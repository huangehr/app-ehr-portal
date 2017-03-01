<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<div class="page-layout-menu c-position-f c-hidden" data-toggle="pageLayoutMenu">
    <div class="referral-menu-box">
        <div class="menu-collapse width-100" data-nav="menu">
            <ul class="all-menu clearfix"  id="info-main">
                <li class="menu-li">
                    <a href="javascript:;" id="info-home" data-src="/doctor/infoPage">
                        <i class="iconfont"></i>
                        <span class="title">个人信息</span>
                    </a>
                </li>

                <li class="menu-li">
                    <a href="javascript:;" data-src="/doctor/resetPassword">
                        <i class="iconfont"></i>
                        <span class="title">密码修改</span>
                    </a>
                </li>

                <li class="menu-li">
                    <a href="javascript:;" data-src="/doctor/suggest">
                        <i class="iconfont"></i>
                        <span class="title">意见反馈</span>
                    </a>
                </li>


            </ul>
        </div>
    </div>
</div>
<div class="page-layout-main c-position-a">
    <iframe frameborder="no" src="" width="100%" height="100%" id="referralIframe"></iframe>
</div>