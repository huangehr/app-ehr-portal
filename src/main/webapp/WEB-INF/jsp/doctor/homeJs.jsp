<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<link rel="stylesheet" href="${staticRoot}/widget/poshytip/1.2/css/jquery.poshytip.css" type="text/css">
<script type="text/javascript" src="${staticRoot}/widget/poshytip/1.2/js/jquery.poshytip.js"></script>
<script type="text/javascript">
    var doctorHome = {
        getAppUrl: '${contextRoot}' + '/system/getUserApps',
        init:function () {
            var me = this;

            /*$.each($("#app-main").find("a"),function (index,_item) {
                $(_item).on("click",function () {
                    $("#app-main").find("a").removeClass("curr");
                    $(_item).addClass("curr");
                    var nav = $(_item).attr("nav");
                    var name = $(_item).attr("name");
                    var src = $(_item).attr("data-src");
                    var type = $(_item).attr("type");
                    top.indexPage.openNav(nav,name,src,type);
                });
            });*/

            me.getTodo();
            me.getPortal();
        },
        getTodo: function () {//获取待办事项
            var url= '${contextRoot}' + "/doctor/messageRemindList",
                    me = this,
                    todoLists = $('.todo-lists'),
                    dotoTmp = $('#dotoTmp').html();
            $.ajax({
                url: url,
                data:{
                    userId: sessionStorage.getItem("userId")
                },
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    if (!!data.successFlg) {
                        if (data.detailModelList.length > 0) {
                            $.each( data.detailModelList, function (index) {
                                todoLists.append(me.render( dotoTmp, data.detailModelList[index], me.setTodoHtml));
                            });
                            todoLists.find('a').on('click',function (e) {
                                var thatUrl = '${contextRoot}' + '/doctor/messageRemind/' + $(this).attr('data-id'),
                                        that=this;
                                $.ajax({
                                    url: thatUrl,
                                    data:{},
                                    type: 'GET',
                                    dataType: 'json',
                                    success:function(data){
                                        if (!!data.successFlg) {
                                            window.parent.indexPage.openNav($(that).attr("nav"),$(that).attr("name"),$(that).attr("data-src"));
                                        }
                                    }
                                });
                                e.stopPropagation();
                            });
                        } else {
                            todoLists.append(['<div class="index-todo-nodata c-t-center ptb20 c-909090">',
                                '<i class="iconfont c-f28">&#xe645;</i>',
                                '<p class="c-f14 pt5">暂时没有待办事项~</p>',
                                '</div>'].join('')
                            );
                        }
                    } else {
                        art.dialog({
                            title: "警告",
                            time: 2,
                            content: data.message
                        });
                    }
                },
                error: function (data) {
                    art.dialog({
                        title: "警告",
                        time: 2,
                        content: "Status:"+data.status +"(" +data.statusText+")"
                    });
                }
            });
        },
        getPortal:function () {//通知公告
            var url = '${contextRoot}' + '/doctor/getPortalSettingList',
                    portalTmp = $('#portalTmp').html(),
                    $indexWorkRight = $('.index-work-right'),
                    me = this;
            $.ajax({
                url: url,
                type: 'GET',
                dataType: 'json',
                data: {},
                success: function (data) {
                    $.each( data.detailModelList, function (index) {
                        $indexWorkRight.append(me.render( portalTmp, data.detailModelList[index]));
                    });
                },
                error: function (data) {
                    art.dialog({
                        title: "警告",
                        time: 2,
                        content: "Status:"+data.status +"(" +data.statusText+")"
                    });
                }
            });
        },
        setTodoHtml: function ( d, v) {
            if (v === 'new' || v === 'todoClass') {
                if (!!!d['readed']) {
                    d['new'] = '<span class="c-badge c-badge-danger c-round ml10">New</span>';
                    d['todoClass'] = 'c-333 c-bold '
                } else {
                    d['new'] = '';
                    d['todoClass'] = 'c-909090'
                }
            }
            if (v === 'createDate') {
                var cd = new Date(d['createDate']);
                d['createDate'] = cd.getFullYear() + '-' + (cd.getMonth() + 1) + '-' + cd.getDate();
            }
            d['workUri'] = !!d['workUri'] ?　d['workUri'] : 'https://www.baidu.com';
            d['appName'] = !!d['appName'] ?　d['appName'] : '';
            d['content'] = !!d['content'] ?　d['content'] : '';
            d['toUserName'] = !!d['toUserName'] ?　d['toUserName'] : '匿名';
        },
        doctorInfo:function(userId){//获取医生基本信息
            var url='${contextRoot}' + "/doctor/infoData";
            $.ajax({
                url: url,    //请求的url地址
                type: 'GET',
                dataType: "json",   //返回格式为json
                async: true, //请求是否异步，默认为异步，这也是ajax重要特性
                data: {
                    "userId":userId
                },
                success: function(data) {
                    if(data.successFlg){
                        var formData = data.obj;
                        var doctorInfo = avalon.define({
                            $id: "doctor",
                            doctor: formData,
                            toGender: function(gender) {
                                if (gender === 0) {
                                    return "男";
                                } else {
                                    return "女";
                                }
                            }

                        });
                        avalon.scan();
                    }else{
                        art.dialog({
                            title: "警告",
                            time: 2,
                            content: "医生信息获取失败"
                        });
                    }
                }
            });
        },
        getShowApp: function (userId) {
            this.appList( userId, function (data) {
                var formData = [];
//                debugger
                data.detailModelList.filter(function (obj) {
                    if (obj.showFlag == 1) {
                        formData.push(obj);
                    }
                });
                var doctorInfo = avalon.define({
                    $id: "apps",
                    apps: formData,
                    bindHref: function (_item) {
                        $("#app-main").find("a").removeClass("curr");
                        $(_item).addClass("curr");
                        var nav = $(_item).attr("nav");
                        var name = $(_item).attr("name");
                        var src = $(_item).attr("data-src");
                        var type = $(_item).attr("type");
                        top.indexPage.openNav(nav,name,src,type);
                    }
                });
                avalon.scan();
            });
        },
        getAddApp: function (userId) {
            var me = this;
            me.appList( userId, function (data) {
                var formData = [];
                data.detailModelList.filter(function (obj) {
                    if (obj.showFlag == 1) {
                        formData.push(obj);
                    }
                });
                var addApps = $('#addAppTmp').html(),
                        htm = '';
                $.each(formData,function (index) {
                    formData[index].btnClass = 'del';
                    formData[index].cClass = '';
                    htm += me.render( addApps,formData[index]);
                });
                $('#addApps').append(htm);
            });
        },
        getDelApp: function (userId) {
            var me = this;
            me.appList( userId, function (data) {
                var formData = [];
                data.detailModelList.filter(function (obj) {
                    if (obj.showFlag == 0) {
                        formData.push(obj);
                    }
                });
                console.log(formData);
                var delApps = $('#addAppTmp').html(),
                    htm = '';
                $.each(formData,function (index) {
                    formData[index].btnClass = 'show';
                    formData[index].cClass = 'gray';
                    htm += me.render( delApps,formData[index]);
                });
                $('#delApps').append(htm);
            });
        },
        appList:function( userId, cb){//获取应用列表
            <%--var url='${contextRoot}' + "/system/getUserApps";--%>
            $.ajax({
                url: this.getAppUrl,    //请求的url地址
                type: 'GET',
                dataType: "json",   //返回格式为json
                async: false, //请求是否异步，默认为异步，这也是ajax重要特性
                data: {
                    "userId":userId
                },
                success: function(data) {
                    if(data.successFlg){
                        cb && cb.call( this, data);
                    }else{
                        if(data.code == 0){
                            art.dialog({
                                title: "警告",
                                time: 2,
                                content: data.message
                            });
                        }else{
                            art.dialog({
                                title: "警告",
                                time: 2,
                                content: "应用列表获取失败！"
                            });
                        }
                    }
                }
            });
        },
        render: function(tmpl, data, cb){
            return tmpl.replace(/\{\{(\w+)\}\}/g, function(m, $1){
                cb && cb.call( this, data, $1);
                return data[$1];
            });
        }
    };

    $(function(){
        var userId = sessionStorage.getItem("userId");
        doctorHome.doctorInfo(userId);

        doctorHome.getShowApp(userId);
        doctorHome.getAddApp(userId);
        doctorHome.getDelApp(userId);
        
//        doctorHome.appList(userId);
        doctorHome.init();

        $('.c-panel').hover(function(){
            $(this).find('.tools').show();
        },function(){
            $(this).find('.tools').hide();
        });

        $('.add-app-btn').on('click',function(){
            $('.app-dialog-wrap').show();
        });

        $('#add-app-cancel').on('click',function(){
            $('.app-dialog-wrap').hide();
        });

        $('#add-app-sure').on('click',function () {
//            document.location.reload();

            $('.app-dialog-wrap').hide();
        });



        function sidebarMenuHeight(){
            $(".index-left-scroll").height($(window).height()-21);
            $('.app-dialog-box').height($(window).height()-200);
        }

        sidebarMenuHeight();

        $(window).resize(function(){throttle(sidebarMenuHeight(), 300)});

        if(!($.browser.msie && $.browser.version == 6)){
            $(".index-left-scroll,.index-todo-list,.app-dialog-box").niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});
        }else{
            $(".index-left-scroll,.index-todo-list,.app-dialog-box").addClass('c-auto-y');
        }

        $("input.switch-state").Cswitch('size','small');

        $('.add-module-btn').on('click',function(){
            var contents=$('.module-artdialog').get(0);
            var artBox=art.dialog({
                lock: true,
                opacity:0.4,
                fixed: false,
                padding: '0px',
                width: 600,
                title:'<i class="iconfont">&#xe68b;</i> 自定义窗口',
                content: contents,
                init:function(){
                    $(".module-artdialog").niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});
                },
                ok: function () {

                },
                cancel: true
            });
        });

        $('.app-box-bd li').poshytip({
            content:function(updateCallback) {
                var p = $(this),
                    $div = $(this).children('div'),
                    id = p.attr('data-data-id'),
                    appName = p.attr('data-app-name'),
                    linkUrl = p.attr('data-src'),
                    appId = p.attr('data-app-id');
                $('#poshytipTitle').html($div.data('title'));
                $('#poshytipInfo').html($div.data('info'));
                var btnHtml='';
                switch ($div.data('btn')){
                    case 'show':
                        btnHtml = '<a href="javascript:;" id="recovery" data-app-id="' + appId + '" data-app-name="' + appName + '" data-src="' + linkUrl + '" data-id="' + id + '" class="c-btn-green c-btn-tiny">恢复应用</a>';
                        break;
                    case 'hide':
                        btnHtml = '<a href="javascript:;" id="hideApp" data-app-id="' + appId + '" data-app-name="' + appName + '" data-src="' + linkUrl + '" data-id="' + id + '" class="c-btn-red c-btn-tiny">隐藏应用</a>';
                        break;
                    case 'add':
                        btnHtml = '<a href="javascript:;" id="addApp" data-app-id="' + appId + '" data-app-name="' + appName + '" data-src="' + linkUrl + '" data-id="' + id + '" class="c-btn-blue c-btn-tiny">添加应用</a>';
                        break;
                    case 'del':
                        btnHtml = '<a href="javascript:;" id="delApp" data-app-id="' + appId + '" data-app-name="' + appName + '" data-src="' + linkUrl + '" data-id="' + id + '" class="c-btn-white c-btn-tiny">删除应用</a>';
                        break;
                }
                $('#poshytipBtn').html(btnHtml);
                return $('#poshytip-box').html();
            },
            className: 'tip-white',
            liveEvents: true,
            alignTo: 'target',
            alignX: 'right',
            alignY: 'center',
            offsetX: 0,
            contentPadding:'20px'
        });
        var moveDom = function (dataId, dId, sta) {
            var li = $('[data-data-id=' + dataId + ']'),
                obj = {
                    id: dataId,
                    appId: li.attr('data-app-id'),
                    appName: li.attr('data-app-name'),
                    linkUrl: li.attr('data-src')
                },
                appMain = $('#app-main');
            if (sta === 'del') {
                appMain.find('[data-id=' + dataId + ']').remove();
                obj.btnClass = 'show';
                obj.cClass = 'gray';
                $('#delApps').append(doctorHome.render( $('#addAppTmp').html(),obj));
                art.dialog({
                    title: "",
                    time: 2,
                    content: '删除成功'
                });
            }
            if (sta === 'show') {
                appMain.append(doctorHome.render($('#showAppTmp').html(),obj));
                obj.btnClass = 'del';
                obj.cClass = '';
                $('#addApps').append(doctorHome.render( $('#addAppTmp').html(),obj));
                art.dialog({
                    title: "",
                    time: 2,
                    content: '添加成功'
                });
            }
            li.remove();
            $('.tip-white').remove();
        }
        var res = function ( url, d, cb) {
            $.ajax({
                url: url,
                data: d,
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    cb && cb.call( this, data);
                }
            });
        };
        var link = '${contextRoot}' + '/system/userManage/app/show';
        //恢复
        $(document).on( 'click', '#recovery', function () {
            var id = $(this).attr('data-id');
            art.dialog({
                title: '警告',
                content: '确定要恢复该应用吗？',
                ok: function () {
                    res( link,{
                        id: id,
                        flag: 1
                    },function (data) {
                        console.log(data);
                        if (data) {
                            moveDom( id, 'addApps', 'show');
                        } else {
                            art.dialog({
                                title: "警告",
                                time: 2,
                                content: data.msg
                            });
                        }
                    });
                },
                cancel:function () {
                    return true;
                }
            });
        });
//        $(document).on( 'click', '#hideApp', function () {
//            console.log('add');
//        });
//        $(document).on( 'click', '#addApp', function () {
//            console.log('add');
//        });
        //删除
        $(document).on( 'click', '#delApp', function () {
            var id = $(this).attr('data-id');
            art.dialog({
                title: '警告',
                content: '确定要删除该应用吗？',
                ok: function () {
                    res( link,{
                        id: id,
                        flag: 0
                    },function (data) {
                        console.log(data);
                        if (data) {
                            moveDom( id, 'delApps', 'del');
                        } else {
                            art.dialog({
                                title: "警告",
                                time: 2,
                                content: data.msg
                            });
                        }
                    });
                },
                cancel:function () {
                    return true;
                }
            });
        });
    });
</script>