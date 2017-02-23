<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>


<link rel="stylesheet" type="text/css" href="${staticRoot}/cross/css/cross.ui.css"/>
<link rel="stylesheet" type="text/css" href="${staticRoot}/css/app_login.layout.css"/>


<div class="login-wrap">
    <div class="login clearfix c-hidden" style="margin-top:65px;">
        <div class="signin-area">
            <h4 class="input_login_text dyna_text">健康之路无边界系统</h4>
            <div class="signin-area-bg dyna_area_bg" id="login-pass">
                <div class="padder">
                    <div class="input_boxer clearfix">
                        <span class="fl mr10"><i class="iconfont">&#xe60c;</i></span>
                        <input type="text" placeholder="请输入邮箱/手机号/帐号" />
                    </div>
                    <div class="input_boxer clearfix mt20 mb10">
                        <span class="fl mr10"><i class="iconfont">&#xe60d;</i></span>
                        <input type="password" placeholder="请输入密码（区分大小写）" />
                    </div>
                    <div class="remember_password clearfix mb15">
                        <a href="javascript:;" class="dyna_switch fl" id="switch-pass"><i class="iconfont mr5">&#xe698;</i>短信快捷登陆</a>
                        <a href="javascript:;" class="fr c-f12" id="forget-password">忘记密码？</a>
                    </div>
                    <div class="sign-input_a">
                        <a href="javascript:;" class="c-btn-3fd0a7 c-btn-full c-btn-rounded">登陆</a>
                    </div>
                </div>
            </div>
            <div class="signin-area-bg dyna_area_bg" id="login-dyna" style="display:none;">
                <div class="padder">
                    <div class="input_boxer clearfix">
                        <span class="fl mr10"><i class="iconfont">&#xe60c;</i></span>
                        <input type="text" placeholder="请输入邮箱/手机号/帐号" />
                    </div>
                    <div class="input_boxer input_boxer_dyna clearfix mt20 mb10">
                        <span class="fl mr10 mt7"><i class="iconfont">&#xe60d;</i></span>
                        <input type="password" class="dyna_pass" placeholder="动态密码" />
                        <span class="dyna_send"><a href="javascript:;">发送动态密码</a></span>
                    </div>
                    <div class="remember_password clearfix mb15">
                        <a href="javascript:;" class="dyna_switch" id="switch-dyna"><i class="iconfont mr5">&#xe697;</i>账号密码登陆</a>
                    </div>
                    <div class="sign-input_a">
                        <a href="javascript:;" class="c-btn-3fd0a7 c-btn-full c-btn-rounded">登陆</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="news_boxer dyna_boxer fl">
            <div class="tit c-nowrap"><i class="iconfont mr5">&#xe627;</i>未检测到匹配的信息，请您完善医生信息</div>
            <div class="dyna_mess">
                <a href="#">
                    <img src="${staticRoot}/images/dyna_doc.png" alt="" width="100" height="100" />
                    <p class="mt10">点击完善医生信息</p>
                </a>
            </div>
        </div>
    </div>
    <div class="footer">
        <div>
            <a href="http://sqgl.yihu.cn/ApplicationUi/wbj2/login/login.html" target="_parent">首页</a> <i>丨</i>
            <a href="http://sqgl.yihu.cn/ApplicationUi/wbj2/login/wgw-intro.html" target="_parent">应用</a> <i>丨</i>
            <a href="http://sqgl.yihu.cn/ApplicationUi/wbj2/login/partners.html" target="_parent">伙伴</a> <i>丨</i>
            <a href="http://sqgl.yihu.cn/ApplicationUi/wbj2/login/news-list.html" target="_parent">公告</a> <i>丨</i>
            <a href="http://sqgl.yihu.cn/ApplicationUi/wbj2/login/download-client.html" target="_parent">客户端</a> <i>丨</i>
            <a href="http://sqgl.yihu.cn/ApplicationUi/wbj2/login/reg-step.html" target="_parent">注册</a> <i>丨</i>
            <a href="http://sqgl.yihu.cn/ApplicationUi/wbj2/login/aboutus.html" target="_parent">关于我们</a> <i>丨</i>
            <a href="http://sqgl.yihu.cn/ApplicationUi/wbj2/login/agreement.html" target="_parent">服务协议</a> <i>丨</i>
            <a href="http://sqgl.yihu.cn/ApplicationUi/wbj2/login/contactus.html" target="_parent">联系我们</a> <i>丨</i>
            <a href="http://y.yihu.cn/WbjUI/wbj2/login/login.html?f=1" target="_parent">返回旧版</a>
        </div>
        <div class="mt5">
            ©健康之路 专业就诊服务机构 版权所有 B2-20110196(全网) 闽B2-20090074 闽ICP备05019666
            <!--
            <span>Copyright © 2013 Yihu.com, All Rights Reserved.</span>北京健康之路众康信息技术有限公司  版权所有<br>
            <span>增值电信业务经营许可证：B2-20110196(全网) 闽B2-20090074 闽ICP备05019666号</span>
             -->
        </div>
    </div>
</div>

<div class="forget-password-box" style="display:none">
    <table class="form">
        <tr>
            <td>登陆名：</td>
            <td><input type="text" class="input-text" value="" /></td>
        </tr>
        <tr>
            <td>验证码：</td>
            <td><input type="text" class="input-text code" value="" /> <span class="code-btn"><a href="javascript:;">获取验证码</a></span></td>
        </tr>
        <tr>
            <td>新密码：</td>
            <td><input type="text" class="input-text" value="" /></td>
        </tr>
        <tr>
            <td>确认新密码：</td>
            <td><input type="text" class="input-text"  value="" /></td>
        </tr>
    </table>
</div>