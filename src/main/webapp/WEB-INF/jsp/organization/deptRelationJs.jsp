<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<link rel="stylesheet" href="${staticRoot}/widget/datatables/1.10.10/css/jquery.dataTables.min.css" type="text/css" />
<script type="text/javascript" src="${staticRoot}/widget/datatables/1.10.10/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="${staticRoot}/widget/zTree/3.5.18/css/zTreeStyle.min.css" type="text/css" />
<script type="text/javascript" src="${staticRoot}/widget/zTree/3.5.18/js/jquery.ztree.min.js"></script>
<script type="text/javascript" src="${staticRoot}/widget/placeholder/2.0.7/js/jquery.placeholder.min.js"></script>
<link rel="stylesheet" href="${staticRoot}/widget/choosePerson/1.0/css/choosePerson.min.css" type="text/css" />
<script type="text/javascript" src="${staticRoot}/widget/choosePerson/1.0/js/chooseAdministrator.min.js"></script>

<script type="text/javascript">
    $(function(){

        $('#demoTabs').tabs({
            callback:function(index){
                if(index==0){
                    if(!$('.example1').data('click')){
                        $('.example1').data('click',true);
                    }

                }
                else if (index == 1) {
                    if(!$('.example2').data('click')){
                        $('.example2').DataTable({
                                    "aoColumns": [
                                        {"sWidth": "20%"},
                                        {"sWidth": "13%"},
                                        {"sWidth": "13%"},
                                        {"sWidth": "9%"},
                                        {"sWidth": "9%"},
                                        {"sWidth": "9%"},
                                        {"sWidth": "9%"},
                                        {"sWidth": "9%"},
                                        {"sWidth": "9%"}
                                    ]
                                }
                        );
                        $('.example2').data('click',true);

                    }
                } else {
                    if(!$('.example3').data('click')) {
                        $('.example3').DataTable({
                                    "aoColumns": [
                                        {"sWidth": "20%"},
                                        {"sWidth": "12%"},
                                        {"sWidth": "12%"},
                                        {"sWidth": "8%"},
                                        {"sWidth": "8%"},
                                        {"sWidth": "8%"},
                                        {"sWidth": "8%"},
                                        {"sWidth": "8%"},
                                        {"sWidth": "8%"},
                                        {"sWidth": "8%"}
                                    ]
                                }
                        );
                        $('.example3').data('click',true);
                    }
                }
            }

        })


        //动态表格
        $('.example1').DataTable({
            "aoColumns":[
                { "sWidth": "20%" },
                { "sWidth": "15%" },
                { "sWidth": "15%" },
                { "sWidth": "10%" },
                { "sWidth": "10%" },
                { "sWidth": "10%" },
                { "sWidth": "10%" },
                { "sWidth": "10%"}
            ]}
        );


        //删除信息
        $('.btn-sec').click(function(){
            var artBox=art.dialog({
                lock: true,
                artIcon:'error',
                opacity:0.4,
                width: 250,
                title:'提示',
                content: '是否删除此信息，删除后不可恢复需重新添加，是否继续？',
                ok: function () {
                },
                cancel: true
            });
        })
        //系统发送信息
        $('.btn-fex').click(function(){
            var artBox=art.dialog({
                lock: true,
                artIcon:'',
                opacity:0.4,
                width: 250,
                title:'提示',
                content: '系统发送信息成功.',
                ok: function () {

                }
            });
        });
        //

        //新增上级
        $('.up-down').click(function(){
            var contents=$('.demo-artdialog').get(0);
            var artBox=art.dialog({
                lock: true,
                artIcon:'',
                opacity:0.4,
                width: 1000,
                title:'新增上级',
                fixed:false,
                content: contents,
                ok: function () {
                    var artBox=art.dialog({
                        lock: true,
                        artIcon:'',
                        opacity:0.4,
                        width: 250,
                        title:'新增上级',
                        content: '新增上级成功.',
                        ok: function () {

                        },
                        cancel: true
                    });
                },
                cancel: true
            });
            $(document).on('click','.managechoo',function(){
                chooseAdministrator({
                    initDataId:$('#appAdminer').attr('data-rid'),
                    initDataName:$('#appAdminer').attr('data-val'),
                    selectNumber:15,
                    ztreeJsonUrl:'../widget/choosePerson/1.0/json/chooseAnswerPersonZtree.php',
                    searchJsonUrl:'../widget/choosePerson/1.0/json/chooseAnswerPersonSearch.php',
                    callBack:function(value){
                        filledData(value,'#appAdminer');
                    }
                });
            });

            function filledData(value,dom){
                var _val=_rid='';
                $(value).each(function(i,v){
                    _val+= v.name+",";
                    _rid+= v.rid+",";
                });
                _val=_val.substring(0,_val.length-1);
                _rid=_rid.substring(0,_rid.length-1);
                $(dom).val(_val).attr('data-val',_val);
                $(dom).val(_val).attr('data-rid',_rid);
            }
        })

        $('.up-down1').click(function(){
            var contents=$('.demo-artdialog1').get(0);
            var artBox=art.dialog({
                lock: true,
                artIcon:'',
                opacity:0.4,
                width: 1000,
                title:'新增下级',
                fixed:false,
                content: contents,
                ok: function () {
                    var artBox=art.dialog({
                        lock: true,
                        artIcon:'',
                        opacity:0.4,
                        width: 250,
                        title:'新增下级',
                        content: '新增下级成功.',
                        ok: function () {

                        },
                        cancel: true
                    });
                },
                cancel: true
            });
            $(document).on('click','.managechoo1',function(){
                chooseAdministrator({
                    initDataId:$('#appAdminer').attr('data-rid'),
                    initDataName:$('#appAdminer').attr('data-val'),
                    selectNumber:15,
                    ztreeJsonUrl:'../widget/choosePerson/1.0/json/chooseAnswerPersonZtree.php',
                    searchJsonUrl:'../widget/choosePerson/1.0/json/chooseAnswerPersonSearch.php',
                    callBack:function(value){
                        filledData(value,'#appAdminer');
                    }
                });
            });

            function filledData(value,dom){
                var _val=_rid='';
                $(value).each(function(i,v){
                    _val+= v.name+",";
                    _rid+= v.rid+",";
                });
                _val=_val.substring(0,_val.length-1);
                _rid=_rid.substring(0,_rid.length-1);
                $(dom).val(_val).attr('data-val',_val);
                $(dom).val(_val).attr('data-rid',_rid);
            }
        })

    })
</script>


