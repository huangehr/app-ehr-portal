<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<script type="text/javascript">

    $("#btn-login").click(function () {
        var url='${contextRoot}' + "/login/login";
        $.ajax({
            url: url,    //请求的url地址
            type: 'GET',
            dataType: "json",   //返回格式为json
            async: true, //请求是否异步，默认为异步，这也是ajax重要特性
            data: {
                "userName": $("#user-name").val(),
                "password": $("#password").val()
            },
            success: function(data) {
                debugger;
                if(data.successFlg){
                    location.href = "${contextRoot}/index";
                }else{
                    alert(data.message)
                }
            },
            error :function(data){

                $.ligerDialog.error("Status:"+data.status +"(" +data.statusText+")");
            }
        });
    });

    $(function(){
        //登陆界面最小高度STAR
        if($(window).height()>470) $('.login-wrap').addClass('login-wrap-fixed');
        $(window).resize(function(){
            if($(window).height()>470) $('.login-wrap').addClass('login-wrap-fixed');
            else $('.login-wrap').removeClass('login-wrap-fixed');
        });

        //登陆页input效果
        $('.input_boxer input').bind('focus',function(){
            $(this).parent('.input_boxer').addClass('focus');
        }).bind('blur',function(){
            $(this).parent('.input_boxer').removeClass('focus');
        });


        $(".dyna_send a").click(function(){
            $(this).parent().html('55秒后可再获取');
        });

        //记住密码勾选
        $('.gou_boxer').on('click',function(){
            $(this).find('i.icon-chkbox').toggleClass('checked');
        });

        $('.code-btn a').on('click',function(){
            $(this).parent().html('55秒之后可再获取');
        });

        //切换登录
        $("#switch-dyna").click(function(){
            $("#login-pass").show();
            $("#login-dyna").hide();
        });
        $("#switch-pass").click(function(){
            $("#login-dyna").show();
            $("#login-pass").hide();
        });
    });
</script>