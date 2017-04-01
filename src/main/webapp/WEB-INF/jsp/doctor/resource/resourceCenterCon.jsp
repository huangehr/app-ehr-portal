<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<link rel="stylesheet" href="${staticRoot}/css/resource-center.css">

<div class="l-body">
    <div class="rc-main">

    </div>
</div>
<script type="text/html" id="resourceTmp">
    <div class="rc-main-item">
        <div class="rc-l">
            <img class="rc-pic" src="${contextRoot}/doctor/resources/uploadFile?storagePath={{picUrl}}" alt="" />
        </div>
        <div class="rc-r">
            <h3 class="rc-tit">{{name}}</h3>
            <div class="rc-p-cs">
                {{codeBtns}}
            </div>
            <div class="rc-btns">
                {{downBtns}}
            </div>
            <p class="rc-con">
                {{description}}
            </p>
        </div>
    </div>
</script>