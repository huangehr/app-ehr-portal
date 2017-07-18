<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>


<link rel="stylesheet" href="${staticRoot}/widget/cswitch/1.0/css/cswitch.css" type="text/css" />
<script src="${staticRoot}/js/jsHelper.js" type="text/javascript"></script>

<script type="text/javascript">
    $(function(){
        var url = '${contextRoot}/login/exit',
            $goOut = $('#goOut');
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

        var xzi = {
            $divBottom: $('.div-bottom'),
            $clearfix: $('.clearfix'),
            init:function(){
                $.ajax({
                    url:  '${contextRoot}/system/userManage/getAppTreeByType',
                    type: 'GET',
                    dataType: 'json',
                    data:{},
                    success: function (result) {
                        if (result.successFlg) {
                            var menuList = result.detailModelList;
                            var menuHtml = "";
                            for(var i =0 ;i<menuList.length;i++) {
                                var menu = menuList[i];
                                if(menu.children.length>0){
                                    var imgUrl = "";
                                    var menuTitle = "";
                                    if(menu.code=="DataCenter"){
                                        imgUrl = "../../lib/images/icon_shujuzhongxin.png";
                                        menuTitle = "数据中心管理";
                                    }else if(menu.code=="MasterInfor"){
                                        imgUrl = "../../lib/images/icon_jichuzhicheng.png";
                                        menuTitle = "基础信息管理";
                                    }else if(menu.code=="BusinessCollaboration"){
                                        imgUrl = "../../lib/images/icon_yewuxiezuo-.png";
                                        menuTitle = "业务协作体系";
                                    }else if(menu.code=="ApplicationService"){
                                        imgUrl = "../../lib/images/icon_yingyongfuwu.png";
                                        menuTitle = "应用服务体系";
                                    }
                                    menuHtml += '<div class="div-bottom-item">'+
                                            '<img src="'+imgUrl+'" >'+
                                            '<div class="div-bottom-text">'+menuTitle+'</div>'+
                                            '</div>';
                                }
                            }
                            $(".div-bottom").html(menuHtml);
                        }
                    }
                });
            },
            bindEvents: function () {
                this.$clearfix.on( 'click', 'li', function () {
                    if ($(this).hasClass('go-out')) {
                        return;
                    }
                    location.href = '${contextRoot}/index?activeIndex=-1&headIndex=' + $(this).index();
                });
                this.$divBottom.on("click",".div-bottom-item",function(){
                    $(".div-bottom").find(".div-bottom-item").removeClass("active");
                    $(this).addClass("active");
                    location.href = '${contextRoot}/index?activeIndex='+$(this).index()+ '&headIndex=-1';
                })
            }
        };

        xzi.init();
        xzi.bindEvents();
        $goOut.on('click',function () {
            sessionStorage.clear();
            _jsHelper.delCookie('userId');
            location.href = url;
        });
        <%--$(".div-bottom").on("click",".div-bottom-item",function(){--%>
            <%--$(".div-bottom").find(".div-bottom-item").removeClass("active");--%>
            <%--$(this).addClass("active");--%>
            <%--location.href = '${contextRoot}/index?activeIndex='+$(this).index()+ '&headIndex=-1';--%>
        <%--})--%>


    });

</script>