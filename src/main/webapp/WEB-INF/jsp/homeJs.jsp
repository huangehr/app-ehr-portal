<%--
  Created by IntelliJ IDEA.
  User: JKZL-A
  Date: 2017/10/26
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<script type="text/javascript" src="${staticRoot}/js/jsHelper.js"></script>

<script>
    ~(function (w, $) {
        $(function () {
            //接口
            var inf = [
                //获取侧边栏
                '${contextRoot}/system/userManage/getAppTypeAndApps'
            ];
            //默认
            var listArr = [
                //数据中心
                [
                    "home-data-center",
                    "../../lib/images/icon_shujuzhongxin.png",
                    "面向整个智慧医疗云提供统一的数据存储与管理方案"
                ],
                //基础支撑
                [
                    "home-basics",
                    "../../lib/images/icon_jichuzhichen.png",
                    "提供云计算资源管理、应用软件的配套设施服务管理、数据质量控制及全平台运维监控等"
                ],
                //业务协作
                [
                    "home-business",
                    "../../lib/images/icon_yewuxiezuo.png",
                    "实现平台之间的互联互通、信息共享、业务协作，为居民提供便捷、高效的数据医疗服务"
                ],
                //应用服务
                [
                    "home-application",
                    "../../lib/images/icon_yingyongfuwu.png",
                    "构建完整的区域内覆盖居民、政府、医院及基层领域的服务体系"
                ]
            ];

            var imgUrl = {
                "数据资源中心": "../../lib/images/icon_shujuzhongxinziyuan.png",
                "基础信息管理": "../../lib/images/icon_jichuxinxiguanli.png",
                "云资源管理": "../../lib/images/icon_yunziyuanguanli.png",
                "区域影像": "../../lib/images/icon_quyuyingx.png",
                "双向转诊服务": "../../lib/images/icon_shuangxiangzhuanzhenfuwu.png",
                "远程会诊服务": "../../lib/images/icon_yuanchenghuizhenfuwu.png",
                "区域检查检验": "../../lib/images/icon_quyujianchajiany.png",
                "区域电子病历": "../../lib/images/icon_quyudianzibingli.png",
                "公共卫生服务": "../../lib/images/icon_gonggweishengfuwu.png",
                "卫生应急指挥": "../../lib/images/icon_weishengyingjizhihui.png",
                "公众健康服务": "../../lib/images/icon_gongzongjiankangfuwu.png",
                "远程医疗教学": "../../lib/images/icon_yuanchengyiliaojiaoxue.png",
                "医疗云服务": "../../lib/images/icon-shujuzhongxinmenhu.png",
                "信息共享交换": "../../lib/images/icon_xinxigongxiangjiaohu.png",
                "政府服务平台": "../../lib/images/zffwpt.png"
            };

            var showTimeOut = null;

            var Home = {
                $homeInfoCon: $('.home-info-con'),
                $homeBCon: $('.home-b-con'),
                bannerTmp: $('#bannerTmp').html(),
                infoConTmp: $('#infoConTmp').html(),
                $loout: $('#loout'),
                $homeItem: $('.home-item'),
                $userInfo: $('#userInfo'),
                $nameInfo: $('.name-info'),
                type: 0,
                init: function () {
                    this.$nameInfo.html(sessionStorage.getItem("loginName"));
                    this.bindDataEvent();
                    this.loadData();
                },
                loadData: function () {
                    var me = this;
                    _jsHelper.mhAjax(inf[0], 'GET', {manageType: 'client'}, function (res) {
                        if (res.successFlg) {
                            var data = res.detailModelList;
                            if (data) {
                                me.type = res.obj;
                                me.initBannerHtml(res.detailModelList);
                            } else {
                                art.dialog({
                                    title: "警告",
                                    time: 2,
                                    content: '返回数据有误'
                                });
                            }
                        } else {
                            art.dialog({
                                title: "警告",
                                time: 2,
                                content: res.message
                            });
                        }
                    })
                },
                initBannerHtml: function (data) {
                    var me = this, html = '';
                    $.each(data, function (k, da) {
                        html += _jsHelper.render(me.bannerTmp, da, function ($1, d) {
                            if ($1 == 'class') {
                                d[$1] = me.getListArrData(d.code, 0)
                            }
                            if ($1 == 'img') {
                                d[$1] = me.getListArrData(d.code, 1)
                            }
                            if ($1 == 'info') {
                                d[$1] = me.getListArrData(d.code, 2)
                            }
                        });
                        me.initItmeHtml(da.children, da.code);
                    });
                    me.$homeBCon.html(html);
                    me.$homeInfoCon.children().eq(0).fadeIn(600);
                    me.bindStyleEvent();
                },
                getListArrData: function (t, n) {
                    var me = this, str = '';
                    switch (t) {
                        case 'DataCenter':
                            str = listArr[0][n];
                            break;
                        case 'MasterInfor':
                            str = listArr[1][n];
                            break;
                        case 'BusinessCollaboration':
                            str = listArr[2][n];
                            break;
                        case 'ApplicationService':
                            str = listArr[3][n];
                            break;
                    }
                    return str;
                },
                initItmeHtml: function (data, code) {
                    var me = this, html = '<ul class="home-show-list">';
                    if (data.length > 0) {
                        $.each(data, function (key, obj) {
                            html += _jsHelper.render(me.infoConTmp, obj, function ($1, d) {
                                if ($1 == 'gourl') {
                                    if (me.type == 1) {
                                        d[$1] = d.url;
                                    } else {
                                        d[$1] = d.outUrl;
                                    }
                                }
                                if ($1 == 'img') {
                                    d[$1] = imgUrl[d.name];
                                }
                            });
                        });
                    }
                    html += '</ul>';
                    me.$homeInfoCon.append(html);
                },
                bindDataEvent: function () {
                    //数据控制事件
                    var me = this;
                    me.$homeInfoCon.on('click', '.home-show-item', function () {
                        var $me = $(this),
                                type = $me.attr('data-type'),
                                url = $me.attr('data-url'),
                                nav = $me.attr('data-id'),
                                name = $me.attr('data-name');
                        window.open('${contextRoot}/newXZIndex?nav=' + nav + '&name=' + name + '&type=' + type + '&url=' + url, '_blank');
                    });
                    me.$homeItem.on('click', function () {
                        var $me = $(this),
                            url = $me.attr('data-url'),
                            nav = $me.attr('data-id'),
                            name = $me.attr('data-name');
                        window.open('${contextRoot}/newXZIndex?nav=' + nav + '&name=' + name + '&url=' + url, '_blank');
                    });
                    me.$userInfo.on('click', function () {
                        window.open('${contextRoot}/newXZIndex?nav=infoMain&name=个人中心&url=doctor/infoMain', '_blank');
                    });
                    me.$loout.on('click', function () {
                        sessionStorage.clear();
                        location.href = '${contextRoot}/login/exit';
                    });
                },
                bindStyleEvent: function () {
                    //样式控制事件
                    var me = this;
                    $('.home-user-item').on('click', function () {
                        if ($('.home-down-con').hasClass('active')) {
                            $('.home-down-con').removeClass('active');
                        } else {
                            $('.home-down-con').addClass('active');
                        }
                    });
                    $('.home-b-item').on('mouseenter', function (e) {
                        var $that = $(this),
                            index = $that.index();
                        showTimeOut = setTimeout(function () {
                            if ($('.home-show-list').eq(index).css('display') == 'none') {
                                $('.home-show-list').hide();
                                    $('.home-show-list').eq(index).fadeIn(600);
                            }
                        }, 100);
                        e.stopPropagation();
                    }).on('mouseleave', function () {
                        clearTimeout(showTimeOut);
                    });
                }
            };
            Home.init();
        });
    })(window, jQuery);
</script>