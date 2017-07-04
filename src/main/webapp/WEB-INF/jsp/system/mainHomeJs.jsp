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
            $el2: document.getElementById("chart-main2"),
            $el3: document.getElementById("chart-main3"),
            myCharts1: null,
            myCharts2: null,
            myCharts3: null,
            $body: $('body'),
            $yjUl: $('.yj-ul'),
            $yjTmp: $('#yjTmp'),
            $imMine: $('.im-mine'),
            $noticeMore: $('.notice-more'),
            $yjListCon: $('.yj-list-con'),
            $mhNoticesCon: $('.mh-notices-con'),
            $divZhiBiaoName: $('.div-zhibiao-name'),
            $divPatientName: $('.div-patient-name'),
            $divDateNum: $('.div-date-num'),
            quotaData: { dateArr: [], dataArr:[]},
            quotaData2: { dateArr: [], dataArr:[]},
            quotaData3: [],
            quotaWarnData: [],
            noticesData: [],
            hBOCData: [],
            init: function () {
                this.getTopAllData();
                this.initScroll();
            },
            //获取指标统计
            getQuotaData: function ( id, filters) {
                return _jsHelper.mhPromiseReq( pi.getQutaReport, 'GET',{
                    id: id,
                    filters: filters
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
            //获取上半部分数据
            getTopAllData: function () {
                var me = this;
                Promise.all([
                    this.getTjQuotaWarnData(),
                    this.getNoticesData(),
                    this.getHealthBusinessOfChild()
                ]).then(function (d) {
                    var d1 = d[0],d2 = d[1],d3 = d[2];
                    if (d1.successFlg) {
                        me.quotaWarnData = d1.data;
                    } else {
                        me.showDialog(d1.message);
                    }
                    if (d2.successFlg) {
                        me.noticesData = d2.detailModelList;
                    } else {
                        me.showDialog(d2.message);
                    }
                    if (d3.successFlg) {
                        me.hBOCData = d3.detailModelList;
                    } else {
                        me.showDialog(d3.message);
                    }
                }).then(function () {
                    me.initAvalon();
                    me.getBottomAllData();
                });
            },
            //获下半部分取所有数据
            getBottomAllData: function () {
                var me = this;
                Promise.all([
                    this.getQuotaData( 3, ''),//柱状图
                    this.getQuotaData( 4, ''),//折线图
                    this.getQuotaData( 5, 'bread')//饼图
                ]).then(function (d) {
                    var d1 = d[0],d2 = d[1],d3 = d[2];
                    if (d1.successFlg) {
                        me.quotaData = me.getXAxisData(d2.obj.reultModelList);
                        me.$divZhiBiaoName.html(d3.obj.tjQuota.name);
                    } else {
                        me.showDialog(d1.message);
                    }
                    if (d2.successFlg) {
                        me.quotaData2 = me.getXAxisData(d2.obj.reultModelList);
                        me.$divPatientName.html(d3.obj.tjQuota.name);
                    } else {
                        me.showDialog(d2.message);
                    }
                    if (d3.successFlg) {
                        me.quotaData3 = me.getPieXAxisData(d3.obj.reultModelList);
                        me.$divDateNum.html(d3.obj.tjQuota.name);
                    } else {
                        me.showDialog(d3.message);
                    }
                }).then(function () {
                    me.initEcharts();
                });
            },
            initEcharts: function () {
                var me =this;
                Promise.all([
                    _jsHelper.loadECharts( me.$el1, {
                        n: 1,
                        xd: me.quotaData.dateArr,
                        d: me.quotaData.dataArr
                    }),
                    _jsHelper.loadECharts( me.$el2, {
                        n: 2,
                        d: me.quotaData3,
                        name: '患病量'
                    }),
                    _jsHelper.loadECharts( me.$el3, {
                        n: 3,
                        xd: me.quotaData2.dateArr,
                        d: me.quotaData2.dataArr,
                        name: '就诊人数'
                    })
                ]).then(function (d) {
                    me.myCharts1 = d[0];
                    me.myCharts2 = d[1];
                    me.myCharts3 = d[2];
                }).then(function () {
                    me.bindEvents();
                });
            },
            getXAxisData: function (d) {
                var da = { dateArr: [], dataArr: []};
                $.each( d, function (ind) {
                    da.dateArr.push(d[ind].key);
                    da.dataArr.push(d[ind].value);
                });
                return da;
            },
            getPieXAxisData:function (d) {
                var da = [];
                $.each( d, function (ind) {
                    da.push({
                        value: d[ind].value,
                        name: d[ind].key
                    });
                });
                return da;
            },
            initAvalon: function () {
                var me = this;
                avalon.filters.checkStrLen = me.checkStrLen;
                avalon.filters.backDateFormat = me.backDateFormat;
                me.vm = avalon.define({
                    $id: 'app',
                    heiRed: 'hei-red',
                    norGre: 'nor-gre',
                    curr: 'curr',
                    selectId: 0,
                    quotaWarnData: me.quotaWarnData,
                    noticesData: me.noticesData,
                    hBOCData: me.hBOCData,
                    changeTab: function (ind) {
                        this.selectId = ind;
                        me.getBottomAllData();
                    }
                });
                avalon.scan();
            },
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
                var me = this,
                    $main = $("#iframe-main",window.parent.document),
                    $navMain = $("#nav-main",window.parent.document);
                _jsHelper.bindEvents([
                    [ $(window), 'onresize', function () {
                        me.myCharts1.resize();
                        me.myCharts2.resize();
                        me.myCharts3.resize();
                    }],
                    [ me.$noticeMore, 'click', function () {
                        _jsHelper.openNav( $main, $navMain, 'notices', '公告', 'doctor/notices/notice?userType=1');
                    }],
                    [ me.$mhNoticesCon, 'click', function () {
                        var id = $(this).attr('dataid');
                        _jsHelper.openNav( $main, $navMain, 'notices', '公告', '/doctor/notices/noticeInfo?noticeId=' + id);
                    }, '.notice-item']
                ]);
            },
            showDialog: function (msg) {
                art.dialog({
                    title: "警告",
                    time: 2,
                    content: msg
                });
            }
        };
        mh.init();
    });
</script>