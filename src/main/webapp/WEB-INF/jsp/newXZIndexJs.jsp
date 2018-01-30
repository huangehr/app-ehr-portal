<%--
  Created by IntelliJ IDEA.
  User: JKZL-A
  Date: 2017/9/25
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<script type="text/javascript" src="${staticRoot}/widget/layui/layui.js"></script>
<script>
    var loading = null;
    var layer = null;
    var NewXZIndex = {
        nav: '${nav}',
        name: '${name}',
        type: '${type}',
        url: '${url}',
        $nameInfo: $('.name-info'),
        $goOut: $('#goOut'),
        $navMain: $('#nav-main'),
        init: function () {
            this.$nameInfo.html(sessionStorage.getItem("loginName"));
            this.tabNavInit();
            this.layoutInit();
            this.bindEvent();
            this.loadPage();
        },
        loadPage: function () {
            var me = this;
            if (me.type == 'backStage') {
                me.url = '${contextRoot}/appIndex?nav=' + me.nav + '&name=' + me.name + '&type=' + me.type + '&url=' + me.url;
            } else if (me.type == 'client'){
                me.url = "/login/signin?clientId=" + me.nav + "&url=" + me.url;
            }
            me.openNav(me.nav, me.name, me.url);
        },
        //滚动标签栏
        tabNavInit:function(){
            var $menu=$('.iframe-menu-list'),
                    $li=$menu.children('ul').children('li'),
                    $wrap=$('.iframe-menu'),
                    w;
            if($('.boss-im').is('.show')){
                w=$(window).width()-260;
            }else{
                w=$(window).width();
            }
            if($li.length*131>w){
                $menu.width($li.length*131);
                $('.iframe-menu-btn').show();
            }

            $('.iframe-menu-btn>a.prev').on('click',function(){

                var left=$('.iframe-menu-list').data('left')*1;
                if(left==0){
                    return false;
                } else if(left<0){
                    $('.iframe-menu-list').animate({'left':left+130},"fast",function(){
                        $('.iframe-menu-list').data('left',left+130);
                    });
                }
            });
            $('.iframe-menu-btn>a.next').on('click',function(){

                var iframeMenuWidth = $wrap.width(),
                        imlWidth = $('.iframe-menu-list').width(),
                        ol = $('.iframe-menu-list')[0].offsetLeft;
                if (imlWidth < iframeMenuWidth) {
                    return false;
                }

                if ((imlWidth + ol) < iframeMenuWidth) {
                    return false;
                }

                var left=$('.iframe-menu-list').data('left')*1;
                if(left<-(($('.iframe-menu-list>ul>li').length-2)*130)){
                    return false;
                }
                else if(left<=0){
                    $('.iframe-menu-list').animate({'left':left-130},"fast",function(){
                        $('.iframe-menu-list').data('left',left-130);
                    });
                }
            });
        },
        //定位导航
        focusNav:function (_this) {
            if($("#nav-main").find(_this).length>0)
            {
                $("#nav-main").find("a").removeClass("curr");
                $(_this).addClass("curr");
                var nav = $(_this).attr("nav");
                $("#iframe-main").find("iframe").removeClass("curr");
                $("#iframe-main").find("iframe[nav='"+nav+"']").addClass("curr");
            }
        },
        //关闭导航
        closeNav:function (_this) {
            var me = this;
            var node = $(_this).parents("li");
            var brother = node.prev();
            var isCurr = node.find("a").hasClass("curr");

            var nav = node.find("a").attr("nav");
            node.remove();
            $("#iframe-main").find("iframe[nav='"+nav+"']").remove();

            if(isCurr)  //关闭当前窗口，默认选中前一窗口
            {
                me.focusNav(brother.find("a"));
            }
        },
        //打开导航
        openNav:function (nav,name,url,type) {
            loading = layer.open({
                shade: [0.8, '#393D49'],icon: 1,
                title: false,
                type: 3
            });
            var main = $("#iframe-main");
            var needCreate = true;
            //判断是否已打开
            $.each(main.find("iframe"),function (index,_item) {
                var itemNav = $(_item).attr("nav");
                if(itemNav == nav)
                {
                    $(_item).addClass("curr");
                    $("#nav-main").find("a[nav='"+itemNav+"']").addClass("curr");
                    needCreate = false;
                    layer.close(loading);
                }
                else{
                    $(_item).removeClass("curr");
                    $("#nav-main").find("a[nav='"+itemNav+"']").removeClass("curr");
                }
            });
            if(needCreate)
            {
                $("#nav-main").append("<li><a href=\"#\" nav=\""+nav+"\" class=\"curr\" onclick=\"NewXZIndex.focusNav(this)\"><span class=\"c-nowrap\">"+name+"</span><i class=\"iconfont\" onclick=\"NewXZIndex.closeNav(this)\">&#xe605;</i></a></li>");
                main.append("<iframe onload=\"reloadUrl(this)\" frameborder=\"no\" nav=\""+nav+"\" src=\""+url+"\" width=\"100%\" height=\"100%\" class=\"curr\"></iframe>");
            }
        },
        //布局初始化
        layoutInit:function(){
            //主iframe
//            if($('.header-wrap').length>0){
//                $('#iframe-main').height($(window).height()-$('.header-wrap').outerHeight(true)-$('.iframe-menu').outerHeight(true));
//            }else{
//                $('#iframe-main').height($(window).height());
//            }
        },
        bindEvent: function () {
            var me = this;
            //窗口大小被改变时
            $(window).resize(function(){me.throttle(me.layoutInit(), 300)});
            me.$goOut.on( 'click', function () {
                sessionStorage.clear();
                location.href = '${contextRoot}/logout';
            });

            $('.dropdown').on('click', function () {
                var $dropdownCon = $('.dropdown-con'),
                        sty = $('.dropdown-con').css('display');
                if (sty == 'none') {
                    $dropdownCon.show();
                } else {
                    $dropdownCon.hide();
                }
            });
        },
        throttle: function (fn, delay){
            var timer = null;
            return function(){
                var context = this, args = arguments;
                clearTimeout(timer);
                timer = setTimeout(function(){
                    fn.apply(context, args);
                }, delay);
            };
        }
    };
    layui.use('layer', function() {
        layer = layui.layer;
        (function (w, $, u) {
            $(function () {
                NewXZIndex.init();
                w._NewXZIndex = NewXZIndex;
            });
        })(window, jQuery);
    });
    function reloadUrl(t) {
        layer.close(loading);

        var href = $(t).prop('contentWindow').location.src;
        if (href.indexOf('/login') != -1) {
            window.location.reload('http://${contextRoot}/login');
        }
    }
</script>
