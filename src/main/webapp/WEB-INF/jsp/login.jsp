<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>


<link rel="stylesheet" type="text/css" href="${staticRoot}/css/login.css">
<link rel="stylesheet" href="${staticRoot}/css/index.css" type="text/css" />
<%--<link rel="stylesheet" type="text/css" href="${staticRoot}/widget/artDialog/4.1.7/css/artDialog.min.css">--%>
<link rel="stylesheet" type="text/css" href="${staticRoot}/widget/layui/layui.css">

<div class="l-body">
    <div class="header-xz-wrap clearfix c-position-r">
        <div class="header-xz-logo plr20 fl">

        </div>
        <%-- 头部右侧按钮 --%>
        <div class="header-feature-xz fr">
            <ul class="clearfix" style="margin-right: 100px;">
                <li><a href="#" onclick="location.href='${contextRoot}/doctor/resource'"><i class="if-xzzx-xz"></i><span class="gg-tit">下载中心</span></a></li>
            </ul>
        </div>
    </div>

    <div class="l-main">
        <div class="l-form">
            <%--<ul class="l-tab">
                <li class="l-t-item"><a href="javascript:;" class="l-active">医生</a></li>
                <li class="l-t-item"><a href="javascript:;">管理</a></li>
            </ul>--%>
            <div class="l-f-c">
                <div class="l-f-tit">欢迎使用医疗云平台系统</div>
                <div><label class="l-f-icon i-an" for="lUAn"></label><input id="lUAn" class="l-f-input" type="text" placeholder="请输入账号" maxlength="50"/></div>
                <div><label class="l-f-icon i-pwd" for="lUPwd"></label><input id="lUPwd" class="l-f-input" type="password" placeholder="请输入密码" maxlength="41"/></div>
                <div>
                    <label class="l-f-radio f-r-d" for="lR"><input id="lR" class="r-d" type="checkbox" /></label>
                    <span class="f-p">记住密码</span>
                    <%--<a class="f-l"  href="javascript:;">忘记密码？</a>--%>
                </div>
                <div><input class="l-btn doc-btn" type="button" value="登录"/></div>
                <%--<div class="l-f-footer">还没有账号？<a href="javascript:;">立即注册</a></div>--%>
            </div>
        </div>
    </div>
    <p class="l-footer">
        主办方：上饶市卫生与计划生育委员会&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;技术支持：健康之路（中国）信息技术有限公司
    </p>
</div>
