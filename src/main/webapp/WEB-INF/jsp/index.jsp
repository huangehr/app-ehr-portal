<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<link rel="stylesheet" href="${staticRoot}/css/index.css" type="text/css" />

<div class="header-wrap clearfix c-position-r">
    <div class="header-logo plr20 fl">
        <h1 class="c-f20 c-fff" style="line-height:40px">健康之路</h1>
    </div>

    <%-- 切换机构菜单按钮 --%>
    <div class="header-menu fl">
        <span class="header-menu-arrow pl15 c-fff c-f14" data-menu='header'><i class="iconfont c-f14 mr5">&#xe657;</i>切换机构</span>
        <div class="header-menu-bg c-position-f c-position-all c-hide"></div>
        <div class="header-menu-box c-position-a">
            <ul class="clearfix">
                <li><a href="#"><img src="${staticRoot}/images/index_bg.jpg"/> <span>健康之路</span></a></li>
            </ul>
        </div>
    </div>

    <%-- 头部右侧按钮 --%>
    <div class="header-feature fr">
        <ul class="clearfix">
            <li><a href="#" class="im-mine" data-im="mine"><i class="iconfont">&#xe60b;</i> 个人中心</a></li>
            <li><span class="vertical-line">|</span></li>
            <li><a href="#" class="im-derail" data-im="apply"><i class="iconfont">&#xe68c;</i> 我的应用</a></li>
            <li><span class="vertical-line">|</span></li>
            <li><a href="#" class="im-tidings" data-im="tidings"><i class="iconfont">&#xe606;</i><em>5</em> 我的消息</a></li>
            <li><span class="vertical-line">|</span></li>
            <li><a href="#"><i class="iconfont">&#xe68d;</i> 安全退出</a></li>
        </ul>
    </div>
</div>

<%--右侧个人面板机构切换--%>
<div class="message-box-wrap c-position-a c-hide">
    <div class="message-box">
        <div class="message-box-hd">
            <s class="message-box-arrow message-box-t"><s></s></s>
        </div>
        <div class="message-box-bd bgc-fff">
            <ul>
                <li><a href="#"><span class="c-nowrap">广州军区福建总院广州军区福建总院广州军区福建总院</span> <span class="un">5</span></a></li>
                <li><a href="#"><span class="c-nowrap">健康之路</span> <span class="un">5</span></a></li>
                <li><a href="#"><span class="c-nowrap">福建医科大学附属第一医院</span> <span class="un">5</span></a></li>
                <li><a href="#"><span class="c-nowrap">福建省卫生厅泉州总工会</span> <span class="un">15</span></a></li>
            </ul>
        </div>
    </div>
</div>
<%--首页主菜单按钮--%>
<div class="iframe-menu c-position-r">
    <div class="c-position-a iframe-menu-list width-100" data-left="0">
        <ul class="clearfix" id="nav-main">
            <li><a href="#" nav="home" class="curr" onclick="indexPage.focusNav(this)"><span class="c-nowrap">首页</span></a></li>
        </ul>
    </div>
    <div class="c-position-a iframe-menu-btn">
        <a href="javascript:;" class="prev"><i class="iconfont">&#xe61c;</i></a><a href="javascript:;" class="next"><i class="iconfont">&#xe608;</i></a>
    </div>
    <div class="iframe-menu-mouse c-position-a c-hide">
        <ul>
            <li><a href="javascript:;">关闭标签页</a></li>
            <li><a href="javascript:;">关闭其他标签页</a></li>
        </ul>
    </div>
</div>
<div class="boss-im c-position-a">
    <div class="boss-im-box c-position-a">
        <div class="boss-im-header">
            <div class="im-my">
                <div class="im-my-head c-position-a"><a href="#"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></a></div>
                <div class="im-my-info c-position-a c-fff">
                    <h2 class="c-f22">管理员</h2>
                    <div class="im-my-organize"><a href="javascript:;"><span class="c-nowrap">福建健康之路</span> <s class="ui-arrow ui-arrow-b"><s></s></s></a></div>

                </div>
            </div>
            <div class="im-organize-list c-position-a bgc-fff c-hidden c-hide">
                <ul>
                    <li><a href="#"><span class="c-nowrap">广州军区福建总院广州军区福建总院广州军区福建总院</span> <span class="un">5</span></a></li>
                    <li><a href="#"><span class="c-nowrap">健康之路</span> <span class="un">5</span></a></li>
                    <li><a href="#"><span class="c-nowrap">福建医科大学附属第一医院</span> <span class="un">5</span></a></li>
                    <li><a href="#"><span class="c-nowrap">福建省卫生厅泉州总工会</span> <span class="un">15</span></a></li>
                </ul>
            </div>
        </div>
        <div class="boss-im-search c-position-r">
            <div class="im-search-box c-fff c-f14">
                <input type="text" value="搜索..." data-im="search" />
                <div class="im-search-close c-555 c-position-a"><i class="iconfont">&#xe605;</i></div>
                <div class="im-search-btn c-555 c-position-a"><i class="iconfont">&#xe610;</i></div>
            </div>
        </div>
        <div class="boss-im-main c-position-r">
            <div class="im-main-box im-main-apps c-position-a width-100">
                <div class="apps-scroll im-apps pt20 plr5">
                    <ul>
                        <li>
                            <a href="#">
                                <div class="im-apps-logo"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block"></div>
                                <div class="im-apps-name">
                                    <p class="c-f14 c-333 im-apps-title"><span class="title c-nowrap">患者管理</span><span class="group">组织</span></p>
                                    <p class="c-nowrap c-f12 c-909090">预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的</p>
                                </div>
                                <div class="im-apps-add c-position-a">已添加</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="im-apps-logo"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block"></div>
                                <div class="im-apps-name">
                                    <p class="c-f14 c-333 im-apps-title"><span class="title c-nowrap">患者管理患者管理</span></p>
                                    <p class="c-nowrap c-f12 c-909090">预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的</p>
                                </div>
                                <div class="im-apps-add c-position-a">已添加</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="im-apps-logo"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block"></div>
                                <div class="im-apps-name">
                                    <p class="c-f14 c-333 im-apps-title"><span class="title c-nowrap">患者管理患者管理</span><span class="group">组织</span></p>
                                    <p class="c-nowrap c-f12 c-909090">预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="im-apps-logo"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block"></div>
                                <div class="im-apps-name">
                                    <p class="c-f14 c-333 im-apps-title"><span class="title c-nowrap">患者管理患者管理</span></p>
                                    <p class="c-nowrap c-f12 c-909090">预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="im-apps-logo"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block"></div>
                                <div class="im-apps-name">
                                    <p class="c-f14 c-333 im-apps-title"><span class="title c-nowrap">患者管理</span><span class="group">组织</span></p>
                                    <p class="c-nowrap c-f12 c-909090">预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的</p>
                                </div>
                                <div class="im-apps-add c-position-a">已添加</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="im-apps-logo"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block"></div>
                                <div class="im-apps-name">
                                    <p class="c-f14 c-333 im-apps-title"><span class="title c-nowrap">患者管理患者管理</span></p>
                                    <p class="c-nowrap c-f12 c-909090">预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的</p>
                                </div>
                                <div class="im-apps-add c-position-a">已添加</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="im-apps-logo"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block"></div>
                                <div class="im-apps-name">
                                    <p class="c-f14 c-333 im-apps-title"><span class="title c-nowrap">患者管理患者管理</span><span class="group">组织</span></p>
                                    <p class="c-nowrap c-f12 c-909090">预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="im-apps-logo"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block"></div>
                                <div class="im-apps-name">
                                    <p class="c-f14 c-333 im-apps-title"><span class="title c-nowrap">患者管理患者管理</span></p>
                                    <p class="c-nowrap c-f12 c-909090">预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="im-apps-logo"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block"></div>
                                <div class="im-apps-name">
                                    <p class="c-f14 c-333 im-apps-title"><span class="title c-nowrap">患者管理</span><span class="group">组织</span></p>
                                    <p class="c-nowrap c-f12 c-909090">预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的</p>
                                </div>
                                <div class="im-apps-add c-position-a">已添加</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="im-apps-logo"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block"></div>
                                <div class="im-apps-name">
                                    <p class="c-f14 c-333 im-apps-title"><span class="title c-nowrap">患者管理患者管理</span></p>
                                    <p class="c-nowrap c-f12 c-909090">预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的</p>
                                </div>
                                <div class="im-apps-add c-position-a">已添加</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="im-apps-logo"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block"></div>
                                <div class="im-apps-name">
                                    <p class="c-f14 c-333 im-apps-title"><span class="title c-nowrap">患者管理患者管理</span><span class="group">组织</span></p>
                                    <p class="c-nowrap c-f12 c-909090">预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="im-apps-logo"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block"></div>
                                <div class="im-apps-name">
                                    <p class="c-f14 c-333 im-apps-title"><span class="title c-nowrap">患者管理患者管理</span></p>
                                    <p class="c-nowrap c-f12 c-909090">预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的预览+管理患者，分享医生个人的</p>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="im-main-box im-main-mine c-position-a width-100">
                <div class="im-mine mine-scroll">
                    <ul>
                        <li>
                            <a href="#">
                                <div class="bg-50bfff border-radius-rounded im-mine-icon c-position-a"><i class="iconfont">&#xe620;</i></div>
                                <div class="im-mine-text c-nowrap c-f16">我的信息</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="bg-2bdac7 border-radius-rounded im-mine-icon c-position-a"><i class="iconfont">&#xe621;</i></div>
                                <div class="im-mine-text c-nowrap c-f16">修改密码</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="bg-7ad140 border-radius-rounded im-mine-icon c-position-a"><i class="iconfont">&#xe61f;</i></div>
                                <div class="im-mine-text c-nowrap c-f16">意见反馈</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="bg-ff707a border-radius-rounded im-mine-icon c-position-a"><i class="iconfont">&#xe624;</i></div>
                                <div class="im-mine-text c-nowrap c-f16">退出登录</div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="im-main-box im-main-search c-position-a width-100">
                <div class="ptb10 search-scroll">
                    <h2 class="c-909090 c-f14 ml10 mb20">好友/组织</h2>
                    <ul>
                        <li class="boss-user">
                            <a href="#">
                                <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                <div class="boss-user-name c-nowrap c-f14 c-333">一<em class="c-ff707a">群</em>老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊</div>
                            </a>
                        </li>
                        <li class="boss-user">
                            <a href="#">
                                <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                <div class="boss-user-name c-nowrap c-f14 c-333">一<em class="c-ff707a">群</em>老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊</div>
                            </a>
                        </li>
                        <li class="boss-user">
                            <a href="#">
                                <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                <div class="boss-user-name c-nowrap c-f14 c-333">一<em class="c-ff707a">群</em></div>
                            </a>
                        </li>
                        <li class="boss-user">
                            <a href="#">
                                <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                <div class="boss-user-name c-nowrap c-f14 c-333">一<em class="c-ff707a">群</em></div>
                            </a>
                        </li>
                        <li class="boss-user">
                            <a href="#">
                                <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                <div class="boss-user-name c-nowrap c-f14 c-333">刘超<em class="c-ff707a">群</em></div>
                            </a>
                        </li>
                        <li class="boss-user">
                            <a href="#">
                                <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                <div class="boss-user-name c-nowrap c-f14 c-333">一<em class="c-ff707a">群</em>老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊</div>
                            </a>
                        </li>
                        <li class="boss-user">
                            <a href="#">
                                <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                <div class="boss-user-name c-nowrap c-f14 c-333">一<em class="c-ff707a">群</em></div>
                            </a>
                        </li>
                        <li class="boss-user">
                            <a href="#">
                                <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                <div class="boss-user-name c-nowrap c-f14 c-333">一<em class="c-ff707a">群</em></div>
                            </a>
                        </li>
                        <li class="boss-user">
                            <a href="#">
                                <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                <div class="boss-user-name c-nowrap c-f14 c-333">刘超<em class="c-ff707a">群</em></div>
                            </a>
                        </li>
                    </ul>
                    <h2 class="c-909090 c-f14 ml10 mb20">群组</h2>
                    <ul>
                        <li class="boss-user">
                            <a href="#" class="curr">
                                <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                <div class="boss-user-name c-nowrap c-f14 c-333">一<em class="c-ff707a">群</em>老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊</div>
                            </a>
                        </li>
                        <li class="boss-user">
                            <a href="#">
                                <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                <div class="boss-user-name c-nowrap c-f14 c-333">一<em class="c-ff707a">群</em>老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊</div>
                            </a>
                        </li>
                        <li class="boss-user">
                            <a href="#">
                                <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                <div class="boss-user-name c-nowrap c-f14 c-333">一<em class="c-ff707a">群</em></div>
                            </a>
                        </li>
                        <li class="boss-user">
                            <a href="#">
                                <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                <div class="boss-user-name c-nowrap c-f14 c-333">一<em class="c-ff707a">群</em></div>
                            </a>
                        </li>
                        <li class="boss-user">
                            <a href="#">
                                <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                <div class="boss-user-name c-nowrap c-f14 c-333">刘超<em class="c-ff707a">群</em></div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="im-main-box im-main-tabs c-position-a width-100">
                <div class="im-menu tabs">
                    <div class="im-menu-bd tabs-bd c-position-r">
                        <div class="im-menu-box tabs-bd-box c-position-a width-100 curr">
                            <div class="c-position-a width-100">
                                <div class="tidings-scroll">
                                    <ul>
                                        <li class="boss-user">
                                            <a href="#">
                                                <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                                <div class="boss-user-name">
                                                    <p class="c-nowrap c-f14 c-333">验证消息</p>
                                                    <p class="c-nowrap c-f12 c-909090">阿萨请求加您为好友</p>
                                                </div>
                                                <div class="boss-user-time c-position-a">14:20</div>
                                                <div class="boss-user-number c-position-a">99</div>
                                            </a>
                                        </li>
                                        <li class="boss-user">
                                            <a href="#" class="curr">
                                                <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                                <div class="boss-user-name">
                                                    <p class="c-nowrap c-f14 c-333">验证消息</p>
                                                    <p class="c-nowrap c-f12 c-909090">阿萨请求加您为好友</p>
                                                </div>
                                                <div class="boss-user-time c-position-a">14:20</div>
                                                <div class="boss-user-number c-position-a">99</div>
                                            </a>
                                        </li>
                                        <li class="boss-user">
                                            <a href="#">
                                                <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                                <div class="boss-user-name">
                                                    <p class="c-nowrap c-f14 c-333">验证消息</p>
                                                    <p class="c-nowrap c-f12 c-909090">阿萨请求加您为好友</p>
                                                </div>
                                                <div class="boss-user-time c-position-a">14:20</div>
                                                <div class="boss-user-number c-position-a">99</div>
                                            </a>
                                        </li>
                                        <li class="boss-user">
                                            <a href="#">
                                                <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                                <div class="boss-user-name">
                                                    <p class="c-nowrap c-f14 c-333">验证消息</p>
                                                    <p class="c-nowrap c-f12 c-909090">阿萨请求加您为好友</p>
                                                </div>
                                                <div class="boss-user-time c-position-a">14:20</div>
                                                <div class="boss-user-number c-position-a">99</div>
                                            </a>
                                        </li>
                                        <li class="boss-user">
                                            <a href="#">
                                                <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                                <div class="boss-user-name">
                                                    <p class="c-nowrap c-f14 c-333">验证消息</p>
                                                    <p class="c-nowrap c-f12 c-909090">阿萨请求加您为好友</p>
                                                </div>
                                                <div class="boss-user-time c-position-a">14:20</div>
                                                <div class="boss-user-number c-position-a">99</div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="im-menu-box tabs-bd-box c-position-a width-100">
                            <div class="im-apply c-t-center mt30 apply-scroll">
                                <ul class="c-blocks-3">
                                    <li><a href="#"><span class="im-apply-img"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></span><span class="im-apply-text c-nowrap">通知公告</span></a></li>
                                    <li><a href="#"><span class="im-apply-img"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></span><span class="im-apply-text c-nowrap"">公文报批</span></a></li>
                                    <li><a href="#"><span class="im-apply-img"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></span><span class="im-apply-text c-nowrap"">活动计划</span></a></li>
                                    <li><a href="#"><span class="im-apply-img"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></span><span class="im-apply-text c-nowrap"">考勤管理</span></a></li>
                                    <li><a href="#"><span class="im-apply-img"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></span><span class="im-apply-text c-nowrap"">会议管理</span></a></li>
                                    <li><a href="javascript:;" id="addapps"><span class="im-apply-iconfont"><i class="iconfont">&#xe62f;</i></span><span class="im-apply-text c-nowrap"">添加应用</span></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="im-menu-box tabs-bd-box c-position-a width-100">
                            <div class="im-user-tabs tabs">
                                <div class="im-user-hd tabs-hd">
                                    <a href="javascript:;" class="curr">好友</a><a href="javascript:;">群组</a><a href="javascript:;">组织</a>
                                </div>
                                <div class="im-user-bd tabs-bd">
                                    <div class="im-user-box tabs-bd-box curr">
                                        <div class="c-position-a width-100">
                                            <div class="user-scroll">
                                                <h2 class="c-333 bg-e0e3ec c-f14 im-user-key mb15">A</h2>
                                                <ul>
                                                    <li class="boss-user">
                                                        <a href="#">
                                                            <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                                            <div class="boss-user-name c-nowrap c-f14 c-333">一群老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊</div>
                                                            <div class="boss-user-number c-position-a">99</div>
                                                        </a>
                                                    </li>
                                                    <li class="boss-user">
                                                        <a href="#">
                                                            <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                                            <div class="boss-user-name c-nowrap c-f14 c-333">一群老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊</div>
                                                        </a>
                                                    </li>
                                                    <li class="boss-user">
                                                        <a href="#">
                                                            <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                                            <div class="boss-user-name c-nowrap c-f14 c-333">一群</div>
                                                        </a>
                                                    </li>
                                                    <li class="boss-user">
                                                        <a href="#">
                                                            <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                                            <div class="boss-user-name c-nowrap c-f14 c-333">一群</div>
                                                        </a>
                                                    </li>
                                                    <li class="boss-user">
                                                        <a href="#">
                                                            <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                                            <div class="boss-user-name c-nowrap c-f14 c-333">刘超群</div>
                                                        </a>
                                                    </li>
                                                </ul>
                                                <h2 class="c-333 bg-e0e3ec c-f14 im-user-key mb15">B</h2>
                                                <ul>
                                                    <li class="boss-user">
                                                        <a href="#" class="curr">
                                                            <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                                            <div class="boss-user-name c-nowrap c-f14 c-333">一老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊</div>
                                                            <div class="boss-user-number c-position-a">99</div>
                                                        </a>
                                                    </li>
                                                    <li class="boss-user">
                                                        <a href="#">
                                                            <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                                            <div class="boss-user-name c-nowrap c-f14 c-333">一老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊</div>
                                                        </a>
                                                    </li>
                                                    <li class="boss-user">
                                                        <a href="#">
                                                            <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                                            <div class="boss-user-name c-nowrap c-f14 c-333">一</div>
                                                        </a>
                                                    </li>
                                                    <li class="boss-user">
                                                        <a href="#">
                                                            <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                                            <div class="boss-user-name c-nowrap c-f14 c-333">一</div>
                                                        </a>
                                                    </li>
                                                    <li class="boss-user">
                                                        <a href="#">
                                                            <div class="boss-user-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                                            <div class="boss-user-name c-nowrap c-f14 c-333">刘超群</div>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="im-user-box tabs-bd-box">
                                        <div class="c-position-a width-100">
                                            <div class="im-user-group group-scroll">
                                                <ul>
                                                    <li>
                                                        <a href="#">
                                                            <div class="bg-50bfff border-radius-circle im-user-icon c-position-a"><i class="iconfont">&#xe619;</i></div>
                                                            <div class="im-user-text c-nowrap c-f16">企业服务中心</div>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <div class="border-radius-circle im-user-img c-position-a"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                                            <div class="im-user-text c-nowrap c-f16">柯医生患友会</div>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <div class="bg-50bfff border-radius-circle im-user-icon c-position-a"><i class="iconfont">&#xe61a;</i></div>
                                                            <div class="im-user-text c-nowrap c-f16">健康之路IT中心</div>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <div class="bg-2bdac7 border-radius-circle im-user-icon c-position-a"><i class="iconfont">&#xe61b;</i></div>
                                                            <div class="im-user-text c-nowrap c-f16">用户发展中心</div>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <div class="bg-7ad140 border-radius-circle im-user-icon c-position-a"><i class="iconfont">&#xe617;</i></div>
                                                            <div class="im-user-text c-nowrap c-f16">产品中心点餐群</div>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="im-user-box tabs-bd-box">
                                        <div class="c-position-a width-100">
                                            <div class="tree-scroll">
                                                <ul class="im-user-tree">
                                                    <li>
                                                        <div class="tree-hd"><a href="#"><i class="iconfont">&#xe609;</i> <span class="c-f14">保卫部保卫部保卫部</span></a></div>
                                                        <ul>
                                                            <li>
                                                                <div class="tree-hd"><a href="#"><i class="iconfont">&#xe60f;</i> <span class="c-f14">保卫部保卫部保卫部保卫部保卫部保卫部保卫部保卫部</span></a></div>
                                                                <ul>
                                                                    <li>
                                                                        <div class="tree-hd"><a href="#"><i class="iconfont">&#xe609;</i> <span class="c-f14">保卫部保卫部保卫部保卫部保卫部保卫部保卫部保卫部保卫部保卫部保卫部</span></a></div>
                                                                        <ul>
                                                                            <li>
                                                                                <div class="tree-hd"><a href="#"><i class="iconfont">&#xe609;</i> <span class="c-f14">保卫部保卫部保卫部保卫部保卫部保卫部保卫部保卫部</span></a></div>
                                                                                <ul>
                                                                                    <li>
                                                                                        <div class="tree-hd"><a href="#"><i class="iconfont">&#xe609;</i> <span class="c-f14">保卫部保卫部保卫部保卫部保卫部保卫部保卫部</span></a></div>
                                                                                        <ul>
                                                                                            <li>
                                                                                                <div class="tree-hd"><a href="#"><i class="iconfont">&#xe609;</i> <span class="c-f14">保卫部保卫部保卫部保卫部保卫部保卫部保卫部保卫部</span></a></div>
                                                                                                <ul>
                                                                                                    <li>
                                                                                                        <div class="tree-hd"><a href="#"><i class="iconfont">&#xe609;</i> <span class="c-f14">保卫部保卫部保卫部保卫部保卫部保卫部保卫部保卫部</span></a></div>
                                                                                                        <ul>
                                                                                                            <li>
                                                                                                                <div class="tree-bd">
                                                                                                                    <a href="#">
                                                                                                                        <div class="tree-bd-box c-position-r">
                                                                                                                            <div class="tree-bd-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                                                                                                            <div class="tree-bd-name c-nowrap c-f14 c-333">一群老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊</div>
                                                                                                                            <div class="tree-bd-number c-position-a">99</div>
                                                                                                                        </div>
                                                                                                                    </a>
                                                                                                                </div>
                                                                                                                <div class="tree-bd">
                                                                                                                    <a href="#" class="curr">
                                                                                                                        <div class="tree-bd-box c-position-r">
                                                                                                                            <div class="tree-bd-face"><img src="http://ued.yihu.cn/framework/images/face.png" class="c-images-block" /></div>
                                                                                                                            <div class="tree-bd-name c-nowrap c-f14 c-333">一群老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊老绵羊</div>
                                                                                                                            <div class="tree-bd-number c-position-a">99</div>
                                                                                                                        </div>
                                                                                                                    </a>
                                                                                                                </div>
                                                                                                            </li>
                                                                                                        </ul>
                                                                                                    </li>
                                                                                                </ul>
                                                                                            </li>
                                                                                        </ul>
                                                                                    </li>
                                                                                </ul>
                                                                            </li>
                                                                        </ul>
                                                                    </li>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="im-menu-hd tabs-hd">
                        <a href="javascript:;" class="curr"><i class="iconfont">&#xe606;</i><span class="c-f14">消息</span></a><a href="javascript:;"><i class="iconfont">&#xe612;</i><span class="c-f14">应用</span></a><a href="javascript:;"><i class="iconfont">&#xe602;</i><span class="c-f14">联系人</span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="boss-im-arrow c-position-a"><i class="iconfont">&#xe61c;</i></div>
</div>
<div id="iframe-im" class="c-position-a">
    <div class="iframe-im-close c-position-a"><a href="#"><i class="iconfont">&#xe605;</i></a></div>
    <iframe frameborder="no" src="/doctor/im/chatbox" width="100%" height="100%"></iframe>
</div>
<div id="iframe-main">
    <iframe frameborder="no" nav="home" src="/doctor/home" width="100%" height="100%" class="curr"></iframe>
</div>

