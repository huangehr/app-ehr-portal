<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
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

    <link rel="stylesheet" href="http://f1.yihuimg.com/concat/cross_pc/1.1.1/iconfont/iconfont.css" type="text/css" />
    <link rel="stylesheet" href="http://f1.yihuimg.com/concat/cross_pc/1.1.1/cross/css/cross.min.css" type="text/css" />
    <link rel="stylesheet" href="http://f1.yihuimg.com/concat/cross_pc/1.1.1/cross/css/cross.ui.min.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="${staticRoot}/css/index_work.css">

    <!--[if lt IE 9]>
    <script type="text/javascript" src="${staticRoot}/cross/js/respond.min.js"></script>
    <![endif]-->
        <script type="text/javascript" src="${staticRoot}/avalon-1.5/dist/avalon.js"></script>

        <script>
        window.root = "${staticRoot}";//项目根路径
    </script>
</head>
<body>
    <tiles:insertAttribute name="contentPage" />

    <script type="text/javascript" src="http://f1.yihuimg.com/concat/cross_pc/1.1.1/cross/js/jquery/1.8.3/jquery.js"></script>
    <script type="text/javascript" src="http://f1.yihuimg.com/concat/cross_pc/1.1.1/cross/js/cross.ui.js"></script>
    <link rel="stylesheet" href="${staticRoot}/widget/artDialog/4.1.7/css/artDialog.css" type="text/css" />
    <script type="text/javascript" src="${staticRoot}/widget/artDialog/4.1.7/js/artDialog.js"></script>
    <script type="text/javascript" src="${staticRoot}/widget/nicescroll/3.6.0/js/jquery.nicescroll.min.js"></script>
    <link rel="stylesheet" href="${staticRoot}/widget/cswitch/1.0/css/cswitch.css" type="text/css" />
    <script type="text/javascript" src="${staticRoot}/widget/cswitch/1.0/js/cswitch.js"></script>


    <tiles:insertAttribute name="pageJs" ignore="true"/>
</body>
</html>
