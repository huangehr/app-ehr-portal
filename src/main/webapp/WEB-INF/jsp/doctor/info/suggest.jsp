<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<link rel="stylesheet" href="${staticRoot}/css/style.css" type="text/css" />

<div class="section">
    <div class="section-header">
        <h4>意见反馈</h4>
    </div>
    <div class="section-main">
        <div class="plr30 ptb30">
            <form id="form_id" class="formular"  method="post">
            <div class="validate[required] textarea-block" ><textarea name="" id="content" placeholder="请写下您的意见或建议，工作人员在第一时间为您处理并反馈给您（字数500字以内）" class="textarea"></textarea></div>
            <div class="mt20">
                <input type="button" id="submit" class="btn" value="提交" />
            </div>
            </form>
        </div>
    </div>
</div>
