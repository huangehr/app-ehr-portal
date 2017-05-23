<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<script type="text/javascript">
    $(function () {
        var $pCode = $('.p-code'),
            $codePops = $('.code-pop');
        //设置rc-main的高度
        (function setRcMainH () {
            var rcMain = $('.rc-main'),
                winH = $(window).height(),
                pH = rcMain.height() + 204;
            if (winH > pH) {
                rcMain.css({
                    'height': winH - pH + rcMain.height() - 20
                });
            }
        })();
        //二维码显示/影藏
        $pCode.on( 'click', function () {
            var codePop = $(this).find('.code-pop');
            if (codePop.css('display') === 'none') {
                $codePops.slideUp();
                codePop.slideDown();
            } else {
                codePop.slideUp();
            }
        });
    });
</script>