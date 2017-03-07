<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<link rel="stylesheet" href="${staticRoot}/css/style.css" type="text/css" />
<%--<link rel="stylesheet" href="${staticRoot}/css/index.css" type="text/css" />--%>

<div class="section"  ms-controller="doctor">
                <div class="section-header">
                    <h4>我的信息</h4>
                </div>
                <div >
                    <div class="plr30 ptb30">
                        <div class="c-position-r pb10 c-border-b">
                            <span class="c-f16 c-333">基本信息</span>
                            <input type="button" class="c-position-a btn btn-s btnSaveEdit" value="保存" />
                        </div>
                        <ul class="form mt20">
                            <li>
                                <label class="form-label">姓名</label>
                                <div class="form-group">
                                    <div class="form-val"  ><input  type="text" placeholder="请输入姓名" class="input-text"  ms-duplex="doctor.realName" /></div>
                                </div>
                            </li>
                            <li>
                                <label class="form-label">性别</label>
                                <div class="form-group" >
                                    <div id="cat1" class="cus-sel" >
                                        <div class="cus-sel-chosed">
                                            <input type="text" style="display:none;" ms-data-value="doctor.gender" id="gender">
                                            <span ms-data-value="doctor.gender" > <input readonly="readonly" ms-duplex="doctor.gender==''?'-请选择-':toGender(doctor.gender)" /> </span>
                                            <span class="jselect-icon"><i class="iconfont"></i></span>
                                        </div>
                                        <div class="cus-sel-list">
                                            <ul>
                                                <li><a ms-repeat-el ="genderArr" ms-duplex="el.value"  ms-data-value="el.value" href="javascript:;">{{el.text}}</a></li>
                                            </ul>
                                        </div>
                                        <%--<select class="cus-sel" ms-duplex="doctor.gender" >--%>
                                            <%--<option ms-repeat-el ="genderArr" ms-duplex="el.value" >{{el.text}}</option>--%>
                                        <%--</select>--%>
                                    </div>
                                </div>
                            </li>

                            <li><label class="form-label">手机</label><div class="form-group"><div class="form-val"  ><input type="text" class="input-text"  ms-duplex="doctor.telephone" /></div></div></li>
                            <li><label class="form-label">邮箱</label><div class="form-group"><div class="form-val"  ><input type="text" class="input-text" ms-duplex="doctor.email" /></div></div></li>
                            <li>
                                <label class="form-label">生日</label>
                                <div class="form-group c-position-r">
                                    <input type="text" class="input-text" name="registerDate" id="registerDate"  ms-duplex="doctor.birthday"  readonly />
                                    <i class="iconfont icon-date">&#xe615;</i>
                                </div>
                            </li>
                            <li>
                                <label class="form-label">地区</label>
                                <div class="form-group" >
                                    <div id="cat2" class="fl cus-sel cus-sel-w135 mr10"  ms-controller="provinces">
                                        <div class="cus-sel-chosed" >
                                            <input type="text" style="display:none;"  id="province">
                                            <span  class="cus-sel-chosed-txt"><input readonly="readonly"/></span>
                                            <span class="jselect-icon"><i class="iconfont"></i></span>
                                        </div>
                                        <div class="cus-sel-list" style="display: none;">
                                            <ul>
                                            </ul>
                                        </div>
                                    </div>
                                    <div id="cat3" class="fl cus-sel cus-sel-w135" >
                                        <div class="cus-sel-chosed" >
                                            <input type="text" style="display:none;"  id="city">
                                            <span  class="cus-sel-chosed-txt"><input readonly="readonly"  /></span>
                                            <span class="jselect-icon"><i class="iconfont"></i></span>
                                        </div>
                                        <div class="cus-sel-list" style="display: none;" >
                                            <ul>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>

                        </ul>
                        <div class="c-position-r pb10 c-border-b">
                            <span class="c-f16 c-333">所属组织</span>
                        </div>
                        <ul class="form mt20">
                            <li><label class="form-label">名称</label><div class="form-group"> <div class="form-val"  ><input readonly="readonly" ms-duplex="doctor.organization" /></div></div></li>
                            <li><label class="form-label">部门</label><div class="form-group"> <div class="form-val"  ><input readonly="readonly" ms-duplex="doctor.org_post" /></div></div></li>
                            <li><label class="form-label">职务</label><div class="form-group"> <div class="form-val"  ><input readonly="readonly" ms-duplex="doctor.tech_title" /></div></div></li>
                        </ul>
                    </div>
                </div>
            </div>


