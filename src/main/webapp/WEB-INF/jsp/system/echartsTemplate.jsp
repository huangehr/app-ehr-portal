<%--
  Created by IntelliJ IDEA.
  User: JKZL-A
  Date: 2017/11/2
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<link rel="stylesheet" type="text/css" href="${staticRoot}/widget/artDialog/4.1.7/css/artDialog.min.css">
<link rel="stylesheet" href="${staticRoot}/css/bootstrap.min.css" type="text/css"/>
<div style="height: 100%" id="tmpCon">

</div>
<script type="text/html" id="strTmp">
    <style>
        html,body,.container-fluid{
            height: 100%;
        }
        .pt-l-r-0{
            padding-left: 0;
            padding-right: 0;
        }
        .pt-l-0{
            padding-left: 0;
        }
        .pt-b-0{
            padding-bottom: 0;
        }
        .pt-15{
            padding-top: 15px;
        }
        .pb-15{
            padding-bottom: 15px;
        }
        .pr-15{
            padding-right: 15px;
        }
        .pl-15{
            padding-left: 15px;
        }
        .oh{
            overflow: hidden;
        }
        .et-title{
            height: 30px;
            text-align: center;
            line-height: 30px;
            background: #fafafa;
            /*border: 1px solid #ccc;*/
        }
        #chartOne{
            height: 50vh;
        }
        #chartTwo,#chartThree,#chartFour{
            height: 22.4vh;
        }
        #chartFive,#chartSix,#chartSeven,#chartEight{
            height: 30vh;
            background: #fff !important;
        }
        #numOne,#numTwo,#numThree,#numfour{
            height: 20vh;
            background: #ccc;
        }
        .echarts{
            /*border: 1px solid #ccc;*/
            border-top: 0;
            position: relative;
        }
        .spinner {
            margin: 0 auto;
            width: 50px;
            height: 60px;
            text-align: center;
            font-size: 10px;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-50%);
        }

        .spinner > div {
            background-color: #67CF22;
            height: 100%;
            width: 6px;
            display: inline-block;

            -webkit-animation: stretchdelay 1.2s infinite ease-in-out;
            animation: stretchdelay 1.2s infinite ease-in-out;
        }

        .spinner .rect2 {
            -webkit-animation-delay: -1.1s;
            animation-delay: -1.1s;
        }

        .spinner .rect3 {
            -webkit-animation-delay: -1.0s;
            animation-delay: -1.0s;
        }

        .spinner .rect4 {
            -webkit-animation-delay: -0.9s;
            animation-delay: -0.9s;
        }

        .spinner .rect5 {
            -webkit-animation-delay: -0.8s;
            animation-delay: -0.8s;
        }

        @-webkit-keyframes stretchdelay {
            0%, 40%, 100% { -webkit-transform: scaleY(0.4) }
            20% { -webkit-transform: scaleY(1.0) }
        }

        @keyframes stretchdelay {
            0%, 40%, 100% {
                transform: scaleY(0.4);
                -webkit-transform: scaleY(0.4);
            }  20% {
                   transform: scaleY(1.0);
                   -webkit-transform: scaleY(1.0);
               }
        }
    </style>


    <div class="container-fluid pb-15" style="background: #f1f1f1">
        <div class="row">
            <div class="col-xs-6 col-sm-6 pt-15 pb-15">
                <div style="background: #fff">
                    <div class="et-title">title</div>
                    <!--chart1-->
                    <div class="echarts" id="chartOne">
                        <div class="spinner">
                            <div class="rect1"></div>
                            <div class="rect2"></div>
                            <div class="rect3"></div>
                            <div class="rect4"></div>
                            <div class="rect5"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 pt-15 pb-15 pt-l-0">
                <div class="oh">
                    <div class="col-xs-6 pb-15 pt-l-r-0">
                        <div style="background: #fff">
                            <div class="et-title">title</div>
                            <!--chart2-->
                            <div class="echarts" id="chartTwo">
                                <div class="spinner">
                                    <div class="rect1"></div>
                                    <div class="rect2"></div>
                                    <div class="rect3"></div>
                                    <div class="rect4"></div>
                                    <div class="rect5"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 pb-15 pt-l-r-0 pl-15">
                        <div style="background: #fff">
                            <div class="et-title">title</div>
                            <!--chart3-->
                            <div class="echarts" id="chartThree">
                                <div class="spinner">
                                    <div class="rect1"></div>
                                    <div class="rect2"></div>
                                    <div class="rect3"></div>
                                    <div class="rect4"></div>
                                    <div class="rect5"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="oh">
                    <div style="background: #fff">
                        <div class="et-title">title</div>
                        <!--chart3-->
                        <div class="echarts" id="chartFour">
                            <div class="spinner">
                                <div class="rect1"></div>
                                <div class="rect2"></div>
                                <div class="rect3"></div>
                                <div class="rect4"></div>
                                <div class="rect5"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row pl-15">
            <div class="col-xs-3 pt-l-0 pr-15">
                <div class="et-title">title</div>
                <!--chart-->
                <div class="echarts" id="chartFive">
                    <div class="spinner">
                        <div class="rect1"></div>
                        <div class="rect2"></div>
                        <div class="rect3"></div>
                        <div class="rect4"></div>
                        <div class="rect5"></div>
                    </div>
                </div>
            </div>
            <div class="col-xs-3 pt-l-0 pr-15">
                <div class="et-title">title</div>
                <!--chart-->
                <div class="echarts" id="chartSix">
                    <div class="spinner">
                        <div class="rect1"></div>
                        <div class="rect2"></div>
                        <div class="rect3"></div>
                        <div class="rect4"></div>
                        <div class="rect5"></div>
                    </div>
                </div>
            </div>
            <div class="col-xs-3 pt-l-0 pr-15">
                <div class="et-title">title</div>
                <!--chart-->
                <div class="echarts" id="chartSeven">
                    <div class="spinner">
                        <div class="rect1"></div>
                        <div class="rect2"></div>
                        <div class="rect3"></div>
                        <div class="rect4"></div>
                        <div class="rect5"></div>
                    </div>
                </div>
            </div>
            <div class="col-xs-3 pt-l-0 pr-15">
                <div class="et-title">title</div>
                <!--chart-->
                <div class="echarts" id="chartEight">
                    <div class="spinner">
                        <div class="rect1"></div>
                        <div class="rect2"></div>
                        <div class="rect3"></div>
                        <div class="rect4"></div>
                        <div class="rect5"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/html" id="jsStr">
        var jsStr = {
            $echarts: $('.echarts'),
            init: function (opt) {
                $.each(this.$echarts, function (k, o) {
                    if (Object.prototype.toString.call(opt[k]) == '[object Object]') {
                        $(0).html('');
                        var chart = echarts.init(o);
                        chart.setOption(opt[k]);
                        charts.push(chart);
                    } else {
                        $(o).find('.spinner').html('数据加载失败！');
                    }
                });
                this.bindEvent();
            },
            bindEvent: function () {
                var to = null;
                $(window).on('resize', function () {
                    !!to && clearTimeout(to);
                    to = setTimeout(function () {
                        $.each(charts, function (k, o) {
                            o.resize();
                        });
                    }, 100);
                });
            }
        };
        jsStr.init(options);
    </script>
</script>