<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<script src="${staticRoot}/widget/My97DatePickerBeta/My97DatePicker/WdatePicker.js" type="text/javascript"></script>


<script type="text/javascript">
    var doctorHome = {
        defaultCity:[],
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
        provinceList:function(province){//获取省信息列表
            var url='${contextRoot}' + "/provinces";
            $.ajax({
                url: url,    //请求的url地址
                type: 'GET',
                dataType: "json",   //返回格式为json
                async: true, //请求是否异步，默认为异步，这也是ajax重要特性
                data: {
                    "level":"1"
                },
                success: function(data) {
                    if(data.successFlg){
                        var formData = data.detailModelList;
                        var cst2= $('#cat2').formSelect({
                            jsonData:formData,
                            jsonDataId:"id",
                            jsonDataText:"name",
                        });
                        for(var i in formData){
                            if(formData[i].id ==province){
                                cst2.formSelect({
                                            initialValue:{key:formData[i].id ,val:formData[i].name},
                                        },null,
                                        function(dom,text,value) {//点击某个选项回调
                                            var cityArr = doctorHome.cityList(value);
                                        },function(){   //初始化回调
                                            var cityArr = doctorHome.cityList(province);
                                        });
                                break;
                            }else{
                                continue;
                            }
                        }

                    }else{
                        alert("省列表信息获取失败！")
                    }
                }
            });
        },
        cityList:function(pid){//获取城市信息列表
            var url='${contextRoot}' + "/citys";
            $.ajax({
                url: url,    //请求的url地址
                type: 'GET',
                dataType: "json",   //返回格式为json
                async: true, //请求是否异步，默认为异步，这也是ajax重要特性
                data: {
                    "pid":pid
                },
                success: function(data) {
                    if(data.successFlg){
                        var formData = data.detailModelList;
                        var cst3= $('#cat3').formSelect({
                            jsonData:formData,
                            jsonDataId:"id",
                            jsonDataText:"name",
                        });
                        doctorHome.defaultCity = formData;
                        return formData;
                    }else{
                        alert("市列表信息获取失败！")
                        return ;
                    }
                }
            });
        },
        initCity:function(city){//初始化选中城市
            var url='${contextRoot}' + "/dictName";
            $.ajax({
                url: url,    //请求的url地址
                type: 'GET',
                dataType: "json",   //返回格式为json
                async: true, //请求是否异步，默认为异步，这也是ajax重要特性
                data: {
                    "id":city
                },
                success: function(data) {
                    if(data.successFlg){
                        var formData = data.obj;
                        $('#cat3').formSelect({
                                    initialValue:{key:formData.id ,val:formData.name},
                                });
                    }else{
                        alert("城市信息实例化失败！")
                    }
                }
            });

        },
        doctorInfo:function(){//获取医生基本信息
            var url='${contextRoot}' + "/doctor/infoData";
            $.ajax({
                url: url,    //请求的url地址
                type: 'GET',
                dataType: "json",   //返回格式为json
                async: true, //请求是否异步，默认为异步，这也是ajax重要特性
                data: {
                    "userId": sessionStorage.getItem("userId")
                },
                success: function(data) {
                    if(data.successFlg){
                        var formData = data.obj;
                        var genderArr = [{value:'', text:'请选择'},{value:'1', text:'男'},{value:'0', text:'女'}];
                        var cst1= $('#cat1').formSelect({
                            jsonData:genderArr,
                            jsonDataId:"value",
                            jsonDataText:"text",
                        });
                        for(var i in genderArr){
                            if(genderArr[i].value == formData.gender){
                                cst1.formSelect({
                                            initialValue:{key:genderArr[i].value ,val:genderArr[i].text},
                                        },null,
                                        function(dom,text,value) {//点击某个选项回调
                                            cst1.formSelect({
                                                initialValue: {key: value, val: text}
                                            });
                                        },function(){   //初始化回调

                                        });
                                break;
                            }else{
                                continue;
                            }
                        }
                        doctorHome.provinceList(formData.provinceId);
                        doctorHome.initCity(formData.cityId);
                        window.top.doctorInfo = avalon.define({
                            $id: "doctor",
                            doctor: formData,
                            genderArr: [{value:'', text:'请选择'},{value:'1', text:'男'},{value:'0', text:'女'}]

                        });
                        avalon.scan();

                        return formData;
                    }else{
                        alert("医生信息获取失败！")
                        return;
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
    $('#cat2').formSelect(
    );
    $('#cat3').formSelect();



        doctorHome.init();
        doctorHome.doctorInfo();

    function upadateDoctor(){//修改医生基本信息
        var url='${contextRoot}' + "/doctor/update";
        debugger
        var doctorJson =JSON.stringify(window.top.doctorInfo.doctor);
        $.ajax({
            url: url,    //请求的url地址
            type: 'POST',
            dataType: "json",   //返回格式为json
            async: true, //请求是否异步，默认为异步，这也是ajax重要特性
            data: {
                "doctor":doctorJson
            },
            success: function(data) {
                if(data.successFlg){
                    art.dialog({
                        skin: 'artDialog-blue',
                        title: '提示',
                        content: '<div class="c-f14 c-333">修改个人信息成功！</div>',
                        width: 300,
                        left: '100%',
                        top: '100%',
                        fixed: true,
                        time: 3,
                        mouseenterOffTime:true,
                        drag: false,
                        resize: false,
                        closeAnimatedTime:300
                    });
                }else{
                    alert("医生信息获取失败！")
                    return;
                }
            }
        });
    }



    $("#editBtn").click(function(){
        var btnType = $('#editBtn').attr('btn-type');
        if(btnType=="save"){
            upadateDoctor();
            $("#realName").attr("disabled","disabled").addClass("input-text-disabled");
            $("#cat1").addClass("disabled");
            $("#cat2").addClass("disabled");
            $("#cat3").addClass("disabled");
            $("#telephone").attr("disabled","disabled").addClass("input-text-disabled");
            $("#email").attr("disabled","disabled").addClass("input-text-disabled");
            $("#registerDate").removeAttr("disabled");

            $("#editBtn").val("编辑");
            $('#editBtn').attr('btn-type','edit');
        }else{
            // 设置控件可编辑
            $("#realName").removeAttr("disabled").removeClass("input-text-disabled");
            $("#cat1").removeClass("disabled");
            $("#cat2").removeClass("disabled");
            $("#cat3").removeClass("disabled");
            $("#telephone").removeAttr("disabled").removeClass("input-text-disabled");
            $("#email").removeAttr("disabled").removeClass("input-text-disabled");
            $("#registerDate").removeAttr("disabled");

            $("#editBtn").val("保存");
            $('#editBtn').attr('btn-type','save');
        }



    });

})
</script>