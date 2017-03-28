<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<link rel="stylesheet" type="text/css" href="${staticRoot}/css/index_work.css">

<div class="p10 clearfix" ms-controller="doctor" >
    <div class="index-work-left c-position-f">
        <div class="index-left-scroll c-hidden bgc-fff">
            <div class="people-info bgc-f9f9f9 p20 clearfix" data-im="mine">
                <div class="head-pic c-border c-images-cycle fl c-hidden"><img src="${staticRoot}/images/bg.jpg" class="c-images-block" /> </div>
                <div class="head-info c-line-h1 c-555 c-f14 fl ml25">
                    <p> <div class="form-val"  ><input ms-duplex="doctor.realName" /></div></p>
                    <p class="c-nowrap" title="外科"><div class="form-val"  ><input ms-duplex="doctor.orgPost" /></div></p>
                    <p class="c-nowrap" title="主任医师"> <div class="form-val"  ><input ms-duplex="doctor.userTypeName" /></div></p>
                </div>
            </div>
            <div class="sidebar-menu plr30 c-f14 c-hidden" ms-controller="apps" >
                <ul class="pb50" id="app-main" >
                    <%--<li>
                        <a href="#" nav="02" name="总支撑平台" data-src="http://192.168.1.221:8080/ehr/index" type="2"><img src="${staticRoot}/images/app_1.png" class="img-gray" /> 总支撑平台 <s class="c-arrow c-arrow-r"><s></s></s></a>
                    </li>
                    <li>
                        <a href="#" nav="03" name="ESB系统" data-src="http://172.19.103.67:8080/esb/jkzl/indexPage" type="2"><img src="${staticRoot}/images/app_1.png" class="img-gray" /> ESB系统 <s class="c-arrow c-arrow-r"><s></s></s></a>
                    </li>--%>
                    <%-- 应用列表 --%>
                    <li ms-repeat-el ="apps">
                        <a href="#" ms-attr-nav="el.appId" ms-attr-name="el.appName" ms-data-src="el.linkUrl"   type="2">
                            <img src="${staticRoot}/images/app_1.png" class="img-gray" />
                            {{el.appName}}
                            <s class="c-arrow c-arrow-r"><s></s></s>
                        </a>
                    </li>

                </ul>
            </div>
        </div>


        <a href="javascript:;" class="add-app-btn c-block width-100 c-position-a bgc-f9f9f9 c-t-center c-f14 c-333"><i class="iconfont c-909090">&#xe693;</i> 管理应用</a>



        <!--<div class="sidebar-box bgc-fff mt20">
            <div class="sidebar-box-hd c-border-b c-position-r clearfix plr20 ptb10">
                <h2 class="c-f16 c-bold">左侧通用</h2>
            </div>
            <div class="sidebar-box-bd c-position-r p15">

            </div>
        </div>-->

    </div>
    <div class="c-hidden index-work-right">
        <div class="index-todo c-panel c-panel-white mb10">
            <div class="c-panel-hd clearfix">
                <div class="title fl"><h2 class="c-f14">待办事项</h2></div>
            </div>
            <div class="c-panel-bd">
                <div class="index-todo-list plr20 c-hidden">
                    <ul class="todo-lists">
                        <%--<li>--%>
                            <%--<a href="#" class="clearfix ptb15">--%>
                                <%--<div class="c-row c-split">--%>
                                    <%--<div class="c-10 c-t-center"><i class="iconfont c-ff8100 c-f16">&#xe692;</i></div>--%>
                                    <%--<div class="c-80 c-line-h1">--%>
                                        <%--<span class="c-333 c-f14 c-border-r pr20 mr10 c-bold">健康知识</span>--%>
                                        <%--<span class="c-333 c-f14 c-border-r pr20 mr10 c-bold">健康知识</span>--%>
                                        <%--<span class="c-333 c-bold">长沙市第一医院与社区简历电子化转诊申请的通知</span>--%>
                                        <%--<span class="c-badge c-badge-danger c-round ml10">New</span>--%>
                                    <%--</div>--%>
                                    <%--<div class="c-10 c-555">--%>
                                        <%--2016.3.15--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#" class="clearfix ptb15">--%>
                                <%--<div class="c-row c-split">--%>
                                    <%--<div class="c-10 c-t-center"><i class="iconfont c-ff8100 c-f16">&#xe692;</i></div>--%>
                                    <%--<div class="c-80 c-line-h1">--%>
                                        <%--<span class="c-333 c-f14 c-border-r pr20 mr10 c-bold">健康知识</span>--%>
                                        <%--<span class="c-333 c-f14 c-border-r pr20 mr10 c-bold">健康知识</span>--%>
                                        <%--<span class="c-333 c-bold">长沙市第一医院与社区简历电子化转诊申请的通知</span>--%>
                                        <%--<span class="c-badge c-badge-danger c-round ml10">New</span>--%>
                                    <%--</div>--%>
                                    <%--<div class="c-10 c-555">--%>
                                        <%--2016.3.15--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#" class="clearfix ptb15">--%>
                                <%--<div class="c-row c-split">--%>
                                    <%--<div class="c-10 c-t-center"><i class="iconfont c-ff8100 c-f16">&#xe692;</i></div>--%>
                                    <%--<div class="c-80 c-line-h1">--%>
                                        <%--<span class="c-909090 c-f14 c-border-r pr20 mr10">健康知识</span>--%>
                                        <%--<span class="c-909090 c-f14 c-border-r pr20 mr10">健康知识</span>--%>
                                        <%--<span class="c-909090">长沙市第一医院与社区简历电子化转诊申请的通知</span>--%>
                                    <%--</div>--%>
                                    <%--<div class="c-10 c-555">--%>
                                        <%--2016.3.15--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#" class="clearfix ptb15">--%>
                                <%--<div class="c-row c-split">--%>
                                    <%--<div class="c-10 c-t-center"><i class="iconfont c-ff8100 c-f16">&#xe692;</i></div>--%>
                                    <%--<div class="c-80 c-line-h1">--%>
                                        <%--<span class="c-909090 c-f14 c-border-r pr20 mr10">健康知识</span>--%>
                                        <%--<span class="c-909090 c-f14 c-border-r pr20 mr10">健康知识</span>--%>
                                        <%--<span class="c-909090">长沙市第一医院与社区简历电子化转诊申请的通知</span>--%>
                                    <%--</div>--%>
                                    <%--<div class="c-10 c-555">--%>
                                        <%--2016.3.15--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#" class="clearfix ptb15">--%>
                                <%--<div class="c-row c-split">--%>
                                    <%--<div class="c-10 c-t-center"><i class="iconfont c-ff8100 c-f16">&#xe692;</i></div>--%>
                                    <%--<div class="c-80 c-line-h1">--%>
                                        <%--<span class="c-909090 c-f14 c-border-r pr20 mr10">健康知识</span>--%>
                                        <%--<span class="c-909090 c-f14 c-border-r pr20 mr10">健康知识</span>--%>
                                        <%--<span class="c-909090">长沙市第一医院与社区简历电子化转诊申请的通知</span>--%>
                                    <%--</div>--%>
                                    <%--<div class="c-10 c-555">--%>
                                        <%--2016.3.15--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#" class="clearfix ptb15">--%>
                                <%--<div class="c-row c-split">--%>
                                    <%--<div class="c-10 c-t-center"><i class="iconfont c-ff8100 c-f16">&#xe692;</i></div>--%>
                                    <%--<div class="c-80 c-line-h1">--%>
                                        <%--<span class="c-909090 c-f14 c-border-r pr20 mr10">健康知识</span>--%>
                                        <%--<span class="c-909090 c-f14 c-border-r pr20 mr10">健康知识</span>--%>
                                        <%--<span class="c-909090">长沙市第一医院与社区简历电子化转诊申请的通知</span>--%>
                                    <%--</div>--%>
                                    <%--<div class="c-10 c-555">--%>
                                        <%--2016.3.15--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#" class="clearfix ptb15">--%>
                                <%--<div class="c-row c-split">--%>
                                    <%--<div class="c-10 c-t-center"><i class="iconfont c-ff8100 c-f16">&#xe692;</i></div>--%>
                                    <%--<div class="c-80 c-line-h1">--%>
                                        <%--<span class="c-909090 c-f14 c-border-r pr20 mr10">健康知识</span>--%>
                                        <%--<span class="c-909090 c-f14 c-border-r pr20 mr10">健康知识</span>--%>
                                        <%--<span class="c-909090">长沙市第一医院与社区简历电子化转诊申请的通知</span>--%>
                                    <%--</div>--%>
                                    <%--<div class="c-10 c-555">--%>
                                        <%--2016.3.15--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li>--%>
                            <%--<a href="#" class="clearfix ptb15">--%>
                                <%--<div class="c-row c-split">--%>
                                    <%--<div class="c-10 c-t-center"><i class="iconfont c-ff8100 c-f16">&#xe692;</i></div>--%>
                                    <%--<div class="c-80 c-line-h1">--%>
                                        <%--<span class="c-909090 c-f14 c-border-r pr20 mr10">健康知识</span>--%>
                                        <%--<span class="c-909090 c-f14 c-border-r pr20 mr10">健康知识</span>--%>
                                        <%--<span class="c-909090">长沙市第一医院与社区简历电子化转诊申请的通知</span>--%>
                                    <%--</div>--%>
                                    <%--<div class="c-10 c-555">--%>
                                        <%--2016.3.15--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                        <%--<li class="last">--%>
                            <%--<a href="#" class="clearfix ptb15">--%>
                                <%--<div class="c-row c-split">--%>
                                    <%--<div class="c-10 c-t-center"><i class="iconfont c-ff8100 c-f16">&#xe692;</i></div>--%>
                                    <%--<div class="c-80 c-line-h1">--%>
                                        <%--<span class="c-909090 c-f14 c-border-r pr20 mr10">健康知识</span>--%>
                                        <%--<span class="c-909090 c-f14 c-border-r pr20 mr10">健康知识</span>--%>
                                        <%--<span class="c-909090">长沙市第一医院与社区简历电子化转诊申请的通知</span>--%>
                                    <%--</div>--%>
                                    <%--<div class="c-10 c-555">--%>
                                        <%--2016.3.15--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</a>--%>
                        <%--</li>--%>
                    </ul>
                </div>
            </div>
        </div>
        <%--<div class="index-todo c-panel c-panel-white mb10">--%>
            <%--<div class="c-panel-hd clearfix">--%>
                <%--<div class="title fl"><h2 class="c-f14">代办事项</h2></div>--%>
            <%--</div>--%>
            <%--<div class="c-panel-bd">--%>
                <%--<div class="index-todo-nodata c-t-center ptb20 c-909090">--%>
                    <%--<i class="iconfont c-f28">&#xe645;</i>--%>
                    <%--<p class="c-f14 pt5">暂时没有待办事项~</p>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <div class="bgc-fff c-t-center">
            <a href="javascript:;" class="c-555 c-f14 add-module-btn"><i class="iconfont">&#xe68b;</i> 自定义窗口</a>
        </div>

        <%--<div class="c-panel c-panel-white mt10">--%>
            <%--<div class="c-panel-hd clearfix">--%>
                <%--<div class="title fl"><h2 class="c-f14">小薇社区</h2></div>--%>
                <%--<div class="tools fr c-hide">--%>
                    <%--<a href="javascript:;" data-toggle="panelSee" class="ml10"><i class="iconfont">&#xe68e;</i></a>--%>
                    <%--<a href="javascript:;" data-toggle="panelReload" class="ml10"><i class="iconfont">&#xe68a;</i></a>--%>
                    <%--<a href="javascript:;" data-toggle="panelCollapse" class="ml10"><i class="iconfont">&#xe60f;</i></a>--%>
                    <%--<a href="javascript:;" data-toggle="panelremove" class="ml10"><i class="iconfont">&#xe605;</i></a>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="c-panel-bd" style="height: 110px">--%>
                <%--<iframe frameborder="no" src="/doctor/demo/demo1" width="100%" height="100%"></iframe>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="c-panel c-panel-white mt10">--%>
            <%--<div class="c-panel-hd clearfix">--%>
                <%--<div class="title fl"><h2 class="c-f14">转诊助手</h2></div>--%>
                <%--<div class="tools fr c-hide">--%>
                    <%--<a href="javascript:;" data-toggle="panelSee" class="ml10"><i class="iconfont">&#xe68e;</i></a>--%>
                    <%--<a href="javascript:;" data-toggle="panelReload" class="ml10"><i class="iconfont">&#xe68a;</i></a>--%>
                    <%--<a href="javascript:;" data-toggle="panelCollapse" class="ml10"><i class="iconfont">&#xe60f;</i></a>--%>
                    <%--<a href="javascript:;" data-toggle="panelremove" class="ml10"><i class="iconfont">&#xe605;</i></a>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="c-panel-bd" style="height: 250px">--%>
                <%--<iframe frameborder="no" src="/doctor/demo/demo3" width="100%" height="100%"></iframe>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="c-panel c-panel-white mt10">--%>
            <%--<div class="c-panel-hd clearfix">--%>
                <%--<div class="title fl"><h2 class="c-f14">连接分析</h2></div>--%>
                <%--<div class="tools fr c-hide">--%>
                    <%--<a href="javascript:;" data-toggle="panelSee" class="ml10"><i class="iconfont">&#xe68e;</i></a>--%>
                    <%--<a href="javascript:;" data-toggle="panelReload" class="ml10"><i class="iconfont">&#xe68a;</i></a>--%>
                    <%--<a href="javascript:;" data-toggle="panelCollapse" class="ml10"><i class="iconfont">&#xe60f;</i></a>--%>
                    <%--<a href="javascript:;" data-toggle="panelremove" class="ml10"><i class="iconfont">&#xe605;</i></a>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="c-panel-bd" style="height: 440px">--%>
                <%--<iframe frameborder="no" src="/doctor/demo/demo2" width="100%" height="100%"></iframe>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="c-panel c-panel-white mt10">--%>
            <%--<div class="c-panel-hd clearfix">--%>
                <%--<div class="title fl"><h2 class="c-f14">默认面板</h2></div>--%>
                <%--<div class="tools fr c-hide">--%>
                    <%--<a href="javascript:;" data-toggle="panelSee" class="ml10"><i class="iconfont">&#xe68e;</i></a>--%>
                    <%--<a href="javascript:;" data-toggle="panelReload" class="ml10"><i class="iconfont">&#xe68a;</i></a>--%>
                    <%--<a href="javascript:;" data-toggle="panelCollapse" class="ml10"><i class="iconfont">&#xe60f;</i></a>--%>
                    <%--<a href="javascript:;" data-toggle="panelremove" class="ml10"><i class="iconfont">&#xe605;</i></a>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="c-panel-bd" style="height: 100px">--%>

            <%--</div>--%>
        <%--</div>--%>
    </div>
</div>
<div class="module-artdialog c-hide c-hidden">
    <ul>
        <li>
            <div class="clearfix plr20 ptb10">
                <div class="fl"><img src="${staticRoot}/images/app_1.png" class="app" /> </div>
                <div class="fl ml10 pt5">
                    <h2 class="c-bold c-f14">爱心诊室</h2>
                    <p class="c-909090">企业内容发布的公式消息或业务通告</p>
                </div>
                <div class="fr pt10">
                    <input class="switch-state" type="checkbox" checked>
                </div>
            </div>
        </li>
        <li>
            <div class="clearfix plr20 ptb10">
                <div class="fl"><img src="${staticRoot}/images/app_1.png" class="app" /> </div>
                <div class="fl ml10 pt5">
                    <h2 class="c-bold c-f14">爱心诊室</h2>
                    <p class="c-909090">企业内容发布的公式消息或业务通告</p>
                </div>
                <div class="fr pt10">
                    <input class="switch-state" type="checkbox">
                </div>
            </div>
        </li>
        <li>
            <div class="clearfix plr20 ptb10">
                <div class="fl"><img src="${staticRoot}/images/app_1.png" class="app" /> </div>
                <div class="fl ml10 pt5">
                    <h2 class="c-bold c-f14">爱心诊室</h2>
                    <p class="c-909090">企业内容发布的公式消息或业务通告</p>
                </div>
                <div class="fr pt10">
                    <input class="switch-state" type="checkbox" checked>
                </div>
            </div>
        </li>
        <li>
            <div class="clearfix plr20 ptb10">
                <div class="fl"><img src="${staticRoot}/images/app_1.png" class="app" /> </div>
                <div class="fl ml10 pt5">
                    <h2 class="c-bold c-f14">爱心诊室</h2>
                    <p class="c-909090">企业内容发布的公式消息或业务通告</p>
                </div>
                <div class="fr pt10">
                    <input class="switch-state" type="checkbox" checked>
                </div>
            </div>
        </li>
        <li>
            <div class="clearfix plr20 ptb10">
                <div class="fl"><img src="${staticRoot}/images/app_1.png" class="app" /> </div>
                <div class="fl ml10 pt5">
                    <h2 class="c-bold c-f14">爱心诊室</h2>
                    <p class="c-909090">企业内容发布的公式消息或业务通告</p>
                </div>
                <div class="fr pt10">
                    <input class="switch-state" type="checkbox" checked>
                </div>
            </div>
        </li>
        <li>
            <div class="clearfix plr20 ptb10">
                <div class="fl"><img src="${staticRoot}/images/app_1.png" class="app" /> </div>
                <div class="fl ml10 pt5">
                    <h2 class="c-bold c-f14">爱心诊室</h2>
                    <p class="c-909090">企业内容发布的公式消息或业务通告</p>
                </div>
                <div class="fr pt10">
                    <input class="switch-state" type="checkbox" checked>
                </div>
            </div>
        </li>
        <li>
            <div class="clearfix plr20 ptb10">
                <div class="fl"><img src="${staticRoot}/images/app_1.png" class="app" /> </div>
                <div class="fl ml10 pt5">
                    <h2 class="c-bold c-f14">爱心诊室</h2>
                    <p class="c-909090">企业内容发布的公式消息或业务通告</p>
                </div>
                <div class="fr pt10">
                    <input class="switch-state" type="checkbox">
                </div>
            </div>
        </li>
    </ul>
</div>
<div class="c-position-f app-dialog-wrap p20 c-hide">
    <div class="c-panel c-panel-white">
        <div class="c-panel-hd">
            <div class="title"><h2 class="c-f14"><i class="iconfont">&#xe68b;</i> 管理您的应用</h2></div>
        </div>
        <div class="c-panel-bd app-dialog-box plr20 ptb30">

            <div class="app-box-hd c-border-b c-position-r mb30">
                <span class="c-position-a border-radius-pill ptb5 plr15 c-666">已添加的应用</span>
            </div>

            <div class="app-box-bd">
                <ul class="clearfix">
                    <li>
                        <div data-title="爱心诊室" data-info="企业内容发布的公式消息或业务通告" data-btn="show" class="c-t-center">
                            <img src="${staticRoot}/images/group_hea.png">
                            <span>1满意度调查</span>
                        </div>
                    </li>
                    <li>
                        <div data-title="爱心诊室" data-info="企业内容发布的公式消息或业务通告" data-btn="hide" class="c-t-center">
                            <img src="${staticRoot}/images/group_hea.png">
                            <span>1满意度调查</span>
                        </div>
                    </li>
                    <li>
                        <div data-title="爱心诊室" data-info="企业内容发布的公式消息或业务通告" data-btn="add" class="c-t-center">
                            <img src="${staticRoot}/images/group_hea.png">
                            <span>1满意度调查</span>
                        </div>
                    </li>
                    <li>
                        <div data-title="爱心诊室" data-info="企业内容发布的公式消息或业务通告" data-btn="del" class="c-t-center">
                            <img src="${staticRoot}/images/group_hea.png">
                            <span>1满意度调查</span>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="app-box-hd ptb30 c-position-r">
                <div class="app-box-hd c-border-b">
                    <span class="c-position-a border-radius-pill ptb5 plr15 c-666">未添加的应用</span>
                </div>
            </div>
            <div class="app-box-bd">
                <ul class="clearfix">
                    <li>
                        <div data-title="爱心诊室" data-info="企业内容发布的公式消息或业务通告" data-btn="show" class="c-t-center gray">
                            <img src="${staticRoot}/images/group_hea.png">
                            <span>1满意度调查</span>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="bgc-fff c-position-f app-dialog-btn ptb10 c-border-t c-t-center">
        <a href="javascript:;" class="c-btn c-btn-blue ml10" id="">确 定</a>
        <a href="javascript:;" class="c-btn c-btn-white ml10" id="add-app-cancel">取 消</a>
    </div>
</div>
<!--poshytipbox-->
<div id="poshytip-box" class="c-hide">
    <h2 id="poshytipTitle" class="c-bold"></h2>
    <div id="poshytipInfo" class="ptb10"></div>
    <div class="c-border-t pt10" id="poshytipBtn"></div>
</div>
<!--Feedback-->
<div id="feedback-box" class="c-t-center">
    <a href="#" class="pt10 c-block">
        <i class="iconfont c-f28 c-fff">&#xe645;</i>
        <span class="c-block c-fff">意见反馈</span>
    </a>
</div>


<script type="text/html" id="dotoTmp">
    <li>
        <a href="javascript:void(0);" class="clearfix ptb15" name="待办事项" data-src="{{workUri}}" data-id="{{id}}">
            <div class="c-row c-split">
                <div class="c-10 c-t-center"><i class="iconfont c-ff8100 c-f16">&#xe692;</i></div>
                <div class="c-80 c-line-h1">
                    <span class="{{todoClass}} c-f14 c-border-r pr20 mr10">{{appName}}</span>
                    <span class="{{todoClass}} c-f14 c-border-r pr20 mr10">{{toUserName}}</span>
                    <span class="{{todoClass}}">{{content}}</span>
                    {{new}}
                </div>
                <div class="c-10 c-555">
                    {{createDate}}
                </div>
            </div>
        </a>
    </li>
</script>
<script type="text/html" id="portalTmp">
    <div class="c-panel c-panel-white mt10">
        <div class="c-panel-hd clearfix">
            <div class="title fl"><h2 class="c-f14">{{columnName}}</h2></div>
            <div class="tools fr">
                <a href="javascript:;" data-toggle="panelSee" class="ml10"><i class="iconfont">&#xe68e;</i></a>
                <a href="javascript:;" data-toggle="panelReload" class="ml10"><i class="iconfont">&#xe68a;</i></a>
                <a href="javascript:;" data-toggle="panelCollapse" class="ml10"><i class="iconfont">&#xe60f;</i></a>
                <a href="javascript:;" data-toggle="panelremove" class="ml10"><i class="iconfont">&#xe605;</i></a>
            </div>
        </div>
        <div class="c-panel-bd" style="height: 440px">
            <iframe frameborder="no" src="{{columnUri}}" width="100%" height="100%"></iframe>
        </div>
    </div>
</script>
