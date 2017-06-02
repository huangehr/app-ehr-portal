<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<script type="text/javascript">
    $(function () {
        var notice = {
            nItem: $('.n-list'),
            noticeTmp: $('#noticeTmp').html(),
            url: '${contextRoot}' + '/doctor/getNotices',
            init: function () {
                var me = this;
                me.resData({
                    userType: '${userType}'
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
                    var rd = new Date(data[$1]);
                    if ($1 === 'releaseDate') {
                        data[$1] = (rd.getMonth() + 1) + '-' + rd.getDate();
                    }
                    if ($1 === 'new' || $1 === 'bubble') {
                        var d = new Date(data['releaseDate']),
                                n = new Date();
                        d.setDate(d.getDate() + 3);
                        if (d.getTime() > n.getTime()) {
                            data[$1] = $1;
                        } else {
                            data[$1] = '';
                        }
                    }
                    if ($1 === 'content') {
                        var con = cb.call(this,data['content']);
                        data['content'] = con.length > 50 ? con.substring( 0, 50) + '...' : con;
                    }
                    if ($1 === 'link') {
                        data[$1] = '${contextRoot}' + '/doctor/notices/noticeInfo?noticeId=' + data['id'];
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