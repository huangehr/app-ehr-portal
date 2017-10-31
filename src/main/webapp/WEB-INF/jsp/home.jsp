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

                <%--<div class="home-b-item home-data-center">--%>
                    <%--<div class="home-zzc"></div>--%>
                    <%--<div class="home-bi-bg"></div>--%>
                    <%--<div class="home-bi-info">--%>
                        <%--<div class="home-bi-top-img">--%>
                            <%--<img src="${staticRoot}/images/icon_shujuzhongxin.png" alt="">--%>
                        <%--</div>--%>
                        <%--<div class="home-bi-tans"></div>--%>
                        <%--<div class="home-bi-tit">数据中心</div>--%>
                        <%--<div class="home-bi-con">面向整个智慧医疗云提供统一的数据存储与管理方案</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="home-b-item home-basics">--%>
                    <%--<div class="home-zzc"></div>--%>
                    <%--<div class="home-bi-bg"></div>--%>
                    <%--<div class="home-bi-info">--%>
                        <%--<div class="home-bi-top-img">--%>
                            <%--<img src="${staticRoot}/images/icon_jichuzhichen.png" alt="">--%>
                        <%--</div>--%>
                        <%--<div class="home-bi-tans"></div>--%>
                        <%--<div class="home-bi-tit">基础支撑</div>--%>
                        <%--<div class="home-bi-con">提供云计算资源管理、应用软件的配套设施服务管理、数据质量控制及全平台运维监控等</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="home-b-item home-business">--%>
                    <%--<div class="home-zzc"></div>--%>
                    <%--<div class="home-bi-bg"></div>--%>
                    <%--<div class="home-bi-info">--%>
                        <%--<div class="home-bi-top-img">--%>
                            <%--<img src="${staticRoot}/images/icon_yewuxiezuo.png" alt="">--%>
                        <%--</div>--%>
                        <%--<div class="home-bi-tans"></div>--%>
                        <%--<div class="home-bi-tit">业务协作</div>--%>
                        <%--<div class="home-bi-con">实现平台之间的互联互通、信息共享、业务协作，为居民提供便捷、高效的数据医疗服务</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="home-b-item home-application">--%>
                    <%--<div class="home-zzc"></div>--%>
                    <%--<div class="home-bi-bg"></div>--%>
                    <%--<div class="home-bi-info">--%>
                        <%--<div class="home-bi-top-img">--%>
                            <%--<img src="${staticRoot}/images/icon_yingyongfuwu.png" alt="">--%>
                        <%--</div>--%>
                        <%--<div class="home-bi-tans"></div>--%>
                        <%--<div class="home-bi-tit">应用服务</div>--%>
                        <%--<div class="home-bi-con">构建完整的区域内覆盖居民、政府、医院及基层领域的服务体系</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            </div>
        </div>
        <%--show--%>
        <div class="home-info-con">
            <%--&lt;%&ndash;item1&ndash;%&gt;--%>
            <%--<ul class="home-show-list" style="display: block">--%>
                <%--<li class="home-show-item">--%>
                    <%--<img src="${staticRoot}/images/icon_shujuziyuanzhongxin.png" alt="">--%>
                    <%--<div>数据资源中心</div>--%>
                <%--</li>--%>
            <%--</ul>--%>
            <%--&lt;%&ndash;item2&ndash;%&gt;--%>
            <%--<ul class="home-show-list">--%>
                <%--<li class="home-show-item">--%>
                    <%--<img src="${staticRoot}/images/icon_jichuxinxiguanli.png" alt="">--%>
                    <%--<div>基础信息管理</div>--%>
                <%--</li>--%>
                <%--<li class="home-show-item">--%>
                    <%--<img src="${staticRoot}/images/icon_yunziyuanguanli.png" alt="">--%>
                    <%--<div>云资源管理</div>--%>
                <%--</li>--%>
            <%--</ul>--%>
            <%--&lt;%&ndash;item3&ndash;%&gt;--%>
            <%--<ul class="home-show-list">--%>
                <%--<li class="home-show-item">--%>
                    <%--<img src="${staticRoot}/images/icon_quyuyingx.png" alt="">--%>
                    <%--<div>区域影像</div>--%>
                <%--</li>--%>
                <%--<li class="home-show-item">--%>
                    <%--<img src="${staticRoot}/images/icon_shuangxiangzhuanzhenfuwu.png" alt="">--%>
                    <%--<div>双向转诊服务</div>--%>
                <%--</li>--%>
                <%--<li class="home-show-item">--%>
                    <%--<img src="${staticRoot}/images/icon_yuanchenghuizhenfuwu.png" alt="">--%>
                    <%--<div>远程会诊服务</div>--%>
                <%--</li>--%>
                <%--<li class="home-show-item">--%>
                    <%--<img src="${staticRoot}/images/icon_quyujianchajiany.png" alt="">--%>
                    <%--<div>区域检查检验</div>--%>
                <%--</li>--%>
                <%--<li class="home-show-item">--%>
                    <%--<img src="${staticRoot}/images/icon_quyudianzibingli.png" alt="">--%>
                    <%--<div>区域电子病历</div>--%>
                <%--</li>--%>
            <%--</ul>--%>
            <%--&lt;%&ndash;item4&ndash;%&gt;--%>
            <%--<ul class="home-show-list">--%>
                <%--<li class="home-show-item">--%>
                    <%--<img src="${staticRoot}/images/icon_gonggweishengfuwu.png" alt="">--%>
                    <%--<div>公共卫生服务</div>--%>
                <%--</li>--%>
                <%--<li class="home-show-item">--%>
                    <%--<img src="${staticRoot}/images/icon_weishengyingjizhihui.png" alt="">--%>
                    <%--<div>卫生应急指挥</div>--%>
                <%--</li>--%>
                <%--<li class="home-show-item">--%>
                    <%--<img src="${staticRoot}/images/icon_gonggzongjiankangfuwu.png" alt="">--%>
                    <%--<div>公众健康服务</div>--%>
                <%--</li>--%>
                <%--<li class="home-show-item">--%>
                    <%--<img src="${staticRoot}/images/icon_yuanchengyiliaojiaoxue.png" alt="">--%>
                    <%--<div>远程医疗教学</div>--%>
                <%--</li>--%>
            <%--</ul>--%>
        </div>
    </div>
    <%--footer--%>
    <div class="home-footer">
        技术支持：健康之路
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
