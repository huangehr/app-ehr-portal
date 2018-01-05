<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<%--<link rel="stylesheet" type="text/css" href="${staticRoot}/widget/artDialog/4.1.7/css/artDialog.min.css">--%>


<script type="text/javascript">
    var layer = parent.layer;
    var loading = layer.open({
        shade: [0.8, '#393D49'],icon: 1,
        title: false,
        type: 3
    });
    var referralIframe = document.getElementById('referralIframe');

    if (referralIframe.attachEvent){
        referralIframe.attachEvent("onload", function(){
            layer.close(loading);
        });
    } else {
        referralIframe.onload = function(e){
            layer.close(loading);
        };
    }

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
                loading = layer.open({
                    shade: [0.8, '#393D49'],icon: 1,
                    title: false,
                    type: 3
                });
                $('#referralIframe').attr('src',$(this).data('src'));
            });
        }
    };

    $(function(){
        doctorInfo.init();
        $("#info-main").find("a[id='info-home']").addClass("curr").click();//初次进入，默认选中我的信息
    });


</script>