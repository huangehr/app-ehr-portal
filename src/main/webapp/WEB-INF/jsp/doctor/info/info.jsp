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
                            <input type="button" id="editBtn" class="c-position-a btn btn-s btnSaveEdit" value="编辑" />
                        </div>
                        <ul class="form mt20">
                            <li>
                                <label class="form-label">姓名</label>
                                <div class="">
                                    <div class="form-val"  ><input id="realName" type="text" placeholder="请输入姓名" class="input-text input-text-disabled"  disabled="disabled"  ms-duplex="doctor.realName" /></div>
                                </div>
                            </li>
                            <li>
                                <label class="form-label">性别</label>
                                <div class="form-group" >
                                    <div id="cat1" class="fl cus-sel cus-sel-w135 disabled" >
                                        <div class="cus-sel-chosed" >
                                            <input type="text" style="display:none;" id="gender" ms-data-value="doctor.gender" ms-duplex="doctor.gender">
                                            <span  class="cus-sel-chosed-txt" ms-data-value="doctor.gender" ><input ms-duplex="doctor.gender" readonly="readonly"  /></span>
                                            <span class="jselect-icon"><i class="iconfont"></i></span>
                                        </div>
                                        <div class="cus-sel-list" style="display: none;" >
                                            <ul>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </li>

                            <li><label class="form-label">手机</label>
                                <div class="form-group">
                                    <div class=""  >
                                        <input type="text" id="telephone" class="input-text input-text-disabled" disabled="disabled"  ms-duplex="doctor.telephone" />
                                    </div>
                                </div>
                            </li>
                            <li><label class="form-label">邮箱</label>
                                <div class="">
                                    <div class="form-val"  >
                                        <input type="text" id="email" class="input-text input-text-disabled" disabled="disabled"  ms-duplex="doctor.email" />
                                    </div>
                                </div>
                            </li>
                            <li>
                                <label class="form-label">生日</label>
                                <div class="form-group c-position-r">
                                    <input type="text" class="input-text" disabled="disabled" name="registerDate" id="registerDate"  ms-duplex="doctor.birthday"  />
                                    <i class="iconfont icon-date">&#xe615;</i>
                                </div>
                            </li>
                            <li>
                                <label class="form-label">地区</label>
                                <div class="form-group" >
                                    <div id="cat2" class="fl cus-sel cus-sel-w135 mr10 disabled" >
                                        <div class="cus-sel-chosed" >
                                            <input type="text" style="display:none;"  id="province"  ms-duplex="doctor.provinceId" ms-data-value="doctor.provinceId">
                                            <span  class="cus-sel-chosed-txt" ms-data-value="doctor.provinceId"><input ms-duplex="doctor.provinceId"  readonly="readonly"/></span>
                                            <span class="jselect-icon"><i class="iconfont"></i></span>
                                        </div>
                                        <div class="cus-sel-list" style="display: none;">
                                            <ul>
                                            </ul>
                                        </div>
                                    </div>
                                    <div id="cat3" class="fl cus-sel cus-sel-w135 disabled" >
                                        <div class="cus-sel-chosed" >
                                            <input type="text" style="display:none;" id="city" ms-data-value="doctor.cityId" ms-duplex="doctor.cityId">
                                            <span  class="cus-sel-chosed-txt" ms-data-value="doctor.cityId" ><input ms-duplex="doctor.cityId" readonly="readonly"  /></span>
                                            <span class="jselect-icon"><i class="iconfont"></i></span>
                                        </div>
                                        <div class="cus-sel-list" style="display: none;" >
                                            <ul>
                                            </ul>
                                        </div>
                                    </div>
                                    <div id="cat4" class="fl cus-sel cus-sel-w135 disabled" >
                                        <div class="cus-sel-chosed" >
                                            <input type="text" style="display:none;" id="area" ms-data-value="doctor.areaId" ms-duplex="doctor.areaId">
                                            <span  class="cus-sel-chosed-txt" ms-data-value="doctor.areaId" ><input ms-duplex="doctor.areaId" readonly="readonly"  /></span>
                                            <span class="jselect-icon"><i class="iconfont"></i></span>
                                        </div>
                                        <div class="cus-sel-list" style="display: none;" >
                                            <ul>
                                            </ul>
                                        </div>
                                    </div>
                                    <div id="cat5" class="fl cus-sel cus-sel-w135 disabled" >
                                        <div class="cus-sel-chosed" >
                                            <input type="text" id="street" ms-data-value="doctor.street" ms-duplex="doctor.street" readonly>
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


