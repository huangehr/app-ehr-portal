<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<link rel="stylesheet" href="${staticRoot}/widget/poshytip/1.2/css/jquery.poshytip.css" type="text/css">
<script type="text/javascript" src="${staticRoot}/widget/poshytip/1.2/js/jquery.poshytip.js"></script>
<script type="text/javascript" src="${staticRoot}/widget/artDialog/4.1.7/js/artDialog.js"></script>
<script type="text/javascript" src="${staticRoot}/js/avalon.js"></script>
<script type="text/javascript" src="${staticRoot}/js/underscore.js"></script>
<script type="text/javascript" src="${staticRoot}/js/es6-promise.js"></script>
<script type="text/javascript" src="${staticRoot}/js/jsHelper.js?v=1.1"></script>

<script type="text/javascript" src="${staticRoot}/js/Ecalendar.jquery.min.js"></script>
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
            $mainOTime: $('#mainOTime'),
            $mainTTime: $('#mainTTime'),
            $kgMz: $('#kgMz'),
            quotaData: { dateArr: [], dataArr:[]},
            quotaData2: { dateArr: [], dataArr:[]},
            quotaData3: [],
            quotaWarnData: [],
            noticesData: [],
            hBOCData: [],
            nowTime: new Date(),
            init: function () {
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
                date = '2017-07-26';

                var reqUrl = [{url: pi.getQutaReport, data: {
                                    id: 16,
                                    startTime: date,
                                    endTime: date,
                                    eventType: ''}},
                                {url: pi.getQutaReport,data: {
                                    id: 18,
                                    startTime: date,
                                    endTime: date,
                                    eventType: ''}},
                                {url: pi.getQutaReport,data: {
                                    id: 27,
                                    startTime: date,
                                    endTime: date,
                                    eventType: ''}}];
                me.getReqPromises(reqUrl).then(function(d) {
                    debugger
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
            getReqPromises:function(reqs){
                var self = this;
                if(!reqs || !reqs.length) {
                    return new Promise(function(resolve, reject) {
                        resolve([]);
                    });
                }
                return Promise.all(_.map(reqs,function(param){
                    return self.getReqPromise(param.url,param.data);
                }));
            },
            getReqPromise:function(url, params){
                return new Promise(function(resolve, reject) {
                    _jsHelper.mhAjax(url, 'GET',params,function(res){
                        resolve(res);
                    })
                });
            },
            initEcharts: function () {
                var me =this;
                me.myCharts1 = _jsHelper.loadECharts( me.$el1, {
                    n: 1,
                    xd: me.quotaData.dateArr,
                    d: me.quotaData.dataArr
                })
                me.myCharts2 = _jsHelper.loadECharts( me.$el2, {
                    n: 1,
                    xd: me.quotaData2.dateArr,
                    d: me.quotaData2.dataArr
                })
                me.myCharts3 = _jsHelper.loadECharts( me.$el3, {
                    n: 3,
                    xd: me.quotaData3.dateArr,
                    d: me.quotaData3.dataArr
                })

                me.bindEvents();
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
                    [ me.$navMainContent, 'click', function (e) {
                        var $that = $(this),
                            lis = $that.parent().find('li');
                        lis.find('a').removeClass('curr');
                        lis.eq($that.index()).find('a').addClass('curr');
                        me.getBottomAllData();
                        e.stopPropagation();
                        e.preventDefault();
                    }, 'li'],
                    [ me.$kgMz, 'click', function (e) {
                        e.stopPropagation();
                        e.preventDefault();
                        var $that = $(this),
                            index = $that.index(),
                            type = '',
//                    date = _jsHelper.dateFormat(me.nowTime);
                                date = '2017-07-26';
//                        type = index == 0 ? 1 : 0;
                        $that.addClass('active').siblings().removeClass('active');
                        Promise.all([
                            me.getQuotaData( 27, date, date, type)//门诊、住院
                        ]).then(function (d) {
                            var d1 = d[0];
                            if (d1.successFlg) {
                                me.quotaData3 = me.getXAxisData(d1.obj.reultModelList);
                                me.$divDateNum.html(d1.obj.tjQuota.name);
                            } else {
                                me.showDialog(d1.message);
                            }
                        }).then(function () {
                            me.myCharts3 = _jsHelper.loadECharts( me.$el3, {
                                n: 3,
                                xd: me.quotaData3.dateArr,
                                d: me.quotaData3.dataArr
                            })
                        });
                    }, 'div']
                ]);
                //日历配置参数
//                type:"time",   //模式，time: 带时间选择; date: 不带时间选择;
//                stamp : false,   //是否转成时间戳，默认true;
//                offset:[0,2],   //弹框手动偏移量;
//                format:"yyyy年mm月dd日",   //时间格式 默认 yyyy-mm-dd hh:ii;
//                skin:3,   //皮肤颜色，默认随机，可选值：0-8,或者直接标注颜色值;
//                step:10,   //选择时间分钟的精确度;
//                callback:function(v,e){} //回调函数
                me.$mainOTime.ECalendar({
                    type:"date",
                    skin: 2,
                    format: 'yyyy-mm-dd',
                    offset:[-70,5],
                    callback: function () {
                        var d = new Date(me.$mainOTime.val()),
                            date = _jsHelper.dateFormat(d);
                        console.log(date);
                        Promise.all([
                            me.getQuotaData( 16, date, date, '')
                        ]).then(function (d) {
                            var d1 = d[0];
                            if (d1.successFlg) {
                                me.quotaData = me.getXAxisData(d1.obj.reultModelList);
                                me.$divZhiBiaoName.html(d1.obj.tjQuota.name);
                            } else {
                                me.showDialog('数据获取失败');
                            }
                        }).then(function () {
                            me.myCharts1 = _jsHelper.loadECharts( me.$el1, {
                                n: 1,
                                xd: me.quotaData.dateArr,
                                d: me.quotaData.dataArr
                            })
                        });
                    }
                });
                me.$mainTTime.ECalendar({
                    type:"date",
                    skin: 2,
                    format: 'yyyy-mm-dd',
                    offset:[-70,5],
                    callback: function (v) {
                        var d = new Date(me.$mainTTime.val()),
                                date = _jsHelper.dateFormat(d);
                        Promise.all([
                            me.getQuotaData( 18, date, date, '')
                        ]).then(function (d) {
                            var d1 = d[0];
                            if (d1.successFlg) {
                                me.quotaData2 = me.getXAxisData(d1.obj.reultModelList);
                                me.$divPatientName.html(d1.obj.tjQuota.name);
                            } else {
                                me.showDialog('数据获取失败');
                            }
                        }).then(function () {
                            me.myCharts2 = _jsHelper.loadECharts( me.$el2, {
                                n: 1,
                                xd: me.quotaData2.dateArr,
                                d: me.quotaData2.dataArr
                            })
                        });
                    }
                });
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