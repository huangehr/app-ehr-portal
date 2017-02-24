<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<div class="page-layout-menu c-position-f c-hidden" data-toggle="pageLayoutMenu">
    <div class="referral-menu-box">
        <div class="menu-collapse width-100" data-nav="menu">
            <ul class="all-menu clearfix">
                <li class="menu-li">
                    <a href="javascript:;" data-src="/system/userManage">
                        <i class="iconfont"></i>
                        <span class="title">用户管理</span>
                    </a>
                </li>


                <li class="menu-li last">
                    <a href="javascript:;">
                        <i class="iconfont"></i>
                        <span class="title">4 Level Menu</span>
                        <span class="arrow"><i class="iconfont"></i></span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="javascript:;">
                                <i class="iconfont"></i>
                                Item 1
                                <span class="arrow"><i class="iconfont"></i></span>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="javascript:;">
                                        <i class="iconfont"></i>
                                        Sample Link 1
                                        <span class="arrow"><i class="iconfont"></i></span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li><a href="#"><i class="iconfont"></i> Sample Link 1 Sample Link 1</a></li>
                                        <li><a href="#"><i class="iconfont"></i> Sample Link 1</a></li>
                                        <li class="last"><a href="#"><i class="iconfont"></i> Sample Link 1</a></li>
                                    </ul>
                                </li>
                                <li><a href="#"><i class="iconfont"></i> Sample Link 1</a></li>
                                <li><a href="#"><i class="iconfont"></i> Sample Link 2</a></li>
                                <li class="last"><a href="#"><i class="iconfont"></i> Sample Link 3</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <i class="iconfont"></i>
                                Item 2
                                <span class="arrow"><i class="iconfont"></i></span>
                            </a>
                            <ul class="sub-menu">
                                <li><a href="#"><i class="iconfont"></i> Sample Link 1 Sample Link 1</a></li>
                                <li><a href="#"><i class="iconfont"></i> Sample Link 1</a></li>
                                <li class="last"><a href="#"><i class="iconfont"></i> Sample Link 1</a></li>

                            </ul>
                        </li>
                        <li class="last">
                            <a href="#"><i class="iconfont"></i> Item 3</a>
                        </li>

                    </ul>

                </li>
            </ul>
        </div>
    </div>
</div>
<div class="page-layout-main c-position-a">
    <iframe frameborder="no" src="" width="100%" height="100%" id="referralIframe"></iframe>
</div>