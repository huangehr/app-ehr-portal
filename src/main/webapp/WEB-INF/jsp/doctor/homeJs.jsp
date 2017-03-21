<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<link rel="stylesheet" href="${staticRoot}/widget/poshytip/1.2/css/jquery.poshytip.css" type="text/css">
<script type="text/javascript" src="${staticRoot}/widget/poshytip/1.2/js/jquery.poshytip.js"></script>
<script type="text/javascript">
    var doctorHome = {
        init:function () {
            var me = this;
            /*$.ajax({
             type: "GET",
             url : "/homeMenu",
             dataType : "json",
             cache:false,
             success :function(data){
             if(data.successFlg) {

             }
             else{
             art.dialog({
             content: data.message,
             quickClose: true,
             artIcon:"error"
             });
             }
             },
             error :function(data){
             art.dialog({
             content: "Status:"+data.status +"(" +data.statusText+")",
             quickClose: true,
             artIcon:"error"
             });
             }
             });*/
            me.getTodo();
            me.bindAEvent("#app-main");
            me.getPortal();
        },
        bindAEvent: function (cl) {
            $.each($(cl).find("a"),function (index,_item) {
                $(_item).on("click",function (e) {
                    $("#app-main").find("a").removeClass("curr");
                    $(_item).addClass("curr");
                    window.parent.indexPage.openNav($(_item).attr("nav"),$(_item).attr("name"),$(_item).attr("data-src"));
                    e.stopPropagation();
                });
            });
        },
        getTodo: function () {//获取待办事项
            var url= '${contextRoot}' + "/doctor/messageRemindList",
                me = this,
                todoLists = $('.todo-lists'),
                dotoTmp = $('#dotoTmp').html();
            $.ajax({
                url: url,
                data:{
                    userId: '1'
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
                            $('.c-panel-bd').html(['<div class="index-todo-nodata c-t-center ptb20 c-909090">',
                                                        '<i class="iconfont c-f28">&#xe645;</i>',
                                                        '<p class="c-f14 pt5">暂时没有待办事项~</p>',
                                                    '</div>'].join('')
                            );
                        }
                    } else {
                        alert(data.message);
                    }
                },
                error: function (data) {
                    $.ligerDialog.error("Status:"+data.status +"(" +data.statusText+")");
                }
            });
        },
        getPortal:function () {
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
                    $.ligerDialog.error("Status:"+data.status +"(" +data.statusText+")");
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
            d['workUri'] = !!d['workUri'] ?　d['workUri'] : 'http://www.baidu.com';
            d['appName'] = !!d['appName'] ?　d['appName'] : '';
            d['content'] = !!d['content'] ?　d['content'] : '';
            d['toUserName'] = !!d['toUserName'] ?　d['toUserName'] : '匿名';
        },
        doctorInfo:function(){//获取医生基本信息
            var url='${contextRoot}' + "/doctor/infoData";
            $.ajax({
                url: url,    //请求的url地址
                type: 'GET',
                dataType: "json",   //返回格式为json
                async: true, //请求是否异步，默认为异步，这也是ajax重要特性
                data: {
                    //TODO  医生信息查询参数（写死的）
                    "userId":"0dae000356bfda059b10c52338ddea55"
                },
                success: function(data) {
                    if(data.successFlg){
                        var formData = data.objectMap.doctorInfo;
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
                        alert("医生信息获取失败！")
                    }
                }
            });
        },
        appList:function(){//获取应用列表
            var url='${contextRoot}' + "/system/apps";
            $.ajax({
                url: url,    //请求的url地址
                type: 'GET',
                dataType: "json",   //返回格式为json
                async: true, //请求是否异步，默认为异步，这也是ajax重要特性
                data: {
                    //TODO  参数设置
                    "filters":""
                },
                success: function(data) {
                    if(data.successFlg){
                        var formData = data.objectMap.appList;
                        var doctorInfo = avalon.define({
                            $id: "apps",
                            apps: formData
//                            toGender: function(gender) {
//                                if (gender === 0) {
//                                    return "男";
//                                } else {
//                                    return "女";
//                                }
//                            }

                        });
                        avalon.scan();
                    }else{
                        alert("应用列表获取失败！")
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
        doctorHome.init();
        doctorHome.doctorInfo();
        doctorHome.appList();

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
                var $div = $(this).children('div');
                $('#poshytipTitle').html($div.data('title'));
                $('#poshytipInfo').html($div.data('info'));
                var btnHtml='';
                switch ($div.data('btn')){
                    case 'show':
                        btnHtml = '<a href="javascript:;" class="c-btn-green c-btn-tiny">恢复应用</a>';
                        break;
                    case 'hide':
                        btnHtml = '<a href="javascript:;" class="c-btn-red c-btn-tiny">隐藏应用</a>';
                        break;
                    case 'add':
                        btnHtml = '<a href="javascript:;" class="c-btn-blue c-btn-tiny">添加应用</a>';
                        break;
                    case 'del':
                        btnHtml = '<a href="javascript:;" class="c-btn-white c-btn-tiny">删除应用</a>';
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

    });
</script>