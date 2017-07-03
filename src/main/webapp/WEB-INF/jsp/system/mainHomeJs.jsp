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
        $('input[name="interval_type"]').ligerRadio();
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
            $el1: document.getElementById("chart-main1"),
            $el3: document.getElementById("chart-main3"),
            myCharts1: null,
            myCharts2: null,
            myCharts3: null,
            $yjUl: $('.yj-ul'),
            $yjTmp: $('#yjTmp'),
            $body: $('body'),
            $yjListCon: $('.yj-list-con'),
            $mhNoticesCon: $('.mh-notices-con'),
            quotaData: { dateArr: [], dataArr:[]},
            quotaData2: { dateArr: [], dataArr:[]},
            quotaWarnData: [],
            noticesData: [],
            init: function () {
                this.getAllData();
                this.initScroll();
            },
            //获取指标统计
            getQuotaData: function (id) {
                return _jsHelper.mhPromiseReq( pi.getQutaReport, 'GET',{
                    id: id,
                    filters: ''
                });
            },
            //获取指标预警信息
            getTjQuotaWarnData: function () {
                return _jsHelper.mhPromiseReq( pi.getTjQuotaWarn, 'GET',{
                    userId: 1
                });
            },
            //获取最新公告
            getNoticesData: function () {
                return _jsHelper.mhPromiseReq( pi.getNotices, 'GET', {
                    userType: 1
                })
            },
            //获取指标分类医疗服务子类目列表
            getHealthBusinessOfChild: function () {
                return _jsHelper.mhPromiseReq( pi.getHealthBusinessOfChild, 'GET', {})
            },
            //获取所有数据
            getAllData: function () {
                var me = this;
                Promise.all([
                    this.getTjQuotaWarnData(),
                    this.getQuotaData(3),
                    this.getNoticesData(),
                    this.getQuotaData(4),
                    this.getHealthBusinessOfChild()
                ]).then(function (data) {
                    me.initData(data);
                });
            },
            initData: function (d) {
                var me = this,d1 = d[0],d2 = d[1],d3 = d[2],d4 = d[3], d5 = d[4];
                if (d1.successFlg) {
                    me.quotaWarnData = d1.data;
                } else {
                    art.dialog({
                        title: "警告",
                        time: 2,
                        content: d1.message
                    });
                }
                if (d2.successFlg) {
                    me.quotaData = me.getXAxisData(d2.obj.reultModelList);
                } else {
                    art.dialog({
                        title: "警告",
                        time: 2,
                        content: d2.message
                    });
                }
                if (d3.successFlg) {
                    me.noticesData = d3.detailModelList;
                } else {
                    art.dialog({
                        title: "警告",
                        time: 2,
                        content: d2.message
                    });
                }
                if (d4.successFlg) {
                    me.quotaData2 = me.getXAxisData(d2.obj.reultModelList);
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
                    }),
                    _jsHelper.loadECharts( me.$el3, {
                        n: 3,
                        xd: me.quotaData2.dateArr,
                        d: me.quotaData2.dataArr,
                        name: '就诊人数'
                    })
                ]).then(function (d) {
                    me.myCharts1 = d[0];
                    me.myCharts3 = d[1];
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
                console.log(da);
                return da;
            },
            initAvalon: function () {
                avalon.filters.checkStrLen = this.checkStrLen;
                avalon.filters.backDateFormat = this.backDateFormat;
                this.vm = avalon.define({
                    $id: 'app',
                    heiRed: 'hei-red',
                    norGre: 'nor-gre',
                    quotaWarnData: this.quotaWarnData,
                    noticesData: this.noticesData
                });
            },
            //
            checkStrLen: function (val) {
                if (val.length > 7) {
                    val = val.substring( 0, 7) + '...';
                }
                return val;
            },
            backDateFormat: function (val) {
                var str = '';
                if (val.length > 0) {
                    str = val.substring( 5, 10);
                }
                return str;
            },
            initScroll: function () {
                var options = {
                    theme:"dark", //主题颜色
                    scrollButtons:{
                        enable:false,
                        scrollType:"continuous",
                        scrollSpeed:20,
                        scrollAmount:40
                    },
                    horizontalScroll:false,
                    callbacks:{
                    }
                };
                this.$yjListCon.mCustomScrollbar(options);
                this.$mhNoticesCon.mCustomScrollbar(options);
                this.$body.mCustomScrollbar(options);
            },
            bindEvents: function () {
                var me = this;
                window.onresize = function () {
                    me.myCharts1.resize();
//                    myChart2.resize();
                    me.myCharts3.resize();
                };
            }
        };
        mh.init();

        var myChart2 = echarts.init(document.getElementById("chart-main2"));
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
        window.onresize = function () {
//            myChart1.resize();
            myChart2.resize();
//            myChart3.resize();
        };

    })

</script>