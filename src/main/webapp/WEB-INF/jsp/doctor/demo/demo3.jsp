<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<style type="text/css">
    .sq-box {height: 250px;}
    .sq-box-one , .sq-box-two {width:165px; height:165px; left: 50%; top: 50%; margin-top: -82.5px; margin-left: -82.5px;}
    .sq-box-one {background: url("${staticRoot}/images/sq_bg_1.png") no-repeat;}
    .sq-box-two {background: url("${staticRoot}/images/sq_bg_2.png") no-repeat;}
    .sq-box .number { font-size: 32px; position: relative; top: 85px;}
    .sq-box-one .number {color: #83c44e;}
    .sq-box-two .number {color: #ffac13;}
    .sq-sub-box {height: 89px; padding-top: 30px}
</style>

<div class="c-row c-split">
    <div class="c-25">
        <div class="sq-box c-border-r c-position-r">
            <div class="sq-box-one c-position-a c-t-center">
                <span class="number">21985</span>
            </div>
        </div>
    </div>
    <div class="c-25">
        <div class="sq-box c-border-r c-position-r c-t-center">
            <div class="sq-sub-box c-border-b">
                <span class="c-f28 c-bold">108</span>
                <p class="c-555">已就诊</p>
            </div>
            <div class="sq-sub-box">
                <span class="c-f28 c-bold">156</span>
                <p class="c-555">已安排就诊</p>
            </div>
        </div>
    </div>
    <div class="c-25">
        <div class="sq-box c-border-r c-position-r">
            <div class="sq-box-two c-position-a c-t-center">
                <span class="number">21036</span>
            </div>
        </div>
    </div>
    <div class="c-25">
        <div class="sq-box c-position-r c-t-center">
            <div class="sq-sub-box c-border-b">
                <span class="c-f28 c-bold">108</span>
                <p class="c-555">已就诊</p>
            </div>
            <div class="sq-sub-box">
                <span class="c-f28 c-bold">156</span>
                <p class="c-555">已安排就诊</p>
            </div>
        </div>
    </div>
</div>
