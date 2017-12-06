<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<script type="text/javascript" src="${staticRoot}/widget/artDialog/4.1.7/js/artDialog.min.js"></script>
<script type="text/javascript">

    $(function () {
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
                    var url = '${contextRoot}' + "/login/login",
                            an = $("#lUAn").val().trim(),
                            pwd = $("#lUPwd").val().trim();
                    me.checkCookie( this, 'r-d', an, pwd, me);
                    <%--me.reqData( an, pwd, url, '${contextRoot}/xzIndex', me);--%>
                    me.reqData( an, pwd, url, '${contextRoot}/home', me);
                });

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
                loading = artDialog({
                    lock: true
                });
                loading.DOM.title.hide();
                loading.DOM.close.hide();
                $.ajax({
                    url: reqUrl,
                    type: 'POST',
                    dataType: 'json',
                    data:{
                        "userName": a,
                        "password": p
                    },
                    beforeSend: function () {
                        pa.isTrue = false;
                    },
                    success: function (data) {
                        loading.close();
                        pa.isTrue = true;
                        me.$docBtn.html("登录").css("pointer-events","");
                        if(data.successFlg){
                            sessionStorage.setItem("userId",data.data.user.id);
                            sessionStorage.setItem("loginName",data.data.user.realName);
                            /* sessionStorage.setItem("userName",a);
                             sessionStorage.setItem("token",data.data.token.accessToken);*/
                            location.href = goUrl;
                        }else{
                            art.dialog({
                                title: "警告",
                                time: 2,
                                content: data.message
                            });
                        }
                    },
                    error: function (data) {
                        me.$docBtn.html("登录").css("pointer-events","");
                        art.dialog({
                            title: "警告",
                            time: 2,
                            content: "Status:"+data.status +"(" +data.statusText+")"
                        });
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
            }
        };
        login.init();
    });


    <%--$("#btn-login").click(function () {--%>
    <%--var url='${contextRoot}' + "/login/login";--%>
    <%--$.ajax({--%>
    <%--url: url,    //请求的url地址--%>
    <%--type: 'GET',--%>
    <%--dataType: "json",   //返回格式为json--%>
    <%--async: true, //请求是否异步，默认为异步，这也是ajax重要特性--%>
    <%--data: {--%>
    <%--"userName": $("#user-name").val(),--%>
    <%--"password": $("#password").val()--%>
    <%--},--%>
    <%--success: function(data) {--%>
    <%--debugger;--%>
    <%--if(data.successFlg){--%>
    <%--location.href = "${contextRoot}/index";--%>
    <%--}else{--%>
    <%--alert(data.message)--%>
    <%--}--%>
    <%--},--%>
    <%--error :function(data){--%>

    <%--$.ligerDialog.error("Status:"+data.status +"(" +data.statusText+")");--%>
    <%--}--%>
    <%--});--%>
    <%--});--%>

    <%--$(function(){--%>
    <%--//登陆界面最小高度STAR--%>
    <%--if($(window).height()>470) $('.login-wrap').addClass('login-wrap-fixed');--%>
    <%--$(window).resize(function(){--%>
    <%--if($(window).height()>470) $('.login-wrap').addClass('login-wrap-fixed');--%>
    <%--else $('.login-wrap').removeClass('login-wrap-fixed');--%>
    <%--});--%>

    <%--//登陆页input效果--%>
    <%--$('.input_boxer input').bind('focus',function(){--%>
    <%--$(this).parent('.input_boxer').addClass('focus');--%>
    <%--}).bind('blur',function(){--%>
    <%--$(this).parent('.input_boxer').removeClass('focus');--%>
    <%--});--%>


    <%--$(".dyna_send a").click(function(){--%>
    <%--$(this).parent().html('55秒后可再获取');--%>
    <%--});--%>

    <%--//记住密码勾选--%>
    <%--$('.gou_boxer').on('click',function(){--%>
    <%--$(this).find('i.icon-chkbox').toggleClass('checked');--%>
    <%--});--%>

    <%--$('.code-btn a').on('click',function(){--%>
    <%--$(this).parent().html('55秒之后可再获取');--%>
    <%--});--%>

    <%--//切换登录--%>
    <%--$("#switch-dyna").click(function(){--%>
    <%--$("#login-pass").show();--%>
    <%--$("#login-dyna").hide();--%>
    <%--});--%>
    <%--$("#switch-pass").click(function(){--%>
    <%--$("#login-dyna").show();--%>
    <%--$("#login-pass").hide();--%>
    <%--});--%>
    <%--});--%>
</script>