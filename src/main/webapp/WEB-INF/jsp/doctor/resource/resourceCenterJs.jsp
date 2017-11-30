<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<script type="text/javascript">
    $(function () {
        debugger
        var c = '${contextRoot}';
        var resourceCenter = {
            $pCode: $('.p-code'),
            $codePops: $('.code-pop'),
            $rcMain: $('.rc-main'),
            winH: $(window).height(),
            resourceTmp: $('#resourceTmp').html(),
            url: '${contextRoot}' + '/doctor/resourcesList',
            init: function () {
                var me = this;
                me.bindEvent( me.$rcMain, 'click', me.popCode, '.p-code');
                me.resAjax(me.setHtml);
            },
            setHtml: function ( d, me) {
                var html = '',
                    dd = d.detailModelList;
                $.each( dd, function (index) {
                    html += me.render( me.resourceTmp, dd[index], me.checkData.bind(me));
                });
                me.$rcMain.append(html);
                me.resetRcMainH();
            },
            checkData:function ( d, $1) {
                var me = this;
                if ($1 === 'codeBtns') {
                    var codeBtnsHtml = '',
                        codeBtnsTmp = ['<div class="p-code">',
                                            '<i class="icon {{codeBtnsCIos}}{{codeBtnsCAndroid}}"></i>{{codeBtnsConI}}{{codeBtnsConA}}',
                                            '<div class="code-pop"><img src="${contextRoot}/doctor/resources/uploadFile?storagePath={{iosQrCodeUrl}}{{androidQrCodeUrl}}" alt=""></div>',
                                        '</div>',].join('');
                    d['iosQrCodeUrl'] === null ? '': (function () {
                        var thatD = [{"codeBtnsCIos" : "ios-i", "codeBtnsCAndroid": "", "codeBtnsConI": "IOS客户端扫码安装",
                                        "iosQrCodeUrl" : d['iosQrCodeUrl'], "androidQrCodeUrl" : ""}];
                        $.each( thatD,function (index) {
                            codeBtnsHtml += me.render( codeBtnsTmp, thatD[index]);
                        })
                    })();
                    d['androidQrCodeUrl'] === null ? '': (function () {
                        var thatD = [{"codeBtnsCIos" : "", "codeBtnsCAndroid": "an-i", "codeBtnsConI": "android客户端扫码安装",
                                        "iosQrCodeUrl" : "", "androidQrCodeUrl" : d['androidQrCodeUrl']}]
                        $.each( thatD,function (index) {
                            codeBtnsHtml += me.render( codeBtnsTmp, thatD[index]);
                        })
                    })();
                    d[$1] = codeBtnsHtml;
                }
                if ($1 === 'picUrl') {
                    d[$1] = d[$1] ? '${contextRoot}/doctor/resources/uploadFile?storagePath=' + d[$1] : '${staticRoot}/images/moren_img.png';
                }
                if ($1 === 'downBtns') {
                    var codeBtnsHtml = '',
                        codeLinkTmp = ['<a class="rc-btn" href="${contextRoot}/doctor/resources/uploadFile?storagePath={{pcLink}}{{dLink}}" target="_blank">',
                            '<i class="icon {{pc}}{{wd}}"></i>{{pcCon}}{{dCon}}',
                            '</a>'].join('');
                    d['url'] === null ? '': (function () {
                        var thatD = [{"pcLink" : "", "dLink": d['url'], "pc": "",
                                        "wd" : "w-i", "pcCon" : "", "dCon" : "windows客户端下载"}];
                        $.each( thatD,function (index) {
                            codeBtnsHtml += me.render( codeLinkTmp, thatD[index]);
                        })
                    })();
                    d[$1] = codeBtnsHtml;
                }
            },
            //设置内容容器高度
            resetRcMainH: function () {
                var me = this,
                    pH = me.$rcMain.height() + 204;
                if (me.winH > pH) {
                    me.$rcMain.css({
                        'height': me.winH - pH + me.$rcMain.height() - 20
                    });
                }
            },
            //显示/隐藏二维码
            popCode: function () {
                var codePop = $(this).find('.code-pop');
                if (codePop.css('display') === 'none') {
                    $('.code-pop').slideUp();
                    codePop.slideDown();
                } else {
                    codePop.slideUp();
                }
            },
            bindEvent: function ( d, eStr, cb, c) {
                cb && d.on(eStr, c && c, cb);
            },
            resAjax: function (cb) {
                var me = this;
                $.ajax({
                    url: me.url,
                    data: {},
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        if (!!data.successFlg) {
                            cb && cb.call( this, data, me);
                        } else {
                            art.dialog({
                                title: "警告",
                                time: 2,
                                content: data.message
                            });
                        }
                    },
                    error: function (data) {
                        $.ligerDialog.error("Status:"+data.status +"(" +data.statusText+")");
                    }
                })
            },
            render: function(tmpl, data, cb){
                return tmpl.replace(/\{\{(\w+)\}\}/g, function(m, $1){
                        cb && cb.call(this, data, $1);
                        return data[$1];
                });
            }
        };
        resourceCenter.init();
    });
</script>