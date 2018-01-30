<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<script type="text/javascript">
    $(function () {
        var noticeInfo = {
            nMain: $('.n-mian'),
            noticeInfoTmp: $('#noticeInfoTmp').html(),
            url: '${contextRoot}' + '/doctor/notice/info',
            noticeId: '${noticeId}',
            init: function () {
                var me = this;
                me.resData({
                    noticeId: me.noticeId
                },me.setHtml);
            },
            resData: function (d, cb) {
                var me = this;
                $.ajax({
                    url: me.url,
                    type: 'GET',
                    dataType: 'json',
                    data: d,
                    success: function (data) {
                        if (!!data.successFlg) {
                            cb && cb.call(me,data.obj);
                        } else {
                            art.dialog({
                                title: "警告",
                                time: 2,
                                content: data.message
                            });
                        }
                    }
                })
            },
            setHtml: function (d) {
                var me = this;
                me.nMain.append(me.render( me.noticeInfoTmp, d));
            },
            render: function(tmpl, data){
                return tmpl.replace(/\{\{(\w+)\}\}/g, function(m, $1){
                    return data[$1];
                });
            }
        };
        noticeInfo.init();
    });
</script>