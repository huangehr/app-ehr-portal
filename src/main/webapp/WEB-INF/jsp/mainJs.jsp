<%--
  Created by IntelliJ IDEA.
  User: JKZL-A
  Date: 2017/9/27
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<script type="text/javascript" src="${staticRoot}/js/jsHelper.js"></script>
<script>
    (function ($, w, u) {
        $(function () {
            var NAV = parent._NewXZIndex.nav;
            var NAME = parent._NewXZIndex.name;
            var TYPE = parent._NewXZIndex.type;
            //接口
            var inf = [
                //获取侧边栏
                '${contextRoot}/system/userManage/getAppTypeAndApps'
            ];
            //默认图标
            var listImgUrl = [
                //数据中心
                [
                    "../../lib/images/icon_shujuzhongxin.png",
                    "../../lib/images/icon_shujuzhongxin_hui.png"
                ],
                //基础支撑
                [
                    "../../lib/images/icon_jichuzhicheng.png",
                    "../../lib/images/icon_jichuzhicheng_hui.png"
                ],
                //业务协作
                [
                    "../../lib/images/icon_yewuxiezuo-.png",
                    "../../lib/images/icon_yewuxiezuo_hui.png"
                ],
                //用用服务
                [
                    "../../lib/images/icon_yingyongfuwu.png",
                    "../../lib/images/icon_yingyongfuwu_hui.png"
                ]
            ];

            var Main = {
                $listMain: $('#listMain'),
                itemTmp: $('#itemTmp').html(),
                itemITmp: $('#itemITmp').html(),
                type: 0,
                init: function () {
                    this.getListData();
                    this.bindEvent();
                },
                openApp: function () {
                    var url = '${contextRoot}/appIndex?nav=' + NAV + '&name=' + NAME + '&type=' + TYPE;
                    parent._NewXZIndex.openNav(NAV, NAME, url, TYPE);
                },
                initHtml: function (data) {
                    var me = this, html = '';
                    $.each(data, function (key, obj) {
                        html += _jsHelper.render(me.itemTmp, obj, function ($1, d) {
                            if ($1 == 'imgUrl') {
                                d[$1] = me.getImgUrl(d.code, d.children.length);
                            }
                            if ($1 == 'content') {
                                d[$1] = me.initChildHtml(d.children);
                            }
                        });
                    });
                    me.$listMain.html(html);
                    if (NAV) {
                        me.openApp();
                    }
                },
                getImgUrl: function (t, len) {
                    var me = this, imgUrl = '';
                    switch (t) {
                        case 'DataCenter':
                            imgUrl = me.checkLen(0, len);
                            break;
                        case 'MasterInfor':
                            imgUrl = me.checkLen(1, len);
                            break;
                        case 'BusinessCollaboration':
                            imgUrl = me.checkLen(2, len);
                            break;
                        case 'ApplicationService':
                            imgUrl = me.checkLen(3, len);
                            break;
                    }
                    return imgUrl;
                },
                checkLen: function (ind, len) {
                    return len > 0 ? listImgUrl[ind][0] : listImgUrl[ind][1];
                },
                initChildHtml: function (data) {
                    var me = this, html = '';
                    $.each(data, function (k, da) {
                        html += _jsHelper.render(me.itemITmp, da, function ($1, d) {
                            if ($1 == 'gourl') {
                                if (me.type == 1) {
                                    d[$1] = d.url;
                                } else {
                                    d[$1] = d.outUrl;
                                }
                            }
                        });
                    });
                    return html;
                },
                getListData: function () {
                    var me = this;
                    _jsHelper.mhAjax(inf[0], 'GET', {manageType: 'client'}, function (res) {
                        if (res.successFlg) {
                            var data = res.detailModelList;
                            if (data) {
                                me.type = res.obj;
                                me.initHtml(res.detailModelList);
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
                bindEvent: function () {
                    var me = this;
                    _jsHelper.bindEvents([
                        [me.$listMain, 'click', function (e) {
                            var $me = $(this),
                                    type = $me.attr('data-type'),
                                    url = $me.attr('data-url'),
                                    nav = $me.attr('data-id'),
                                    name = $me.attr('data-name');
                            switch (type) {
                                case 'backStage':
                                    window.open('${contextRoot}/newXZIndex?nav=' + nav + '&name=' + name + '&type=' + type, '_blank');
                                    break;
                                case 'client':
                                    if (nav == 'R1yHNdX5Ud') {
                                        url = "/login/signin?clientId=" + nav + "&url=" + url;
                                    }
                                    parent._NewXZIndex.openNav(nav, name, url, type);
                                    break;
                            }
                        }, '.m-i-i-a']
                    ]);
                }
            };
            Main.init();
        });
    })(jQuery, window);
</script>