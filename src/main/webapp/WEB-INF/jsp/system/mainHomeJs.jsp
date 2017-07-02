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
        var pi = {
            //获取指标预警信息
            getTjQuotaWarn: 'quota/tj/getTjQuotaWarn',
            //统计
            getQutaReport: 'quota/tj/getQuotaReport'
        };

        var mh = {
            $el1: document.getElementById("chart-main1"),
            myCharts1: null,
            myCharts2: null,
            myCharts3: null,
            $yjUl: $('.yj-ul'),
            $yjTmp: $('#yjTmp'),
            quotaData: {dateArr: [],dataArr:[]},
            quotaWarnData: [],
            init: function () {
                this.getAllData();
            },
            //获取指标统计
            getQuotaData: function () {
                return _jsHelper.mhPromiseReq( pi.getQutaReport, 'GET',{
                    id: 3,
                    filters: ''
                });
            },
            //获取指标预警信息
            getTjQuotaWarnData: function () {
                return _jsHelper.mhPromiseReq( pi.getTjQuotaWarn, 'GET',{
                    userId: 1
                });
            },
            //获取所有数据
            getAllData: function () {
                var me = this;
                Promise.all([ this.getTjQuotaWarnData(), this.getQuotaData()]).then(function (data) {
                    me.initData(data);
                });
            },
            initData: function (d) {
                var me = this,
                    d1 = d[0],
                    d2 = d[1];
                if (d1.code == 0) {
                    me.quotaWarnData = d1.data;
                } else {
                    art.dialog({
                        title: "警告",
                        time: 2,
                        content: d1.message
                    });
                }
                if (d2.code == 0) {
                    me.quotaData = me.getXAxisData(d2.obj.reultModelList);
//                    me.quotaData.map = d2.obj.map;
//                    me.quotaData.tjQuota = d2.obj.tjQuota;
                } else {
                    art.dialog({
                        title: "警告",
                        time: 2,
                        content: d2.message
                    });
                }
                me.initAvalon();
                me.initEcharts();
                console.log(d);
            },
            initEcharts: function () {
                var me =this;
                Promise.all([
                    _jsHelper.loadECharts( me.$el1, {
                        n: 1,
                        xd: me.quotaData.dateArr,
                        d: me.quotaData.dataArr
                    })
                ]).then(function (d) {
                    me.myCharts1 = d[0];
                }).then(function () {
                    me.bindEvents();
                });
            },
            getXAxisData: function (d) {
                var da = {dateArr: [],dataArr:[]};
                $.each( d, function (ind) {
                    da.dateArr.push(d[ind].key);
                    da.dataArr.push(d[ind].value);
                });
//                for ( var i in d) {
//                    da.dateArr.push(i);
//                    da.dataArr.push(d[i]);
//                }
                console.log(da);
                return da;
            },
            initAvalon: function () {
                avalon.filters.checkStrLen = function (val) {
                    if (val.length > 7) {
                        val = val.substring( 0, 7) + '...';
                    }
                    return val;
                }
                this.vm = avalon.define({
                    $id: 'mhMain',
                    heiRed: 'hei-red',
                    norGre: 'nor-gre',
//                    quotaData: this.quotaData,
                    quotaWarnData: this.quotaWarnData
                });
            },
            bindEvents: function () {
                var me = this;
                window.onresize = function () {
                    me.myCharts1.resize();
//                    myChart2.resize();
//                    myChart3.resize();
                };
            }
        };
        mh.init();



        var myChart2 = echarts.init(document.getElementById("chart-main2"));
        var myChart3 = echarts.init(document.getElementById("chart-main3"));
        var xAxisData = [];
        var data = [];
        for (var i = 1; i < 19; i++) {
            xAxisData.push('5月' + i + '日');
            data.push(Math.round(Math.random() * 500) + 500);
        }

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
//            myChart1.resize();
            myChart2.resize();
            myChart3.resize();
        };

    })

</script>