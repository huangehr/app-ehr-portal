<%--
  Created by IntelliJ IDEA.
  User: JKZL-A
  Date: 2017/10/26
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<link rel="stylesheet" href="${staticRoot}/css/home.css">

<div class="home-mian" ms-controller="homeapp">
    <%--top--%>
    <div class="home-top">
        <%--logo--%>
        <div class="home-t-left">
            <h1 class="home-logo">健康之路智慧医疗云平台</h1>
        </div>
        <%--list--%>
        <div class="home-t-right">
            <div class="home-list">
                <a href="#" class="home-item clock" data-url="doctor/notices/notice?userType=1" title="平台公告" data-name="平台公告" data-id="notices"></a>
                <%--<a href="#" class="home-item msg" data-url="" data-name="" data-id=""></a>--%>
                <a href="#" class="home-item down" data-url="doctor/resource/resCenCon" title="下载中心" data-name="下载中心" data-id="zyzx"></a>
                <a href="#" class="home-user-item" data-url="" data-name="" data-id="">
                    <div class="home-head">
                        <img src="${staticRoot}/images/pe_hea.png" alt="">
                    </div>
                    <span class="home-name name-info"></span>
                    <i class="home-down"></i>
                    <ul class="home-down-con">
                        <li id="userInfo">个人中心</li>
                        <li id="loout">退出</li>
                    </ul>
                </a>
            </div>
        </div>
    </div>
    <%--body--%>
    <div class="home-body">
        <div class="home-banner">
            <div class="home-b-con">

            </div>
        </div>
        <%--show--%>
        <div class="home-info-con">

        </div>
    </div>
    <%--footer--%>
    <div class="home-footer">
        主办方：上饶市卫生与计划生育委员会&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;技术支持：健康之路（中国）信息技术有限公司
    </div>
</div>

<script type="text/html" id="bannerTmp">
    <div class="home-b-item {{class}}">
        <div class="home-zzc"></div>
        <div class="home-bi-bg"></div>
        <div class="home-bi-info">
            <div class="home-bi-top-img">
                <img src="{{img}}" alt="">
            </div>
            <div class="home-bi-tans"></div>
            <div class="home-bi-tit">{{value}}</div>
            <div class="home-bi-con">{{info}}</div>
        </div>
    </div>
</script>


<script type="text/html" id="infoConTmp">
    <%--<ul class="home-show-list">--%>
        <li class="home-show-item" data-url="{{gourl}}" data-type="{{manageType}}" data-id="{{id}}" data-name="{{name}}">
            <div class="home-i-i-con">
                <img src="{{img}}" alt="{{name}}">
            </div>
            <div class="home-item-name">{{name}}</div>
        </li>
    <%--</ul>--%>
</script>
