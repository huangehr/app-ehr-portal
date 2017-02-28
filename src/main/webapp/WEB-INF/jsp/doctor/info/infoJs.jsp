<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<script src="${staticRoot}/widget/jquery.select/js/jquery.select.js" type="text/javascript"></script>
<script src="${staticRoot}/widget/My97DatePickerBeta/My97DatePicker/WdatePicker.js" type="text/javascript"></script>


<script type="text/javascript">
    var doctorHome = {
        init:function () {
            var me = this;
            /*$.ajax({
             type: "GET",
             url : "/homeMenu",
             dataType : "json",
             cache:false,
             success :function(data){
             if(data.successFlg) {

             }
             else{
             art.dialog({
             content: data.message,
             quickClose: true,
             artIcon:"error"
             });
             }
             },
             error :function(data){
             art.dialog({
             content: "Status:"+data.status +"(" +data.statusText+")",
             quickClose: true,
             artIcon:"error"
             });
             }
             });*/

//            $.each($("#app-main").find("a"),function (index,_item) {
//                $(_item).on("click",function () {
//                    $("#app-main").find("a").removeClass("curr");
//                    $(_item).addClass("curr");
//                    window.parent.indexPage.openNav($(_item).attr("nav"),$(_item).attr("name"),$(_item).attr("data-src"));
//                });
//
//
//            });
        },
        doctorInfo:function(){//获取医生基本信息
            var url='${contextRoot}' + "/doctor/infoData";
            $.ajax({
                url: url,    //请求的url地址
                type: 'GET',
                dataType: "json",   //返回格式为json
                async: true, //请求是否异步，默认为异步，这也是ajax重要特性
                data: {
                    //TODO  医生信息查询参数（写死的）
                    "userId":"0dae000356bfda059b10c52338ddea55"
                },
                success: function(data) {
                    if(data.successFlg){
                        var formData = data.objectMap.doctorInfo;
                        var doctorInfo = avalon.define({
                            $id: "doctor",
                            doctor: formData,
                            toGender: function(gender) {
                                if (gender === 0) {
                                    return "男";
                                } else {
                                    return "女";
                                }
                            },
                            genderArr: [{value:'', text:'请选择'},{value:'1', text:'男'},{value:'0', text:'女'}]

                        });
                        avalon.scan();
                    }else{
                        alert("医生信息获取失败！")
                    }
                }
            });
        },
        appList:function(){//获取应用列表
            var url='${contextRoot}' + "/system/apps";
            $.ajax({
                url: url,    //请求的url地址
                type: 'GET',
                dataType: "json",   //返回格式为json
                async: true, //请求是否异步，默认为异步，这也是ajax重要特性
                data: {
                    //TODO  参数设置
                    "filters":""
                },
                success: function(data) {
                    if(data.successFlg){
                        var formData = data.objectMap.appList;
                        var doctorInfo = avalon.define({
                            $id: "apps",
                            apps: formData
//                            toGender: function(gender) {
//                                if (gender === 0) {
//                                    return "男";
//                                } else {
//                                    return "女";
//                                }
//                            }

                        });
                        avalon.scan();
                    }else{
                        alert("应用列表获取失败！")
                    }
                }
            });
        }

    };


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



        doctorHome.init();
        doctorHome.doctorInfo();
        doctorHome.appList();


})
</script>