<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>


<link rel="stylesheet" type="text/css" href="${staticRoot}/css/login.css">
<link rel="stylesheet" type="text/css" href="${staticRoot}/widget/artDialog/4.1.7/css/artDialog.min.css">

<div class="l-body">
    <div class="l-header">
        <h2 class="l-l">医疗云平台</h2>
        <ul class="l-s">
            <%--<li><a href="${contextRoot}/login">登录</a></li>--%>
            <li><a href="${contextRoot}/doctor/resource">下载中心</a></li>
        </ul>
    </div>
    <div class="l-main">
        <div class="l-form">
            <ul class="l-tab">
                <li class="l-t-item"><a href="javascript:;" class="l-active">医生</a></li>
                <li class="l-t-item"><a href="javascript:;">管理</a></li>
            </ul>
            <div class="l-f-c">
                <div class="l-f-tit">欢迎使用医疗云平台系统</div>
                <div><label class="l-f-icon i-an" for="lUAn"></label><input id="lUAn" class="l-f-input" type="text" placeholder="请输入账号"/></div>
                <div><label class="l-f-icon i-pwd" for="lUPwd"></label><input id="lUPwd" class="l-f-input" type="password" placeholder="请输入密码"/></div>
                <div>
                    <label class="l-f-radio f-r-d" for="lR"><input id="lR" class="r-d" type="checkbox" /></label>
                    <span class="f-p">记住密码</span>
                    <a class="f-l"  href="javascript:;">忘记密码？</a>
                </div>
                <div><input class="l-btn doc-btn" type="button" value="登录"/></div>
                <%--<div class="l-f-footer">还没有账号？<a href="javascript:;">立即注册</a></div>--%>
            </div>
            <div class="l-f-c" style="display: none">
                <div class="l-f-tit">欢迎使用医疗云平台系统</div>
                <div><label class="l-f-icon i-an" for="lUAnO"></label><input id="lUAnO" class="l-f-input" type="text" placeholder="请输入账号"/></div>
                <div><label class="l-f-icon i-pwd" for="lUPwdO"></label><input id="lUPwdO" class="l-f-input" type="password" placeholder="请输入密码"/></div>
                <div>
                    <label class="l-f-radio f-r-m" for="lRO"><input id="lRO" class="r-m" type="checkbox" /></label>
                    <span class="f-p">记住密码</span>
                    <a class="f-l" href="javascript:;">忘记密码？</a>
                </div>
                <div><input class="l-btn man-btn" type="button" value="登录"/></div>
                <%--<div class="l-f-footer">还没有账号？<a href="javascript:;">立即注册</a></div>--%>
            </div>
        </div>
    </div>
    <p class="l-footer">
        ©健康之路 专业就诊服务机构 版权所有 B2-20110196(全网) 闽B2-20090074 闽ICP备05019666
    </p>
</div>

<%--<link rel="stylesheet" type="text/css" href="${staticRoot}/css/app_login.layout.css"/>--%>


<%--<div class="login-wrap">--%>
    <%--<div class="login clearfix c-hidden" style="margin-top:65px;">--%>
        <%--<div class="signin-area">--%>
            <%--<h4 class="input_login_text dyna_text">健康之路无边界系统</h4>--%>
            <%--<div class="signin-area-bg dyna_area_bg" id="login-pass">--%>
                <%--<div class="padder">--%>
                    <%--<div class="input_boxer clearfix">--%>
                        <%--<span class="fl mr10"><i class="iconfont">&#xe60c;</i></span>--%>
                        <%--<input id="user-name" type="text" placeholder="请输入邮箱/手机号/帐号" />--%>
                    <%--</div>--%>
                    <%--<div class="input_boxer clearfix mt20 mb10">--%>
                        <%--<span class="fl mr10"><i class="iconfont">&#xe60d;</i></span>--%>
                        <%--<input id="password" type="password" placeholder="请输入密码（区分大小写）" />--%>
                    <%--</div>--%>
                    <%--&lt;%&ndash;<div class="remember_password clearfix mb15">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<a href="javascript:;" class="dyna_switch fl" id="switch-pass"><i class="iconfont mr5">&#xe698;</i>短信快捷登陆</a>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<a href="javascript:;" class="fr c-f12" id="forget-password">忘记密码？</a>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--<div class="sign-input_a">--%>
                        <%--<a class="c-btn-3fd0a7 c-btn-full c-btn-rounded" id="btn-login">登陆</a>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--&lt;%&ndash;<div class="signin-area-bg dyna_area_bg" id="login-dyna" style="display:none;">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class="padder">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="input_boxer clearfix">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<span class="fl mr10"><i class="iconfont">&#xe60c;</i></span>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<input type="text" placeholder="请输入邮箱/手机号/帐号" />&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="input_boxer input_boxer_dyna clearfix mt20 mb10">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<span class="fl mr10 mt7"><i class="iconfont">&#xe60d;</i></span>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<input type="password" class="dyna_pass" placeholder="动态密码" />&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<span class="dyna_send"><a href="javascript:;">发送动态密码</a></span>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="remember_password clearfix mb15">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<a href="javascript:;" class="dyna_switch" id="switch-dyna"><i class="iconfont mr5">&#xe697;</i>账号密码登陆</a>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="sign-input_a">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<a href="javascript:;" class="c-btn-3fd0a7 c-btn-full c-btn-rounded">登陆</a>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--</div>--%>
        <%--<div class="news_boxer dyna_boxer fl">--%>
            <%--<div class="tit c-nowrap"><i class="iconfont mr5">&#xe627;</i>未检测到匹配的信息，请您完善医生信息</div>--%>
            <%--<div class="dyna_mess">--%>
                <%--<a href="#">--%>
                    <%--<img src="${staticRoot}/images/dyna_doc.png" alt="" width="100" height="100" />--%>
                    <%--<p class="mt10">点击完善医生信息</p>--%>
                <%--</a>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="footer">--%>
        <%--<div>--%>
            <%--<a href="http://sqgl.yihu.cn/ApplicationUi/wbj2/login/login.html" target="_parent">首页</a> <i>丨</i>--%>
            <%--<a href="http://sqgl.yihu.cn/ApplicationUi/wbj2/login/wgw-intro.html" target="_parent">应用</a> <i>丨</i>--%>
            <%--<a href="http://sqgl.yihu.cn/ApplicationUi/wbj2/login/partners.html" target="_parent">伙伴</a> <i>丨</i>--%>
            <%--<a href="http://sqgl.yihu.cn/ApplicationUi/wbj2/login/news-list.html" target="_parent">公告</a> <i>丨</i>--%>
            <%--<a href="http://sqgl.yihu.cn/ApplicationUi/wbj2/login/download-client.html" target="_parent">客户端</a> <i>丨</i>--%>
            <%--<a href="http://sqgl.yihu.cn/ApplicationUi/wbj2/login/reg-step.html" target="_parent">注册</a> <i>丨</i>--%>
            <%--<a href="http://sqgl.yihu.cn/ApplicationUi/wbj2/login/aboutus.html" target="_parent">关于我们</a> <i>丨</i>--%>
            <%--<a href="http://sqgl.yihu.cn/ApplicationUi/wbj2/login/agreement.html" target="_parent">服务协议</a> <i>丨</i>--%>
            <%--<a href="http://sqgl.yihu.cn/ApplicationUi/wbj2/login/contactus.html" target="_parent">联系我们</a> <i>丨</i>--%>
            <%--<a href="http://y.yihu.cn/WbjUI/wbj2/login/login.html?f=1" target="_parent">返回旧版</a>--%>
        <%--</div>--%>
        <%--<div class="mt5">--%>
            <%--©健康之路 专业就诊服务机构 版权所有 B2-20110196(全网) 闽B2-20090074 闽ICP备05019666--%>
            <%--<!----%>
            <%--<span>Copyright © 2013 Yihu.com, All Rights Reserved.</span>北京健康之路众康信息技术有限公司  版权所有<br>--%>
            <%--<span>增值电信业务经营许可证：B2-20110196(全网) 闽B2-20090074 闽ICP备05019666号</span>--%>
             <%---->--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<%--<div class="forget-password-box" >--%>
    <%--<table class="form">--%>
        <%--<tr>--%>
            <%--<td>登陆名：</td>--%>
            <%--<td><input type="text" class="input-text" value="" /></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>验证码：</td>--%>
            <%--<td><input type="text" class="input-text code" value="" /> <span class="code-btn"><a href="javascript:;">获取验证码</a></span></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>新密码：</td>--%>
            <%--<td><input type="text" class="input-text" value="" /></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>确认新密码：</td>--%>
            <%--<td><input type="text" class="input-text"  value="" /></td>--%>
        <%--</tr>--%>
    <%--</table>--%>
<%--</div>--%>