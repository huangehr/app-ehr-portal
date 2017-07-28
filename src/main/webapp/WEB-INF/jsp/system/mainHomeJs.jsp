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
            $yjTmp: $('#yjTmp'),
            $imMine: $('.im-mine'),
            $noticeMore: $('.notice-more'),
            $yjListCon: $('.yj-list-con'),
            $divZhiBiaoName: $('.div-zhibiao-name'),
            $divPatientName: $('.div-patient-name'),
            $divDateNum: $('.div-date-num'),
            $yjUl: $('.yj-ul'),
            $mhNoticesCon: $('.mh-notices-con'),
            $navMainContent: $('#nav-main-content'),
            //模板
            jsTmp: $('#jsTmp').html(),
            ggTmp: $('#ggTmp').html(),
            tjTmp: $('#tjTmp').html(),
            quotaData: { dateArr: [], dataArr:[]},
            quotaData2: { dateArr: [], dataArr:[]},
            quotaData3: [],
            quotaWarnData: [],
            noticesData: [],
            hBOCData: [],
            nowTime: new Date(),
            init: function () {
                jeDate({
                    dateCell:"#main1Time",//isinitVal:true,
                    format:"YYYY-MM-DD",
                    isTime:false, //isClear:false,
                    minDate:"2014-09-19 00:00:00"
                })
                this.getTopAllData();
            },
            //获取指标统计
            getQuotaData: function ( id, startTime, endTime, eventType) {
                return _jsHelper.mhPromiseReq( pi.getQutaReport, 'GET',{
                    id: id,
                    startTime: startTime,
                    endTime: endTime,
                    eventType: eventType,
                    nowTime: this.nowTime.getTime()
                });
            },
            //获取指标预警信息
            getTjQuotaWarnData: function () {
                return _jsHelper.mhPromiseReq( pi.getTjQuotaWarn, 'GET',{
                    userId: 1,
                    nowTime: this.nowTime.getTime()
                });
            },
            //获取最新公告
            getNoticesData: function () {
                return _jsHelper.mhPromiseReq( pi.getNotices, 'GET', {
                    userType: 1,
                    nowTime: this.nowTime.getTime()
                })
            },
            //获取指标分类医疗服务子类目列表
            getHealthBusinessOfChild: function () {
                return _jsHelper.mhPromiseReq( pi.getHealthBusinessOfChild, 'GET', {
                    nowTime: this.nowTime.getTime()
                })
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
//                    me.initAvalon();
                }).then(function () {
                    me.setTtml();
                }).then(function () {
                    me.getBottomAllData();
                }).then(function () {
                    me.initScroll();
                });
            },
            setTtml: function () {
                var me = this,
                    jsHtml = '',
                    ggHtml = '',
                    tjHtml = '';
                $.each( me.quotaWarnData, function (index) {
                    jsHtml += _jsHelper.render( me.jsTmp, me.quotaWarnData[index], function ( $1, data) {
                        if ($1 == 'subQuotaName') {
                            var val = data['quotaName'];
                            if (val.length > 7) {
                                val = val.substring( 0, 7) + '...';
                            }
                            data[$1] = val;
                        }
                        if ($1 == 'class') {
                            if (data['status'] == 1) {
                                data[$1] = 'hei-red';
                            } else {
                                data[$1] = 'nor-gre';
                            }
                        }
                    });
                })
                $.each( me.noticesData, function (index) {
                    ggHtml += _jsHelper.render( me.ggTmp, me.noticesData[index], function ( $1, data) {
                        if ($1 == 'releaseDate') {
                            var str = data['releaseDate'];
                            if (str.length > 0) {
                                str = str.substring( 5, 10);
                            }
                            data['releaseDate'] = str;
                        }
                    });
                })
                $.each( me.hBOCData, function (index) {
                    tjHtml += _jsHelper.render( me.tjTmp, me.hBOCData[index], function ( $1, data) {
                        if ($1 == 'class') {
                            data[$1] = index == 0 ? 'curr' : '';
                        }
                    });
                })
                me.$yjUl.html(jsHtml);
                me.$mhNoticesCon.html(ggHtml);
                me.$navMainContent.html(tjHtml);
            },
            //获下半部分取所有数据
            getBottomAllData: function () {
                var me = this,
//                    date = _jsHelper.dateFormat(me.nowTime);
                date = '';
                Promise.all([
                    this.getQuotaData( 16, date, date, ''),//柱状图
                    this.getQuotaData( 19, date, date, ''),//折线图
                    this.getQuotaData( 27, date, date, '')//饼图
                ]).then(function (d) {
                    var d1 = d[0],d2 = d[1],d3 = d[2];
                    if (d1.successFlg) {
                        me.quotaData = me.getXAxisData(d1.obj.reultModelList);
                        me.$divZhiBiaoName.html(d1.obj.tjQuota.name);
                    } else {
                        me.showDialog(d1.message);
                    }
                    if (d2.successFlg) {
                        me.quotaData2 = me.getXAxisData(d2.obj.reultModelList);
                        me.$divPatientName.html(d2.obj.tjQuota.name);
                    } else {
                        me.showDialog(d2.message);
                    }
                    if (d3.successFlg) {
                        me.quotaData3 = me.getXAxisData(d3.obj.reultModelList);
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
                        n: 1,
                        xd: me.quotaData3.dateArr,
                        d: me.quotaData3.dataArr,
//                        d: me.quotaData3,
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
                    }, '.notice-item'],
                    [ me.$navMainContent, 'click', function () {
                        var $that = $(this),
                            lis = $that.parent().find('li');
                        lis.find('a').removeClass('curr');
                        lis.eq($that.index()).find('a').addClass('curr');
                        me.getBottomAllData();
                    }, 'li']
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