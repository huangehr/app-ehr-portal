<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<div class="page-layout-menu c-position-f c-hidden" data-toggle="pageLayoutMenu">
    <div class="referral-menu-box">
        <div class="menu-collapse width-100" data-nav="menu">
            <ul class="all-menu clearfix">
                <li class="menu-li">
                    <a href="javascript:;" data-src="/organization/info">
                        <i class="iconfont"></i>
                        <span class="title">机构信息管理</span>
                    </a>
                </li>

                <li class="menu-li">
                    <a href="javascript:;" data-src="/organization/manager">
                        <i class="iconfont"></i>
                        <span class="title">部门与人员管理</span>
                    </a>
                </li>

                <li class="menu-li">
                    <a href="javascript:;" data-src="/organization/relation">
                        <i class="iconfont"></i>
                        <span class="title">上下级关系管理</span>
                    </a>
                </li>

                <li class="menu-li">
                    <a href="javascript:;" data-src="/organization/deptRelation">
                        <i class="iconfont"></i>
                        <span class="title">上下级机构设置</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="page-layout-main c-position-a">
    <iframe frameborder="no" src="" width="100%" height="100%" id="referralIframe"></iframe>
</div>