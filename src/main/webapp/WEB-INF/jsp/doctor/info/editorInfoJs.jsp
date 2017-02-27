<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<script type="text/javascript" src="http://ued.yihu.cn/framework/cross/js/jquery/1.8.3/jquery.js"></script>
<script type="text/javascript" src="${staticRoot}/widget/nicescroll/3.6.0/js/nicescroll.js"></script>
<script src="${staticRoot}/widget/jquery.select/js/jquery.select.js" type="text/javascript"></script>
<script src="${staticRoot}/widget/My97DatePickerBeta/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript" src="${staticRoot}/avalon-1.5/dist/avalon.js"></script>


<script type="text/javascript">
    var doctor = {
        //绑定按钮事件
        bindEvents: function () {
            var me = this;
            $('#btnSave').click(function () {
                me.save();
            });
        },
        getDoctorInfo:function() {
            $.ajax({ //ajax处理
                type: "GET",
                url : '${contextRoot}/doctor/infoData',
                dataType : "json",
                data: {
                    //TODO  医生信息查询参数
                    "userId":"0dae000356bfda059b10c52338ddea55"
                },
                cache:false,
                success :function(data){
                    if(data.successFlg) {
                        var formData = data.objectMap.doctorInfo;
                        var doctorInfo = avalon.define({
                            $id: "doctor",
                            info: formData,
                            toGender: function(gender) {
                                if (gender === "1") {
                                    return "男";
                                }else if (gender === "0") {
                                    return "女";
                                }else {
                                    return "未知";
                                }
                            }

                        });
                        avalon.scan();
//            $.ligerDialog.success(data.message);
//            me.grid.reload();
                    }
                    else {
                        $.ligerDialog.error(data.message);
                    }
                },
                error :function(data) {
                    $.ligerDialog.error("Status:"+data.status +"(" +data.statusText+")");
                }
            });
        }

    }


$(function(){
    $(".section-main").niceScroll({cursorborder:"",cursorcolor:"#cccdd1",boxzoom:false});

    //日期时间控件
    $('#registerDate').click(function(){
        WdatePicker({skin:'whyGreen'});
    })
    $('.icon-date').click(function(){
        WdatePicker({el:$dp.$('registerDate'),skin:'whyGreen'});
    })

    //select插件参数：jsonData是添加到当前对象下拉菜单中的数据，如果仅显示jsondata内容，当前对象内容要先清空
    $('#cat1').formSelect();
    $('#cat3').formSelect();
    $('#cat2').formSelect({
        jsonData:{1001:"预约挂号类4",1002:"预约挂号类5",1003:"预约挂号类6"}
    });

    doctor.getDoctorInfo();

})
</script>