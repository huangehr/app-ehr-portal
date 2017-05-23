<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<link rel="stylesheet" href="${staticRoot}/widget/zTree/3.5.18/css/zTreeStyle.css" type="text/css" />
<script type="text/javascript" src="${staticRoot}/widget/zTree/3.5.18/js/jquery.ztree.js"></script>
<link rel="stylesheet" href="${staticRoot}/widget/datatables/1.10.10/css/jquery.dataTables.css">
<script type="text/javascript" src="${staticRoot}/widget/datatables/1.10.10/js/jquery.dataTables.js"></script>
<link rel="stylesheet" href="${staticRoot}/widget/searchSelect/1.0/css/searchSelect.min.css">
<script src="${staticRoot}/widget/searchSelect/1.0/js/searchSelect.min.js"></script>


<script>
    $(function(){
        // 滚动条
        $('.aside-block').niceScroll({cursorborder:"",cursorcolor:"#cccdd1",horizrailenabled:true});
        $('.aside-block').on('click',function(){
            $(".aside-block").getNiceScroll().resize();
        });
        $(".aside-block").on('mouseover',function() {
            $(".aside-block").getNiceScroll().resize();
        });

        $('#memberDataTable').DataTable({
            fnDrawCallback:function(){
            }
        });

        $('#memberDataTable-wait').DataTable({
            fnDrawCallback:function(){
            }
        });

        // 重新发送弹窗
        $(document).on('click','.btn-again-post',function(){
            var artBox=art.dialog({
                lock: true,
                artIcon:'add',
                opacity:0.4,
                width: 250,
                title:'邀请加入',
                content: '<p class="c-t-center">将通过短信重新发送邀请</p>',
                ok: function () {
                    art.dialog({
                        lock: true,
                        opacity:0.4,
                        content: '<img src="../widget/artDialog/4.1.7/images/tips-icon.png" class="mr10" />邀请短信已重新发送',
                        tips:true,
                        time: 3
                    });
                },
                cancel:true
            });
        });

        // 修改主职弹窗
        $(document).on('click','.btn-edit-zz',function(){
            var contents=$('.edit-zw-pop').get(0);
            var artBox=art.dialog({
                lock: true,
                artIcon:'add',
                opacity:0.4,
                width: 620,
                title:'修改主职',
                content: contents,
                init:function(){
                    // 弹窗里面的单选
                    $('.edit-zw-pop').radioGroup({elemClass:'.demo-radio-elem'});
                },
                ok: function () {
                },
                cancel:true
            });
        });
        // 设置部门弹窗
        $(document).on('click','.btn-edit-bm',function(){
            var contents=$('.edit-bm-pop').get(0);
            var artBox=art.dialog({
                lock: true,
                artIcon:'add',
                opacity:0.4,
                width: 620,
                title:'设置部门',
                content: contents,
                fixed:false,
                ok: function () {
                },
                cancel:true
            });
        });

        // 表格中的删除
        $(document).on('click','#memberDataTable .tbbtnDel',function(){
            var artBox=art.dialog({
                lock: true,
                artIcon:'error',
                opacity:0.4,
                width: 320,
                title:'删除人员',
                content: '删除人员将同时删除此成员相关业务信息，<br />您确定要删除此人员信息吗？',
                ok: function () {
                },
                cancel: true
            });
        });

        // 表格中的删除
        $(document).on('click','#memberDataTable-wait .tbbtnDel',function(){
            art.dialog({
                lock: true,
                opacity:0.4,
                content: '<img src="../widget/artDialog/4.1.7/images/tips-icon.png" class="mr10" />删除成功！',
                tips:true,
                time: 1
            });
        });

        //表格里面的组单选
        $('#edit-bm').radioGroup({elemClass:'.demo-radio-elem'});


        // 职务搜索
        var data = [
            {"key":"device","val":"device"},
            {"key":"BlackBerry","val":"BlackBerry"},
            {"key":0,"val":"-请选择-"},
            {"key":"with","val":"with"},
            {"key":"entertainment","val":"entertainment"},
            {"key":"and","val":"and"},
            {"key":"social","val":"social"}
        ];
        var demoSelect=$('#Select-zw').searchSelect({
            selectData      : data,
            jsonDataId      : 'key',
            jsonDataText    : 'val',
            jsonDataStick   : 'stick',
            selectInitVal   :  {key:"apps",val:"apps"},
            selectCallBack  : function(value,text,item,elem){
                alert(value);
            }
        });

        // 动态表格里面的 表格弹窗
        $(document).on('click','.btn-info',function(){
            $('.table-info-pop').remove();
            $(this).append(function(){
                return	'<div class="table-info-pop c-position-a z-100 c-position-lt20 w400 max-h-300 mt15">'+
                        '<h3 class="ptb10 plr20 c-f16 c-border-t c-border-l c-border-r bgc-fff c-t-left">'+
                        '<i class="iconfont mr5 c-f90 c-bold">&#xe620;</i>小俊俊'+
                        '<a class="alinks alinks-blue ml10 btn-edit-zz c-f12" href="javascript:;">修改主职</a>'+
                        '</h3>'+
                        '<div class="max-h-200">'+
                        '<table class="tb tb-b width-100" data-toggle="tbHover">'+
                        '<tr>'+
                        '<th class="c-33">部门</th>'+
                        '<th class="c-33">职务</th>'+
                        '<th class="c-33">职务类型</th>'+
                        '</tr>'+
                        '<tr>'+
                        '<td>儿科</td>'+
                        '<td>副院长</td>'+
                        '<td>主职</td>'+
                        '</tr>'+
                        '<tr>'+
                        '<td>儿科</td>'+
                        '<td>副院长</td>'+
                        '<td>主职</td>'+
                        '</tr>'+
                        '<tr>'+
                        '<td>儿科</td>'+
                        '<td>副院长</td>'+
                        '<td>主职</td>'+
                        '</tr>'+
                        '<tr>'+
                        '<td>儿科</td>'+
                        '<td>副院长</td>'+
                        '<td>主职</td>'+
                        '</tr>'+
                        '<tr>'+
                        '<td>儿科</td>'+
                        '<td>副院长</td>'+
                        '<td>主职</td>'+
                        '</tr>'+
                        '<tr>'+
                        '<td>儿科</td>'+
                        '<td>副院长</td>'+
                        '<td>主职</td>'+
                        '</tr>'+
                        '</table>'+
                        '</div>'+
                        '</div>';
            });
            //判断弹窗是否要往上显示（页面底部空间不够的时候）
            if( $(this).offset().top +200 >= $(window).height() + $(window).scrollTop() )
            {
                $('.table-info-pop').removeClass('c-position-lt20').addClass('c-position-lb0');
            }
            return false;
        });
        // 移除动态表格里面的弹窗
        $(document).on('click',function(){
            $('.table-info-pop').remove();
        });

    });
</script>