<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<link rel="stylesheet" href="${staticRoot}/css/index.css" type="text/css" />

<link href="${staticRoot}/widget/navigationMenu/css/font-awesome.css" rel="stylesheet">
<link href="${staticRoot}/widget/navigationMenu/css/style.css" rel="stylesheet">
<link href="${staticRoot}/widget/navigationMenu/css/style-responsive.css" rel="stylesheet" />
<link href="${staticRoot}/widget/navigationMenu/css/default.css" rel="stylesheet" id="style_color">



<%--首页主菜单按钮--%>
<div class="page-sidebar navbar-collapse" style="background: #23344a;overflow: initial;">
    <div class="sidebar-mana">
        <ul class="page-sidebar-menu">
            <li class="start" >
                <%--<span>导航栏</span>--%>
                <%--<div class="sidebar-toggler hidden-phone"></div>--%>
                <div class="sidebar-toggler hidden-phone" style="cursor:auto"></div>
            </li>
        </ul>
    </div>
</div>
<div id="if-main" style="height:100%;position: absolute;left: 55px;width: calc(100% - 55px);border-top: 1px solid #ccc;">
    <iframe id="appBody" name="myIFrame" nav="imain" src="" width="100%" height="100%" class=""></iframe>
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
            <i class="fa fa-angle-right" style="color:transparent;"></i>
        </a>
    </li>
</script>
