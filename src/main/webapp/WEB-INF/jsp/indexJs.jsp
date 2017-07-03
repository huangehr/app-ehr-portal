<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>


<link rel="stylesheet" href="${staticRoot}/widget/cswitch/1.0/css/cswitch.css" type="text/css" />
<script type="text/javascript" src="${staticRoot}/widget/cswitch/1.0/js/cswitch.js"></script>

<script type="text/javascript">
    var indexPage = {
        headIndex: ${headIndex},
        $clearfixLis: $('.clearfix').find('li'),
        init:function () {
            var me = this;
            //渲染控件

            //me.headerNavInit();
            me.tabNavInit();
            /*me.newMessage();*/
            me.layoutInit();
            //me.imInit();

            //窗口大小被改变时
            $(window).resize(function(){throttle(me.layoutInit(), 300)});

            //函数节流
            function throttle(fn, delay){
                var timer = null;
                return function(){
                    var context = this, args = arguments;
                    clearTimeout(timer);
                    timer = setTimeout(function(){
                        fn.apply(context, args);
                    }, delay);
                };
            };
            if (this.headIndex != -1) {
                $(this.$clearfixLis[this.headIndex]).find('a').trigger('click');
            }
        },
        //头部切换导航
        /*headerNavInit:function(){
            //分机构导航
            $('span[data-menu="header"]').on('click',function(){
                var $this=$(this).parent(),
                        $menu=$this.find('.header-menu-box'),
                        $bg=$this.find('.header-menu-bg');
                if($menu.css('display')=='none'){
                    $menu.slideDown();
                    $bg.show();
                }else{
                    $menu.slideUp();
                    $bg.hide();
                }
            });
            $('.header-menu-bg').on('click',function(){
                $('.header-menu-box').slideUp();
                $('.header-menu-bg').hide();
            });
        },*/
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
                }
                else if(left<0){
                    $('.iframe-menu-list').animate({'left':left+130},"fast",function(){
                        $('.iframe-menu-list').data('left',left+130);
                    });
                }
            });
            $('.iframe-menu-btn>a.next').on('click',function(){
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
        //右下角新消息提醒
        /*newMessage:function () {
            art.dialog({
                skin: 'artDialog-blue',
                title: '<i class="iconfont mr5 c-f18">&#xe69b;</i>新消息',
                content: '<div class="c-f14 c-333">hello world!</div>',
                width: 300,
                left: '100%',
                top: '100%',
                fixed: true,
                time: 3,
                mouseenterOffTime:true,
                drag: false,
                resize: false,
                closeAnimatedTime:300,
                button:[
                    {
                        name: '立即查看',
                        callback: function () {
                            alert('你不同意');
                            return true;
                        }
                    },
                    {
                        name: '设置',
                        callback: function () {
                            var contents=$('.module-artdialog').get(0);
                            var artBox=art.dialog({
                                lock: true,
                                opacity:0.4,
                                fixed: false,
                                padding: '0px',
                                width: 600,
                                title:'<i class="iconfont">&#xe68b;</i> 自定义消息',
                                content: contents,
                                init:function(){
                                    $(".module-artdialog").niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});
                                },
                                ok: function () {

                                },
                                cancel: true
                            });
                            return true;
                        }
                    }
                ]
            });
        },*/
        //布局初始化
        layoutInit:function(){
            //$('.boss-im').height($(window).height()-40);
            //主iframe
            if($('.header-wrap').length>0){
                $('#iframe-main').height($(window).height()-$('.header-wrap').outerHeight(true)-$('.iframe-menu').outerHeight(true));
            }else{
                $('#iframe-main').height($(window).height());
            }
            //$('#iframe-im').css({height:$(window).height()-40});
            //im-main-box 高度
            //$('.im-main-search,.im-menu-bd,.im-main-mine,.im-main-apps').css({height:$(window).height()-243});
            //自定义滚动条
            /*$(".apps-scroll").css({height:$(window).height()-276}).niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});
            $(".search-scroll").css({height:$(window).height()-243}).niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});
            $('.mine-scroll').css({height:$(window).height()-276}).niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});
            $('.apply-scroll').css({height:$(window).height()-276}).niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});
            $('.group-scroll').css({height:$(window).height()-276}).niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});
            $('.tree-scroll').css({height:$(window).height()-276}).niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});
            $('.user-scroll').css({height:$(window).height()-276}).niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});
            $('.tidings-scroll').css({height:$(window).height()-276}).niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});*/


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
                }
                else{
                    $(_item).removeClass("curr");
                    $("#nav-main").find("a[nav='"+itemNav+"']").removeClass("curr");
                }
            });

            //新增iframe
            if(needCreate)
            {
                $("#nav-main").append("<li><a href=\"#\" nav=\""+nav+"\" class=\"curr\" onclick=\"indexPage.focusNav(this)\"><span class=\"c-nowrap\">"+name+"</span><i class=\"iconfont\" onclick=\"indexPage.closeNav(this)\">&#xe605;</i></a></li>");
                if(type=="2")
                {
                    url = "/login/signin?clientId="+nav+"&url="+ url;
                }
                main.append("<iframe frameborder=\"no\" nav=\""+nav+"\" src=\""+url+"\" width=\"100%\" height=\"100%\" class=\"curr\"></iframe>");
            }
        },

        //IM初始化
        /*imInit:function(){
            var me = this;
            //搜索
            $('input[data-im="search"]').on('focus',function(){
                if($(this).val()=='搜索...'){
                    $(this).val('').addClass('focus');
                    $('.im-search-btn').show();
                }

            }).on('blur',function(){
                if($(this).val()==''){
                    $('.im-menu-hd>a').eq(0).click();
                    searchFun();
                }
            });
            $('.im-search-btn').on('click',function(){
                $(".search-scroll").getNiceScroll().resize();
                $('.im-main-search').show();
                $('.im-search-close').show();
                $('.im-menu-hd>a.curr').removeClass('curr');
            });
            $('.im-search-close').on('click',function(){
                $('input[data-im="search"]').val('').focus();
            });
            $('.boss-im').on('click','a#addapps',function(){
                $('.im-main-apps').show();
                $('.apps-scroll').getNiceScroll().resize();
            });
            function searchFun(){
                $('input[data-im="search"]').val('搜索...').removeClass('focus');
                $('.im-search-btn').hide();
                $('.im-search-close').hide();
                $('.im-main-search').hide();
            }


            //tabs
            $('.im-menu').tabs({
                callback:function(index){
                    $('.im-main-mine,.im-main-apps').hide();
                    searchFun();
                    switch (index) {
                        case 0:
                            $('.tidings-scroll').getNiceScroll().resize();
                            break;
                        case 1:
                            $('.apply-scroll').getNiceScroll().resize();
                            break;
                        case 2:
                            userTabsScroll($('.im-user-hd').find('a.curr').index());
                            break;
                    }
                }
            });
            $('.im-user-tabs').tabs({
                callback:function(index){
                    userTabsScroll(index);
                }
            });
            function userTabsScroll(index){
                switch (index) {
                    case 0:
                        $('.user-scroll').getNiceScroll().resize();
                        break;
                    case 1:
                        $('.group-scroll').getNiceScroll().resize();
                        break;
                    case 2:
                        $('.tree-scroll').getNiceScroll().resize();
                        break;
                }
            }
            //im主窗口
            $('.boss-im-arrow').on('click',function(){
                showImBox();
            });
            $('a[data-im="mine"]').on('click',function(){
                showImBox("mine");
            });
            $('a[data-im="tidings"]').on('click',function(e){
                showImBox("tidings");
                showMessagebox(e);
            });
            $('a[data-im="apply"]').on('click',function(){
                showImBox("apply");
            });
            function showMessagebox(e){
                e.stopPropagation();
                e.preventDefault();
                var $el=$('.message-box-wrap');
                if($el.css('display')=='none'){
                    if($('.boss-im').is('.show')){
                        $el.slideDown('slow');
                    }
                }else{
                    $el.slideUp('slow');
                }
                $(document).on('click',function(){
                    if($el.css('display')!='none'){
                        $el.slideUp('slow');
                    }
                });
                $el.on('click','li',function(){
                    if($(this).data('click')) return false;
                    $(this).data('click',true);
                })
            }

            $('.im-my-organize').on('click',function(e){
                e.stopPropagation();
                e.preventDefault();
                var $el=$('.im-organize-list');
                if($el.css('display')=="none"){
                    $el.slideDown('slow');
                    $(this).find('a').addClass('show');
                }else{
                    $el.slideUp('slow');
                    $(this).find('a').removeClass('show');
                }
                $(document).on('click',function(){
                    if($el.css('display')!='none'){
                        $el.slideUp('slow');
                    }
                });
                $el.on('click','li',function(){
                    if($(this).data('click')) return false;
                    $(this).data('click',true);
                });
            });

            function showImBox(dom){
                var $im=$('.boss-im'),
                        $arrow=$('.boss-im-arrow'),
                        $iframe=$('#iframe-main'),
                        $menua=$('.im-menu-hd>a'),
                        $iframeTab=$('.iframe-menu');
                if(typeof(dom)=='undefined'){
                    $('.im-main-mine').hide();
                    searchFun();
                }
                if(dom!=''){
                    if($im.is('.show')){
                        switch (dom) {
                            case 'mine':
                                if($('.im-main-mine').css('display')=='none'){
                                    $('.im-menu-hd>a.curr').removeClass('curr');
                                    $('.im-main-mine').show();
                                    return false;
                                }
                                break;
                            case 'tidings':
                                if(!($menua.eq(0).is('.curr'))){
                                    searchFun();
                                    $('.im-main-mine').hide();
                                    $menua.eq(0).click();
                                    return false;
                                }
                                break;
                            case 'apply':
                                if(!($menua.eq(1).is('.curr'))){
                                    searchFun();
                                    $('.im-main-mine').hide();
                                    $menua.eq(1).click();
                                    return false;
                                }
                                break;
                        }

                    }else{
                        switch (dom) {
                            case 'mine':
                                $('.im-main-mine').show();
                                $('.im-menu-hd>a.curr').removeClass('curr');
                                break;
                            case 'tidings':
                                $menua.eq(0).click();
                                break;
                            case 'apply':
                                $menua.eq(1).click();
                                break;
                        }
                    }
                }

                if($im.is('.show')){
                    $im.removeClass('show').animate({
                        right: -275
                    },300);
                    /!*$iframe.animate({
                     width: $(window).width()
                     },300);*!/
                    $iframeTab.animate({
                        width: $(window).width()
                    },300,function(){$arrow.css('left',"-15px")});
                    $arrow.html('<i class="iconfont">&#xe61c;</i>');
                    $('#iframe-im').hide();
                }else{
                    $im.addClass('show').animate({
                        right: 0
                    },300);
                    /!*$iframe.animate({
                     width: $(window).width()-260
                     },300);*!/
                    $iframeTab.animate({
                        width: $(window).width()-260
                    },300);
                    $arrow.css('left',"0px").html('<i class="iconfont">&#xe608;</i>');
                }
            }
            //iframe-im
            $('.iframe-im-close').on('click',function(){
                $('#iframe-im').hide();
            });
            $('.im-my-head').on('click',function(){
                $('#iframe-im').show();
            });

            me.imOrgTreeInit();
            me.imTabInit();
        },*/
        //初始化IM组织树
        /*imOrgTreeInit:function(){
            //组织列表
            $(document).on('click','div.tree-hd',function(){
                var $el=$(this),
                        $next=$el.next(),
                        $a=$el.children('a'),
                        $iconfont=$el.find('i.iconfont'),
                        $box=$next.find('.tree-bd-box');
                $box.css('padding-left',$a.position().left);
                if($next.css('display')=='none'){
                    $iconfont.remove();
                    $a.prepend('<i class="iconfont">&#xe60f;</i>');
                    $next.slideDown();
                }else{
                    $iconfont.remove();
                    $a.prepend('<i class="iconfont">&#xe609;</i>')
                    $next.slideUp();
                }
            });
        },*/
       /* imTabInit:function() {
            //选项卡
            $.fn.tabs=function(options){
                if(this.length == 0) return this;

                if(this.length > 1){
                    this.each(function(){$(this).tabs(options)});
                    return this;
                }
                if($(this).data('binds')=='yes') return false;
                $(this).data('binds','yes');
                var defaults={};
                var opts=$.extend(defaults,options || {});
                var $this=$(this),
                        $hd=$this.children('div.tabs-hd').children('a'),
                        $bd=$this.children('div.tabs-bd').children('div.tabs-bd-box');

                $hd.on('click',function(){
                    var $el=$(this),
                            index=$el.index();
                    $el.addClass('curr').siblings().removeClass('curr');
                    $bd.eq(index).addClass('curr').siblings().removeClass('curr');
                    if(opts.callback){
                        opts.callback(index);
                    }
                })
            }
        }*/
    };

    $(function(){
        indexPage.init();
        var activeIndex = '${activeIndex}';
        $.ajax({
            url:  '${contextRoot}/system/userManage/getAppTreeByType',
            type: 'GET',
            dataType: 'json',
            data:{},
            success: function (data) {
//                debugger
                if (data.successFlg) {
                    var resultData = data.detailModelList;
                    var resultHtml = "";
                    for(var i=0;i<resultData.length;i++){
                        var menuData = resultData[i];
                        var children = menuData.children;
                        resultHtml += '<li>'+
                                ' <div class="div-head-menu">'+
                                '<label class="f-fs16">'+menuData.value+'</label>'+
                                '<i class="if-sanjiaox"></i>'+
                                ' </div>'+
                                ' <ul class="f-pt16 f-dn menu-item-ul">';
                        for(var j=0;j<children.length;j++){
                            var childrenData = children[j];
                            var appCode = childrenData.code;
                            var appClass = "";
                            switch(appCode)
                            {
                                case 'DataCentre'://数据中心-数据资源中心
                                    appClass = "if-sjzyzx";
                                    break;
                                case 'ESB'://基础支撑-信息共享交换平台
                                    appClass = "if-xxgxjhpt";
                                    break;
                                case 'RSRESOURCES'://基础支撑-资源视图管理平台
                                    appClass = "if-zystglpt";
                                    break;
                                case 'ResourceManager'://基础支撑-云资源管理
                                    appClass = "if-yzygl";
                                    break;
                                case 'EHR'://基础支撑-基础信息管理平台
                                    appClass = "if-yjcxxgl";
                                    break;
                                case 'RegionalImage'://业务协作-区域影像平台
                                    appClass = "if-quyxpt";
                                    break;
                                case 'EHR003'://业务协作-双向转诊服务平台
                                    appClass = "if-sxzzfwpt";
                                    break;
                                case 'EHR004'://业务协作-远程会诊服务平台
                                    appClass = "if-ychzfwpt";
                                    break;
                                case 'EHR002'://业务协作-区域检查检验平台
                                    appClass = "if-qyjcjypt";
                                    break;
                                case 'EMR'://业务协作-区域电子病历平台
                                    appClass = "if-qydzbl";
                                    break;
                                case 'EHR007'://应用服务-公共卫生服务平台
                                    appClass = "if-ggwsfwpt";
                                    break;
                                case 'EHR009'://应用服务-卫生应急指挥平台
                                    appClass = "if-wsyjzhpt";
                                    break;
                                case 'EHR006'://应用服务-公众健康服务平台
                                    appClass = "if-gzjkfwpt";
                                    break;
                                case 'EHR008'://应用服务-远程医学教育系统
                                    appClass = "if-ycyxjyxt";
                                    break;
                                case 'EHR005'://应用服务-综合分析平台
                                    appClass = "if-zhfxpt";
                                    break;
                                default:
                                    break;
                            }

                            resultHtml+= ' <li class="f-fs14 div-menu-item" nav="'+childrenData.id+'" name="'+childrenData.name+'" src="'+childrenData.url+'" type="2">'+
                                    ' <i class="'+appClass+'"></i>'+childrenData.name+
                                    ' </li>';
                        }
                        resultHtml+=' </ul>'+
                                '</li>';
                    }

                    $(".div-menu .menu-ul").html(resultHtml);
                    if (activeIndex != -1) {
                        setTimeout(function(){
                            var num1 = 0,
                                    num2 = 0;
                            if (activeIndex == 0) {
                                num1 = 2;
                            }
                            if (activeIndex == 1) {
                                num1 = 3;
                                num2 = 2;
                            }
                            if (activeIndex == 2) {
                                num1 = 1;
                            }
                            if (activeIndex == 3) {
                                num1 = 0;
                            }
                            $(".menu-ul").find("li .div-head-menu").eq(num1).trigger("click");
                            $(".menu-ul").find("li .div-head-menu").eq(num1).closest("li").find(".menu-item-ul li").eq(num2).trigger("click");
                        },500)
                    }
                } else{
                    art.dialog({
                        title: "警告",
                        time: 2,
                        content: "菜单获取失败"
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


        $(".menu-ul").on("click","li .div-head-menu",function(event){
            $(".menu-ul").find(".menu-item-ul").hide();
            $(".menu-ul").find("li .div-head-menu i").removeClass("if-sanjiaos").removeClass("if-sanjiaox");
            $(".menu-ul").find("li .div-head-menu i").addClass("if-sanjiaox")
            $(this).find("i").removeClass("if-sanjiaox").addClass("if-sanjiaos");
            $(this).closest("li").find(".menu-item-ul").slideToggle(200);
        }).on("click",".menu-item-ul li",function(){
            $(".menu-item-ul li").removeClass("active");
            $(this).addClass("active");
            var nav = $(this).attr("nav");
            var name =$(this).attr("name");
            var src = $(this).attr("src");
            var type = $(this).attr("type");
            top.indexPage.openNav(nav,name,src,type);
        });


        var mySwiper = new Swiper ('.swiper-container', {
            direction: 'horizontal',
            loop: false,
            autoplay:3000,
            // 如果需要分页器
            pagination: '.swiper-pagination',
            // 如果需要前进后退按钮
//            nextButton: '.swiper-button-next',
//            prevButton: '.swiper-button-prev',
            // 如果需要滚动条
//            scrollbar: '.swiper-scrollbar',
        })

        //警告弹出层
        /*var artBox=art.dialog({
            lock: true,
            opacity:0.4,
            width: 350,
            height: 200,
            title:'友情提醒',
            content: '内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容',
            ok: function () {

            },
            cancel: true
        });*/

        //控制侧边栏
        var $menuCon = $('.menu-con'),
             $barBtn = $('.bar-btn'),
             $barSC = $('.bar-s-c');
        $barBtn.on( 'click', function () {
            var $that = $(this),
                it = $that.hasClass('active');
            if (it) {
                $that.removeClass('active');
                $barSC.html('显示');
                $menuCon.animate({
                    left: -200
                });
            } else {
                $that.addClass('active');
                $barSC.html('隐藏');
                $menuCon.animate({
                    left: 0
                });
            }
        });
    });

    $(window).load(function(){
        $(".div-menu").mCustomScrollbar({
            theme:"dark", //主题颜色
            scrollButtons:{
                enable:false,
                scrollType:"continuous",
                scrollSpeed:20,
                scrollAmount:40
            },
            horizontalScroll:false,
        });
    })
</script>