<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<link rel="stylesheet" type="text/css" href="${staticRoot}/css/notice.css">

<div class="n-body">
    <div class="n-main">
        <ul class="n-list">
            <%--公告列表--%>
        </ul>
        <%--<div class="n-pages">--%>
        <%--<ul class="p-list">--%>
        <%--<li>--%>
        <%--<a href="javascript:;" class="p-btn">上一页</a>--%>
        <%--</li>--%>
        <%--<li><a href="javascript:;">1</a></li>--%>
        <%--<li><a href="javascript:;">2</a></li>--%>
        <%--<li class="active"><a href="javascript:;">3</a></li>--%>
        <%--<li><a href="javascript:;">4</a></li>--%>
        <%--<li><a href="javascript:;">5</a></li>--%>
        <%--<li><a href="javascript:;">6</a></li>--%>
        <%--<li><a href="javascript:;">7</a></li>--%>
        <%--<li><a href="javascript:;">8</a></li>--%>
        <%--<li><a href="javascript:;">9</a></li>--%>
        <%--<li>--%>
        <%--<a href="javascript:;" class="n-btn">下一页</a>--%>
        <%--</li>--%>
        <%--<li class="p-s">--%>
        <%--<input type="text" class="p-num" />--%>
        <%--<a href="javascript:;" class="n-sure">确定</a>--%>
        <%--</li>--%>
        <%--</ul>--%>
        <%--</div>--%>
    </div>
</div>
<%--列表模板--%>
<script type="text/html" id="noticeTmp">
    <li class="n-item" data-id="{{id}}">
        <div class="n-i-con">
            <div class="n-i-l">
                <i class="n-icon"></i>
                <span class="n-time {{new}}">{{createDate}}</span>
            </div>
            <div class="n-i-r">
                <a href="javascript:void(0);">
                    <h3 class="{{bubble}}">{{appName}}</h3>
                    <p>{{content}}</p>
                </a>
            </div>
        </div>
    </li>
</script>
