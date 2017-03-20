<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<link rel="stylesheet" type="text/css" href="${staticRoot}/css/notice-info.css">

<div class="n-body">
    <div class="n-mian">
        <%--内容--%>
    </div>
</div>
<%--详情模板--%>
<script type="text/html" id="noticeInfoTmp">
    <h3 class="ni-tit">{{title}}</h3>
    <div class="ni-time">{{releaseDate}}</div>
    <p class="ni-con">{{content}}</p>
</script>