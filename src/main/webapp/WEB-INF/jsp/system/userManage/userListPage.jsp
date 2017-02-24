<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>


<!-- ####### 页面部分 ####### -->
<div class="m-content">
    <!-- ####### 查询条件部分 ####### -->

    <form class="m-form-inline">
        <div class="m-form-group">
            <label style="width: 80px;">任务选择：</label>
            <div class="m-form-control">
                <input type="text" id="inp_search" placeholder="请输入类别名称"/>
            </div>
            <div class="m-form-control right">
                <div id="btnEditJob" class="l-button" >
                    <span>任务编辑</span>
                </div>
            </div>
            <div class="m-form-control right">
                <div id="btnRepeatJob" class="l-button" >
                    <span>任务补采</span>
                </div>
            </div>
            <div class="m-form-control right">
                <div id="btnSave" class="l-button">
                    <span>保存</span>
                </div>
            </div>
        </div>
    </form>
    <!--######数据源信息表######-->
    <div id="div_grid" ></div>
</div>