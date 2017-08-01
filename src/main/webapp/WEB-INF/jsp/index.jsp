<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<link rel="stylesheet" href="${staticRoot}/css/index.css" type="text/css" />

<link href="${staticRoot}/widget/navigationMenu/css/font-awesome.css" rel="stylesheet">
<link href="${staticRoot}/widget/navigationMenu/css/style.css" rel="stylesheet">
<link href="${staticRoot}/widget/navigationMenu/css/style-responsive.css" rel="stylesheet" />
<link href="${staticRoot}/widget/navigationMenu/css/default.css" rel="stylesheet" id="style_color">

<style>
    .swiper-pagination-bullet-active{background: #ffffff;}
    /*.div-menu{position: absolute;top:0;left:0;z-index: 999;}*/
    /*.bar-btn{width: 50px;height: 125px;position: absolute;right: -50px;top: 50%;background: #000;opacity: 0.3;cursor: pointer;transform: translateY(-50%)}*/
    /*.menu-con{position: absolute;width: 200px;left:-200px;top: 40px;bottom: 0;z-index: 999;}*/
    /*.bar-btn-cro{width: 5px;height: 5px;border-style: solid;border-color: #fff;border-width: 1px}*/
    /*/!*.bar-btn:after{content: " ";display: inline-block;height: 6px;width: 6px;border-width: 2px 2px 0 0;border-color: #C8C8CD;border-style: solid;-webkit-transform: matrix(0.71, 0.71, -0.71, 0.71, 0, 0);transform: matrix(0.71, 0.71, -0.71, 0.71, 0, 0);position: relative;top: -2px;position: absolute;top: 50%;margin-top: -4px;right: 6px;}*!/*/
    /*.bar-btn.active:after{border-width: 0 0 2px 2px;right: 2px;}*/
    /*.bar-btn-con{width: 14px;display: block;font-size: 14px;color: #fff;margin: 0 auto;margin-top: 21px;}*/
    .user-name{color: #fff}
</style>
<div class="header-wrap clearfix c-position-r">
    <div class="header-logo plr20 fl">
        <%--<h1 class="c-f20 c-fff" style="line-height:40px">健康之路智慧医疗云平台</h1>--%>
    </div>

    <%-- 切换机构菜单按钮 --%>
    <%--<div class="header-menu fl">
        <span class="header-menu-arrow pl15 c-fff c-f14" data-menu='header'><i class="iconfont c-f14 mr5">&#xe657;</i>切换机构</span>
        <div class="header-menu-bg c-position-f c-position-all c-hide"></div>
        <div class="header-menu-box c-position-a">
            <ul class="clearfix">
                <li><a href="#"><img src="${staticRoot}/images/index_bg.jpg"/> <span>健康之路</span></a></li>
            </ul>
        </div>
    </div>--%>

    <%-- 头部右侧按钮 --%>
    <div class="header-feature fr">
        <ul class="clearfix">
            <li><a href="#" onclick="indexPage.openNav('notices','平台公告','doctor/notices/notice?userType=1')"><i class="if-gg"></i><span class="gg-tit">平台公告</span></a></li>
            <li><span class="vertical-line">|</span></li>
            <li><a href="#" onclick="indexPage.openNav('message','待办','doctor/messageRem')"><i class="if-db"></i><span class="gg-tit">待办</span></a></li>
            <li><span class="vertical-line">|</span></li>
            <li><a href="#" class="im-mine" onclick="indexPage.openNav('infoMain','个人中心','doctor/infoMain')" <%--data-im="mine"--%>><i class="iconfont">&#xe60b;</i> 个人中心</a></li>
            <li><span class="vertical-line">|</span></li>
            <li><a href="#" onclick="indexPage.openNav('zyzx','下载中心','doctor/resource/resCenCon')"><i class="if-zy"></i><span class="gg-tit">下载中心</span></a></li>
           <%-- <li><a href="#" class="im-derail" data-im="apply"><i class="iconfont">&#xe68c;</i> 我的应用</a></li>
            <li><span class="vertical-line">|</span></li>
            <li><a href="#" class="im-tidings" data-im="tidings"><i class="iconfont">&#xe606;</i><em>5</em> 我的消息</a></li>
            <li><span class="vertical-line">|</span></li>--%>
            <li><a href="javascript:;" onclick="delCookie()" id="goOut"><i class="iconfont">&#xe68d;</i> 安全退出</a></li>
        </ul>
    </div>
    <div class="fr user-name">欢迎 <span class="name-info"></span></div>
</div>

<%--右侧个人面板机构切换--%>
<%--<div class="message-box-wrap c-position-a c-hide">
    <div class="message-box">
        <div class="message-box-hd">
            <s class="message-box-arrow message-box-t"><s></s></s>
        </div>
        <div class="message-box-bd bgc-fff">
            <ul>
                <li><a href="#"><span class="c-nowrap">广州军区福建总院广州军区福建总院广州军区福建总院</span> <span class="un">5</span></a></li>
                <li><a href="#"><span class="c-nowrap">健康之路</span> <span class="un">5</span></a></li>
                <li><a href="#"><span class="c-nowrap">福建医科大学附属第一医院</span> <span class="un">5</span></a></li>
                <li><a href="#"><span class="c-nowrap">福建省卫生厅泉州总工会</span> <span class="un">15</span></a></li>
            </ul>
        </div>
    </div>
</div>--%>

<%--首页主菜单按钮--%>
<div class="page-sidebar navbar-collapse">
    <div class="sidebar-mana">
        <ul class="page-sidebar-menu">
            <li class="start">
                <span>导航栏</span>
                <div class="sidebar-toggler hidden-phone"></div>
            </li>
        </ul>
    </div>
</div>

<div class="iframe-menu c-position-r">
    <div class="c-position-a iframe-menu-list width-100" data-left="0">
        <ul class="clearfix" id="nav-main">
            <%--<li><a href="#" nav="home" class="curr" onclick="indexPage.focusNav(this)"><span class="c-nowrap">首页</span></a></li>--%>
        </ul>
    </div>
    <div class="c-position-a iframe-menu-btn">
        <a href="javascript:;" class="prev"><i class="iconfont">&#xe61c;</i></a><a href="javascript:;" class="next"><i class="iconfont">&#xe608;</i></a>
    </div>
    <div class="iframe-menu-mouse c-position-a c-hide">
        <ul>
            <li><a href="javascript:;">关闭标签页</a></li>
            <li><a href="javascript:;">关闭其他标签页</a></li>
        </ul>
    </div>
</div>

<div id="iframe-main" style="position: absolute;left: 200px;width: calc(100% - 200px);">

</div>

<!-- 左侧菜单需要的模板-->
<script type="text/tmpl" id="menu_tmpl">
    <li class="">
        <a href="javascript:;" class="menu-a">
            <i class="fa fa-th-large">
                <b class=""></b>
            </i>
            <span class="title"></span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu" style="overflow: hidden; display: none;">

        </ul>
    </li>
</script>

<script type="text/tmpl" id="leaf_menu_tmpl">
    <li class="tooltips end sub-menu" data-placement="right" data-original-title="">
        <a href="#" data-url="">
            <i class="fa fa-tasks">
                <b class="bg-warning"></b>
            </i>
            <span class="title"></span>
        </a>
    </li>
</script>

<script type="text/tmpl" id="leaf_tmpl">
    <li>
        <a tabindex="-1" href="#" data-url="">
            <i class="fa fa-angle-right"></i>
        </a>
    </li>
</script>
