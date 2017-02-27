<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<link rel="stylesheet" href="${staticRoot}/css/index.css" type="text/css" />
<link rel="stylesheet" href="${staticRoot}/css/style.css" type="text/css" />

<div class="section">
    <div class="section-header">
        <h4>我的信息</h4>
    </div>
    <div class="section-main">
        <div class="plr30 ptb30">
            <div class="c-position-r pb10 c-border-b">
                <span class="c-f16 c-333">基本信息</span>
                <a href="javascript:;" class="c-position-a btn btn-s btnEdit"><i class="iconfont">&#xe60a;</i>编辑</a>
            </div>
            <ul class="form mt20">
                <li class="error">
                    <label class="form-label">姓名</label>
                    <div class="form-group">
                        <div class="form-val" ms-controller="doctor" ><input ms-duplex="info.realName" /></div>
                    </div>
                </li>
                <li>
                    <label class="form-label">性别</label>
                    <div class="form-group">
                        <div class="form-val" ms-controller="doctor" ><input ms-duplex="toGender(info.gender)" /></div>
                    </div>
                </li>
                <li>
                    <label class="form-label">手机</label>
                    <div class="form-group">
                        <div class="form-val" ms-controller="doctor" ><input readonly="readonly" ms-duplex="info.telephone" /></div>
                    </div>
                </li>
                <li>
                    <label class="form-label">邮箱</label>
                    <div class="form-group">
                        <div class="form-val" ms-controller="doctor" ><input ms-duplex="info.email" /></div>
                    </div>
                </li>
                <li>
                    <label class="form-label">生日</label>
                    <div class="form-group">
                        <div class="form-val" ms-controller="doctor" ><input ms-duplex="info.birthday" /></div>
                    </div>
                </li>
                <li>
                    <label class="form-label">地区</label>
                    <div class="form-group">
                        <div class="form-val" ms-controller="doctor" ><input ms-duplex="info.privilege" /></div>
                    </div>
                </li>
            </ul>
            <div class="c-position-r pb10 c-border-b">
                <span class="c-f16 c-333">所属组织</span>
            </div>
            <ul class="form mt20">
                <li><label class="form-label">名称</label><div class="form-group"> <div class="form-val" ms-controller="doctor" ><input ms-duplex="info.organization" /></div></div></li>
                <li><label class="form-label">部门</label><div class="form-group"> <div class="form-val" ms-controller="doctor" ><input ms-duplex="info.org_post" /></div></div></li>
                <li><label class="form-label">职务</label><div class="form-group"> <div class="form-val" ms-controller="doctor" ><input ms-duplex="info.tech_title" /></div></div></li>
            </ul>
        </div>
    </div>
</div>

