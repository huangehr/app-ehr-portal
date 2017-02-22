<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<%--定义页面文档类型以及使用的字符集,浏览器会根据此来调用相应的字符集显示页面内容--%>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">

<%--IE=edge告诉IE使用最新的引擎渲染网页，chrome=1则可以激活Chrome Frame.--%>
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="${staticRoot}/cross/css/cross.css" type="text/css" />
<link rel="stylesheet" href="${staticRoot}/iconfont/iconfont.css" type="text/css" />



<!--[if lt IE 9]>
    <script type="text/javascript" src="${staticRoot}/cross/js/respond.min.js"></script>
 <![endif]-->
<script>
    window.root = "${staticRoot}";//项目根路径
</script>


