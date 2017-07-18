<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%--定义页面文档类型以及使用的字符集,浏览器会根据此来调用相应的字符集显示页面内容--%>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <%--IE=edge告诉IE使用最新的引擎渲染网页，chrome=1则可以激活Chrome Frame.--%>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${title}</title>
    <link rel="stylesheet" href="http://f1.yihuimg.com/concat/cross_pc/1.1.1/iconfont/iconfont.css" type="text/css"/>
    <link rel="stylesheet" href="http://f1.yihuimg.com/concat/cross_pc/1.1.1/cross/css/cross.min.css" type="text/css"/>
    <link rel="stylesheet" href="http://f1.yihuimg.com/concat/cross_pc/1.1.1/cross/css/cross.ui.min.css" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${staticRoot}/css/index_work.css">
    <link rel="stylesheet" href="${staticRoot}/ligerui/skins/Aqua/css/ligerui-all.css">
    <link rel="stylesheet" href="${staticRoot}/ligerui/skins/custom/css/all.css">
    <link rel="stylesheet" href="${staticRoot}/widget/scrollbar/jquery.mCustomScrollbar.css">
    <%--<link rel="stylesheet" href="${staticRoot}/css/liger_style.css">--%>

    <%--<!--[if lt IE 9]>
    &lt;%&ndash; 让IE9以下的IE支持HTML5元素 &ndash;%&gt;
    <script src="${staticRoot}/extra/html5shiv.js"></script>
    <![endif]-->--%>
    <script>
        window.root = "${contextRoot}";//项目根路径
    </script>

</head>
<body>
<tiles:insertAttribute name="contentPage"/>

<script type="text/javascript"  src="http://f1.yihuimg.com/concat/cross_pc/1.1.1/cross/js/jquery/1.8.3/jquery.js"></script>
<script src="${staticRoot}/widget/navigationMenu/js/jquery.cookie.min.js"></script>
<script src="${staticRoot}/ligerui/ligerui.all.js"></script>
<script src="${staticRoot}/ligerui/custom/ligerEx.js"></script>
<script src="${staticRoot}/ligerui/custom/ligerOverwrite.js"></script>
<script src="${staticRoot}/ligerui/plugins/customTree.js"></script>

<script src="${staticRoot}/widget/scrollbar/jquery.mousewheel.min.js"></script>
<script src="${staticRoot}/widget/scrollbar/jquery.mCustomScrollbar.js"></script>
<script src="${staticRoot}/widget/echarts/echarts-all-3.js"></script>


<tiles:insertAttribute name="pageJs" ignore="true"/>
</body>
</html>
