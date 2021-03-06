<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<link rel="stylesheet" href="${staticRoot}/widget/artDialog/4.1.7/css/artDialog.css">
<link rel="stylesheet" href="${staticRoot}/css/index.css" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${staticRoot}/css/ecalendarstyle.css">
<link rel="stylesheet" type="text/css" href="${staticRoot}/css/mainHome.css?v=1.4">
<style>
    .date-inp{
        width: 190px;
        height: 25px;
        position: absolute;
        right: 60px;
        top: 15px;
        border: 1px solid #ccc;
        z-index: 999;
    }
    .main-time{
        width: 168px;
        height: 23px;
        border:none;
        padding: 0 10px;
    }
    .kg{
        width: 100px;
        height: 30px;
        border: 1px solid #4DB2EE;
        -webkit-border-radius:30px;
        -moz-border-radius:30px;
        border-radius:30px;
        position: absolute;
        right: 24px;
        top: 21px;
    }
    .kg>div{
        width: 53px;
        height: 30px;
        text-align: center;
        position: absolute;
        display: inline-block;
        line-height: 30px;
        cursor: pointer;
    }
    .kg>div.active{
        background: #4DB2EE;
        color: #fff;
    }
    .kg-zy{
        left: 0;
        top: 0;
        -webkit-border-radius:30px;
        -moz-border-radius:30px;
        border-radius:30px;
    }
    .kg-mz{
        right: 0;
        top: 0;
        -webkit-border-radius:30px;
        -moz-border-radius:30px;
        border-radius:30px;}
    .is-null{
        display: none;
        position: absolute;
        left:0;
        top: 0;
        right: 0;
        bottom: 0;
        text-align: center;
        line-height: 290px;
    }
</style>

<div ms-controller="app" class="div-main-content" style="height: 100%;background: #F2F3F7;padding: 20px;width: calc(100% - 40px);">
    <div style="width:100%;">
        <%--预警--%>
        <%--<div style="width: calc(50% - 22px);height: 235px;float: left;margin-right: 20px;background: #ffffff;border: 1px solid #e1e1e1;">--%>
            <%--<div style="height: 49px;line-height: 49px;border-bottom: 1px solid #e1e1e1;">--%>
                <%--<i class="if-yj"></i>--%>
                <%--<span class="yj-tit">预警</span>--%>
                <%--<span class="yj-more">更多</span>--%>
            <%--</div>--%>
            <%--<div class="yj-list-con">--%>
                <%--<ul class="yj-ul">--%>
                    <%--&lt;%&ndash;<li ms-for="($index,it) in @quotaWarnData">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<span ms-attr="{title:it.quotaName}" ms-html="it.quotaName | checkStrLen"></span>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div id="yjUlDiv" :class="[it.status == 1 ? heiRed : norGre]" ms-html="it.quotaCount"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
                <%--</ul>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--公告--%>
        <%--<div class="notice-main">--%>
            <%--<div style="height: 49px;line-height: 49px;border-bottom: 1px solid #e1e1e1;">--%>
                <%--<i class="if-gg"></i>--%>
                <%--<span style="font-size: 14px;color:#333333;">公告</span>--%>
                <%--<span class="notice-more">更多</span>--%>
            <%--</div>--%>
            <%--<div class="mh-notices-con">--%>
                <%--&lt;%&ndash;<div class="notice-item" ms-for="($index,it) in @noticesData" ms-attr="{dataid:it.id}">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<label class="n-i-time" ms-html="it.releaseDate | backDateFormat"></label>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<span class="n-i-con" ms-html="it.title"></span>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--</div>--%>
        <%--</div>--%>
            <%--快速查询--%>
        <div style="/*width: calc(20% - 2px);*/width: 100%;height: 235px;float: left;background: #ffffff;border: 1px solid #e1e1e1;">
            <div style="height: 49px;line-height: 49px;border-bottom: 1px solid #e1e1e1;">
                <i class="if-kscx"></i>
                <span style="font-size: 14px;color:#333333;">快速查询</span>
            </div>
            <div style="height: calc(100% - 80px);margin-top: 30px;">
                <ul>
                    <li style="width: 33%;text-align: center;display: inline-block;">
                        <span class="icon-jigouchaxuan"></span>
                        <div style="color: #333;font-size: 14px;padding-top: 15px;">机构查询</div>
                    </li>
                    <li style="width: 33%;text-align: center;display: inline-block;">
                        <span class="icon-yishengchaxun"></span>
                        <div style="color: #333;font-size: 14px;padding-top: 15px;">医生查询</div>
                    </li>
                    <li style="width: 32%;text-align: center;display: inline-block;">
                        <span class="icon-zonghechaxun"></span>
                        <div style="color: #333;font-size: 14px;padding-top: 15px;">综合查询</div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <%--报表--%>
    <div class="mh-bottom">
        <div class="mh-b-tit">
            <i class="if-tjfxbb"></i>
            <span style="font-size: 14px;color:#333333;">统计分析报表</span>
            <div class="iframe-menu c-position-r">
                <div class="c-position-a iframe-menu-list width-100">
                    <ul class="clearfix" id="nav-main-content">
                        <%--<li ms-for="($index,it) in @hBOCData" ms-attr="{dataCode:it.code}" ms-click="@changeTab($index)">--%>
                            <%--<a href="#" nav="home" :class="[($index == @selectId ? curr : '')]">--%>
                                <%--<span class="c-nowrap" style="font-size: 14px;top: 5px;" ms-html="it.name"></span>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                    </ul>
                </div>
            </div>
        </div>
        <div style="width:calc(100% - 36px);height: 330px;margin:38px 20px 20px 16px;border:1px solid #e1e1e1;position: relative;" class="main-one">
            <div class="date-inp">
                <input type="text" class="calendarWarp main-time" id="mainOTime" readonly/>
            </div>
            <div style="padding:26px 0px 14px 20px;font-size: 14px;color:#333;" class="div-zhibiao-name">

            </div>
            <div style="height: 290px; " id="chart-main1">

            </div>
            <div id="nullOne" class="is-null">暂无数据</div>
        </div>
        <div style="width:calc(100% - 36px);height: 330px;border:1px solid #e1e1e1;margin: 38px 20px 20px 16px;position: relative">
            <div class="date-inp">
                <input type="text" class="calendarWarp main-time" id="mainTTime" readonly/>
            </div>

            <div style="padding:26px 0px 14px 20px;font-size: 14px;color:#333;" class="div-patient-name">

            </div>
            <div style="height: 290px;margin:0px 5px 0px 10px;" id="chart-main2">

            </div>
            <div id="nullTwo" class="is-null">暂无数据</div>
        </div>
        <div style="width: calc(50% - 38px);height: 295px;float: left;margin-right: 20px;margin-left:16px;background: #ffffff;border: 1px solid #e1e1e1;">
            <div style="height: 50px;line-height: 50px;border-bottom: 1px solid #e1e1e1;padding-left: 16px;">
                <div class="l-radio-wrapper"><a href="javascript:void(0)" class="l-radio l-radio-checked"></a><input
                        type="radio" name="interval_type" value="1" checked="" style="font-size: 14px;color:#333333;"
                        class="l-hidden" ligeruiid="Radio1000"></div>
                日报&emsp;
                <div class="l-radio-wrapper"><a href="javascript:void(0)" class="l-radio"></a><input type="radio"
                                                                                                     name="interval_type"
                                                                                                     value="2"
                                                                                                     style="font-size: 14px;color:#333333;"
                                                                                                     class="l-hidden"
                                                                                                     ligeruiid="Radio1001">
                </div>
                周报&emsp;
                <div class="l-radio-wrapper"><a href="javascript:void(0)" class="l-radio"></a><input type="radio"
                                                                                                     name="interval_type"
                                                                                                     value="3"
                                                                                                     style="font-size: 14px;color:#333333;"
                                                                                                     class="l-hidden"
                                                                                                     ligeruiid="Radio1002">
                </div>
                月报&emsp;
                <span style="font-size: 14px;color: #666666;float: right;margin-right: 14px;">更多</span>
            </div>
            <div style="height: 245px;">
                <div style="padding-left: 0;position: relative;height: 60px;line-height: 60px;border-bottom: 1px dashed #e1e1e1;margin-left: 10px;">
                    <label style="margin-right: 10px;font-size: 14px;display: inline-block;color:#666666;">05-31</label>
                    <span style="width: calc(100% - 115px);font-size: 14px;color:#666666;display: -webkit-box;  -webkit-box-orient: vertical;-webkit-line-clamp: 1;  overflow: hidden;position: absolute;left: 50px;top: 0px;height: 60px;">健康之路公告健康之路公告健康之路公告健康之路公告健康之路公告健康之路公告健康之路公告健康之路公告</span>
                    <i class="if-download" style="position: absolute;right: 25px;top: 17px;"></i>
                </div>
                <div style="padding-left: 0;position: relative;height: 60px;line-height: 60px;border-bottom: 1px dashed #e1e1e1;margin-left: 10px;">
                    <label style="margin-right: 10px;font-size: 14px;display: inline-block;color:#666666;">05-31</label>
                    <span style="width: calc(100% - 115px);font-size: 14px;color:#666666;display: -webkit-box;  -webkit-box-orient: vertical;-webkit-line-clamp: 1;  overflow: hidden;position: absolute;left: 50px;top: 0px;height: 60px;">健康之路公告健康之路公告健康之路公告健康之路公告健康之路公告健康之路公告健康之路公告健康之路公告</span>
                    <i class="if-download" style="position: absolute;right: 25px;top: 17px;"></i>
                </div>
                <div style="padding-left: 0;position: relative;height: 60px;line-height: 60px;border-bottom: 1px dashed #e1e1e1;margin-left: 10px;">
                    <label style="margin-right: 10px;font-size: 14px;display: inline-block;color:#666666;">05-31</label>
                    <span style="width: calc(100% - 115px);font-size: 14px;color:#666666;display: -webkit-box;  -webkit-box-orient: vertical;-webkit-line-clamp: 1;  overflow: hidden;position: absolute;left: 50px;top: 0px;height: 60px;">健康之路公告健康之路公告健康之路公告健康之路公告健康之路公告健康之路公告健康之路公告健康之路公告</span>
                    <i class="if-download" style="position: absolute;right: 25px;top: 17px;"></i>
                </div>
                <div style="padding-left: 0;position: relative;height: 60px;line-height: 60px;border-bottom: 1px dashed #e1e1e1;margin-left: 10px;">
                    <label style="margin-right: 10px;font-size: 14px;display: inline-block;color:#666666;">05-31</label>
                    <span style="width: calc(100% - 115px);font-size: 14px;color:#666666;display: -webkit-box;  -webkit-box-orient: vertical;-webkit-line-clamp: 1;  overflow: hidden;position: absolute;left: 50px;top: 0px;height: 60px;">健康之路公告健康之路公告健康之路公告健康之路公告健康之路公告健康之路公告健康之路公告健康之路公告</span>
                    <i class="if-download" style="position: absolute;right: 25px;top: 17px;"></i>
                </div>
            </div>
        </div>
        <div style="width: calc(50% - 22px);height: 295px;float: left;margin-right: 20px;background: #ffffff;border: 1px solid #e1e1e1;position: relative;">
            <div class="kg" id="kgMz">
                <div class="kg-zy active">住院</div>
                <div class="kg-mz">门诊</div>
            </div>
            <div style="padding:26px 0px 14px 20px;font-size: 14px;color:#333;" class="div-date-num">

            </div>
            <div style="height: 255px;" id="chart-main3">

            </div>
            <div id="nullThree" class="is-null">暂无数据</div>
        </div>
    </div>
</div>
<%--预警--%>
<script type="text/html" id="jsTmp">
    <li>
        <span title="{{quotaName}}">{{subQuotaName}}</span>
        <div id="yjUlDiv" class="{{class}}" >{{quotaCount}}</div>
    </li>
</script>
<%--公告--%>
<script type="text/html" id="ggTmp">
    <div class="notice-item" data-id="{{id}}">
        <label class="n-i-time">{{releaseDate}}</label>
        <span class="n-i-con">{{title}}</span>
    </div>
</script>
<%--统计--%>
<script type="text/html" id="tjTmp">
    <li data-code="{{code}}">
        <a href="#" nav="home" class="{{class}}">
            <span class="c-nowrap" style="font-size: 14px;top: 5px;">{{name}}</span>
        </a>
    </li>
</script>








