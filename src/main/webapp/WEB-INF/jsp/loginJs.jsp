<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<script type="text/javascript" src="${staticRoot}/widget/placeholder/2.0.7/js/jquery.placeholder.js"></script>

<script type="text/javascript">

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

        $('#forget-password').click(function(){
            var contents=$('.forget-password-box').get(0);
            //alert($(contents).html())
            var artBox=art.dialog({
                lock: true,
                artIcon:'edit',
                opacity:0.4,
                width: 450,
                title:'忘记密码',
                content: contents,
                ok: function () {

                },
                cancel: true
            });
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

        //公告
        var artBox=art.dialog({
            lock: true,
            artIcon:'',
            opacity:0.4,
            width: 450,
            title:'<i class="iconfont mr5">&#xe627</i>系统公告',
            content: '<h2 class="c-f18 c-bold c-simsun  c-t-center mt5">无边界医疗服务平台4.0版本上线公告</h2><p class="c-f14 c-line-h1  c-simsun ptb15">无边界医疗服务平台4.0版本计划于4月19日正式上线，在新的版本中，您将感受到截然不同的视觉和交互体验。本版本主要升级内容有...</p>',
            ok: function () {

            },
            cancel: true
        });


    });
</script>