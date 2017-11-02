<%--
  Created by IntelliJ IDEA.
  User: JKZL-A
  Date: 2017/11/2
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<script type="text/javascript" src="${staticRoot}/widget/artDialog/4.1.7/js/artDialog.min.js"></script>
<script type="text/javascript" src="${staticRoot}/widget/echarts/macarons.js"></script>
<script type="text/javascript">
    ~(function (w, $ ,u) {
        $(function () {

            var options = [
                {
                    title: {
                        text: '折线图堆叠'
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
//                    legend: {
//                        data:['邮件营销','联盟广告','视频广告','直接访问','搜索引擎']
//                    },
                    grid: {
                        top: '10%',
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    toolbox: {
//                        feature: {
//                            saveAsImage: {}
//                        }
                    },
                    xAxis: {
                        type: 'category',
                        boundaryGap: false,
                        data: ['周一','周二','周三','周四','周五','周六','周日']
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [
                        {
                            name:'邮件营销',
                            type:'line',
                            stack: '总量',
                            data:[120, 132, 101, 134, 90, 230, 210]
                        },
                        {
                            name:'联盟广告',
                            type:'line',
                            stack: '总量',
                            data:[220, 182, 191, 234, 290, 330, 310]
                        },
                        {
                            name:'视频广告',
                            type:'line',
                            stack: '总量',
                            data:[150, 232, 201, 154, 190, 330, 410]
                        },
                        {
                            name:'直接访问',
                            type:'line',
                            stack: '总量',
                            data:[320, 332, 301, 334, 390, 330, 320]
                        },
                        {
                            name:'搜索引擎',
                            type:'line',
                            stack: '总量',
                            data:[820, 932, 901, 934, 1290, 1330, 1320]
                        }
                    ]
                },
                {
                    title : {
                        text: '某站点用户访问来源',
                        subtext: '纯属虚构',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
//                    legend: {
//                        orient: 'vertical',
//                        left: 'left',
//                        data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
//                    },
                    series : [
                        {
                            name: '访问来源',
                            type: 'pie',
                            radius : '55%',
                            center: ['50%', '60%'],
                            data:[
                                {value:335, name:'直接访问'},
                                {value:310, name:'邮件营销'},
                                {value:234, name:'联盟广告'},
                                {value:135, name:'视频广告'},
                                {value:1548, name:'搜索引擎'}
                            ],
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                },
                {
                    title : {
                        text: '某站点用户访问来源',
                        subtext: '纯属虚构',
                        x:'center'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b}: {c} ({d}%)"
                    },
//                    legend: {
//                        orient: 'vertical',
//                        x: 'left',
//                        data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
//                    },
                    series: [
                        {
                            name:'访问来源',
                            type:'pie',
                            radius: ['50%', '70%'],
                            center: ['50%', '60%'],
                            avoidLabelOverlap: false,
                            label: {
                                normal: {
                                    show: false,
                                    position: 'center'
                                },
                                emphasis: {
                                    show: true,
                                    textStyle: {
                                        fontSize: '30',
                                        fontWeight: 'bold'
                                    }
                                }
                            },
                            labelLine: {
                                normal: {
                                    show: false
                                }
                            },
                            data:[
                                {value:335, name:'直接访问'},
                                {value:310, name:'邮件营销'},
                                {value:234, name:'联盟广告'},
                                {value:135, name:'视频广告'},
                                {value:1548, name:'搜索引擎'}
                            ]
                        }
                    ]
                },
                {
                    color: ['#3398DB'],
                    tooltip : {
                        trigger: 'axis',
                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    grid: {
                        top: '8%',
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis : [
                        {
                            type : 'category',
                            data : ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                            axisTick: {
                                alignWithLabel: true
                            }
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value'
                        }
                    ],
                    series : [
                        {
                            name:'直接访问',
                            type:'bar',
                            barWidth: '60%',
                            data:[10, 52, 200, 334, 390, 330, 220]
                        }
                    ]
                },
                {
                    title : {
                        text: '某站点用户访问来源',
                        subtext: '纯属虚构',
                        x:'center'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b}: {c} ({d}%)"
                    },
//                    legend: {
//                        orient: 'vertical',
//                        x: 'left',
//                        data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
//                    },
                    series: [
                        {
                            name:'访问来源',
                            type:'pie',
                            radius: ['50%', '70%'],
                            center: ['50%', '60%'],
                            avoidLabelOverlap: false,
                            label: {
                                normal: {
                                    show: false,
                                    position: 'center'
                                },
                                emphasis: {
                                    show: true,
                                    textStyle: {
                                        fontSize: '30',
                                        fontWeight: 'bold'
                                    }
                                }
                            },
                            labelLine: {
                                normal: {
                                    show: false
                                }
                            },
                            data:[
                                {value:335, name:'直接访问'},
                                {value:310, name:'邮件营销'},
                                {value:234, name:'联盟广告'},
                                {value:135, name:'视频广告'},
                                {value:1548, name:'搜索引擎'}
                            ]
                        }
                    ]
                },
                {
                    title: {
                        text: '对数轴示例',
                        left: 'center'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: '{a} <br/>{b} : {c}'
                    },
//                    legend: {
//                        left: 'left',
//                        data: ['2的指数', '3的指数']
//                    },
                    xAxis: {
                        type: 'category',
                        name: 'x',
                        splitLine: {show: false},
                        data: ['一', '二', '三', '四', '五', '六', '七', '八', '九']
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    yAxis: {
                        type: 'log',
                        name: 'y'
                    },
                    series: [
                        {
                            name: '3的指数',
                            type: 'line',
                            data: [1, 3, 9, 27, 81, 247, 741, 2223, 6669]
                        },
                        {
                            name: '2的指数',
                            type: 'line',
                            data: [1, 2, 4, 8, 16, 32, 64, 128, 256]
                        },
                        {
                            name: '1/2的指数',
                            type: 'line',
                            data: [1/2, 1/4, 1/8, 1/16, 1/32, 1/64, 1/128, 1/256, 1/512]
                        }
                    ]
                },
                {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'cross',
                            crossStyle: {
                                color: '#999'
                            }
                        }
                    },
                    toolbox: {
//                        feature: {
//                            dataView: {show: true, readOnly: false},
//                            magicType: {show: true, type: ['line', 'bar']},
//                            restore: {show: true},
//                            saveAsImage: {show: true}
//                        }
                    },
//                    legend: {
//                        data:['蒸发量','降水量','平均温度']
//                    },
                    xAxis: [
                        {
                            type: 'category',
                            data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
                            axisPointer: {
                                type: 'shadow'
                            }
                        }
                    ],
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    yAxis: [
                        {
                            type: 'value',
                            name: '水量',
                            min: 0,
                            max: 250,
                            interval: 50,
                            axisLabel: {
                                formatter: '{value} ml'
                            }
                        },
                        {
                            type: 'value',
                            name: '温度',
                            min: 0,
                            max: 25,
                            interval: 5,
                            axisLabel: {
                                formatter: '{value} °C'
                            }
                        }
                    ],
                    series: [
                        {
                            name:'蒸发量',
                            type:'bar',
                            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
                        },
                        {
                            name:'降水量',
                            type:'bar',
                            data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
                        },
                        {
                            name:'平均温度',
                            type:'line',
                            yAxisIndex: 1,
                            data:[2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2]
                        }
                    ]
                },
                {
                    title : {
                        text: '某站点用户访问来源',
                        subtext: '纯属虚构',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
//                    legend: {
//                        orient: 'vertical',
//                        left: 'left',
//                        data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
//                    },
                    series : [
                        {
                            name: '访问来源',
                            type: 'pie',
                            radius : '55%',
                            center: ['50%', '60%'],
                            data:[
                                {value:335, name:'直接访问'},
                                {value:310, name:'邮件营销'},
                                {value:234, name:'联盟广告'},
                                {value:135, name:'视频广告'},
                                {value:1548, name:'搜索引擎'}
                            ],
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                }
            ];
            var charts = [];
            var load = art.dialog({
                title: '加载中...',
                cancel: false,

            });
            var ET = {
                $tmpCon: $('#tmpCon'),
                strTmp: $('#strTmp').html(),
                init: function () {
                    load.close();

                    this.$tmpCon.append(this.strTmp);
                    var jsStr = this.$tmpCon.find('#jsStr').html();
                    eval(jsStr);
                }
            };
            ET.init();
        });
    })(window, jQuery);
</script>