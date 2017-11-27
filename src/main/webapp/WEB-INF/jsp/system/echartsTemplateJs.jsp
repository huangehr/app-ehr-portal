<%--
  Created by IntelliJ IDEA.
  User: JKZL-A
  Date: 2017/11/2
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<script type="text/javascript" src="${staticRoot}/widget/artDialog/4.1.7/js/artDialog.min.js"></script>
<script type="text/javascript" src="${staticRoot}/widget/echarts/shine.js"></script>
<script type="text/javascript">
    ~(function (w, $ ,u) {
        $(function () {

            var options = [];
            var charts = [];
            var intf = '/doctor/getTemplateData';
            var load = art.dialog({
                title: '加载中...',
                cancel: false,

            });
            var ET = {
                $tmpCon: $('#tmpCon'),
                strTmp: $('#strTmp').html(),
                init: function () {
                    this.loadData();
                },
                loadData: function () {
                    var me =this;
                    $.ajax({
                        url: intf,
                        data: {
                            reportCode: 123
                        },
                        type: 'GET',
                        dataType: 'json',
                        success: function (res) {
                            if (res.successFlg) {
                                var obj = res.obj,
                                    tmp = !!obj ? obj.templateContent : '',
                                    opt = !!obj ? obj.viewInfos[0].options : '';
                                $.each(opt, function (k, obj) {
                                    var op = JSON.parse(obj.option);
                                    op.title.show = false;
                                    options.push(op);
                                });
                                me.$tmpCon.append(tmp);
                                var jsStr = me.$tmpCon.find('#jsStr').html();
                                eval(jsStr);
                            } else {
                                art.dialog({
                                    title: "警告",
                                    time: 2,
                                    content: res.message
                                });
                            }
                            load.close();
                        }
                    });
                }
            };
            ET.init();
        });
    })(window, jQuery);
</script>