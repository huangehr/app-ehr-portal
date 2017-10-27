<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<link rel="stylesheet" href="${staticRoot}/css/index.css" type="text/css" />

<link href="${staticRoot}/widget/navigationMenu/css/font-awesome.css" rel="stylesheet">
<link href="${staticRoot}/widget/navigationMenu/css/style.css" rel="stylesheet">
<link href="${staticRoot}/widget/navigationMenu/css/style-responsive.css" rel="stylesheet" />
<link href="${staticRoot}/widget/navigationMenu/css/default.css" rel="stylesheet" id="style_color">

<style>
    .swiper-pagination-bullet-active{background: #ffffff;}
    .user-name{color: #fff}
    .iframe-menu{margin-left: 0}
</style>
<div class="header-wrap clearfix c-position-r">
    <div class="header-logo plr20 fl">
    </div>

    <%-- 头部右侧按钮 --%>
    <div class="header-feature fr">
        <ul class="clearfix">
            <li><a href="#" onclick="NewXZIndex.openNav('notices','平台公告','doctor/notices/notice?userType=1')"><i class="if-gg"></i><span class="gg-tit">平台公告</span></a></li>
            <%--<li><span class="vertical-line">|</span></li>--%>
            <%--<li><a href="#" onclick="NewXZIndex.openNav('message','待办','doctor/messageRem')"><i class="if-db"></i><span class="gg-tit">待办</span></a></li>--%>
            <li><span class="vertical-line">|</span></li>
            <li><a href="#" class="im-mine" onclick="NewXZIndex.openNav('infoMain','个人中心','doctor/infoMain')" <%--data-im="mine"--%>><i class="iconfont">&#xe60b;</i> 个人中心</a></li>
            <li><span class="vertical-line">|</span></li>
            <li><a href="#" onclick="NewXZIndex.openNav('zyzx','下载中心','doctor/resource/resCenCon')"><i class="if-zy"></i><span class="gg-tit">下载中心</span></a></li>
            <%-- <li><a href="#" class="im-derail" data-im="apply"><i class="iconfont">&#xe68c;</i> 我的应用</a></li>
             <li><span class="vertical-line">|</span></li>
             <li><a href="#" class="im-tidings" data-im="tidings"><i class="iconfont">&#xe606;</i><em>5</em> 我的消息</a></li>
             <li><span class="vertical-line">|</span></li>--%>
            <li><a href="javascript:;" onclick="delCookie()" id="goOut"><i class="iconfont">&#xe68d;</i> 安全退出</a></li>
        </ul>
    </div>
    <div class="fr user-name">欢迎 <span class="name-info"></span></div>
</div>

<div class="iframe-menu c-position-r">
    <div class="c-position-a iframe-menu-list width-100" data-left="0">
        <ul class="clearfix" id="nav-main">
            <li><a href="#" nav="main" class="curr" onclick="NewXZIndex.focusNav(this)"><span class="c-nowrap">门户</span></a></li>
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

<div id="iframe-main" style="position: absolute;left: 0;width: 100%;bottom: 0;top: 77px;">
    <iframe  nav="main" src="${contextRoot}/main" width="100%" height="100%" class="curr"></iframe>
</div>
