<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>



<script type="text/javascript">
    var oldPassword;

    //验证新旧密码是否相同
    function checkNoChange(field, rules, i, options){
        var oldPwd =$("#oldPassword").val();
        if (field.val() == oldPwd) {
            debugger
            // this allows to use i18 for the error msgs
            return options.checkPwdEques.alertText;
        };
    };

    //验证原密码是否正确
    function checkPwdRight(field, rules, i, options){
        var flag ;
        $.ajax({
            url: '${contextRoot}' + "/doctor/checkPwd",    //请求的url地址
            type: 'GET',
            dataType: "json",   //返回格式为json
            async: false, //请求是否异步，默认为异步，这也是ajax重要特性
            data: {
                //TODO　根据登录信息获取登录名loginName
                "password":field.val()
            },
            success: function(data) {
                if(!data.successFlg) {
                    flag = false;
                }else{
                    flag =  true;
                }
            }
        });
        if(!flag){
            return options.pwdError.alertText;
        }

    };

    $(function(){
        var checkUrl = '${contextRoot}' + "/doctor/checkPwd";
        //TODO 根据登录信息获取登录名loginName
        oldPassword =  $("#oldPassword").val();
        // 直接调用表单验证
//        $('#form_id').validationEngine();
        // 自定义参数调用
        $('#form_id').validationEngine('attach', {
            promptPosition: 'centerRight',
            scroll: false,
            showOneMessage: true,
            checkPwdEques:{
                'alertText': '新密码不能原密码一致',
            },
            pwdError: {
                'alertText': '原密码输入错误，请重新输入',
            }
        });


        $(".section-main").niceScroll({cursorborder:"",cursorcolor:"#cccdd1",boxzoom:true});

        $('#saveBtn').click(function(){
            var valid = $('#form_id').validationEngine('validate');
            if(valid){
                var url='${contextRoot}' + "/doctor/resetPwd";
                var oldPassword = $("#oldPassword").val();
                var password = $("#password").val();

                $.ajax({
                    url: url,    //请求的url地址
                    type: 'POST',
                    dataType: "json",   //返回格式为json
                    data: {
                        //TODO　userId获取和设置
                        "userId":sessionStorage.getItem("userId"),
                        "oldPassword":oldPassword,
                        "password":password
                    },
                    success: function(data) {
                        if(data.successFlg){
                            art.dialog({
                                skin: 'artDialog-blue',
                                title: '提示',
                                content: '<div class="c-f14 c-333">修改密码成功！</div>',
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
                            art.dialog({		//错误
                                lock: true,
                                width: 200,
                                icon: 'error',
                                content: '修改密码失败！',
                                ok: function () {

                                }
                            });
                        }
                    }
                });
            }else{
                return false;
            }
        });


    })
</script>