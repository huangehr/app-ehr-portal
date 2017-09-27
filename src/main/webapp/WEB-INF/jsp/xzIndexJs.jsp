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
                var me = this;
                $.ajax({
                    url:  '${contextRoot}/system/userManage/getAppTypeAndApps',
                    type: 'GET',
                    dataType: 'json',
                    data:{manageType: 'client'},
                    success: function (result) {
                        if (result.successFlg) {
                            var menuList = result.detailModelList;
                            var menuHtml = "", n = 0;
                            for(var i =0 ;i<menuList.length;i++) {
                                var menu = menuList[i];
                                var imgUrl = "";
                                var menuTitle = "";
                                menuTitle = menu.value;
                                if(menu.code=="DataCenter"){
                                    imgUrl = me.getImg("../../lib/images/icon_shujuzhongxin.png",
                                                        "../../lib/images/icon_shujuzhongxin_hui.png",
                                                        menu.children.length);
                                }else if(menu.code=="MasterInfor"){
                                    imgUrl = me.getImg("../../lib/images/icon_jichuzhicheng.png",
                                                        "../../lib/images/icon_jichuzhicheng_hui.png",
                                                        menu.children.length);
                                }else if(menu.code=="BusinessCollaboration"){
                                    imgUrl = me.getImg("../../lib/images/icon_yewuxiezuo-.png",
                                                        "../../lib/images/icon_yewuxiezuo_hui.png",
                                                        menu.children.length);
                                }else if(menu.code=="ApplicationService"){
                                    imgUrl = me.getImg("../../lib/images/icon_yingyongfuwu.png",
                                                        "../../lib/images/icon_yingyongfuwu_hui.png",
                                                        menu.children.length);
                                }
                                menuHtml += '<div class="div-bottom-item" data-len="' + menu.children.length + '" data-num="' + n + '">'+
                                                '<img src="'+imgUrl+'" >'+
                                                '<div class="div-bottom-text">'+menuTitle+'</div>'+
                                            '</div>';
                                if (menu.children.length>0) {
                                    n++;
                                }
                            }
                            $(".div-bottom").html(menuHtml);
                        }
                    }
                });
            },
            getImg: function (url1, url2, len) {
                var url = '';
                if (len > 0) {
                    url = url1;
                } else {
                    url = url2;
                }
                return url;
            },
            bindEvents: function () {
                this.$clearfix.on( 'click', 'li', function () {
                    if ($(this).hasClass('go-out')) {
                        return;
                    }
                    location.href = '${contextRoot}/index?activeIndex=-1&headIndex=' + $(this).index();
                });
                this.$divBottom.on("click",".div-bottom-item",function(){
                    var len = $(this).attr('data-len'),
                        num = $(this).attr('data-num');
                    if (len == '0') {
                        return;
                    }
                    $(".div-bottom").find(".div-bottom-item").removeClass("active");
                    $(this).addClass("active");
                    location.href = '${contextRoot}/index?activeIndex=' + num + '&headIndex=-1';
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