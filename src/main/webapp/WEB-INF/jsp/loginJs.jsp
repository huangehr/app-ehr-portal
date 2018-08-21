<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<%--<script type="text/javascript" src="${staticRoot}/widget/artDialog/4.1.7/js/artDialog.min.js"></script>--%>
<script type="text/javascript" src="${staticRoot}/widget/layui/layui.js"></script>
<script type="text/javascript">

    $(function () {
        layui.use('layer', function(){
            var layer = layui.layer;
            sessionStorage.clear();
            var loading = null;
            var login = {
                //$lTab: $('.l-tab'),
                $lFC: $('.l-f-c'),
                $fRD: $('.f-r-d'),
                /*$fRM: $('.f-r-m'),*/
                $docBtn: $('.doc-btn'),
                $manBtn: $('.man-btn'),
                isTrue: true,
                init: function () {

                    var me = this;
                    me.setCookieVal();
                    //角色切换
                    //me.bindEvent( me.$lTab, 'click', me.lTabEvnt.bind(me), '.l-t-item');
                    //记住密码
                    me.bindEvent( me.$fRD, 'click', function () {
                        me.setClass( this, '.r-d');
                    });
                    //记住密码
                    /* me.bindEvent( me.$fRM, 'click', function () {
                     me.setClass( this, '.r-m');
                     });*/
                    //医生登录
                    me.bindEvent( me.$docBtn, 'click', function () {
                        var url = '${contextRoot}' + "/login",
                                an = $("#lUAn").val().trim(),
                                pwd = $("#lUPwd").val().trim();
                        me.checkCookie( this, 'r-d', an, pwd, me);
                        <%--me.reqData( an, pwd, url, '${contextRoot}/xzIndex', me);--%>
                        me.reqData( an, pwd, url, '${contextRoot}/home', me);
                    });
                    me.getDictSetting();
                    $(document).keypress(function(e) {
                        // 回车键事件
                        if(e.which == 13) {
                            me.$docBtn.trigger("click");
                        }
                    });
                    //管理员登录
                    /*me.bindEvent( me.$manBtn, 'click', function () {
                     var url = '${contextRoot}' + "/login/login",
                     an = $("#lUAnO").val(),
                     pwd = $("#lUPwdO").val();
                     me.checkCookie( this, 'r-m', an, pwd, me);
                     me.reqData( an, pwd, url, '${contextRoot}/index', me);
                     });*/
                },
                /*lTabEvnt: function () {
                 var me = $(window.event.target).parent(),
                 index = me.index();
                 me.siblings().find('a').removeClass('l-active');
                 me.find('a').addClass('l-active');
                 this.$lFC.hide().eq(index).show();
                 },*/
                setClass:function ( t, c) {
                    var me = $(t),
                            c = me.find(c).attr('checked');
                    if (!!c) {
                        me.addClass('active');
                    } else {
                        me.removeClass('active');
                    }
                },
                reqData: function ( a, p, reqUrl, goUrl, pa) {
                    var me = this;
                    if (!pa.isTrue) {
                        return;
                    }
                    if (!pa.checkVal( a, '请输入账号')){
                        return false;
                    };
                    if (!pa.checkVal( p, '请输入密码')){
                        $("#lUPwd").val("");
                        return false;
                    };
                    loading = layer.open({
                        shade: [0.8, '#393D49'],icon: 1,
                        title: false,
                        type: 3
                    });
                    $.ajax({
                        url: reqUrl,
                        type: 'POST',
                        dataType: 'json',
                        data:{
                            "username": a,
                            "password": p
                        },
                        beforeSend: function () {
                            pa.isTrue = false;
                        },
                        success: function (data) {
                            layer.close(loading);
                            pa.isTrue = true;
                            me.$docBtn.html("登录").css("pointer-events","");
                            if(data.successFlg){
                                sessionStorage.setItem("userId",data.obj.id);
                                sessionStorage.setItem("loginName",data.obj.realName);
                                /* sessionStorage.setItem("userName",a);
                                 sessionStorage.setItem("token",data.data.token.accessToken);*/
                                location.href = goUrl;
                            }else{
                                debugger
                                art.dialog({
                                    title: "警告",
                                    time: 2,
                                    content: data.message
                                });
                            }
                        },
                        error: function (data) {
                            layer.close(loading);
                            pa.isTrue = true;
                            if(data.status = 401) {
                                debugger
                                art.dialog({
                                    title: "警告",
                                    time: 2,
                                    content: "登陆失败，账号或密码有误！"
                                });
                            }else {
                                me.$docBtn.html("登录").css("pointer-events", "");
                                art.dialog({
                                    title: "警告",
                                    time: 2,
                                    content: "Status:" + data.status + "(" + data.statusText + ")"
                                });
                            }
                        }
                    });
                },
                checkVal: function (v,s) {
                    if (v === '') {
                        art.dialog({
                            title: '警告',
                            time: 2,
                            content: s || ''
                        });
                        return false;
                    }
                    return true;
                },
                bindEvent: function ( d, eve, cb, c) {
                    cb && d.on( eve, c && c, cb);
                },
                setCookieVal: function () {
                    var me = this,
                            rDLN = me.getCookie("r-dname"),
                            rDLP = me.getCookie("r-dpwd"),
                            rMLN = me.getCookie("r-mname"),
                            rMLP = me.getCookie("r-mpwd");
                    if (!!rDLN && !! rDLP) {
                        me.$fRD.addClass('active').find('.r-d').attr('checked',true);
                        $("#lUAn").val(rDLN);
                        $("#lUPwd").val(rDLP);
                    }
                    /*if (!!rMLN && !! rMLP) {
                     me.$fRM.addClass('active').find('.r-m').attr('checked',true);
                     $("#lUAnO").val(rMLN);
                     $("#lUPwdO").val(rMLP);
                     }*/
                },
                checkCookie: function ( d, c, a, p, pa) {
                    var isCheck = $(d).closest('.l-f-c').find('.' + c).attr('checked');
                    if (!!isCheck) {
                        pa.addCookie(c + "name", a, 7);
                        pa.addCookie(c + "pwd", p, 7);
                    } else {
                        pa.delCookie(c + "name");
                        pa.delCookie(c + "pwd");
                    }
                },
                //添加cookie
                addCookie: function (objName, objValue, objHours) {
                    var str = objName + "=" + encodeURIComponent(objValue);
                    if (objHours > 0) {//为0时不设定过期时间，浏览器关闭时cookie自动消失
                        var date = new Date();
                        var ms = objHours * 3600 * 1000;
                        date.setTime(date.getTime() + ms);
                        str += "; expires=" + date.toGMTString();
                    }
                    document.cookie = str;
                },
                //获取指定名称的cookie的值
                getCookie: function (objName) {
                    var arrStr = document.cookie.split("; ");
                    for (var i = 0; i < arrStr.length; i++) {
                        var temp = arrStr[i].split("=");
                        if (temp[0] == objName)
                            return decodeURIComponent(temp[1]);
                    }
                },
                //为了删除指定名称的cookie，可以将其过期时间设定为一个过去的时间
                delCookie: function (name) {
                    var date = new Date();
                    date.setTime(date.getTime() - 10000);
                    document.cookie = name + "=a; expires=" + date.toGMTString();
                },
                getDictSetting:function(){
                    $.ajax({
                        type: "GET",
                        url: "${contextRoot}/doctor/portalSetting/getLogoByDictAndEntryCode",
                        data: {"dictId":125,"dictEntryCode":"portalLogo","type":1},
                        dataType: "json",
                        success: function(data) {
                            if(data.successFlg){
                                $(".header-xz-logo").css("background",'url(' + data.detailModelList[0].path + ') center no-repeat');
                            }
                        }
                    });
                    $.ajax({
                        type: "GET",
                        url: "${contextRoot}/doctor/portalSetting/getLogoByDictAndEntryCode",
                        data: {"dictId":184,"dictEntryCode":"technicalSupport","type":2},
                        dataType: "json",
                        success: function(data) {
                            if(data.successFlg){
                            $(".technicalSupport").html(data.obj.value);}else{$(".technicalSupport").html("健康之路（中国）信息技术有限公司");}
                        }
                    });
                    $.ajax({
                        type: "GET",
                        url: "${contextRoot}/doctor/portalSetting/getLogoByDictAndEntryCode",
                        data: {"dictId":184,"dictEntryCode":"sponsor","type":2},
                        dataType: "json",
                        success: function(data) {
                            if(data.successFlg){
                            $(".sponsor").html(data.obj.value);}else{$(".sponsor").html("市卫生与计划生育委员会");}
                        }
                    });
                }
            };
            login.init();
        });
    });
</script>