<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<script type="text/javascript">
$(function(){
    $(".section-main").niceScroll({cursorborder:"",cursorcolor:"#cccdd1",boxzoom:true});
    $('#form_id').validationEngine();
    $('#submit').click(function(){
        var content = $('#content').val();
            var url='${contextRoot}' + "/doctor/sendSuggest";
            $.ajax({
                url: url,    //请求的url地址
                type: 'POST',
                dataType: "json",   //返回格式为json
                data: {
                    //TODO　userId获取和设置
                    "userId":"0dae000356bfda059b10c52338ddea55",
                    "content":content
                },
                success: function(data) {
                    if(data.successFlg){
                        art.dialog({
                            skin: 'artDialog-blue',
                            title: '提示',
                            content: '<div class="c-f14 c-333">反馈提交成功！</div>',
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
                        $('#content').val("");
                    }else{
                        art.dialog({		//错误
                            lock: true,
                            width: 200,
                            icon: 'error',
                            content: '意见反馈提交失败！',
                            ok: function () {

                            }
                        });
                    }
                }
            });

    });


})
 </script>
</body>
</html>