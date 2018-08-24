<%--
  Created by IntelliJ IDEA.
  User: JKZL-A
  Date: 2017/9/25
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<script type="text/javascript" src="${staticRoot}/widget/layui/layui.js"></script>
<script>
    var lnk = '${url}';
    var menuId = '${menuId}';
    var toggleFullscreen = function(){
        if(document.fullscreenElement ||
            document.mozFullScreenElement ||
            document.webkitFullscreenElement ||
            document.msFullscreenElement){
            if (document.exitFullscreen) {
                document.exitFullscreen();
            } else if (document.mozCancelFullScreen) {
                document.mozCancelFullScreen();
            } else if (document.webkitExitFullscreen) {
                document.webkitExitFullscreen();
            } else if (document.msExitFullscreen) {
                document.msExitFullscreen();
            }
        }else{
            if (document.documentElement.requestFullscreen) {
                document.documentElement.requestFullscreen();
            } else if (document.documentElement.mozRequestFullScreen) {
                document.documentElement.mozRequestFullScreen();
            } else if (document.documentElement.webkitRequestFullscreen) {
                document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
            } else if (document.body.msRequestFullscreen) {
                document.body.msRequestFullscreen();
            }
        }

        //更新iframe定位
        update_iframe_pos();
    }

    //退出全屏时恢复全屏按钮、iframe的定位方式
    var update_iframe_pos = function(){
        if(document.fullscreenElement ||
            document.mozFullScreenElement ||
            document.webkitFullscreenElement ||
            document.msFullscreenElement){
            $("#iframe-main").find('iframe').addClass("ifr_fixed");
        }else{
            $("#iframe-main").find('iframe').removeClass("ifr_fixed");
        }
    }
    getUrlParms = function (name) {//获取地址栏参数，name:参数名称
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)
            return unescape(r[2]);
        return null;
    }
    if(getUrlParms("url")==null||getUrlParms("url").indexOf("bigScreenShow") == -1){//跳转应用不是“大数据应用平台”，则显示头部
//        if(getUrlParms("url").indexOf("bigScreenShow") == -1)
        $("#iframe-main").css("top","70px")
        $(".header-wrap").show();
    }
    //添加退出全屏时的监听事件
    window.addEventListener("fullscreenchange", function(e) {
        update_iframe_pos();
    });
    window.addEventListener("mozfullscreenchange", function(e) {
        update_iframe_pos();
    });
    window.addEventListener("webkitfullscreenchange", function(e) {
        update_iframe_pos();
    });
    window.addEventListener("msfullscreenchange", function(e) {
        update_iframe_pos();
    });

    window.addEventListener("message", function (e) {
        switch (e.data.type) {
            case 'pagereload':
                location.reload();
                break;
            case 'fullScreen':
                toggleFullscreen();
                break;
            case 'jump':
                var data = e.data.data;
                var turl = '${contextRoot}/newXZIndex?nav=' + data.appId + '&menuId='+ data.menuId +'&type='+ (data.appId == 'R1yHNdX5Ud' ? 'client' : 'backStage') +'&url=' + lnk + '?menuId=' + data.menuId;
                var ourl = encodeURI(turl);
                var surl = encodeURI(ourl);
                window.open(surl, '_blank');
                break;
        }
    }, true);
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
            this.getDictSetting();
        },
        loadPage: function () {
            var me = this;
            //单病例隐藏头部
            if (me.nav == 'eC1GhVeSSR') {
                $('.header-wrap').hide();
                $('#iframe-main').css({
                    'top': '0'
                });
            }
            if (me.type == 'backStage') {
                me.url = '${contextRoot}/appIndex?nav=' + me.nav + '&name=' + encodeURIComponent(me.name) + '&type=' + me.type + '&url=' + me.url;
                if (menuId != '') {
                    me.url = me.url + '&menuId=' + menuId
                }
                setTimeout(function () {
                    var menuName=sessionStorage.getItem("MenuName");
                    if(menuName=="信息共享交换"){menuName+=" >>"}
                    console.log(menuName);
                    $(window.frames["xziFrame"].document.getElementById("appBody")).contents().find("#n_indexNav").html("menuName");
                    $(window.frames["xziFrame"].document.getElementById("appBody")).contents().find("#indexNav").hide();
                },2500)
            } else if (me.type == 'client') {
                me.url = "/login/signin?clientId=" + me.nav + "&url=" + me.url;
                if (menuId != '') {
                    me.url = me.url + '&menuId=' + menuId
                }
            }
            //单病例隐藏头部
            if (me.nav == 'eC1GhVeSSR') {
                $('.header-wrap').hide();
                $('#iframe-main').css({
                    'top': '0'
                });
            }
            me.openNav(me.nav, me.name, me.url);
        },
        getDictSetting:function(){
            $.ajax({
                type: "GET",
                url: "${contextRoot}/doctor/portalSetting/getLogoByDictAndEntryCode",
                data: {"dictId":125,"dictEntryCode":"portalInnerLogo","type":1},
                dataType: "json",
                success: function(data) {
                    if(data.successFlg){
                        $(".header-logo").css({"background":'url(' + data.detailModelList[0].path + ') no-repeat',"background-size":"contain","margin-left":"20px"});
                    } }
            });
        },
        //滚动标签栏
        tabNavInit: function () {
            var $menu = $('.iframe-menu-list'),
                    $li = $menu.children('ul').children('li'),
                    $wrap = $('.iframe-menu'),
                    w;
            if ($('.boss-im').is('.show')) {
                w = $(window).width() - 260;
            } else {
                w = $(window).width();
            }
            if ($li.length * 131 > w) {
                $menu.width($li.length * 131);
                $('.iframe-menu-btn').show();
            }

            $('.iframe-menu-btn>a.prev').on('click', function () {

                var left = $('.iframe-menu-list').data('left') * 1;
                if (left == 0) {
                    return false;
                } else if (left < 0) {
                    $('.iframe-menu-list').animate({'left': left + 130}, "fast", function () {
                        $('.iframe-menu-list').data('left', left + 130);
                    });
                }
            });
            $('.iframe-menu-btn>a.next').on('click', function () {

                var iframeMenuWidth = $wrap.width(),
                        imlWidth = $('.iframe-menu-list').width(),
                        ol = $('.iframe-menu-list')[0].offsetLeft;
                if (imlWidth < iframeMenuWidth) {
                    return false;
                }

                if ((imlWidth + ol) < iframeMenuWidth) {
                    return false;
                }

                var left = $('.iframe-menu-list').data('left') * 1;
                if (left < -(($('.iframe-menu-list>ul>li').length - 2) * 130)) {
                    return false;
                }
                else if (left <= 0) {
                    $('.iframe-menu-list').animate({'left': left - 130}, "fast", function () {
                        $('.iframe-menu-list').data('left', left - 130);
                    });
                }
            });
        },
        //定位导航
        focusNav: function (_this) {
            debugger
            if ($("#nav-main").find(_this).length > 0) {
                $("#nav-main").find("a").removeClass("curr");
                $(_this).addClass("curr");
                var nav = $(_this).attr("nav");
                $("#iframe-main").find("iframe").removeClass("curr");
                $("#iframe-main").find("iframe[nav='" + nav + "']").addClass("curr");
            }
        },
        //关闭导航
        closeNav: function (_this) {
            var me = this;
            var node = $(_this).parents("li");
            var brother = node.prev();
            var isCurr = node.find("a").hasClass("curr");

            var nav = node.find("a").attr("nav");
            node.remove();
            $("#iframe-main").find("iframe[nav='" + nav + "']").remove();

            if (isCurr)  //关闭当前窗口，默认选中前一窗口
            {
                me.focusNav(brother.find("a"));
            }
        },
        //打开导航
        openNav: function (nav, name, url, type) {
            loading = layer.open({
                shade: [0.8, '#393D49'], icon: 1,
                title: false,
                type: 3
            });
            var main = $("#iframe-main");
            var needCreate = true;
            //判断是否已打开
            $.each(main.find("iframe"), function (index, _item) {
                var itemNav = $(_item).attr("nav");
                if (itemNav == nav) {
                    $(_item).addClass("curr");
                    $("#nav-main").find("a[nav='" + itemNav + "']").addClass("curr");
                    needCreate = false;
                    layer.close(loading);
                }
                else {
                    $(_item).removeClass("curr");
                    $("#nav-main").find("a[nav='" + itemNav + "']").removeClass("curr");
                }
            });
            if (needCreate) {
                $("#nav-main").append("<li><a href=\"#\" nav=\"" + nav + "\" class=\"curr\" onclick=\"NewXZIndex.focusNav(this)\"><span class=\"c-nowrap\">" + name + "</span><i class=\"iconfont\" onclick=\"NewXZIndex.closeNav(this)\">&#xe605;</i></a></li>");
                main.append("<iframe onload=\"reloadUrl(this)\" frameborder=\"no\" nav=\"" + nav + "\" src=\"" + url + "\" width=\"100%\" height=\"100%\" class=\"curr\" name=\"xziFrame\" id=\"xziFrame\"></iframe>");
            }
        },
        //布局初始化
        layoutInit: function () {
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
            $(window).resize(function () {
                me.throttle(me.layoutInit(), 300)
            });
            me.$goOut.on('click', function () {
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
        throttle: function (fn, delay) {
            var timer = null;
            return function () {
                var context = this, args = arguments;
                clearTimeout(timer);
                timer = setTimeout(function () {
                    fn.apply(context, args);
                }, delay);
            };
        },
        GetRequest:function () {
            var url = location.search; //获取url中"?"符后的字串
            var theRequest = new Object();
            if (url.indexOf("?") != -1) {
                var str = url.substr(1);
                strs = str.split("&");
                for(var i = 0; i < strs.length; i ++) {
                    theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
                }
            }
            return theRequest;
        },
    };
    layui.use('layer', function () {
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

        <%--var href = $(t).prop('contentWindow').location.src;--%>
        <%--if(href){--%>
            <%--if (href.indexOf('/login') != -1) {--%>
                <%--window.location.reload('http://${contextRoot}/login');--%>
            <%--}--%>
        <%--}--%>
    }
</script>
