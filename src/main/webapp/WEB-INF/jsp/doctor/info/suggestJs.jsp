<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<script type="text/javascript">
$(function(){
     var loading = null;
     var layer = window.parent.layer;
     function Trim(str,is_global) {
          var result;
          result = str.replace(/(^\s+)|(\s+$)/g,"");
          if(is_global.toLowerCase()=="g")
          {
            result = result.replace(/\s/g,"");
          }
          return result;
     }


    $(".section-main").niceScroll({cursorborder:"",cursorcolor:"#cccdd1",boxzoom:true});
    $('#form_id').validationEngine();
    $('#submit').click(function(){
        var content = $('#content').val();
        var url='${contextRoot}' + "/doctor/sendSuggest", str = Trim(content, 'g');
        if (!!!str) {
            art.dialog({		//错误
                lock: true,
                width: 200,
                icon: 'error',
                content: '请填写意见反馈！',
                ok: function () {

                }
            });
            return;
        }
        if (str.length > 500) {
            art.dialog({		//错误
               lock: true,
               width: 200,
               icon: 'error',
               content: '超出字数！',
               ok: function () {

               }
            });
            return;
        }

        loading = layer.open({
         shade: [0.8, '#393D49'],icon: 1,
         title: false,
         type: 3
        });

        $.ajax({
            url: url,    //请求的url地址
            type: 'POST',
            dataType: "json",   //返回格式为json
            data: {
                //TODO　userId获取和设置
                "userId":sessionStorage.getItem("userId"),
                "content":content
            },
            success: function(data) {
                layer.close(loading);
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