<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<script type="text/javascript">
    $(function(){
        //新消息 Cswitch
        $("input.switch-state").Cswitch('size','small');
        //新消息
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
        //警告弹出层
        var artBox=art.dialog({
            lock: true,
            opacity:0.4,
            width: 350,
            height: 200,
            title:'友情提醒',
            content: '内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容',
            ok: function () {

            },
            cancel: true
        });

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

        //页面初始化
        function scrollFun(){
            $('.boss-im').height($(window).height()-40);
            //主iframe
            if($('.header-wrap').length>0){
                $('#iframe-main').height($(window).height()-$('.header-wrap').outerHeight(true)-$('.iframe-menu').outerHeight(true));
            }else{
                $('#iframe-main').height($(window).height());
            }
            $('#iframe-im').css({height:$(window).height()-40});
            //im-main-box 高度
            $('.im-main-search,.im-menu-bd,.im-main-mine,.im-main-apps').css({height:$(window).height()-243});
            //自定义滚动条
            $(".apps-scroll").css({height:$(window).height()-276}).niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});
            $(".search-scroll").css({height:$(window).height()-243}).niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});
            $('.mine-scroll').css({height:$(window).height()-276}).niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});
            $('.apply-scroll').css({height:$(window).height()-276}).niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});
            $('.group-scroll').css({height:$(window).height()-276}).niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});
            $('.tree-scroll').css({height:$(window).height()-276}).niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});
            $('.user-scroll').css({height:$(window).height()-276}).niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});
            $('.tidings-scroll').css({height:$(window).height()-276}).niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});
        }
        scrollFun();
        //窗口大小被改变时
        $(window).resize(function(){throttle(scrollFun(), 300)});
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
                /*$iframe.animate({
                 width: $(window).width()
                 },300);*/
                $iframeTab.animate({
                    width: $(window).width()
                },300,function(){$arrow.css('left',"-15px")});
                $arrow.html('<i class="iconfont">&#xe61c;</i>');
                $('#iframe-im').hide();
            }else{
                $im.addClass('show').animate({
                    right: 0
                },300);
                /*$iframe.animate({
                 width: $(window).width()-260
                 },300);*/
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

        //iframe-menu
        function iframeMenuList(){
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
        iframeMenuList();
    });
    ;(function($){
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
    })(jQuery);
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

</script>