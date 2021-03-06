<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>


<link rel="stylesheet" href="${staticRoot}/widget/cswitch/1.0/css/cswitch.css" type="text/css" />
<script type="text/javascript" src="${staticRoot}/widget/cswitch/1.0/js/cswitch.js"></script>
<script src="${staticRoot}/widget/navigationMenu/js/app.js"></script>
<script type="text/javascript" src="${staticRoot}/js/underscore.js"></script>

<script type="text/javascript">
    var navEvent = '${nav}';
    var navName = '${name}';
    var navType = '${type}';
    var navCate= '';
    var navUrl= '${url}';
    var menuId= '${menuId}';
    var navcount=0;
    $(function(){
        var inf = ['${contextRoot}/system/userManage/getAppTypeAndApps'];
        var MasterInfor=["0e3DIdNaQ2","Ox8hdRyXVd","VLho13abxY","aikGiriuX0","I5kZOtr7eZ","2aUmOdMCyQ","0C73NZ2CcW","7Ht412MfBu","k4soGEAEiR","fTb1FSZScW","wQmCg7FUFT"]
        var AppIndex = {
            activeIndexs: false,
            bgs: ['bg-danger','bg-warning','bg-success','bg-info','bg-primary'],
            $appBody: $('#appBody'),
            $iFrame: null,
            _NewXZIndex: parent._NewXZIndex,
            state: 0,
            init: function () {
                $("body").addClass("page-sidebar-closed");
                App.init();
                this.loadNavBar();
                this.bindEvent();
            },
            //加载侧边栏
            loadNavBar: function () {
                var me = this;
                navCate = me.GetRequest().cate;
                if(!navCate){navCate="MasterInfor"}
                $.ajax({
                    url:  inf[0],
                    type: 'GET',
                    dataType: 'json',
                    data:{manageType: 'client'},
                    success: function (result) {
                        if(result.successFlg){
                            var objType = result.obj;
                            var menuList =  result.detailModelList;
                            var menuDom = $(".page-sidebar-menu");
                            var leafMenuHtml = $("#leaf_menu_tmpl").html();
                            var menuHtml = $("#menu_tmpl").html();
                            var leafHtml = $("#leaf_tmpl").html();
                            for(var i =0 ;i<menuList.length;i++){
                                if(menuList[i].code==navCate){
                                    var menu = menuList[i];
                                    //叶子节点菜单
                                    if(menu.leaf){
                                        var newLi = menuDom.append(leafMenuHtml).find(">li:last-child");
                                        newLi.attr("data-original-title",menu.value);
                                        newLi.find("a").attr("data-url",menu.menuUrl).data("buttons",menu.buttonList);
                                        newLi.find(".title").html(menu.value);
                                    }else{
                                        var childMenuList = menu.children;
                                        if(childMenuList && childMenuList.length>0){
                                            var length=childMenuList.length;
                                            childMenuList=me.resortList(childMenuList,length);
                                            for(var j=0;j<length;j++){
                                                var childMenu = childMenuList[j];
                                                if(childMenu && childMenu.id != "zkGuSIm2Fg"){
                                                    navcount++;
                                                    var newLi = menuDom.append(menuHtml).find(">li:last-child");
                                                    var mod = j%5;
                                                    var bg = me.bgs[mod];
                                                    newLi.addClass("_"+childMenu.id);
                                                    newLi.find("b").addClass(bg);
                                                    newLi.find(".title").html(childMenu.name);
                                                    newLi.find(".arrow").hide();
                                                    newLi.find("a").attr("data-code",menu.code).attr("data-url", objType == 1 ? childMenu.url : childMenu.outUrl).attr("data-nav",childMenu.id).attr("data-name",childMenu.name).attr("title",childMenu.name).attr("data-type",childMenu.manageType);
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            var $activeNav = $('a[data-nav=' + navEvent + ']'),
                                url = $activeNav.attr('data-url');
                            if ($activeNav.length <= 0 || !url) {
                                url = navUrl;
                            }
                            url = "/login/signin?clientId=" + navEvent + "&url=" + url;
                            if (menuId != '') {
                                url = url + '?menuId=' + menuId
                            }
                            me.$appBody.attr('src', url);

                            $('a[data-nav="aikGiriuX0"]')
                            $("ul.page-sidebar-menu a[data-nav='"+me.GetRequest().nav+"']").parents("li").addClass("active");
                            me.loadNavBar1();
                        }else{
                            art.dialog({
                                title: "警告",
                                time: 2,
                                content: "菜单获取失败"
                            });
                        }
                    },
                    error: function (data) {
                        art.dialog({
                            title: "警告",
                            time: 2,
                            content: "Status:"+data.status +"(" +data.statusText+")"
                        });
                    }
                });
            },
            loadNavBar1: function () {
                var me = this;
                $.ajax({
                    url:  inf[0],
                    type: 'GET',
                    dataType: 'json',
                    data:{manageType: 'backStage'},
                    success: function (result) {
                        if(result.successFlg){
                            var objType = result.obj;
                            var menuList =  result.detailModelList;
                            var menuDom = $(".page-sidebar-menu");
                            var leafMenuHtml = $("#leaf_menu_tmpl").html();
                            var menuHtml = $("#menu_tmpl").html();
                            var leafHtml = $("#leaf_tmpl").html();
                            for(var i =0 ;i<menuList.length;i++){
                                if(menuList[i].code=="BusinessCollaboration"||menuList[i].code=="ApplicationService"){
                                    var menu = menuList[i];
                                    //叶子节点菜单
                                    if(menu.leaf){
                                        var newLi = menuDom.append(leafMenuHtml).find(">li:last-child");
                                        newLi.attr("data-original-title",menu.value);
                                        newLi.find("a").attr("data-url",menu.menuUrl).data("buttons",menu.buttonList);
                                        newLi.find(".title").html(menu.value);
                                    }else{
                                        var childMenuList = menu.children;
                                        if(childMenuList && childMenuList.length>0){
                                            navcount++;
//                                            var newLi = $("li.start").after(menuHtml).next();
                                            var newLi = menuDom.append(menuHtml).find("li:last-child");
                                            newLi.addClass("_"+menu.code);
                                            var mod = (6-i)%5;
                                            var bg = me.bgs[mod];
                                            newLi.find("b").addClass(bg);
                                            newLi.find(".title").html(menu.value);
                                            if(navcount>5){
                                                newLi.find(".sub-menu").addClass("down");
                                            }else{
                                                newLi.find(".sub-menu").addClass("up");
                                            }
                                            for(var j = 0 ;j<childMenuList.length;j++){
                                                var childMenu = childMenuList[j];
                                                if(childMenu.code=="DataCenter"){
                                                    me.activeIndexs=true;
                                                }
                                                var newLeaf = newLi.find(".sub-menu").append(leafHtml).find("li:last-child");
                                                newLeaf.find("a").attr("data-code",menu.code).attr("data-url", objType == 1 ? childMenu.url : childMenu.outUrl).attr("data-nav",childMenu.id).attr("data-name",childMenu.name).attr("title",childMenu.name).attr("data-type",childMenu.manageType).attr("data-cate",menu.code);
                                                newLeaf.find(".fa").after(childMenu.name);
                                            }
                                        }
                                    }
                                }
                            }
                            var $activeNav = $('a[data-nav=' + navEvent + ']'),
                                url = $activeNav.attr('data-url');
                            if ($activeNav.length <= 0 || !url) {
                                url = navUrl;
                            }
                            url = "/login/signin?clientId=" + navEvent + "&url=" + url;
                            if (menuId != '') {
                                url = url + '?menuId=' + menuId
                            }
                            me.$appBody.attr('src', url);

                            $('a[data-nav="aikGiriuX0"]')
                            $("ul.page-sidebar-menu a[data-nav='"+me.GetRequest().nav+"']").parents("li").addClass("active");
                        }else{
                            art.dialog({
                                title: "警告",
                                time: 2,
                                content: "菜单获取失败"
                            });
                        }
                    },
                    error: function (data) {
                        art.dialog({
                            title: "警告",
                            time: 2,
                            content: "Status:"+data.status +"(" +data.statusText+")"
                        });
                    }
                });
            },
            bindEvent: function () {
                var me = this;
                //菜单的单机事件
                $(".page-sidebar").on("click",".menu-a",function(){
                    var url = $(this).data("url");
                    $(".page-sidebar").find(".current").removeClass("current");
                    $(this).addClass("current");
                    if(url){
                        var name = $(this).attr("data-name");
                        var nav = $(this).attr("data-nav");
                        var type = $(this).attr("data-type");
                        if(url){
                            var newname=sessionStorage.getItem("MenuName");
                            sessionStorage.setItem("MenuName",name);
                            window.open('${contextRoot}/newXZIndex?nav=' + nav + '&cate=' + navCate+'&name=' +encodeURIComponent(name) + '&type=backStage&url='+url, '_blank');
                            setTimeout(function () {
                                sessionStorage.setItem("MenuName",newname);
                            },3000)
                        }else{//无数据时跳转的页面
                            url = "/system/noData";
                            type = "";
                            me._NewXZIndex.openNav(nav, name, url, type);
                        }
                    }else{

                    }
                });
                //菜单的单机事件
                $(".page-sidebar").on("click",".sub-menu a",function(){
                    debugger
                    var url = $(this).data("url");
                    $(".page-sidebar").find(".current").removeClass("current");
                    $(this).addClass("current");
                    var name = $(this).attr("data-name");
                    var nav = $(this).attr("data-nav");
                    var type = $(this).attr("data-type");
                    var cate = $(this).attr("data-cate");
                    if(url){
                        var newname=sessionStorage.getItem("MenuName");
                        sessionStorage.setItem("MenuName",name);
                        window.open('${contextRoot}/newXZIndex?nav=' + nav + '&cate=' + cate+'&name=' +encodeURIComponent(name) + '&type=' + type+'&url='+url, '_blank');
                        setTimeout(function () {
                            sessionStorage.setItem("MenuName",newname);
                        },3000)
                    }else{//无数据时跳转的页面
                        url = "/system/noData";
                        type = "";
                        me._NewXZIndex.openNav(nav, name, url, type);
                    }
                });
                //缩放菜单
                $('.page-sidebar, .header').on('click', '.sidebar-toggler', function (e) {
//                    var body = $('body');
//                    if (body.hasClass("page-sidebar-closed")) {
//                        $(".iframe-menu").css("margin-left","55px");
//                        $("#if-main").css("width","calc(100% - 55px)").css("left","55px");
//                        $(".page-sidebar.navbar-collapse").css("overflow-y","initial");
//                        $(".page-sidebar.navbar-collapse").css("overflow-x","initial");
//                    } else {
//                        $(".iframe-menu").css("margin-left","200px");
//                        $("#if-main").css("width","calc(100% - 200px)").css("left","200px");
//                        $(".page-sidebar.navbar-collapse").css("overflow-y","auto");
//                        $(".page-sidebar.navbar-collapse").css("overflow-x","hidden");
//                    }
                });
            },
            GetRequest:function () {
                var url = location.search; //获取url中"?"符后的字串
                var theRequest = new Object();
                if (url.indexOf("?") != -1) {
                    var str = url.substr(1);
                    strs = str.split("&");
                    for(var i = 0; i < strs.length; i ++) {
                        theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
                    }
                }
                return theRequest;
            },
            resortList:function (menuList,length) {
                var newlist=[];
                var count=1;
                var mcount=0;
                for(var j =0 ;j<menuList.length;j++){
                    var name=menuList[j].id;
                    var has=false;
                    for(var i =0 ;i<MasterInfor.length;i++){
                        if(MasterInfor[i]==name){
                            menuList[j].sort=i;
                            newlist.push(menuList[j]);
                            has=true;
                            mcount++;
                        }
                    }
                    if(!has){
                        menuList[j].sort=length-count;
                        newlist.push(menuList[j]);
                        count++;
                    }
                }
                newlist=_.sortBy(newlist, 'sort');
                return newlist;
            },
        };
        AppIndex.init();
        <%--window.addEventListener('message', function(e){--%>
            <%--if (e.data.msg == 'openTab') {--%>
                <%--var nav = e.data.id,--%>
                    <%--name = e.data.name;--%>
                <%--var url = '${contextRoot}/appIndex?nav=' + navEvent + '&name=' + name;--%>
                <%--AppIndex._NewXZIndex.openNav(nav, name, url);--%>
            <%--} else if (e.data.msg == 'loadLogin') {--%>
                <%--sessionStorage.clear();--%>
                <%--location.href = '${contextRoot}/login/exit';--%>
            <%--} else {--%>
                <%--art.dialog({--%>
                    <%--title: "警告",--%>
                    <%--time: 2,--%>
                    <%--content: "参数错误"--%>
                <%--});--%>
            <%--}--%>
        <%--}, false);--%>
    });
</script>