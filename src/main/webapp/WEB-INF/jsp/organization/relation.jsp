<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>


<link rel="stylesheet" href="${staticRoot}/css/lobby-admin.css">

<div>
    <div class="add-aside">
        <div class="aside-block">
            <div class="pl35 pt20">
                <a class="alinks alinks-blue btn-top-person mb5" href="javascript:;">顶级人员管理</a>
                <div class="input-search c-position-r">
                    <input type="text" class="search" placeholder="关键词">
                    <span class="search-btn c-position-a">
                        <i class="iconfont"></i>
                    </span>
                </div>
            </div>
            <!-- 树结构在此 -->
            <div class="mt10">
                <ul id="ztreesolidarrow" class="ztree ztree-slack ztree-solid-arrow">
                </ul>
            </div>
        </div>
        <div class="main" id="main">
            <!--右侧 内容部分 -->
            <div class="p20">
                <div class="ptb15 plr20 c-border-b c-position-r clearfix">
                    <h2 class="fl c-333 c-f18 mr20">院长</h2>
                    <a href="javascript:;" class="fl c-btn c-btn-white c-btn-tiny mr10 btn-del-zw">新增下级</a>
                    <a href="javascript:;" class="fl c-btn c-btn-white c-btn-tiny mr10 btn-edit-zw">新增上级</a>
                </div>
                <div class="ptb20">
                    <table class="dataTable dataTable-skin1 hover c-t-center" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th class="c-t-center">直属上级</th>
                            <th class="c-t-center">工号</th>
                            <th class="c-t-center">手机</th>
                            <th class="c-t-center">主部门</th>
                            <th class="c-t-center">主职</th>
                            <th class="c-t-center">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>陈建11111华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        <tr>
                            <td>陈3333建华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        <tr>
                            <td>陈建华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        <tr>
                            <td>陈建华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        <tr>
                            <td>陈7777建华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        <tr>
                            <td>陈建华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        <tr>
                            <td>陈建华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        <tr>
                            <td>陈建华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        <tr>
                            <td>陈建华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        <tr>
                            <td>陈建华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        <tr>
                            <td>陈建22222华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="ptb20" id="memberTab">
                    <table id="memberDataTablexj" class="dataTable-skin1 hover c-t-center" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th class="c-t-center">直属下级</th>
                            <th class="c-t-center">工号</th>
                            <th class="c-t-center">手机</th>
                            <th class="c-t-center">主部门</th>
                            <th class="c-t-center">主职</th>
                            <th class="c-t-center">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>陈建11111华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        <tr>
                            <td>陈3333建华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        <tr>
                            <td>陈建华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        <tr>
                            <td>陈建华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        <tr>
                            <td>陈7777建华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        <tr>
                            <td>陈建华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        <tr>
                            <td>陈建华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        <tr>
                            <td>陈建华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        <tr>
                            <td>陈建华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        <tr>
                            <td>陈建华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        <tr>
                            <td>陈建22222华</td>
                            <td>123</td>
                            <td>15900000000</td>
                            <td>1</td>
                            <td>主任医师</td>
                            <td><a href="javascript:;" class="c-007cd9 tbbtnDel">删除</a></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- 顶级人员管理弹窗 开始 -->
    <div class="top-level-person-pop c-hide">
        <div>
            请选择要设为顶级的成员：
            <a href="javascript:;" class="c-btn-green c-btn-tiny">添加</a>
        </div>
        <div class="mt20 max-h-300">
            <table class="tb tb-b c-t-center width-100" data-toggle="tbHover">
                <thead>
                <tr>
                    <th class="c-25">姓名</th>
                    <th class="c-25">主部门</th>
                    <th class="c-25">主职</th>
                    <th class="c-25">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>小小俊</td>
                    <td></td>
                    <td></td>
                    <td>
                        <a class="alinks alinks-blue ml10" href="#">删除</a>
                    </td>
                </tr>
                <tr>
                    <td>小小俊</td>
                    <td></td>
                    <td></td>
                    <td>
                        <a class="alinks alinks-blue ml10" href="#">删除</a>
                    </td>
                </tr>
                <tr>
                    <td>小小俊</td>
                    <td></td>
                    <td></td>
                    <td>
                        <a class="alinks alinks-blue ml10" href="#">删除</a>
                    </td>
                </tr>
                <tr>
                    <td>小小俊</td>
                    <td></td>
                    <td></td>
                    <td>
                        <a class="alinks alinks-blue ml10" href="#">删除</a>
                    </td>
                </tr>
                <tr>
                    <td>小小俊</td>
                    <td></td>
                    <td></td>
                    <td>
                        <a class="alinks alinks-blue ml10" href="#">删除</a>
                    </td>
                </tr>
                <tr>
                    <td>小小俊</td>
                    <td></td>
                    <td></td>
                    <td>
                        <a class="alinks alinks-blue ml10" href="#">删除</a>
                    </td>
                </tr>
                <tr>
                    <td>小小俊</td>
                    <td></td>
                    <td></td>
                    <td>
                        <a class="alinks alinks-blue ml10" href="#">删除</a>
                    </td>
                </tr>
                <tr>
                    <td>小小俊</td>
                    <td></td>
                    <td></td>
                    <td>
                        <a class="alinks alinks-blue ml10" href="#">删除</a>
                    </td>
                </tr>
                <tr>
                    <td>小小俊</td>
                    <td></td>
                    <td></td>
                    <td>
                        <a class="alinks alinks-blue ml10" href="#">删除</a>
                    </td>
                </tr>
                <tr>
                    <td>小小俊</td>
                    <td></td>
                    <td></td>
                    <td>
                        <a class="alinks alinks-blue ml10" href="#">删除</a>
                    </td>
                </tr>
                <tr>
                    <td>小小俊</td>
                    <td></td>
                    <td></td>
                    <td>
                        <a class="alinks alinks-blue ml10" href="#">删除</a>
                    </td>
                </tr>
                <tr>
                    <td>小小俊</td>
                    <td></td>
                    <td></td>
                    <td>
                        <a class="alinks alinks-blue ml10" href="#">删除</a>
                    </td>
                </tr>
                </tbody>
            </table>
            <dl class="mt20 c-f14 c-666">
                <dt>备注:</dt>
                <dd>1、设置为顶级人员，无法再添加上级；</dd>
                <dd>2、删除顶级人员须保证该人员下面无下级。</dd>
            </dl>
        </div>
    </div>
    <!-- 顶级人员管理弹窗 结束 -->

</div>

