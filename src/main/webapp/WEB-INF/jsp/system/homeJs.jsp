<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>



<script type="text/javascript">
    var systemHome = {
        init:function () {
            var me = this;

            me.layout();
        },
        //窗口自适应
        layout:function () {
            $(".page-layout-menu").height($(window).height()).niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});

            $('.page-layout-menu').on('click',function(){
                $(".page-layout-menu").getNiceScroll().resize();
            });

            $(".page-layout-menu").on('mouseover',function() {
                $(".page-layout-menu").getNiceScroll().resize();
            });

            $('.menu-collapse').on('click','a',function(){
                $('#referralIframe').attr('src',$(this).data('src'));
            });
        }
    };

    $(function(){
       systemHome.init();
    });


</script>