<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<link rel="stylesheet" href="${staticRoot}/widget/artDialog/4.1.7/css/artDialog.css">
<link rel="stylesheet" href="${staticRoot}/css/index.css" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${staticRoot}/css/dataCenterMainHome.css?v=1.4">

<div style="width: 100%;height: 100%;" class="div-main-content">
    <div ms-controller="app" style="height: 100%;background: #F2F3F7;padding: 20px;width: calc(100% - 40px);">
        <div class="c-w-100">
            <%--健康档案--%>
            <div class="div-jkda">
                <div class="div-jkda-header">
                    <i class="if-jkda"></i>
                    <span class="yj-tit">健康档案</span>
                </div>
                <div class="div-jkda-content">
                    <div class="c-w-100 div-chart">
                        <div id="div_jkda_chart1" class="c-w-100 c-h-100">

                        </div>
                        <div class="div-instruction">
                            <div class="div-jkda-amount">15256</div>
                            <div class="div-jkda-title">档案识别</div>
                        </div>
                    </div>
                    <div class="c-w-100 div-bottom-instruction">
                        <div class="f-mb10 f-pl30">
                            <label class="bar-a cb-42d16f"></label>
                            可识别:
                            <label class="c-42d16f">2562</label>
                        </div>
                        <div class="f-pl30">
                            <label class="bar-a cb-ffbd5c"></label>
                            不可识别:
                            <label class="c-ffbd5c">2562</label>
                        </div>
                    </div>
                </div>
                <div class="div-jkda-content">
                    <div class="c-w-100 div-chart">
                        <div id="div_jkda_chart2" class="c-w-100 c-h-100">

                        </div>
                        <div class="div-instruction">
                            <div class="div-jkda-amount">15256</div>
                            <div class="div-jkda-title">住院/门诊</div>
                        </div>
                    </div>
                    <div class="c-w-100 div-bottom-instruction">
                        <div class="f-mb10 f-pl30">
                            <label class="bar-a cb-5bc9f4"></label>
                            住院:
                            <label class="c-5bc9f4">2562</label>
                        </div>
                        <div class="f-pl30">
                            <label class="bar-a cb-ffbd5c"></label>
                            门诊:
                            <label class="c-ffbd5c">2562</label>
                        </div>
                    </div>
                </div>
                <div class="div-jkda-content">
                    <div class="c-w-100 div-chart">
                        <div id="div_jkda_chart3" class="c-w-100 c-h-100">

                        </div>
                        <div class="div-instruction">
                            <div class="div-jkda-amount">15256</div>
                            <div class="div-jkda-title">数据统计</div>
                        </div>
                    </div>
                    <div class="c-w-100 div-bottom-instruction">
                        <div class="f-mb10 f-pl30">
                            <label class="bar-a cb-9a9cf4"></label>
                            今日入库:
                            <label class="c-9a9cf4">2562</label>
                        </div>
                        <div class="f-pl30">
                            <label class="bar-a cb-d08dff"></label>
                            每日更新:
                            <label class="c-d08dff">2562</label>
                        </div>
                    </div>
                </div>
                <div class="div-jkda-content">
                    <div class="div-ljjbrs"></div>
                    <div style="font-size: 1.2vw;color:#333;padding: 20px 0px 10px 30px;">累计疾病人数</div>
                    <div style="font-size: 1.05vw;color:#FF807F;padding: 0px 0px 30px 30px;">每日新增<label style="color:#FF807F;">2562</label></div>
                    <div>
                        <label class="c-d08dff" style="margin: 0px 10px 0px 30px;font-size: 1.96vw;">152586</label>
                        <label style="font-size: 1.3vw;color:#333;">人</label>
                    </div>
                </div>
                <div class="div-jkda-content">
                    <div class="div-ljjzrs"></div>
                    <div style="font-size: 1.2vw;color:#333;padding: 20px 0px 10px 30px;">累计就诊人数</div>
                    <div style="font-size: 1.05vw;color:#FF807F;padding: 0px 0px 30px 30px;">每日新增<label style="color:#FF807F;">252</label></div>
                    <div>
                        <label class="c-ffbd5c" style="margin: 0px 10px 0px 30px;font-size: 1.96vw;">152586</label>
                        <label style="font-size: 1.3vw;color:#333;">人</label>
                    </div>
                </div>
            </div>

            <%--电子病历--%>
            <div class="div-dzbl">
                <div class="div-jkda-header">
                    <i class="if-dzbl"></i>
                    <span class="yj-tit">电子病历</span>
                </div>
                <div>
                    <div id="div_jkda_chart4"></div>
                    <div class="div-chuizhi-xian"></div>
                    <div class="div-dzbl-content">
                        <div class="c-w-60 c-h-100 c-pr c-fl f-index10">
                            <div id="div_jkda_chart5" class="c-w-100 c-h-100">

                            </div>
                            <div class="div-instruction">
                                <div class="div-jkda-amount">15256</div>
                                <div class="div-jkda-title">住院/就诊</div>
                            </div>
                        </div>
                        <div class="c-w-40 c-h-100 c-fl f-fs12">
                            <div class="f-mb20 f-pt135">
                                <label class="bar-a cb-42d16f"></label>
                                住院:
                                <label class="c-42d16f">2562</label>
                            </div>
                            <div>
                                <label class="bar-a cb-ffbd5c"></label>
                                就诊:
                                <label class="c-ffbd5c">2562</label>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <%--生命体征--%>
            <div class="div-smtz">
                <div class="div-jkda-header">
                    <i class="if-smtz"></i>
                    <span class="yj-tit">生命体征</span>
                </div>
                <div class="f-pl30 f-pr30">
                    <div class="div-smtz-content div-smtz1">
                        <div class="div-shebeishu-img"></div>
                        <div class="div-smtz-amount-title">设备数</div>
                        <div class="div-smtz-day-add">每日增长
                            <label class="c-fff">2562</label>
                        </div>
                        <div>
                            <label class="div-smtz-amount">152586</label>
                            <label class="f-fs20 c-fff">台</label>
                        </div>
                    </div>
                    <div class="div-smtz-content div-smtz2">
                        <div class="div-xuetangshu-img"></div>
                        <div class="div-smtz-amount-title">血糖数</div>
                        <div class="div-smtz-day-add">每日增长
                            <label class="c-fff">2562</label>
                        </div>
                        <div>
                            <label class="div-smtz-amount">152586</label>
                            <label class="f-fs20 c-fff">条</label>
                        </div>
                    </div>
                    <div class="div-smtz-content div-smtz3">
                        <div class="div-xinlv-img"></div>
                        <div class="div-smtz-amount-title">心率</div>
                        <div class="div-smtz-day-add">每日增长
                            <label class="c-fff">2562</label>
                        </div>
                        <div>
                            <label class="div-smtz-amount">152586</label>
                            <label class="f-fs20 c-fff">条</label>
                        </div>
                    </div>
                    <div class="div-smtz-content div-smtz4">
                        <div class="div-xueyashu-img"></div>
                        <div class="div-smtz-amount-title">血压数</div>
                        <div class="div-smtz-day-add">每日增长
                            <label class="c-fff">2562</label>
                        </div>
                        <div>
                            <label class="div-smtz-amount">152586</label>
                            <label class="f-fs20 c-fff">条</label>
                        </div>
                    </div>
                </div>
            </div>

            <%--全员人口个案库--%>
            <div class="div-qyrkgak">
                <div class="div-jkda-header">
                    <i class="if-qyrkgak"></i>
                    <span class="yj-tit">全员人口个案库</span>
                </div>
                <div>
                    <div class="div-qyrkgak-chart1">
                        <div class="c-w-100 c-h-100">
                            <div id="div_jkda_chart6" >

                            </div>
                        </div>
                        <div class="div-instruction">
                            <div class="div-jkda-amount">15256</div>
                            <div class="div-jkda-title">健康卡绑定量</div>
                        </div>
                    </div>
                    <div class="div-chuizhi-xian"></div>
                    <div id="div_jkda_chart7"></div>
                    <div class="div-chuizhi-xian"></div>
                    <div class="div-chart8-content">
                        <div class="c-w-60 c-h-100 c-pr c-fl f-index10">
                            <div id="div_jkda_chart8" class="c-w-100 c-h-100">

                            </div>
                            <div class="div-instruction">
                                <div class="div-jkda-amount">15256</div>
                                <div class="div-jkda-title">住院/就诊</div>
                            </div>
                        </div>
                        <div class="c-w-40 c-h-100 c-fl f-fs12">
                            <div class="f-ml20 f-mb20 f-pt135">
                                <label class="bar-a cb-42d16f"></label>
                                住院:
                                <label class="c-42d16f">2562</label>
                            </div>
                            <div class="f-ml20">
                                <label class="bar-a cb-ffbd5c"></label>
                                就诊:
                                <label class="c-ffbd5c">2562</label>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <%--医疗资源库--%>
            <div class="div-ylzyk">
                <div class="div-jkda-header">
                    <i class="if-ylzyk"></i>
                    <span class="yj-tit">医疗资源库</span>
                </div>
                <div>
                    <div id="div_jkda_chart9"></div>
                    <div class="div-ylzyk-content">
                        <div class="div-ylzyk-header">
                            <div class="div-ylzyk-title">全市统计</div>
                            <div class="c-border-top f-pt22 f-pl30">
                                <div>
                                    <label class="f-pl20 f-fs16 c-fwb c-333">医生：</label>
                                    <label class="f-fs16 c-44d4ca">112555</label>
                                </div>
                                <div class="f-pt35">
                                    <label class="f-pl20 f-fs16 c-fwb c-333">护士：</label>
                                    <label class="f-fs16 c-ffbd5c">112555</label>
                                </div>
                                <div class="f-pt35">
                                    <label class="f-pl20 f-fs16 c-fwb c-333">床位：</label>
                                    <label class="f-fs16 c-28a9e6">112555</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>









