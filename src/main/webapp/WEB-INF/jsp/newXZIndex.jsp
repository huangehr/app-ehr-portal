<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<link rel="stylesheet" href="${staticRoot}/css/index.css" type="text/css" />

<link href="${staticRoot}/widget/navigationMenu/css/font-awesome.css" rel="stylesheet">
<link href="${staticRoot}/widget/navigationMenu/css/style.css" rel="stylesheet">
<link href="${staticRoot}/widget/navigationMenu/css/style-responsive.css" rel="stylesheet" />
<link href="${staticRoot}/widget/navigationMenu/css/default.css" rel="stylesheet" id="style_color">
<link rel="stylesheet" type="text/css" href="${staticRoot}/widget/layui/css/layui.css">

<style>
    .swiper-pagination-bullet-active{background: #ffffff;}
    .user-name{color: #fff}
    .iframe-menu{margin-left: 0}
    #nav-main{height: 41px;white-space: nowrap;   position: relative;}
    #nav-main li{width: 130px;display: inline-block;float: inherit}
    .iframe-menu-btn{
        display: block;
    }
    .ifr_fixed{
        position: fixed;
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
        z-index: 10;
    }
    .f-dn{
        display:none;
    }
</style>
<div class="header-wrap clearfix c-position-r f-dn">
    <div class="header-logo plr20 fl">
    </div>

    <%-- 头部右侧按钮 --%>
    <div class="header-feature fr">
        <ul class="clearfix">
            <li><a href="/home" title="首页"><i class="if-home"></i><span class="gg-tit"></span></a></li>
            <li><a href="#" onclick="NewXZIndex.openNav('notices','平台公告','doctor/notices/notice?userType=1')" title="平台公告"><i class="if-gg"></i><span class="gg-tit"></span></a></li>
            <%--<li><span class="vertical-line">|</span></li>--%>
            <%--<li><a href="#" onclick="NewXZIndex.openNav('message','待办','doctor/messageRem')"><i class="if-db"></i><span class="gg-tit">待办</span></a></li>--%>
            <%--<li><span class="vertical-line">|</span></li>--%>
            <%--<li><a href="#" class="im-mine" onclick="NewXZIndex.openNav('infoMain','个人中心','doctor/infoMain')" title="个人中心"><i class="iconfont">&#xe60b;</i> </a></li>--%>
            <%--<li><span class="vertical-line">|</span></li>--%>
            <li><a href="#" onclick="NewXZIndex.openNav('zyzx','下载中心','noLandingResources/resource/resCenCon')" title="下载中心"><i class="if-zy"></i><span class="gg-tit"></span></a></li>
            <%-- <li><a href="#" class="im-derail" data-im="apply"><i class="iconfont">&#xe68c;</i> 我的应用</a></li>
             <li><span class="vertical-line">|</span></li>
             <li><a href="#" class="im-tidings" data-im="tidings"><i class="iconfont">&#xe606;</i><em>5</em> 我的消息</a></li>
             <li><span class="vertical-line">|</span></li>--%>
            <%--<li><a href="javascript:;" onclick="delCookie()" id="goOut"><i class="iconfont">&#xe68d;</i> 安全退出</a></li>--%>

            <li class="dropdown">
                <a id="indexHead" class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                    <i class="fa fa-head"><img src="${staticRoot}/images/pe_hea.png" alt=""></i>
                </a>
                <span class="name-info"></span><i class="fa fa-icon fa-dbx"></i>
                <ul class="dropdown-con" style="display: none">
                    <li>
                        <a href="javascript:void(0);" onclick="NewXZIndex.openNav('infoMain','个人中心','doctor/infoMain')">
                            <div class="text-center link-block">
                                个人中心
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" onclick="delCookie()" id="goOut">
                            <div class="text-center link-block">
                                退出
                            </div>
                        </a>
                    </li>
                </ul>
            </li>

        </ul>
    </div>
    <%--<div class="fr user-name">欢迎 <span class="name-info"></span></div>--%>
</div>

<div class="iframe-menu c-position-r" style="display: none">
    <div class="c-position-a iframe-menu-list" data-left="0">
        <ul class="clearfix" id="nav-main">
            <%--<li><a href="#" nav="main" class="curr" onclick="NewXZIndex.focusNav(this)"><span class="c-nowrap">门户</span></a></li>--%>
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

<div id="iframe-main" style="position: absolute;left: 0;width: 100%;bottom: 0;top: 0px;">
    <%--<iframe  nav="main" src="${contextRoot}/main" width="100%" height="100%" class="curr"></iframe>--%>
</div>

