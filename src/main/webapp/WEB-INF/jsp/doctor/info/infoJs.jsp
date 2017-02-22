<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<script type="text/javascript" src="http://ued.yihu.cn/framework/cross/js/jquery/1.8.3/jquery.js"></script>
<script type="text/javascript" src="${staticRoot}/widget/nicescroll/3.6.0/js/nicescroll.js"></script>
<script src="${staticRoot}/widget/jquery.select/js/jquery.select.js" type="text/javascript"></script>
<script type="text/javascript">
  $(function(){
    $(".section-main").niceScroll({cursorborder:"",cursorcolor:"#cccdd1",boxzoom:false});

    //select插件参数：jsonData是添加到当前对象下拉菜单中的数据，如果仅显示jsondata内容，当前对象内容要先清空
    $('#cat1').formSelect();
    $('#cat3').formSelect();
    $('#cat2').formSelect({
      jsonData:{1001:"预约挂号类4",1002:"预约挂号类5",1003:"预约挂号类6"}
    });


    var url1='${contextRoot}' + "/doctor/info";
    $.ajax({
      url: url1,    //请求的url地址
      type: 'GET',
      dataType: "json",   //返回格式为json
      async: true, //请求是否异步，默认为异步，这也是ajax重要特性
      data: {
        "userId":"0dae000356bfda059b10c52338ddea55"
      },
      success: function(data) {
        if(data){
          alert("成功！");
        }else{
          alert("失败！")
        }
      }
    });




  })
</script>