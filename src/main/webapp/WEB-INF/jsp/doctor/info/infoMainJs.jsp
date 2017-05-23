<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>



<script type="text/javascript">
    var doctorInfo = {
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
        doctorInfo.init();
        $("#info-main").find("a[id='info-home']").addClass("curr").click();//初次进入，默认选中我的信息

    });


</script>