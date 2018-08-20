<%--
  Created by IntelliJ IDEA.
  User: JKZL-A
  Date: 2017/10/26
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<link rel="stylesheet" href="${staticRoot}/ligerui/skins/Aqua/css/ligerui-all.css">
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
                <a href="#" class="home-item msg" data-url="doctor/notices/notice?userType=1" title="平台公告" data-name="平台公告" data-id="notices"></a>
                <%--<a href="#" class="home-item msg" data-url="" data-name="" data-id=""></a>--%>
                <a href="#" class="home-item down" data-url="doctor/resource/resCenCon" title="下载中心" data-name="下载中心" data-id="zyzx"></a>
                <a href="#" class="home-user-item" data-url="" data-name="" data-id="">
                    <div class="home-head">
                        <img src="${staticRoot}/images/pe_hea.png" alt="">
                    </div>
                    <%--<span class="home-name name-info"></span>--%>
                    <%--<i class="home-down"></i>--%>
                    <ul class="home-down-con">
                        <li class="disabled name-info"></li>
                        <li id="userInfo">个人中心</li>
                        <li id="loout">退出</li>
                    </ul>
                </a>
            </div>
        </div>
    </div>
    <%--body--%>
    <div class="home-body w3-row">
        <div class="w3-col" style="width:23%;float: right;">
            <div class="yewuxiezuo-div div-m5">
                <div class="div-p_5">
                    <div class="div-title">业务协作</div>
                    <div class="yewuxiezuo-icon">实现平台之间的互联互通、信息共享、业务协作，为居民提供便捷、高效的数据医疗服务</div>
                </div>
                <div class="w3-row  innerItem  clearfix">

                </div>
            </div>
        </div>
        <div class="w3-rest">
            <div class="w3-row clearfix">
                <div class="w3-col" style="width:25%;">
                    <div class="dashuju-div div-m5 left">
                        <div class="innerItem">
                        </div>
                        <div class="div-p_5">
                            <div class="div-title">大数据中心</div>
                            <div class="dashuju-icon">面向整个智慧医疗云提供统一的数据存储与管理方案</div>
                        </div>
                    </div>
                </div>
                <div class="w3-col" style="max-width:75%;">
                    <div class="basic-div div-m5 w3-row clearfix" style="position:relative;">
                        <div class="w3-col div-p1" style="width: 25%;position: relative;top: 3rem;">
                            <div class="div-title">基础支撑</div>
                            <div class="basic-icon">提供云计算资源管理、应用软件的配套设施服务管理、数据质量控制及全平台运维监控等</div>
                        </div>
                        <div class="w3-rest">
                            <div class="w3-row  innerItem clearfix">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="w3-row">
                <div class="appServer-div div-m5  w3-row clearfix"  style="position:relative;">
                    <div  class="w3-col div-p_5" style="width:20%;float: right;position: relative;top: 2rem;">
                        <div class="div-title c-t-right">应用服务</div>
                        <div class="appServer-icon">构建完整的区域内覆盖居民、政府、医院及基层领域的服务体系</div>
                    </div>
                    <div class="w3-rest">
                        <div class="w3-row innerItem clearfix">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script  type="text/html" id="divItem">
    <div class="div-p_5 {{outclass}} clickdiv" style="{{outstyle}}" data-url="{{gourl}}" data-type="{{manageType}}" data-id="{{id}}" data-name="{{name}}" data-role="{{roleType}}">
        <div class="{{outclass1}}"></div>
        <div class="div-item"  style="{{outstyle1}}">
           <div class="{{iconclass}}"  style="{{iconstyle}}" >
               <%--<img src="{{icon}}" alt="{{name}}">--%>
               <div class="div-icon _{{id}}"></div>
           </div>
           <div class="itemname {{titleclass}}">{{name}}</div>
        </div>
    </div>
</script>