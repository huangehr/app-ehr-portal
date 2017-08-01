<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<script type="text/javascript">
    $(function () {
        var notice = {
            nItem: $('.n-list'),
            noticeTmp: $('#noticeTmp').html(),
            userId: sessionStorage.getItem("userId"),
            url: '${contextRoot}' + '/doctor/messageRemindList',
            init: function () {
                var me = this;
                me.resData({
                    userId: this.userId
                }, me.setHtml);
            },
            resData: function ( d,cb) {
                var me = this;
                $.ajax({
                    url: me.url,
                    type: 'GET',
                    dataType: 'json',
                    data: d,
                    success: function (data) {
                        if (!!data.successFlg) {
                            cb.call( me, data);
                        } else {
                            art.dialog({
                                title: "警告",
                                time: 2,
                                content: data.message
                            });
                        }
                    },
                    error:function (data) {
                        art.dialog({
                            title: "警告",
                            time: 2,
                            content: "Status:"+data.status +"(" +data.statusText+")"
                        });
                    }
                });
            },
            setHtml: function (d) {
                var me = this,
                        html = '',
                        ol = d.detailModelList;
                if (ol.length > 0) {
                    $.each( ol, function (index) {
                        html += me.render( me.noticeTmp, ol[index], me.clearHtml);
                    });
                    me.nItem.append(html);
                } else {
                    html = '<div style="text-align: center;padding: 100px 0;font-size: 16px;font-weight: 600">暂无公告</div>';
                    $('.n-pages').hide();
                    me.nItem.replaceWith(html);
                }
            },
            render: function( tmpl, data, cb){
                return tmpl.replace(/\{\{(\w+)\}\}/g, function(m, $1){
                    if ($1 === 'createDate') {
                        var rd = new Date(data[$1]);
                        data[$1] = (rd.getMonth() + 1) + '-' + rd.getDate();
                    }
                    if ($1 === 'new' || $1 === 'bubble') {
                        if (data['readed'] == 0) {
                            data[$1] = $1;
                        } else {
                            data[$1] = '';
                        }
                    }
                    if ($1 === 'content') {
                        var con = cb.call(this,data['content']);
                        data['content'] = con.length > 50 ? con.substring( 0, 50) + '...' : con;
                    }
                    return data[$1];
                });
            },
            clearHtml: function (str) {
                str = str.replace(/&nbsp;/ig,'');
                str = str.replace(/\n[\s| | ]*\r/g,'\n');
                str = str.replace(/[\r\n]/g,"");
                return str.replace(/<\/?[^>]*>/g,'');
            }
        };
        notice.init();
    });
</script>