<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<link rel="stylesheet" href="${staticRoot}/widget/poshytip/1.2/css/jquery.poshytip.css" type="text/css">
<script type="text/javascript" src="${staticRoot}/widget/poshytip/1.2/js/jquery.poshytip.js"></script>
<script type="text/javascript">
    $(window).load(function(){

        $("body").mCustomScrollbar({
            theme:"dark", //主题颜色
            scrollButtons:{
                enable:false,
                scrollType:"continuous",
                scrollSpeed:20,
                scrollAmount:40
            },
            horizontalScroll:false,
            callbacks:{
//                onCreate:function(){console.log("onCreate")},
//                onInit:function(){console.log("onInit")},
                //onScrollStart:function(){console.log("onScrollStart")},
                //onScroll:function(){console.log("onScroll")},
                //onTotalScroll:function(){console.log("onTotalScroll")},
                //onTotalScrollBack:function(){console.log("onTotalScrollBack")},
                //whileScrolling:function(){console.log("whileScrolling")},
                //onOverflowY:function(){console.log("onOverflowY")},
                //onOverflowX:function(){console.log("onOverflowX")},
                //onOverflowYNone:function(){console.log("onOverflowYNone")},
                //onOverflowXNone:function(){console.log("onOverflowXNone")},
                //onImageLoad:function(){console.log("onImageLoad")},
                //onSelectorChange:function(){console.log("onSelectorChange")},
                //onBeforeUpdate:function(){console.log("onBeforeUpdate")},
                //onUpdate:function(){console.log("onUpdate")}
                //$("#mCSB_1_container").css("overflow","hidden");
                //$("#mCSB_1").css("overflow","hidden");
            }
        });
    })

    $(function(){
        $('input[name="interval_type"]').ligerRadio();
        var myChart1 = echarts.init(document.getElementById("chart-main1"));
        var myChart2 = echarts.init(document.getElementById("chart-main2"));
        var myChart3 = echarts.init(document.getElementById("chart-main3"));
        var xAxisData = [];
        var data = [];
        for (var i = 1; i < 19; i++) {
            xAxisData.push('5月' + i + '日');
            data.push(Math.round(Math.random() * 500) + 500);
        }
        var option1 = {
            grid: {
                x: 50,
                x2: 10,
                y: 20,
                y2: 60,
                borderWidth:0
            },
            tooltip : {
                show: true,
                trigger: 'item'
            },
            xAxis: [{
                data: xAxisData,
                axisLine : {    // 轴线
                    show: false
                },
                axisTick: {show:false},
                axisLabel: {show:true,textStyle:{
                    color: '#909090',
                    fontSize:12
                }},
                splitArea: {show:false},
                splitLine: {show:false}
            }, {
                // 辅助 x 轴
                show: false,
                data: xAxisData
            }],
            yAxis: {
                axisLine : {    // 轴线
                    show: false
                },
                axisTick : {    // 轴标记
                    show:false
                },
                axisLabel: {show:true,textStyle:{
                    color: '#909090',
                    fontSize:12
                }},
                splitLine : {
                    show:false
                },
                splitArea : {
                    show: false
                }
            },
            series: [
                {
                    // 辅助系列
                    type           : 'bar',
                    silent         : true,
                    xAxisIndex     : 1,
                    itemStyle      : {
                        normal         : {
                            barBorderRadius: 0,
                            color: '#f7f7ff'
                        }
                    },
                    barWidth: 20,
                    data: data.map(function (val) {
                        return 1000;
                    })
                },
                {
                    type: 'bar',
                    data: data,
                    barWidth: 20,
                    itemStyle: {
                        normal: {
                            barBorderRadius: 0,
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: '#9c9af4'
                            }, {
                                offset: 1,
                                color: '#65c5ff'
                            }]),
                            // shadowColor: 'rgba(35,149,229,0.8)',
                            // shadowBlur: 20,
                        }
                    }
                }
            ]
        };
        myChart1.setOption(option1);

        var option2  = {
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            calculable : true,
            color:['#d071d9', '#ffe33e','#3cb5ff'],
            series : [
                {
                    name:'患病量',
                    type:'pie',
                    radius : '50%',
                    center: ['50%', '50%'],
                    data:[
                        {value:335, name:'患病量1'},
                        {value:310, name:'患病量2'},
                        {value:234, name:'患病量3'}
                    ]
                }
            ]
        };
        myChart2.setOption(option2);

        var option3 = {
            tooltip : {
                trigger: 'axis'
            },
            grid: {
                x: 50,
                x2: 20,
                y: 20,
                y2: 60,
                borderWidth:0
            },
//            legend: {
//                data:['意向','预购','成交']
//            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    boundaryGap : false,
                    data : ['周一','周二','周三','周四','周五','周六','周日'],
                    axisLabel: {show:true,textStyle:{
                        color: '#909090',
                        fontSize:12
                    }},
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    axisLine : {    // 轴线
                        show: true,
                    },
                    axisTick : {    // 轴标记
                        show:false
                    },
                    splitLine : {
                        show:true,
                        lineStyle: {
                            color: '#dddddd',
                            type: 'dotted',
                            width: 2
                        }
                    },
                    axisLabel: {show:true,textStyle:{
                        color: '#909090',
                        fontSize:12
                    }},
                }
            ],
            series : [
                {
                    name:'成交',
                    type:'line',
                    smooth:true,
                    itemStyle: {normal:{ color: new echarts.graphic.LinearGradient(0, 0, 0, 1,
                       [{
                            offset: 0,
                            color: '#54c4ed'
                        }, {
                            offset: 1,
                            color: '#9a70fb'
                        }]),
                        areaStyle:{normal:{color:'#fdb54a'}}
                    }},
                    data:[10, 12, 21, 54, 260, 830, 710]
                }
            ]
        };
        myChart3.setOption(option3);
        window.onresize = function () {
            myChart1.resize();
            myChart2.resize();
            myChart3.resize();
        };

    })

</script>