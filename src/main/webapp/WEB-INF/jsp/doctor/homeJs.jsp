<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>


<script type="text/javascript">
    $(function(){
        $('.c-panel').hover(function(){
            $(this).find('.tools').show();
        },function(){
            $(this).find('.tools').hide();
        });

        $('.add-app-btn').on('click',function(){
            $('.app-dialog-wrap').show();
        });

        $('#add-app-cancel').on('click',function(){
            $('.app-dialog-wrap').hide();
        });



        function sidebarMenuHeight(){
            $(".index-left-scroll").height($(window).height()-21);
            $('.app-dialog-box').height($(window).height()-200);
        }

        sidebarMenuHeight();

        $(window).resize(function(){throttle(sidebarMenuHeight(), 300)});

        if(!($.browser.msie && $.browser.version == 6)){
            $(".index-left-scroll,.index-todo-list,.app-dialog-box").niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});
        }else{
            $(".index-left-scroll,.index-todo-list,.app-dialog-box").addClass('c-auto-y');
        }

        $("input.switch-state").Cswitch('size','small');

        $('.add-module-btn').on('click',function(){
            var contents=$('.module-artdialog').get(0);
            var artBox=art.dialog({
                lock: true,
                opacity:0.4,
                fixed: false,
                padding: '0px',
                width: 600,
                title:'<i class="iconfont">&#xe68b;</i> 自定义窗口',
                content: contents,
                init:function(){
                    $(".module-artdialog").niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});
                },
                ok: function () {

                },
                cancel: true
            });
        });

        $('.app-box-bd li').poshytip({
            content:function(updateCallback) {
                var $div = $(this).children('div');
                $('#poshytipTitle').html($div.data('title'));
                $('#poshytipInfo').html($div.data('info'));
                var btnHtml='';
                switch ($div.data('btn')){
                    case 'show':
                        btnHtml = '<a href="javascript:;" class="c-btn-green c-btn-tiny">恢复应用</a>';
                        break;
                    case 'hide':
                        btnHtml = '<a href="javascript:;" class="c-btn-red c-btn-tiny">隐藏应用</a>';
                        break;
                    case 'add':
                        btnHtml = '<a href="javascript:;" class="c-btn-blue c-btn-tiny">添加应用</a>';
                        break;
                    case 'del':
                        btnHtml = '<a href="javascript:;" class="c-btn-white c-btn-tiny">删除应用</a>';
                        break;
                }
                $('#poshytipBtn').html(btnHtml);
                return $('#poshytip-box').html();
            },
            className: 'tip-white',
            liveEvents: true,
            alignTo: 'target',
            alignX: 'right',
            alignY: 'center',
            offsetX: 0,
            contentPadding:'20px'
        });

    });
</script>