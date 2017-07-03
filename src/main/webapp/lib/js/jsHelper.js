/**
 * Created by JKZL-A on 2017/7/2.
 */
~(function ( win, $, u) {
    var jsHelper = {
        /*
        * ajax
        * */
        mhAjax: function ( url, type, data, scb, ecb, res) {
            $.ajax({
                url: url,
                type: type,
                dataType: 'json',
                data: data,
                success: function (r) {
                    $.isFunction(res) && res(r);
                    $.isFunction(scb) && scb.call( this, r);
                },
                error: function (e) {
                    $.isFunction(ecb) && ecb.call( this, e);
                }
            });
        },
        mhPromiseReq: function ( url, type, data) {
            var me = this;
            return new Promise(function ( res, rej) {
                me.mhAjax( url, type, data, u, u, res);
            });
        },
        /*
        * 图表
        * */
        //柱状图
        getBarChartsOptions: function ( xAxisData, data) {
            var num = Math.max.apply( null, data);
            var option = {
                grid: {
                    x: 80,
                    x2: 30,
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
                            return num;
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
            return option;
        },
        //饼图
        getPieChartsOptions: function ( name, d) {
            var option  = {
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                calculable : true,
                // color:['#d071d9', '#ffe33e','#3cb5ff'],
                series : [
                    {
                        name: name,
                        type:'pie',
                        radius : '50%',
                        center: ['50%', '50%'],
                        data: d
                    }
                ]
            };
            return option;
        },
        //折线图
        getLineChartsOptions: function ( xAxisData, data, name) {
            var option = {
                tooltip : {
                    trigger: 'axis'
                },
                grid: {
                    x: 80,
                    x2: 50,
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
                        data : xAxisData,
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
                        name: name,
                        type: 'line',
                        smooth: true,
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
                        data: data
                    }
                ]
            };
            return option;
        },
        loadECharts: function ( el, op) {
            var myCharts = echarts.init(el);
            switch (op.n) {
                case 1:
                    myCharts.setOption(this.getBarChartsOptions( op.xd, op.d));
                    break;
                case 2:
                    myCharts.setOption(this.getPieChartsOptions( op.name, op.d));
                    break;
                case 3:
                    myCharts.setOption(this.getLineChartsOptions( op.xd, op.d, op.name));
                    break;
            }
            return myCharts;
        },
        /*
        * bindEvents
        * */
        bindEvents: function (arr) {//[{el:document,es:event,cb:callback,nel:nel},...]
            $.each( arr, function (index) {
                var a = arr[index];
                a[3] = a[3] || '';
                a[0].on( a[1], a[3], function (e) {
                    $.isFunction(a[2]) && a[2].call( this, e);
                });
            })
        },
        /*
        *打开导航
        */
        openNav:function ( $main, $navMain, nav, name, url, type) {
            var main = $main;
            var needCreate = true;
            //判断是否已打开
            $.each(main.find("iframe"),function (index,_item) {
                var itemNav = $(_item).attr("nav");
                if(itemNav == nav)
                {
                    $(_item).addClass("curr");
                    $navMain.find("a[nav='"+itemNav+"']").addClass("curr");
                    needCreate = false;
                }
                else{
                    $(_item).removeClass("curr");
                    $navMain.find("a[nav='"+itemNav+"']").removeClass("curr");
                }
            });
            //新增iframe
            if(needCreate)
            {
                $navMain.append("<li><a href=\"#\" nav=\""+nav+"\" class=\"curr\" onclick=\"indexPage.focusNav(this)\"><span class=\"c-nowrap\">"+name+"</span><i class=\"iconfont\" onclick=\"indexPage.closeNav(this)\">&#xe605;</i></a></li>");
                if(type=="2")
                {
                    url = "/login/signin?clientId="+nav+"&url="+ url;
                }
                main.append("<iframe frameborder=\"no\" nav=\""+nav+"\" src=\""+url+"\" width=\"100%\" height=\"100%\" class=\"curr\"></iframe>");
            }
        }
    };
    win._jsHelper = jsHelper;
})( window, jQuery)
