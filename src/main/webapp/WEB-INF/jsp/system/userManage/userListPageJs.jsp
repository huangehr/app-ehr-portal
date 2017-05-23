<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>


<script>
    /* *************************** 自定义模块 ***************************** */
    var datasourceList = {};
    try{
        datasourceList = $.parseJSON('${datasourceList}')["detailModelList"];
    }
    catch(e){}

    var configDataset = {
        dialog:null,
        grid:null,
        init:function(){
            var me = this;

            me.grid = $("#div_grid").ligerGrid({
                usePager:false,
                enabledEdit: true,
                url: '${contextRoot}/datacollect/getDatasetSource',
                parms:{stdVersion:"${stdVersion}"},
                columns: [
                    {display:'数据集代码',name:'datasetCode', width: '25%'},
                    {display:'数据集名称',name:'datasetName', width: '25%'},
                    {display:'机构名称',name:'orgId', width: '25%',dict:true,dictName:"SYSTEM_ORGANIZATION"},
                    {display:'配置数据源',name:'datasourceId', width: '25%',
                        editor: {
                            type: 'select',
                            data: datasourceList,
                            valueField: 'id',
                            textField: 'name'
                        },
                        render: function (item)
                        {
                            for (var i = 0; i < datasourceList.length; i++)
                            {
                                if (datasourceList[i]['id'] == item.datasourceId)
                                    return datasourceList[i]['name'];
                            }
                            return item.datasourceId;
                        }
                    }
                ]
            });

            me.bindEvents();
        },
        //绑定按钮事件
        bindEvents: function () {
            var me = this;
            $('#btnSave').click(function () {
                me.save();
            });
        },
        //批量保存
        save:function(){
            var me = this;
            me.grid.endEdit();
            var updateData = me.grid.getUpdated();
            if(updateData!=null && updateData.length>0) {
                for (var i = updateData.length - 1; i >= 0; i--) {
                    var id = updateData[i]["id"];
                    var datasourceId = updateData[i]["datasourceId"];
                    if (id == undefined && (datasourceId == undefined || datasourceId.length == 0)) {
                        updateData.splice(i, 1);
                    }
                }
            }
            if(updateData!=null && updateData.length>0)
            {
                $.ajax({ //ajax处理
                    type: "POST",
                    url : '${contextRoot}/datacollect/saveDatasetSource',
                    dataType : "json",
                    data:{stdVersion:'${stdVersion}',json:JSON.stringify(updateData)},
                    cache:false,
                    success :function(data){
                        if(data.successFlg) {
                            $.ligerDialog.success(data.message);
                            me.grid.reload();
                        }
                        else {
                            $.ligerDialog.error(data.message);
                        }
                    },
                    error :function(data) {
                        $.ligerDialog.error("Status:"+data.status +"(" +data.statusText+")");
                    }
                });
            }

        }
    }

    $(function () {
        configDataset.init();
    });
</script>
