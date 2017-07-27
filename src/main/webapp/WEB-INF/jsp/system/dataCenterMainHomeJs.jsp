<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<link rel="stylesheet" href="${staticRoot}/widget/poshytip/1.2/css/jquery.poshytip.css" type="text/css">
<script type="text/javascript" src="${staticRoot}/widget/poshytip/1.2/js/jquery.poshytip.js"></script>
<script type="text/javascript" src="${staticRoot}/widget/artDialog/4.1.7/js/artDialog.js"></script>
<script type="text/javascript" src="${staticRoot}/js/avalon.js"></script>
<script type="text/javascript" src="${staticRoot}/js/es6-promise.js"></script>
<script type="text/javascript" src="${staticRoot}/js/jsHelper.js?v=1.1"></script>
<script type="text/javascript">

    $(window).load(function(){
        //数据接口
        var pi = {
            //获取指标预警信息
            getTjQuotaWarn: 'quota/tj/getTjQuotaWarn',
            //统计
            getQutaReport: 'quota/tj/getQuotaReport',
            //公告
            getNotices: '${contextRoot}' + '/doctor/getNotices',
            //获取指标分类医疗服务子类目列表
            getHealthBusinessOfChild: 'quota/tj/getHealthBusinessOfChild'
        };

        var mh = {
            $el1: document.getElementById("div_jkda_chart1"),
            $el2: document.getElementById("div_jkda_chart2"),
            $el3: document.getElementById("div_jkda_chart3"),
            $el4: document.getElementById("div_jkda_chart4"),
            $el5: document.getElementById("div_jkda_chart5"),
            $el6: document.getElementById("div_jkda_chart6"),
            $el7: document.getElementById("div_jkda_chart7"),
            $el8: document.getElementById("div_jkda_chart8"),
            $el9: document.getElementById("div_jkda_chart9"),
            myCharts1: null,
            myCharts2: null,
            myCharts3: null,
            myCharts4: null,
            myCharts5: null,
            myCharts6: null,
            myCharts7: null,
            myCharts8: null,
            myCharts9: null,
            init: function () {
                this.loadChart1();
                this.loadChart2();
                this.loadChart3();
                this.loadChart4();
                this.loadChart5();
                this.loadChart6();
                this.loadChart7();
                this.loadChart8();
                this.loadChart9();
                this.bindEvents();
                $(".div-main-content").mCustomScrollbar({
                    theme:"dark", //主题颜色
                    scrollButtons:{
                        enable:false,
                        scrollType:"continuous",
                        scrollSpeed:10,
                        scrollAmount:40
                    },
                    horizontalScroll:false,
                });
            },
            loadChart1:function(){
                var me = this;
                me.myCharts1 = echarts.init(me.$el1);
                var option = {
//                    tooltip : {
//                        trigger: 'item',
//                        formatter: "{a} <br/>{b} : {c} ({d}%)"
//                    },
//                    title: {
////                        itemGap: 5,
//                        text: '15256',
//                        textStyle: {
//                            color: '#333',
//                            fontStyle: 'normal',
//                            fontWeight: 'bolder',
//                            fontFamily: 'sans-serif',
//                            fontSize: 16,
//                        },
//                        subtext: ' 数据统计',
//                        subtextStyle: {
//                            color: '#333',
//                            fontStyle: 'normal',
//                            fontWeight: 'normal',
//                            fontFamily: 'sans-serif',
//                            fontSize: 12,
//                        },
//                        x: 'center',
//                        y: 'center'
//                    },
                    color:['#42d16f', '#ffbd5c'],
                    calculable : false,
                    series : [
                        {
                            name:'访问来源',
                            type:'pie',
                            hoverAnimation:false,//是否开启 hover 在扇区上的放大动画效果
                            radius : ['70%', '85%'],
//                            center:['50%','50%'],
                            selectedMode: 'single',
                            itemStyle : {
                                normal : {
                                    label : {
                                        show : false
                                    },
                                    labelLine : {
                                        show : false
                                    }
                                }
                            },
                            data:[
                                {value:335, name:'可识别'},
                                {value:150, name:'不可识别',selected:true}
                            ]
                        }
                    ]
                };
                me.myCharts1.setOption(option);
            },
            loadChart2:function(){
                var me = this;
                me.myCharts2 = echarts.init(me.$el2);
                var option = {
                    color:['#5bc9f4', '#ffbd5c'],
                    calculable : false,
                    series : [
                        {
                            name:'访问来源',
                            type:'pie',
                            hoverAnimation:false,//是否开启 hover 在扇区上的放大动画效果
                            radius : ['70%', '85%'],
//                            center:['50%','50%'],
                            selectedMode: 'single',
                            itemStyle : {
                                normal : {
                                    label : {
                                        show : false
                                    },
                                    labelLine : {
                                        show : false
                                    }
                                }
                            },
                            data:[
                                {value:335, name:'住院'},
                                {value:150, name:'就诊',selected:true}
                            ]
                        }
                    ]
                };
                me.myCharts2.setOption(option);
            },
            loadChart3:function(){
                var me = this;
                me.myCharts3 = echarts.init(me.$el3);
                var option = {
                    color:['#d08dff', '#ffbd5c'],
                    calculable : false,
                    series : [
                        {
                            name:'访问来源',
                            type:'pie',
                            hoverAnimation:false,//是否开启 hover 在扇区上的放大动画效果
                            radius : ['70%', '85%'],
//                            center:['50%','50%'],
                            selectedMode: 'single',
                            itemStyle : {
                                normal : {
                                    label : {
                                        show : false
                                    },
                                    labelLine : {
                                        show : false
                                    }
                                }
                            },
                            data:[
                                {value:335, name:'今日入库'},
                                {value:234, name:'每日更新',selected:true}
                            ]
                        }
                    ]
                };
                me.myCharts3.setOption(option);
            },
            loadChart4:function(){
                var me = this;
                me.myCharts4 = echarts.init(me.$el4);
                var option = {
                    tooltip : {
                        trigger: 'axis'
                    },
                    legend: {
                        data:['采集总数','住院','就诊']
                    },
                    grid: {
                        borderWidth:0
                    },
                    calculable : true,
                    xAxis : [
                        {
                            type : 'category',
                            boundaryGap : false,
                            data : ['7/1','7/2','7/3','7/4','7/5','7/6','7/7'],
                            axisLine : {    // 轴线
                                show: true,
                                lineStyle: {
                                    color: '#dcdcdc',
                                    width: 1
                                }
                            },
                            axisTick: {show:false},
                            axisLabel: {show:true,textStyle:{
                                color: '#909090',
                                fontSize:14
                            }},
                            splitArea: {show:false},
                            splitLine: {show:false}
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value',
                            name : '单位:人',
                            nameTextStyle:{
                                color: '#909090',
                                fontSize:12
                            },
                            axisLine : {    // 轴线
                                show: true,
                                lineStyle: {
                                    color: '#dcdcdc',
                                    width: 1
                                }
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
                            splitArea: {show:false},
                            axisLabel: {show:true,textStyle:{
                                color: '#909090',
                                fontSize:14
                            }},
                        }
                    ],
                    series : [
                        {
                            name:'采集总数',
                            type:'line',
                            stack: '总量',
                            symbol:'circle',
                            symbolSize:10,
                            itemStyle : {
                                normal : {
                                    color: "#28a9e3",
                                    lineStyle:{
                                        color:'#28a9e3'
                                    }
                                }
                            },
                            data:[450, 232, 201, 154, 190, 330, 610]
                        },
                        {
                            name:'住院',
                            type:'line',
                            stack: '总量',
                            symbol:'circle',
                            symbolSize:10,
                            itemStyle : {
                                normal : {
                                    color: "#ffae43",
                                    lineStyle:{
                                        color:'#ffae43'
                                    }
                                }
                            },
                            data:[220, 182, 191, 234, 290, 330, 310]
                        },
                        {
                            name:'就诊',
                            type:'line',
                            stack: '总量',
                            symbol:'circle',
                            symbolSize:10,
                            itemStyle : {
                                normal : {
                                    color: "#45d16f",
                                    lineStyle:{
                                        color:'#45d16f'
                                    }
                                }
                            },
                            data:[120, 132, 101, 134, 90, 230, 210]
                        }
                    ]
                };
                me.myCharts4.setOption(option);
            },
            loadChart5:function(){
                var me = this;
                me.myCharts5 = echarts.init(me.$el5);
                var option = {
                    color:['#42d16f', '#ffbd5c'],
                    calculable : false,
                    series : [
                        {
                            name:'访问来源',
                            type:'pie',
                            hoverAnimation:false,//是否开启 hover 在扇区上的放大动画效果
                            radius : ['70%', '85%'],
//                            center:['50%','50%'],
                            selectedMode: 'single',
                            itemStyle : {
                                normal : {
                                    label : {
                                        show : false
                                    },
                                    labelLine : {
                                        show : false
                                    }
                                }
                            },
                            data:[
                                {value:335, name:'住院'},
                                {value:150, name:'就诊',selected:true}
                            ]
                        }
                    ]
                };
                me.myCharts5.setOption(option);
            },
            loadChart6:function(){
                var me = this;
                me.myCharts6 = echarts.init(me.$el6);
                var option = {
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    color:['#ea0e69', '#F7F7F7'],
                    calculable : false,
                    series : [
                        {
                            name:'访问来源',
                            type:'pie',
                            radius : ['70%', '85%'],
                            selectedMode: 'single',
                            itemStyle : {
                                normal : {
                                    label : {
                                        show : false
                                    },
                                    labelLine : {
                                        show : false
                                    }
                                }
                            },
                            data:[
                                {value:15256, name:'总量'},
                                {value:5256, name:'健康卡绑定量'}
                            ]
                        }
                    ]
                };
                me.myCharts6.setOption(option);
            },
            loadChart7:function(){
                var me = this;
                me.myCharts7 = echarts.init(me.$el7);
                var xAxisData = ['1-8','9-18','19-27','28-36','37-44','45-52','53-60','61-67','68-75','76-82','85以上'];
                var data = [];
                for (var i = 1; i < 12; i++) {
                    data.push(Math.round(Math.random() * 500) + 500);
                }
                var option = {
                    grid: {
//                        x: 50,
//                        x2: 10,
//                        y: 20,
//                        y2: 60,
                        borderWidth:0
                    },
                    tooltip : {
                        show: true,
                        trigger: 'item'
                    },
                    xAxis: [{
                        name : '年龄',
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
                        type : 'value',
                        name : '单位:人',
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
                me.myCharts7.setOption(option);
            },
            loadChart8:function(){
                var me = this;
                me.myCharts8 = echarts.init(me.$el8);
                var option = {
                    color:['#42d16f', '#ffbd5c','#5bc9f4'],
                    calculable : false,
                    series : [
                        {
                            name:'访问来源',
                            type:'pie',
                            hoverAnimation:false,//是否开启 hover 在扇区上的放大动画效果
                            radius : ['70%', '85%'],
//                            center:['50%','50%'],
                            selectedMode: 'single',
                            itemStyle : {
                                normal : {
                                    label : {
                                        show : false
                                    },
                                    labelLine : {
                                        show : false
                                    }
                                }
                            },
                            data:[
                                {value:335, name:'男'},
                                {value:310, name:'女',selected:true},
                                {value:234, name:'未知'}
                            ]
                        }
                    ]
                };
                me.myCharts8.setOption(option);
            },
            loadChart9:function(){
                var me = this;
                me.myCharts9 = echarts.init(me.$el9);
                var option = {
                    tooltip : {
                        trigger: 'axis',
                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    legend: {
                        data:['医生', '护士','床位']
                    },
                    grid: {
                        borderWidth:0,
                        y2: 140
                    },
                    calculable : true,
                    yAxis : [
                        {
                            type : 'value',
                            boundaryGap : [0, 0.01],
                            axisLine : {    // 轴线
                                show: false,
                                lineStyle: {
                                    color: '#dcdcdc',
                                    width: 1
                                }
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
                            splitArea: {show:false},
                            axisLabel: {show:true,textStyle:{
                                color: '#909090',
                                fontSize:14
                            }}
                        }
                    ],
                    xAxis : [
                        {
                            type : 'category',
                            data : ['上饶市第一医院','上饶市第一医院','上饶市第一医院','上饶市第一医院','上饶市第一医院','上饶市第一医院','上饶市第一医院','上饶市第一医院','上饶市第一医院','上饶市第一医院'],
                            axisLine : {    // 轴线
                                show: true,
                                lineStyle: {
                                    color: '#dcdcdc',
                                    width: 1
                                }
                            },
                            axisTick: {show:false},
                            axisLabel: {
                                interval:0,
                                formatter : function(params){
                                    var newParamsName = "";
                                    var paramsNameNumber = params.length;
                                    var provideNumber = 4;
                                    var rowNumber = Math.ceil(paramsNameNumber / provideNumber);
                                    if (paramsNameNumber > provideNumber) {
                                        for (var p = 0; p < rowNumber; p++) {
                                            var tempStr = "";
                                            var start = p * provideNumber;
                                            var end = start + provideNumber;
                                            if (p == rowNumber - 1) {
                                                tempStr = params.substring(start, paramsNameNumber);
                                            } else {
                                                tempStr = params.substring(start, end) + "\n";
                                            }
                                            newParamsName += tempStr;
                                        }

                                    } else {
                                        newParamsName = params;
                                    }
                                    return newParamsName
                                },
//                                rotate:90,
                                show:true,
                                textStyle:{
                                color: '#909090',
                                fontSize:14,
                            }},
                            splitArea: {show:false},
                            splitLine: {show:false}
                        }
                    ],
                    series : [
                        {
                            name:'医生',
                            type:'bar',
                            barGap:2,
                            barMaxWidth:6,
                            itemStyle : {
                                normal : {
                                    barBorderRadius:[6],
                                    color:'#44d4ca',
                                    lineStyle:{
                                        color:'#44d4ca'
                                    }
                                }
                            },
                            data:[1000, 2000, 3000, 4000, 5000,1000, 2000, 3000, 4000, 5000]
                        },
                        {
                            name:'护士',
                            type:'bar',
                            barGap:2,
                            barMaxWidth:6,
                            itemStyle : {
                                normal : {
                                    barBorderRadius:[6],
                                    color:'#FFBD5C',
                                    lineStyle:{
                                        color:'#FFBD5C'
                                    }
                                }
                            },
                            data:[6000, 7000, 8000, 9000, 1000,1000, 2000, 3000, 4000, 5000]
                        },
                        {
                            name:'床位',
                            type:'bar',
                            barGap:2,
                            barMaxWidth:6,
                            itemStyle : {
                                normal : {
                                    barBorderRadius:[6],
                                    color:'#28a9e6',
                                    lineStyle:{
                                        color:'#28a9e6'
                                    }
                                }
                            },
                            data:[11000, 12000, 13000, 14000, 1500,1000, 2000, 3000, 4000, 5000]
                        }
                    ]
                };
                me.myCharts9.setOption(option);
            },
            bindEvents: function () {
                var me = this;
                window.onresize = function () {
                    me.myCharts1.resize();
                    me.myCharts2.resize();
                    me.myCharts3.resize();
                    me.myCharts4.resize();
                    me.myCharts5.resize();
                    me.myCharts6.resize();
                    me.myCharts7.resize();
                    me.myCharts8.resize();
                    me.myCharts9.resize();
                };

            },
        };
        mh.init();
    });
</script>