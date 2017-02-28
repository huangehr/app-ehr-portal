<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<link rel="stylesheet" type="text/css" href="${staticRoot}/css/index_work.css">
<link rel="stylesheet" href="${staticRoot}/css/index.css" type="text/css" />
<link rel="stylesheet" href="${staticRoot}/css/style.css" type="text/css" />
<div class="p10 clearfix">
    <div class="index-work-left c-position-f">
        <div class="index-left-scroll c-hidden bgc-fff"  >
            <div class="people-info bgc-f9f9f9 p20 clearfix" data-im="mine">
                <div class="head-pic c-border c-images-cycle fl c-hidden"><img src="${staticRoot}/images/bg.jpg" class="c-images-block" /> </div>
                <div class="head-info c-line-h1 c-555 c-f14 fl ml25">
                    <p> <div class="form-val" ms-controller="doctor" ><input ms-duplex="doctor.realName" /></div></p>
                    <p class="c-nowrap" title="外科"><div class="form-val" ms-controller="doctor" ><input ms-duplex="doctor.orgPost" /></div></p>
                    <p class="c-nowrap" title="主任医师"> <div class="form-val" ms-controller="doctor" ><input ms-duplex="doctor.userTypeName" /></div></p>
                </div>
            </div>
            <div  class="sidebar-menu plr30 c-f14 c-hidden"   >
                <ul class="pb50" id="app-main" >
                    <li>
                        <a href="#" nav="01" name="个人信息" data-src="/system/home"> 个人信息 <s class="c-arrow c-arrow-r"><s></s></s></a>
                    </li>
                    <li>
                        <a href="#" nav="01" name="修改密码" data-src="/system/home"> 修改密码 <s class="c-arrow c-arrow-r"><s></s></s></a>
                    </li>
                    <li>
                        <a href="#" nav="01" name="意见反馈" data-src="/system/home"> 意见反馈 <s class="c-arrow c-arrow-r"><s></s></s></a>
                    </li>
                </ul>
            </div>
        </div>


    </div>
    <div class="c-hidden index-work-right" style="height: 860px" >
        <div class="index-todo c-panel c-panel-white mb10" style="height: 100%" >
            <div >
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
                                    <div class="form-val" ms-controller="doctor" ><input  type="text" placeholder="请输入姓名" class="input-text"  ms-duplex="doctor.realName" /></div>
                                </div>
                            </li>
                            <li>
                                <label class="form-label">性别</label>
                                <div class="form-group">
                                    <div id="cat1" class="cus-sel">
                                        <div class="cus-sel-chosed">
                                            <input type="text" style="display:none;">
                                            <span data-value="" class="cus-sel-chosed-txt">-请选择-</span>
                                            <span class="jselect-icon"><i class="iconfont">&#xe60f;</i></span>
                                        </div>
                                        <div class="cus-sel-list">
                                            <ul>
                                                <li><a data-value="1" href="javascript:;">男</a></li>
                                                <li><a data-value="2" href="javascript:;">女</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li><label class="form-label">手机</label><div class="form-group"><div class="form-val" ms-controller="doctor" ><input type="text" class="input-text"  ms-duplex="doctor.telephone" /></div></div></li>
                            <li><label class="form-label">邮箱</label><div class="form-group"><div class="form-val" ms-controller="doctor" ><input type="text" class="input-text" ms-duplex="doctor.email" /></div></div></li>
                            <li>
                                <label class="form-label">生日</label>
                                <div class="form-group c-position-r">
                                    <input type="text" class="input-text" name="registerDate" id="registerDate" value="" readonly />
                                    <i class="iconfont icon-date">&#xe615;</i>
                                </div>
                            </li>
                            <li><label class="form-label">地区</label><div class="form-group"><input type="text" class="input-text" /></div></li>
                            <li>
                                <label class="form-label">地区</label>
                                <div class="form-group">
                                    <div id="cat3" class="fl cus-sel cus-sel-w135 mr10">
                                        <div class="cus-sel-chosed">
                                            <input type="text" style="display:none;">
                                            <span data-value="" class="cus-sel-chosed-txt">-请选择-</span>
                                            <span class="jselect-icon"><i class="iconfont">&#xe60f;</i></span>
                                        </div>
                                        <div class="cus-sel-list" style="display: none;">
                                            <ul>
                                                <li><a data-value="1" href="javascript:;">预约挂号类1</a></li>
                                                <li><a data-value="2" href="javascript:;">预约挂号类2</a></li>
                                                <li><a data-value="3" href="javascript:;">预约挂号类3</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div id="cat2" class="fl cus-sel cus-sel-w135">
                                        <div class="cus-sel-chosed">
                                            <input type="text" style="display:none;">
                                            <span data-value="" class="cus-sel-chosed-txt">-请选择-</span>
                                            <span class="jselect-icon"><i class="iconfont">&#xe60f;</i></span>
                                        </div>
                                        <div class="cus-sel-list" style="display: none;">
                                            <ul>
                                                <li><a data-value="1" href="javascript:;">预约挂号类1</a></li>
                                                <li><a data-value="2" href="javascript:;">预约挂号类2</a></li>
                                                <li><a data-value="3" href="javascript:;">预约挂号类3</a></li>
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
                            <li><label class="form-label">名称</label><div class="form-group"> <div class="form-val" ms-controller="doctor" ><input ms-duplex="doctor.organization" /></div></div></li>
                            <li><label class="form-label">部门</label><div class="form-group"> <div class="form-val" ms-controller="doctor" ><input ms-duplex="doctor.org_post" /></div></div></li>
                            <li><label class="form-label">职务</label><div class="form-group"> <div class="form-val" ms-controller="doctor" ><input ms-duplex="doctor.tech_title" /></div></div></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

