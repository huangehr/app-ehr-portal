<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<link rel="stylesheet" type="text/css" href="${staticRoot}/css/style.css">


<script type="text/javascript">
    $(function(){
        $('.sec_scroll').niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});//聊天消息框
        $('.face_include').niceScroll({cursorborder:"",cursorcolor:"#cccdd1"});//表情弹出层

        $('.exp_boxer').on('click','i[data-class="icon-face"]',function(event){//表情
            event.stopPropagation();
            $('.face_include').toggle();
        })
        $('body,html').bind('click',function(){
            $('.face_include').hide();
        })

        $('.input_boxer input').each(function(index, element) { //登陆页input效果
            var $this=$(this),
                    word=$this.val();
            $this.bind('focus',function(){
                $this.parent('.input_boxer').addClass('focus');
                $this.val('');
            }).bind('blur',function(){

                $this.parent('.input_boxer').removeClass('focus');
                if($this.val()==''){
                    $this.val(word);
                }
                else{
                    return;
                }
            })
        });
        //表情END
    })
</script>