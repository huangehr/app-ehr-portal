<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>


<link rel="stylesheet" href="${staticRoot}/widget/cswitch/1.0/css/cswitch.css" type="text/css" />
<script type="text/javascript" src="${staticRoot}/widget/cswitch/1.0/js/cswitch.js"></script>

<script type="text/javascript">
    $(function(){

        var mySwiper = new Swiper ('.swiper-container', {
            direction: 'horizontal',
            loop: false,
            autoplay:3000,
            // 如果需要分页器
            pagination: '.swiper-pagination',
            // 如果需要前进后退按钮
//            nextButton: '.swiper-button-next',
//            prevButton: '.swiper-button-prev',
            // 如果需要滚动条
//            scrollbar: '.swiper-scrollbar',
        });

        var indexPage = {

            //打开导航
            openNav:function (nav,name,url,type) {
                var main = $("#iframe-main");
                var needCreate = true;
                //判断是否已打开
                $.each(main.find("iframe"),function (index,_item) {
                    var itemNav = $(_item).attr("nav");
                    if(itemNav == nav)
                    {
                        $(_item).addClass("curr");
                        $("#nav-main").find("a[nav='"+itemNav+"']").addClass("curr");
                        needCreate = false;
                    }
                    else{
                        $(_item).removeClass("curr");
                        $("#nav-main").find("a[nav='"+itemNav+"']").removeClass("curr");
                    }
                });

                //新增iframe
                if(needCreate)
                {
                    $("#nav-main").append("<li><a href=\"#\" nav=\""+nav+"\" class=\"curr\" onclick=\"indexPage.focusNav(this)\"><span class=\"c-nowrap\">"+name+"</span><i class=\"iconfont\" onclick=\"indexPage.closeNav(this)\">&#xe605;</i></a></li>");
                    if(type=="2")
                    {
                        url = "/login/signin?clientId="+nav+"&url="+ url;
                    }
                    main.append("<iframe frameborder=\"no\" nav=\""+nav+"\" src=\""+url+"\" width=\"100%\" height=\"100%\" class=\"curr\"></iframe>");
                }
            }
        };


        $(".div-bottom").on("click",".div-bottom-item",function(){
            $(".div-bottom").find(".div-bottom-item").removeClass("active");
            $(this).addClass("active");
            location.href = '${contextRoot}/index?activeIndex='+$(this).index();
        })


    });

</script>