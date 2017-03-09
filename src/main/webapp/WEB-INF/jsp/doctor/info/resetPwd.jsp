<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<link rel="stylesheet" href="${staticRoot}/css/style.css" type="text/css" />

<div class="section">
    <div class="section-header">
        <h4>修改密码</h4>
    </div>
    <div class="section-main">
        <div class="plr30 ptb30" style="padding-top:60px;">
            <form id="form_id" class="formular"  method="post">
            <ul class="form">
                <!--输入有误时 li加上class error，错误信息结构：<div class="mt5 c-f47979"><i class="iconfont icon-cuowutishi"></i> 请填写您的姓名</div>-->
                <li>
                    <label class="form-label form-label-w75 c-t-right"><span class="c-f00">*</span> 原密码</label>
                    <div class="form-group">
                        <input class="validate[required,funcCall[checkPwdRight]] input-text" type="password"  id="oldPassword"placeholder="请输入原密码" />
                    </div>
                </li>
                <!--/输入有误-->
                <li>
                    <label class="form-label form-label-w75 c-t-right"><span class="c-f00">*</span> 新密码</label>
                    <div class="form-group">
                        <input class="validate[required,funcCall[checkNoChange]] input-text" type="password"  id="password" placeholder="请输入新密码" />
                    </div>
                </li>
                <li>
                    <label class="form-label form-label-w75 c-t-right"><span class="c-f00">*</span> 确认密码</label>
                    <div class="form-group">
                        <input class="validate[required,equals[password]] input-text" type="password" name="password2" id="password2" placeholder="请再次输入新密码" />
                    </div>
                </li>
                <li>
                    <label class="form-label form-label-w75 c-t-right"></label>
                    <div class="form-group">
                        <input type="button" id="saveBtn" class="btn" value="完成" />
                    </div>
                </li>
            </ul>
            </form>
        </div>
    </div>
</div>
