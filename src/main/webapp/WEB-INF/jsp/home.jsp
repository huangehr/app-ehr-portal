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
            <h1 class="home-logo"></h1>
        </div>
        <%--list--%>
        <div class="home-t-right">
            <div class="home-list">
                <a href="#" class="home-item msg" data-url="doctor/notices/notice?userType=1" title="平台公告" data-name="平台公告" data-id="notices"></a>
                <%--<a href="#" class="home-item msg" data-url="" data-name="" data-id=""></a>--%>
                <a href="#" class="home-item down" data-url="noLandingResources/resource/resCenCon" title="下载中心" data-name="下载中心" data-id="zyzx"></a>
                <a href="#" class="home-user-item" data-url="" data-name="" data-id="">
                    <div class="home-head">
                        <img src="${staticRoot}/images/180813/moren_nanyisheng_img.png" alt="">
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
    <div class="home-body">
        <div class="w3-row div-p15">
            <div class="w3-col  div-p03" style="width:1.84rem;float: right;">
                <div class="yewuxiezuo-div">
                    <div style="padding:0.05rem 0.1rem 0.05rem 0.1rem">
                        <div class="div-title">业务协作</div>
                        <div class="yewuxiezuo-icon">实现平台之间的互联互通、信息共享、业务协作，为居民提供便捷、高效的数据医疗服务</div>
                    </div>
                    <div class="w3-row  innerItem  clearfix" style="padding: 0 0.08rem">
                        <div class="div-p_5 w3-col yewuxiezuo-item" id="VWh4aaifgY"></div>
                        <div class="div-p_5 w3-col yewuxiezuo-item" id="M13pAosamN"></div>
                        <div class="div-p_5 w3-col yewuxiezuo-item" id="h1Nc8PyF5k"></div>
                        <div class="div-p_5 w3-col yewuxiezuo-item" id="sAigwZvAQF"></div>
                        <div class="div-p_5 w3-col yewuxiezuo-item" id="aoGoGPD7Qf"></div>
                        <div class="div-p_5 w3-col yewuxiezuo-item" id="U11VgRplOb"></div>
                    </div>
                </div>
            </div>
            <div class="w3-rest">
                <div class="w3-row clearfix">
                    <div class="w3-col  div-p03" style="width:1.58rem;position:relative;">
                        <div class="dashuju-div left">
                            <div class="innerItem">
                                <div class="div-p08" id="R1yHNdX5Ud"></div>
                            </div>
                            <div  style="position: relative;top: -0.1rem;padding:0 0.16rem">
                                <div class="div-title">大数据中心</div>
                                <div class="dashuju-icon">面向整个智慧医疗云提供统一的数据存储与管理方案</div>
                            </div>
                        </div>
                    </div>
                    <div class="w3-col div-p03" style="width:4.67rem;">
                        <div class="basic-div w3-row clearfix" style="position:relative;">
                            <div class="w3-col div-p1" style="width:1.4rem;">
                                <div  style="position: relative;top: 0.2rem;padding:0 0.16rem">
                                    <div class="div-title">基础支撑</div>
                                    <div class="basic-icon">提供云计算资源管理、应用软件的配套设施服务管理、数据质量控制及全平台运维监控等</div>
                                </div>
                            </div>
                            <div class="w3-rest" style="padding: .06rem 0.09rem;">
                                <div class="w3-row  innerItem clearfix">
                                    <div class="div-p_5 w3-col basic-item" id="0e3DIdNaQ2"></div>
                                    <div class="div-p_5 w3-col basic-item" id="zkGuSIm2Fg"></div>
                                    <div class="div-p_5 w3-col basic-item" id="Ox8hdRyXVd"></div>
                                    <div class="w3-col" style="width:1.54rem;display: none" id="VLho13abxY"></div>
                                    <div class="w3-col" style="width:1.54rem;display: none;" id="aikGiriuX0"></div>
                                    <div class="div-p_5 w3-col basic-item" id="I5kZOtr7eZ"></div>
                                    <div class="div-p_5 w3-col basic-item" id="2aUmOdMCyQ"></div>
                                    <div class="div-p_5 w3-col basic-item" id="0C73NZ2CcW"></div>
                                    <div class="div-p_5 w3-col basic-item" id="fTb1FSZScW"></div>
                                    <div class="div-p_5 w3-col basic-item" id="k4soGEAEiR"></div>
                                    <div class="div-p_5 w3-col basic-item" id="wQmCg7FUFT"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="w3-row  div-p03">
                    <div class="appServer-div  w3-row clearfix"  style="position:relative;">
                        <div class="w3-col div-p1" style="width:1.4rem;float: right;">
                            <div  style="position: relative;top: 0.3rem;padding:0 0.16rem">
                                <div class="div-title c-t-right">应用服务</div>
                                <div class="appServer-icon">构建完整的区域内覆盖居民、政府、医院及基层领域的服务体系</div>
                            </div>
                        </div>
                        <div class="w3-rest">
                            <div class="w3-row innerItem clearfix div-p06">
                                <div class="div-p_5 w3-col appServer-item" id="P1C7SOQe6n"></div>
                                <div class="div-p_5 w3-col appServer-item" id="5DloGvRVVZ"></div>
                                <div class="div-p_5 w3-col appServer-item" id="lZfekFOy6r"></div>
                                <div class="div-p_5 w3-col appServer-item" id="wmIgx8RWcQ"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="home-bottom">
        主办方：<span class="sponsor" style="padding-right: 0.5rem;"></span>技术支持：<span class="technicalSupport"></span>
    </div>
</div>


<script  type="text/html" id="divItem">
    <div class="{{outclass}} clickdiv" style="{{outstyle}}" data-url="{{gourl}}" data-type="{{manageType}}" data-id="{{id}}" data-name="{{name}}" data-role="{{roleType}}" data-cate="{{catalog}}">
        <div class="{{outclass1}}"></div>
        <div class="div-item"  style="{{outstyle1}}">
           <div class="{{iconclass}}"  style="{{iconstyle}}" >
               <%--<img src="{{icon}}" alt="{{name}}">--%>
               <div class="div-icon _{{id}}"></div>
           </div>
           <div class="itemname {{titleclass}}" style="{{titlestyle}}">{{name}}</div>
        </div>
    </div>
</script>