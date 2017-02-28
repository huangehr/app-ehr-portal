<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>


<link rel="stylesheet" href="${staticRoot}/css/lobby-admin.css">

<div>
    <div class="add-aside">
        <div class="aside-block">
            <p class="c-f14 c-909090 mt10 ml10">
                <i class="iconfont c-f90 c-bold">&#xe6b9;</i>
                点击鼠标右键维护部门信息
            </p>
            <!-- 树结构在此 -->
            <div class="">
                <ul id="ztreesolidarrow" class="ztree ztree-slack ztree-solid-arrow"></ul>
            </div>
        </div>
        <div class="main" id="main">
            <!--右侧 内容部分 -->
            <div class="ptb15 plr20 c-border-b c-position-r clearfix">
                <h2 class="fl c-333 c-f18 mr20">门诊办</h2>
                <a href="javascript:;" class="fl c-btn c-btn-white c-btn-tiny mr10">添加人员</a>
                <div class="fr">
                    <div class="input-search c-position-r">
                        <input type="text" class="search" placeholder="关键词">
								<span class="search-btn c-position-a">
									<i class="iconfont">&#xe610;</i>
								</span>
                    </div>
                </div>
            </div>

            <div class="tabs tabs-two c-position-r mt20 ml20" data-toggle="tabs">
                <div class="tabs-hd clearfix">
                    <a href="javascript:;" class="curr">
                        <span>成员列表</span>
                    </a>
                    <a href="javascript:;">
                        <span>待确认成员</span>
                    </a>
                </div>
                <div class="tabs-bd">
                    <div class="pb20 pt10 tabs-bd-box c-hide curr">
                        <p class="c-f90 mb10">如果硬要在这份需要加一个附加条件，我希望是一份中文api</p>
                        <table id="memberDataTable" class="dataTable-skin1 hover c-t-center" cellspacing="0" width="100%">
                            <thead>
                            <tr>
                                <th class="c-t-center">姓名</th>
                                <th class="c-t-center">职务</th>
                                <th class="c-t-center">部门</th>
                                <th class="c-t-center">手机</th>
                                <th class="c-t-center">登入帐号</th>
                                <th class="c-t-center">邮箱</th>
                                <th class="c-t-center">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>陈建华</td>
                                <td>主任</td>
                                <td>外科</td>
                                <td>15949565123</td>
                                <td>15949565123</td>
                                <td>674059309@qq.com</td>
                                <td>
                                    <a class="alinks alinks-blue ml10" href="javascript:;">编辑</a>
                                    <a class="alinks alinks-blue ml10 tbbtnDel" href="javascript:;">删除</a>
                                    <a class="alinks alinks-blue ml10 btn-edit-bm" href="javascript:;">设置部门</a>
                                </td>
                            </tr>
                            <tr>
                                <td>陈建华</td>
                                <td>主任</td>
                                <td>外科</td>
                                <td>15949565123</td>
                                <td>15949565123</td>
                                <td>674059309@qq.com</td>
                                <td>
                                    <a class="alinks alinks-blue ml10" href="javascript:;">编辑</a>
                                    <a class="alinks alinks-blue ml10 tbbtnDel" href="javascript:;">删除</a>
                                    <a class="alinks alinks-blue ml10 btn-edit-bm" href="javascript:;">设置部门</a>
                                </td>
                            </tr>
                            <tr>
                                <td>陈建华</td>
                                <td>主任</td>
                                <td>外科</td>
                                <td>15949565123</td>
                                <td>15949565123</td>
                                <td>674059309@qq.com</td>
                                <td>
                                    <a class="alinks alinks-blue ml10" href="javascript:;">编辑</a>
                                    <a class="alinks alinks-blue ml10 tbbtnDel" href="javascript:;">删除</a>
                                    <a class="alinks alinks-blue ml10 btn-edit-bm" href="javascript:;">设置部门</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="pb20 pt10 tabs-bd-box c-hide">
                        <table id="memberDataTable-wait" class="dataTable-skin1 hover c-t-center" cellspacing="0" width="100%">
                            <thead>
                            <tr>
                                <th class="c-t-center">姓名</th>
                                <th class="c-t-center">职务</th>
                                <th class="c-t-center">部门</th>
                                <th class="c-t-center">手机</th>
                                <th class="c-t-center">登入帐号</th>
                                <th class="c-t-center">邮箱</th>
                                <th class="c-t-center">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>陈建华</td>
                                <td class="c-position-r btn-info">
                                    主任<i class="iconfont c-cursor-p c-f12 ml5">&#xe6b2;</i>
                                </td>
                                <td class="c-position-r btn-info">外科<i class="iconfont c-cursor-p c-f12 ml5">&#xe6b2;</i></td>
                                <td>15949565123</td>
                                <td>
                                    15949565123
                                    <span class="c-badge c-badge-warning c-radius ml10">待确认</span>
                                </td>
                                <td>674059309@qq.com</td>
                                <td>
                                    <a class="alinks alinks-blue ml10" href="javascript:;">编辑</a>
                                    <a class="alinks alinks-blue ml10 tbbtnDel" href="#">删除</a>
                                    <a class="alinks alinks-blue ml10 btn-edit-bm" href="javascript:;">设置部门</a>
                                </td>
                            </tr>
                            <tr>
                                <td>陈建华</td>
                                <td>主任</td>
                                <td>外科</td>
                                <td>15949565123</td>
                                <td>
                                    15949565123
                                    <a class="alinks alinks-blue ml10 btn-again-post" href="javascript:;">重新邀请</a>
                                </td>
                                <td>674059309@qq.com</td>
                                <td>
                                    <a class="alinks alinks-blue ml10" href="javascript:;">编辑</a>
                                    <a class="alinks alinks-blue ml10 tbbtnDel" href="#">删除</a>
                                    <a class="alinks alinks-blue ml10 btn-edit-bm" href="javascript:;">设置部门</a>
                                </td>
                            </tr>
                            <tr>
                                <td>陈建华</td>
                                <td class="c-position-r btn-info">
                                    主任<i class="iconfont c-cursor-p c-f12 ml5">&#xe6b2;</i>
                                </td>
                                <td class="c-position-r btn-info">外科<i class="iconfont c-cursor-p c-f12 ml5">&#xe6b2;</i></td>
                                <td>15949565123</td>
                                <td>
                                    15949565123
                                    <span class="c-badge c-badge-warning c-radius ml10">待确认</span>
                                </td>
                                <td>674059309@qq.com</td>
                                <td>
                                    <a class="alinks alinks-blue ml10" href="javascript:;">编辑</a>
                                    <a class="alinks alinks-blue ml10 tbbtnDel" href="#">删除</a>
                                    <a class="alinks alinks-blue ml10 btn-edit-bm" href="javascript:;">设置部门</a>
                                </td>
                            </tr>
                            <tr>
                                <td>陈建华</td>
                                <td>主任</td>
                                <td>外科</td>
                                <td>15949565123</td>
                                <td>
                                    15949565123
                                    <a class="alinks alinks-blue ml10 btn-again-post" href="javascript:;">重新邀请</a>
                                </td>
                                <td>674059309@qq.com</td>
                                <td>
                                    <a class="alinks alinks-blue ml10" href="javascript:;">编辑</a>
                                    <a class="alinks alinks-blue ml10 tbbtnDel" href="#">删除</a>
                                    <a class="alinks alinks-blue ml10 btn-edit-bm" href="javascript:;">设置部门</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div id="rMenu">
            <ul>
                <li onclick="addTreeNode();" id="m_add">添加子部门</li>
                <li onclick="editNode();" id="m_reset">修改名称</li>
                <li onclick="removeTreeNode();" id="m_del">删除</li>
                <li onclick="moveUpTreeNode();" id="m_reset">上移</li>
                <li onclick="moveDownTreeNode();" id="m_reset">下移</li>
            </ul>
        </div>
    </div>

    <!-- 修改主职弹窗 开始 -->
    <div class="edit-zw-pop c-hide">
        <p class="c-f16 c-333 ptb5">
            <i class="iconfont mr5 c-f90 c-bold">&#xe620;</i>小俊俊
        </p>
        <div class="max-h-300">
            <table class="tb tb-b width-100 c-t-center" data-toggle="tbHover">
                <thead>
                <tr>
                    <th class="c-33">部门</th>
                    <th class="c-33">职务</th>
                    <th class="c-33">职务类型</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>儿科</td>
                    <td>副院长</td>
                    <td>
                        <label class="radio demo-radio-elem checked">
                            <input type="radio" name="group" checked="checked"> <i class="icon-radio"></i>
                            主职
                        </label>
                    </td>
                </tr>
                <tr>
                    <td>儿科</td>
                    <td>副院长</td>
                    <td>
                        <label class="radio demo-radio-elem">
                            <input type="radio" name="group"> <i class="icon-radio"></i>
                            主职
                        </label>
                    </td>
                </tr>
                <tr>
                    <td>儿科</td>
                    <td>副院长</td>
                    <td>
                        <label class="radio demo-radio-elem">
                            <input type="radio" name="group"> <i class="icon-radio"></i>
                            主职
                        </label>
                    </td>
                </tr>
                <tr>
                    <td>儿科</td>
                    <td>副院长</td>
                    <td>
                        <label class="radio demo-radio-elem checked">
                            <input type="radio" name="group" checked="checked"> <i class="icon-radio"></i>
                            主职
                        </label>
                    </td>
                </tr>
                <tr>
                    <td>儿科</td>
                    <td>副院长</td>
                    <td>
                        <label class="radio demo-radio-elem">
                            <input type="radio" name="group"> <i class="icon-radio"></i>
                            主职
                        </label>
                    </td>
                </tr>
                <tr>
                    <td>儿科</td>
                    <td>副院长</td>
                    <td>
                        <label class="radio demo-radio-elem">
                            <input type="radio" name="group"> <i class="icon-radio"></i>
                            主职
                        </label>
                    </td>
                </tr>
                <tr>
                    <td>儿科</td>
                    <td>副院长</td>
                    <td>
                        <label class="radio demo-radio-elem checked">
                            <input type="radio" name="group" checked="checked"> <i class="icon-radio"></i>
                            主职
                        </label>
                    </td>
                </tr>
                <tr>
                    <td>儿科</td>
                    <td>副院长</td>
                    <td>
                        <label class="radio demo-radio-elem">
                            <input type="radio" name="group"> <i class="icon-radio"></i>
                            主职
                        </label>
                    </td>
                </tr>
                <tr>
                    <td>儿科</td>
                    <td>副院长</td>
                    <td>
                        <label class="radio demo-radio-elem">
                            <input type="radio" name="group"> <i class="icon-radio"></i>
                            主职
                        </label>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!-- 修改主职弹窗 结束 -->

    <!-- 设置部门弹窗 开始 -->
    <div class="edit-bm-pop c-hide">
        <p class="c-f16 c-333">
            <i class="iconfont mr5 c-f90 c-bold">&#xe620;</i>小俊俊
            <a class="alinks alinks-blue fr c-f14" href="#">没找到相关职务，点此添加</a>
        </p>
        <div class="mt10">
            <table id="edit-bm" class="tb c-t-center dataTable dataTable-skin1" data-toggle="tbHover">
                <thead>
                <tr>
                    <th class="c-20"> <em class="c-f60">*</em>
                        部门
                    </th>
                    <th class="c-20"> <em class="c-f60">*</em>
                        职务
                    </th>
                    <th class="c-20">职务类型</th>
                    <th class="c-20">
                        <em class="c-f60">*</em>
                        身份
                    </th>
                    <th class="c-20">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>儿科</td>
                    <td>管理员</td>
                    <td>
                        <label class="radio demo-radio-elem checked">
                            <input type="radio" name="group" checked="checked"> <i class="icon-radio"></i>
                            主职
                        </label>
                    </td>
                    <td>负责人</td>
                    <td>
                        <a class="alinks alinks-blue" href="javascript:;">删除</a>
                    </td>
                </tr>
                <tr>
                    <td>儿科</td>
                    <td>管理员</td>
                    <td>
                        <label class="radio demo-radio-elem">
                            <input type="radio" name="group"> <i class="icon-radio"></i>
                            主职
                        </label>
                    </td>
                    <td>负责人</td>
                    <td>
                        <a class="alinks alinks-blue" href="javascript:;">删除</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a class="c-btn-tiny c-btn-blue managechoo" href="javascript:;">添加</a>
                    </td>
                    <td>
                        <select id="Select-zw" class="c-search-select-w125"></select>
                    </td>
                    <td>
                        <label class="radio demo-radio-elem">
                            <input type="radio" name="group">
                            <i class="icon-radio"></i>
                            主职
                        </label>
                    </td>
                    <td>
                        <div class="cus-sel cus-sel-w125 cus-sel-h33" data-toggle="formSelect">
                            <div class="cus-sel-chosed">
                                <input type="text" class="c-hide">
                                <span class="cus-sel-chosed-txt" data-value="">-选择身份-</span>
                                <span class="jselect-icon"></span>
                            </div>
                            <div class="cus-sel-list c-hide">
                                <ul>
                                    <li>
                                        <a href="javascript:;" data-value="1">男</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;" data-value="2">女</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </td>
                    <td>
                        <a class="alinks alinks-blue" href="javascript:;">添加</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!-- 设置部门弹窗 结束 -->
</div>