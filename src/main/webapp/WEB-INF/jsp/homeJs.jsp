<%--
  Created by IntelliJ IDEA.
  User: JKZL-A
  Date: 2017/10/26
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<script type="text/javascript" src="${staticRoot}/js/jsHelper.js"></script>
<script type="text/javascript" src="${staticRoot}/js/underscore.js"></script>
<script type="text/javascript" src="${staticRoot}/ligerui/ligerui.all.js"></script>

<script>
    ~(function (w, $) {
        $(function () {
            var loading = null;
            var dialog=null;
            //接口
            var inf = [
                //获取侧边栏
                '${contextRoot}/system/userManage/getAppTypeAndApps','${contextRoot}/system/userManage/getUserRoleApps'
            ];
            var showTimeOut = null;

            listArr=[$(".dashuju-div"),$(".basic-div"),$(".yewuxiezuo-div"),$(".appServer-div")]

            var itemClass={
                "DataCenter":{
                    outclass:"div-p_5  w3-row clearfix",outstyle:"",outclass1:"",outstyle1:"",iconclass:"w3-col",iconstyle:"width:40%;padding-top:.5rem",titleclass:"w3-rest lh5"
                },
                "BusinessCollaboration":{
                    outclass:"",outstyle:"",outclass1:"",outstyle1:"padding: .3rem;",iconclass:"",iconstyle:"",titleclass:""
                },
                "ApplicationService":{
                    outclass:"",outstyle:"",outclass1:"",outstyle1:"padding: 1.1rem;",iconclass:"div-item1",iconstyle:"",titleclass:""
                },
                "MasterInfor":{
                    outclass:"",outstyle:"",outclass1:"",outstyle1:"", iconclass:"",iconstyle:"margin-top: -.5rem;",titleclass:"",manageType:"backStage"
                },
                "MasterInfor1":{
                    outclass:"div-p_5  w3-row clearfix",outstyle:"",outclass1:"",outstyle1:"",iconclass:"w3-col",iconstyle:"width:40%;padding-top:.5rem",titleclass:"w3-rest lh5 c-t-left",manageType:"backStage"
                },
            };

            var itemList=["R1yHNdX5Ud",
                "0e3DIdNaQ2","Ox8hdRyXVd","aikGiriuX0","2aUmOdMCyQ","0C73NZ2CcW","k4soGEAEiR","wQmCg7FUFT",
                "VWh4aaifgY","M13pAosamN","h1Nc8PyF5k","sAigwZvAQF","aoGoGPD7Qf","U11VgRplOb",
                "wmIgx8RWcQ","P1C7SOQe6n","5DloGvRVVZ"];

//            var MasterInfor=[{"0e3DIdNaQ2":1},{"Ox8hdRyXVd":2},{"aikGiriuX0":3},{"2aUmOdMCyQ":4},{"0C73NZ2CcW":5},{"k4soGEAEiR":6},{"wQmCg7FUFT":7}]

            var Home = {
                divItem: $('#divItem').html(),
                $appServerDiv:$(".appServer-div"),
                $basicDiv:$(".basic-div"),
                $yewuxiezuoDiv:$(".yewuxiezuo-div"),
                $dashujuDiv:$(".dashuju-div"),
                $clickdiv:$(".clickdiv"),

                $loout: $('#loout'),
                $homeItem: $('.home-item'),
                $userItem: $('.home-head'),
                $userInfo: $('#userInfo'),
                $nameInfo: $('.name-info'),
                type: 0,


                init: function () {
                    this.$nameInfo.html(sessionStorage.getItem("loginName"));
                    this.$userItem.attr("title",sessionStorage.getItem("loginName"));
                    this.loadData();
                },
                loadData: function () {
                    var me = this;
//                    _jsHelper.mhAjax(inf[0], 'GET', {manageType: 'client'}, function (res) {
                    _jsHelper.mhAjax(inf[1], 'GET', {userId: sessionStorage.getItem("userId")}, function (res) {
                        if (res.successFlg) {
                            var data = res.detailModelList;
                            if (data) {
                                me.type = res.obj;
//                                me.initItmeHtml0(res.detailModelList);
                                me.initItmeHtml1(res.detailModelList);
                            } else {
                                art.dialog({
                                    title: "警告",
                                    time: 2,
                                    content: '返回数据有误'
                                });
                            }
                        } else {
                            art.dialog({
                                title: "警告",
                                time: 2,
                                content: res.message
                            });
                        }
                    })
                },
                getListArrData: function (t) {
                    var me = this, str = '';
                    switch (t) {
                        case 'DataCenter':
                            str = listArr[0];
                            break;
                        case 'MasterInfor':
                            str = listArr[1];
                            break;
                        case 'BusinessCollaboration':
                            str = listArr[2];
                            break;
                        case 'ApplicationService':
                            str = listArr[3];
                            break;
                    }
                    return str;
                },
                initItmeHtml1: function (data) {
                    var me = this;
                    var M_count=0;
                    $.each(data, function (k, da) {
                        if(me.checkItem(da.id)){
                            var html="";
                            var $div=me.getListArrData(da.catalog);
                            var daclass=itemClass[da.catalog];
                            if(da.catalog=="MasterInfor"){
                                M_count++
                            }
                            if(da.catalog=="MasterInfor" && da.id=="aikGiriuX0"){
                                _.extend(da,itemClass["MasterInfor1"])
                            }else{
                                _.extend(da,daclass)
                            }
                            var newHtml=_jsHelper.render(me.divItem, da, function ($1, d) {
                                if ($1 == 'gourl') {
                                    if (me.type == 1) {
                                        d[$1] = d.url;
                                    } else {
                                        d[$1] = d.outUrl;
                                    }
                                }else  if($1 == 'outclass1'){
                                    if(da.roleType=="0"){
                                        d["outclass1"] = "roletype";
                                    }
                                }else  if($1 == 'outstyle1'){
                                    if(da.roleType=="0"){
                                        d["outstyle1"]+="margin-top:-2.5rem;"
                                    }
                                }

                            });
                            if(da.catalog=="MasterInfor" && M_count==3){
                                html+= '<div class="w3-col" style="width:50%">'+newHtml+'</div>';
                            }else{
                                html+= newHtml;
                            }
//                            $div.find(".innerItem").append(html);
                            $("#"+da.id).append(newHtml);
                        }
                    })
                    me.bindDataEvent();
                },
                initItmeHtml0: function (data) {
                    var me = this;
                    $.each(data, function (k, da) {
                        var html="";
                        var $div=me.getListArrData(da.code);
                        var daclass=itemClass[da.code];
                        if(da.children.length>0){
                            $.each(da.children,function (key,obj) {
                                if(me.checkItem(obj.id)){
                                    if(da.code=="MasterInfor" && key==2){
                                        _.extend(obj,itemClass["MasterInfor1"])
                                    }else{
                                        _.extend(obj,daclass)
                                    }
                                    var newHtml=_jsHelper.render(me.divItem, obj, function ($1, d) {
                                        if ($1 == 'gourl') {
                                            if (me.type == 1) {
                                                d[$1] = d.url;
                                            } else {
                                                d[$1] = d.outUrl;
                                            }
                                        }
                                    });
                                    if(da.code=="MasterInfor" && key==2){
                                        html+= '<div class="w3-col" style="width:50%">'+newHtml+'</div>';
                                    }else{
                                        html+= newHtml;
                                    }
                                }
                            })
                            $div.find(".innerItem").append(html);
                        }
                    })
                    me.bindDataEvent();
                },
                bindDataEvent: function () {
                    //数据控制事件
                    var me = this;
                    $(".clickdiv").on('click', function () {
                        debugger
                        var $me = $(this),
                            type = $me.attr('data-type'),
                            url = $me.attr('data-url'),
                            nav = $me.attr('data-id'),
                            name = $me.attr('data-name'),
                            cate = $me.attr('data-cate'),
                            judgeRole=$me.attr('data-role');
                        if(judgeRole=="0"){
                            $me.addClass("active")
                            me.judgeJurisdiction(nav);
                        }else{
                            var turl = '${contextRoot}/newXZIndex?nav=' + nav + '&type=' + type + '&url=' + url+'&cate=' + cate;
                            var ourl = encodeURI(turl);
                            var surl = encodeURI(ourl);
                            window.open(surl, '_blank');
                        }
                    });
                    me.$homeItem.on('click', function () {
                        var $me = $(this),
                            url = $me.attr('data-url'),
                            nav = $me.attr('data-id'),
                            name = $me.attr('data-name');
                        window.open('${contextRoot}/newXZIndex?nav=' + nav + '&url=' + url, '_blank');
                    });
                    me.$userInfo.on('click', function () {
                        window.open('${contextRoot}/newXZIndex?nav=infoMain&url=doctor/infoMain', '_blank');
                    });
                    me.$loout.on('click', function () {
                        sessionStorage.clear();
                        loading = artDialog({
                            lock: true
                        });
                        loading.DOM.title.hide();
                        loading.DOM.close.hide();
                        location.href = '${contextRoot}/logout';
                    });
                    me.$userItem.on('click',function () {
                       if(!$(this).hasClass("disabled")){
                            $(".home-down-con").toggle();
                            setTimeout(function () {
                                $(".home-down-con").hide();
                            },2000)
                        }
                    })
                },
                getDictSetting:function(){
                    $.ajax({
                        type: "GET",
                        url: "${contextRoot}/doctor/portalSetting/getLogoByDictAndEntryCode",
                        data: {"dictId":125,"dictEntryCode":"portalLogo","type":1},
                        dataType: "json",
                        success: function(data) {
                            if(data.successFlg) {
                                $(".home-logo").css({
                                    "background": 'url(' + data.detailModelList[0].path + ') no-repeat',
                                    "background-size": "contain"
                                });
                            }
                        }
                    });
                },
                checkItem:function (element) {
                    for (var i = 0; i < itemList.length; i++) {
                        if (itemList[i] == element) {
                            return true;
                        }
                    } return false;
                },
                judgeJurisdiction:function (nav) {
                    $.ligerDialog.open({
                        width: 450,
                        height:150,
                        type: 'info',
                        content: '很抱歉，您暂无此功能的访问权限，请联系系统管理员',
                        buttons: [{ text: '好的，我知道了', onclick: function(item, dialog){
                            $("#"+nav).find(".clickdiv").removeClass("active");
                            dialog.close();
                        }}]
                    });
                }
            };
            Home.init();
        });
    })(window, jQuery);
</script>