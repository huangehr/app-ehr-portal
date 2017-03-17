<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<script type="text/javascript">

    $(function () {
        var $lTab = $('.l-tab'),
            $lFC = $('.l-f-c'),
            $fRD = $('.f-r-d'),
            $fRM = $('.f-r-m'),
            $docBtn = $('.doc-btn'),
            $manBtn = $('.man-btn'),
            isTrue = true,
            addCookie = function (objName, objValue, objHours){//添加cookie
                var str = objName + "=" + encodeURIComponent(objValue);
                if (objHours > 0) {//为0时不设定过期时间，浏览器关闭时cookie自动消失
                    var date = new Date();
                    var ms = objHours * 3600 * 1000;
                    date.setTime(date.getTime() + ms);
                    str += "; expires=" + date.toGMTString();
                }
                document.cookie = str;
            },
            getCookie = function (objName){//获取指定名称的cookie的值
                var arrStr = document.cookie.split("; ");
                for (var i = 0; i < arrStr.length; i++) {
                    var temp = arrStr[i].split("=");
                    if (temp[0] == objName)
                        return decodeURIComponent(temp[1]);
                }
            },
            delCookie = function (name){//为了删除指定名称的cookie，可以将其过期时间设定为一个过去的时间
                var date = new Date();
                date.setTime(date.getTime() - 10000);
                document.cookie = name + "=a; expires=" + date.toGMTString();
            };
        //tab
        $lTab.on('click', '.l-t-item', function () {
            var me = $(this),
                index = me.index();
            me.siblings().find('a').removeClass('l-active');
            me.find('a').addClass('l-active');
            $lFC.hide().eq(index).show();
        });
        var rDLN = getCookie("r-dname"),
            rDLP = getCookie("r-dpwd"),
            rMLN = getCookie("r-mname"),
            rMLP = getCookie("r-mpwd");
        if (!!rDLN && !! rDLP) {
            $fRD.addClass('active').find('.r-d').attr('checked',true);
            $("#lUAn").val(rDLN);
            $("#lUPwd").val(rDLP);
        }
        if (!!rMLN && !! rMLP) {
            $fRM.addClass('active').find('.r-m').attr('checked',true);
            $("#lUAnO").val(rMLN);
            $("#lUPwdO").val(rMLP);
        }
        var checkCookie = function ( d, c, a, p) {
            var isCheck = $(d).closest('.l-f-c').find('.' + c).attr('checked');
            if (!!isCheck) {
                addCookie(c + "name", a, 7);
                addCookie(c + "pwd", p, 7);
            } else {
                delCookie(c + "name");
                delCookie(c + "pwd");
            }
        };
        //ajax
        var reqData = function ( a, p, reqUrl, goUrl) {
            if (!isTrue) {
                return;
            }
            console.log('a');
            $.ajax({
                url: reqUrl,
                type: 'GET',
                dataType: 'json',
                data:{
                    "userName": a,
                    "password": p
                },
                beforeSend: function () {
                    isTrue = false;
                },
                success: function (data) {
                    isTrue = true;
                    debugger;
                    if(data.successFlg){
                        location.href = goUrl;
                    }else{
                        alert(data.message);
                    }
                },
                error: function (data) {
                    $.ligerDialog.error("Status:"+data.status +"(" +data.statusText+")");
                }
            });
        };
        //医生登录
        $docBtn.on( 'click', function () {
            var url = '${contextRoot}' + "/login/login",
                an = $("#lUAn").val(),
                pwd = $("#lUPwd").val();
            checkCookie( this, 'r-d', an, pwd);
            reqData( an, pwd, url, '/index');
        });
        //管理员登录
        $manBtn.on( 'click', function () {
            var url = '${contextRoot}' + "/login/login",
                    an = $("#lUAnO").val(),
                    pwd = $("#lUPwdO").val();
            checkCookie( this, 'r-m', an, pwd);
            reqData( an, pwd, url, '/index');
        });

        var setClass = function (t,c) {
            var me = $(t),
                c = me.find(c).attr('checked');
            if (!!c) {
                me.addClass('active');
            } else {
                me.removeClass('active');
            }
        };
        $fRD.on('click', function () {
            setClass( this, '.r-d');
        });
        $fRM.on('click', function () {
            setClass( this, '.r-m');
        });
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