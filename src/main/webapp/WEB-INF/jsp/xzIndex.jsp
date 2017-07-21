<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<link rel="stylesheet" href="${staticRoot}/css/index.css" type="text/css" />
<style>
    .swiper-pagination-bullet-active{background: #ffffff;}
    body,html{background: #ffffff;}
</style>
<div class="header-xz-wrap clearfix c-position-r">
    <div class="header-xz-logo plr20 fl">

    </div>

    <%-- 头部右侧按钮 --%>
    <div class="header-feature-xz fr">
        <ul class="clearfix">
            <%--<li><a href="#" onclick="indexPage.openNav('notices','平台公告','doctor/notices/notice?userType=1')"><i class="if-gg"></i><span class="gg-tit">平台公告</span></a></li>--%>
            <li><a href="#"><i class="if-db-xz"></i><span class="gg-tit">待办</span></a></li>
            <li><span class="vertical-line">|</span></li>
            <li><a href="#" class="im-mine" <%--data-im="mine"--%>><i class="if-grzx-xz"></i><span class="gg-tit">个人中心</span></a></li>
            <li><span class="vertical-line">|</span></li>
            <li><a href="#"><i class="if-xzzx-xz"></i><span class="gg-tit">下载中心</span></a></li>
           <%-- <li><a href="#" class="im-derail" data-im="apply"><i class="iconfont">&#xe68c;</i> 我的应用</a></li>
            <li><span class="vertical-line">|</span></li>--%>
            <%--<li><span class="vertical-line">|</span></li>--%>
            <%--<li><a href="#" class="im-tidings" data-im="tidings"><i class="if-wdxx-xz"></i><em>5</em> 我的消息</a></li>--%>
            <li><span class="vertical-line">|</span></li>
            <li class="go-out"><a href="javascript:;" id="goOut"><i class="if-aqtc-xz"></i> 安全退出</a></li>
        </ul>
    </div>
</div>

<div style="height: calc(100% - 22vw - 20px);">
    <div class="swiper-container" style="width:100%;height: 100%;">
    <div class="swiper-wrapper">
        <div class="swiper-slide">
            <div style="position: absolute;right: calc(50% + 90px);top: 50%;margin-top: -104px;z-index: 40">
                <div style="font-size: 2.08vw;color: #fff;font-weight: bold;margin-bottom: 34px;">实现机构、系统平台的自由接入</div>
                <div style="font-size: 1.15vw; color: #fff;">国家/省/市/区/县多级平台层层连接与逐层向上传送数据的<br>模式，容易造成信息传送失真，高级平台受低价平台建设绑<br>架等问题。而互联网扁、平、快的模式，很快地解决了这个<br>问题，实现机构、系统平台的自由接入。</div>
            </div>
            <img src="../../lib/images/banner-1.png" width="100%" height="100%" style="position: absolute;z-index: 20">
            <div style="width:50%;height: 100%;position: absolute;z-index: 30;top:60px;">
                <img src="../../lib/images/tu_1_left.png" style="width: 47.25vw;height: 100%;">
            </div>
            <div style="width:50%;height: 100%;position: absolute;z-index: 30;left: 55%;top:60px;">
                <img src="../../lib/images/tu_1_right.png" style="width: 47.25vw;height: 100%;">
            </div>
        </div>
        <div class="swiper-slide">
            <div style="position: absolute;right: calc(50% + 190px);top: 50%;margin-top: -104px;z-index: 40">
                <div style="font-size: 2.08vw;color: #fff;font-weight: bold;margin-bottom: 34px;">身份连接、信息整合</div>
                <div style="font-size: 1.15vw; color: #fff;">平台不但解决异构系统间信息连接，居民唯一身份<br>识别的问题，还实现了居民互联网身份（账号）与<br>实际生活中身份（就诊卡）的连接，真正实现了居<br>民生命周期和跨空间的信息整合。</div>
            </div>
            <img src="../../lib/images/banner-2.png" width="100%" height="100%" style="position: absolute;z-index: 20">
            <div style="width:50%;height: 100%;position: absolute;z-index: 30;top: 10px;">
                <img src="../../lib/images/tu_2_left.png" style="width: 47.25vw;height: 100%;">
            </div>
            <div style="width:50%;height: 100%;position: absolute;z-index: 30;left: 50%; top: 50%; margin-top: -169px;">
                <img src="../../lib/images/tu_2_right.png" style="width: 52.59vw;height: 21.78vw;">
            </div>
        </div>
        <div class="swiper-slide">
            <div style="position: absolute;right: calc(50% + 90px);top: 50%;margin-top: -104px;z-index: 40">
                <div style="font-size: 2.08vw;color: #fff;font-weight: bold;margin-bottom: 34px;">降低门槛、提高效率</div>
                <div style="font-size: 1.15vw; color: #fff;">大数据支撑平台的生态能力，实现了对结构化与非结构化数据的有<br>机整合，降低了数据收集的准入门槛，极大地提高了海量信息<br>数据的管理与应用效率，并为数据信息的快速增量提供了十分可靠<br>的支撑能力。</div>
            </div>
            <img src="../../lib/images/banner-3.png" width="100%" height="100%" style="position: absolute;z-index: 20">
            <div style="width:50%;height: 100%;position: absolute;z-index: 30;top:60px;">
                <img src="../../lib/images/tu_3_left.png" style="width: 47.25vw;height: 100%;/*28.58vw;*/">
            </div>
            <div style="width:50%;height: 100%;position: absolute;z-index: 30;left: 60%;top:0px;">
                <img src="../../lib/images/tu_3_right.png" style="width: 45.9vw;height: 100%;/*28.58vw;*/">
            </div>
        </div>
    </div>
    <!-- 如果需要分页器 -->
    <div class="swiper-pagination"></div>
    <!-- 如果需要滚动条 -->
    <%--<div class="swiper-scrollbar"></div>--%>
    </div>
</div>

<div class="div-bottom">
    <%--<div class="div-bottom-item">--%>
        <%--<img src="../../lib/images/icon_shujuzhongxin.png" >--%>
        <%--<div class="div-bottom-text">数据中心管理</div>--%>
    <%--</div>--%>
    <%--<div class="div-bottom-item">--%>
        <%--<img src="../../lib/images/icon_jichuzhicheng.png">--%>
        <%--<div class="div-bottom-text">基础信息管理</div>--%>
    <%--</div>--%>
    <%--<div class="div-bottom-item">--%>
        <%--<img src="../../lib/images/icon_yewuxiezuo-.png">--%>
        <%--<div class="div-bottom-text">业务协作体系</div>--%>
    <%--</div>--%>
    <%--<div class="div-bottom-item">--%>
        <%--<img src="../../lib/images/icon_yingyongfuwu.png">--%>
        <%--<div class="div-bottom-text">应用服务体系</div>--%>
    <%--</div>--%>
</div>

