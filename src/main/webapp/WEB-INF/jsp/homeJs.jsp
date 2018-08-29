<%--
  Created by IntelliJ IDEA.
  User: JKZL-A
  Date: 2017/10/26
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>
<script type="text/javascript" src="${staticRoot}/js/jsHelper.js"></script>
<script type="text/javascript" src="${staticRoot}/js/underscore.js"></script>
<script type="text/javascript" src="${staticRoot}/js/rem.js"></script>
<script type="text/javascript" src="${staticRoot}/ligerui/ligerui.all.js"></script>

<script>
    ~(function (w, $) {
        $(function () {
            var loading = null;
            var dialog=null;
            //接口
            var inf = [
                //获取侧边栏
                '${contextRoot}/system/userManage/getAppTypeAndApps','${contextRoot}/system/userManage/getUserRoleApps'
            ];
            var showTimeOut = null;

            listArr=[$(".dashuju-div"),$(".basic-div"),$(".yewuxiezuo-div"),$(".appServer-div")]

            var itemClass={
                "DataCenter":{
                    outclass:"div-p08  w3-row clearfix",outstyle:"",outclass1:"",outstyle1:"width:1.25rem;height:0.67rem;",iconclass:"w3-col",iconstyle:"width:43%;padding-top:.17rem",titleclass:"w3-rest lh6",titlestyle:"text-align:left;",
                },
                "BusinessCollaboration":{
                    outclass:" clearfix",outstyle:"",outclass1:"",outstyle1:"width:0.747rem;height:0.635rem;",iconclass:"",iconstyle:"padding-top:0.1rem;",titleclass:""
                },
                "ApplicationService":{
                    outclass:" clearfix",outstyle:"",outclass1:"",outstyle1:"height: 0.95rem;padding-top: 0.2rem;",iconclass:"div-item1",iconstyle:"",titleclass:""
                },
                "MasterInfor":{
                    outclass:" clearfix",outstyle:"",outclass1:"",outstyle1:"width:0.68rem;height:0.675rem;", iconclass:"",iconstyle:"padding-top:0.1rem;",titleclass:"",manageType:"backStage"
                },
                "MasterInfor1":{
                    outclass:"div-p_5  w3-row clearfix",outstyle:"",outclass1:"",outstyle1:"width:1.45rem;height:0.68rem;",iconclass:"w3-col",iconstyle:"width:40%;padding-top:.17rem;margin-left:0.07rem;",titleclass:"w3-rest lh6",titlestyle:"text-align:left;",manageType:"backStage"
                },
            };

            var itemList=["R1yHNdX5Ud",
                "0e3DIdNaQ2","Ox8hdRyXVd","aikGiriuX0","2aUmOdMCyQ","0C73NZ2CcW","k4soGEAEiR","wQmCg7FUFT","zkGuSIm2Fg","VLho13abxY","I5kZOtr7eZ","fTb1FSZScW",
                "VWh4aaifgY","M13pAosamN","h1Nc8PyF5k","sAigwZvAQF","aoGoGPD7Qf","U11VgRplOb",
                "wmIgx8RWcQ","P1C7SOQe6n","5DloGvRVVZ","lZfekFOy6r"];

//            var MasterInfor=[{"0e3DIdNaQ2":1},{"Ox8hdRyXVd":2},{"aikGiriuX0":3},{"2aUmOdMCyQ":4},{"0C73NZ2CcW":5},{"k4soGEAEiR":6},{"wQmCg7FUFT":7}]

            var Home = {
                divItem: $('#divItem').html(),
                $appServerDiv:$(".appServer-div"),
                $basicDiv:$(".basic-div"),
                $yewuxiezuoDiv:$(".yewuxiezuo-div"),
                $dashujuDiv:$(".dashuju-div"),
                $clickdiv:$(".clickdiv"),

                $loout: $('#loout'),
                $homeItem: $('.home-item'),
                $userItem: $('.home-head'),
                $userInfo: $('#userInfo'),
                $nameInfo: $('.name-info'),
                type: 0,


                init: function () {
                    this.$nameInfo.html(sessionStorage.getItem("loginName"));
                    this.$userItem.attr("title",sessionStorage.getItem("loginName"));
                    this.loadData();
                    this.getDictSetting();
                },
                loadData: function () {
                    var me = this;
//                    _jsHelper.mhAjax(inf[0], 'GET', {manageType: 'client'}, function (res) {
                    _jsHelper.mhAjax(inf[1], 'GET', {userId: sessionStorage.getItem("userId")}, function (res) {
//                        res={"successFlg":true,"pageSize":10,"currPage":0,"totalPage":0,"totalCount":0,"detailModelList":[{"id":"0e3DIdNaQ2","name":"信息共享交换","secret":"xmo1vlZGzR4lGEcT","url":"http://192.168.200.62:8080/esb/jkzl/oauth2/signin","outUrl":"http://jksr.srswjw.gov.cn:1234/esb/jkzl/oauth2/signin","creator":"0dae0003590016e5b3865e377b2f8615","auditor":"0dae0003590016e5b3865e377b2f8615","createTime":"2017-02-28 11:51:33","auditTime":"2017-07-21 16:51:12","catalog":"MasterInfor","status":"Approved","description":"信息共享交换平台","tags":[],"org":"jkzl","code":"ESB","sourceType":1,"icon":"group1:M00/00/00/wKgyJVrYBcyAG8P4AAATrJjD8lw281.png","releaseFlag":1,"manageType":"client","roleType":"1","doctorManageType":""},{"id":"3CDhsgepr4","name":"医疗云平台","secret":"M35aY5GYxVucyaYP","url":"http://192.168.220.68:8011/ehr/index","outUrl":"http://jksr.srswjw.gov.cn:1235/ehr/index","creator":"0dae0003590016e5b3865e377b2f8615","auditor":"0dae0003590016e5b3865e377b2f8615","createTime":"2016-04-06 17:30:37","auditTime":"2017-07-21 17:17:04","catalog":"","status":"Approved","description":"","tags":[],"org":"jkzl","code":"HealthArchivePortal","sourceType":1,"icon":"","releaseFlag":1,"manageType":"backStage","roleType":"1","doctorManageType":null},{"id":"3Y31QxxuWi","name":"公共卫生服务","secret":"u8o4ydI1fRTgTsFg","url":"","outUrl":null,"creator":"0dae0003590016e5b3865e377b2f8615","auditor":"0dae0003590016e5b3865e377b2f8615","createTime":"2017-06-07 20:35:31","auditTime":"2017-07-21 17:17:10","catalog":"ApplicationService","status":"Approved","description":"","tags":[],"org":"jkzl","code":"OverAllHealth","sourceType":1,"icon":"","releaseFlag":1,"manageType":"backStage","roleType":"1","doctorManageType":null},{"id":"5DloGvRVVZ","name":"卫生应急指挥","secret":"QZzgB0wZLltUBeg0","url":"http://192.168.220.70:9099/emergency/login/signin","outUrl":"http://jksr.srswjw.gov.cn:81/emergency/login/signin","creator":"0dae0003590016e5b3865e377b2f8615","auditor":"0dae0003590016e5b3865e377b2f8615","createTime":"2017-06-07 20:36:41","auditTime":"2017-07-24 10:55:30","catalog":"ApplicationService","status":"Approved","description":"","tags":[],"org":"jkzl","code":"EHR009","sourceType":1,"icon":"group1:M00/00/00/wKgyJVrYA-KAFWiZAAAPt8eqHs4754.png","releaseFlag":1,"manageType":"client","roleType":"1","doctorManageType":null},{"id":"7Ht412MfBu","name":"系统配置","secret":"wBfgwXSN1vgNvVez","url":"http://192.168.220.70:8090/ehr/login/signin","outUrl":"http://jksr.srswjw.gov.cn:1235/ehr/login/signin","creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2018-03-02 10:01:14","auditTime":null,"catalog":"MasterInfor","status":"Approved","description":"","tags":[],"org":"jkzl","code":"SystemConfiguration","sourceType":1,"icon":"","releaseFlag":1,"manageType":"client","roleType":"1","doctorManageType":""},{"id":"aoGoGPD7Qf","name":"区域影像","secret":"ULSGaXHx8hhygsOo","url":"","outUrl":null,"creator":"0dae0003590016e5b3865e377b2f8615","auditor":"0dae0003590016e5b3865e377b2f8615","createTime":"2017-06-07 20:30:56","auditTime":"2017-07-24 10:55:23","catalog":"BusinessCollaboration","status":"Approved","description":"","tags":[],"org":"jkzl","code":"RegionalImage","sourceType":1,"icon":"","releaseFlag":1,"manageType":"backStage","roleType":"1","doctorManageType":null},{"id":"fTb1FSZScW","name":"基础设施","secret":"tzOiN5IrLgHvkmzs","url":"http://192.168.220.70:8090/ehr/login/signin","outUrl":"http://jksr.srswjw.gov.cn:1235/ehr/login/signin","creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2018-01-12 16:03:33","auditTime":null,"catalog":"MasterInfor","status":"Approved","description":"","tags":[],"org":"jkzl","code":"infrastructureBackstage","sourceType":1,"icon":"","releaseFlag":1,"manageType":"client","roleType":"1","doctorManageType":""},{"id":"fZVXAnGWkg","name":"数据质控管理","secret":"ClKsvKRBvMeT5OZW","url":"http://jksr.srswjw.gov.cn:1235/qc/sign/sign/html/sign.html","outUrl":"http://jksr.srswjw.gov.cn:1235/qc/sign/sign/html/sign.html","creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2018-06-20 17:41:15","auditTime":null,"catalog":"MasterInfor","status":"Approved","description":"","tags":[],"org":"jkzl","code":"DataQualityControlManagement","sourceType":1,"icon":"group1:M00/26/B4/rBFuWFsqIr2AVTl9AAANA0eL0tk430.png","releaseFlag":1,"manageType":"backStage","roleType":"1","doctorManageType":null},{"id":"GZpOCYOexO","name":"弘扬即时交互","secret":"P3mOpZo7VGG67P0Q","url":"www.cctv.com","outUrl":null,"creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2018-05-21 14:50:08","auditTime":null,"catalog":"BusinessCollaboration","status":"Approved","description":"","tags":[],"org":"hy0000001","code":"hongyang001","sourceType":0,"icon":"","releaseFlag":1,"manageType":"backStage","roleType":"0","doctorManageType":null},{"id":"h1Nc8PyF5k","name":"双向转诊服务","secret":"kamtOmb5pZ5x0t1v","url":"https://srzz.yihu.cn/WbjUI/wbj2/business/web/param_sr.html","outUrl":"https://srzz.yihu.cn/WbjUI/wbj2/business/web/param_sr.html","creator":"0dae0003590016e5b3865e377b2f8615","auditor":"0dae0003590016e5b3865e377b2f8615","createTime":"2017-06-07 20:32:41","auditTime":"2017-07-24 10:55:32","catalog":"BusinessCollaboration","status":"Approved","description":"","tags":[],"org":"jkzl","code":"EHR003","sourceType":1,"icon":"","releaseFlag":1,"manageType":"backStage","roleType":"1","doctorManageType":"OnlineService"},{"id":"HPnz4GXfYA","name":"公众健康服务","secret":"lzWFbzGYgBhceEkA","url":"","outUrl":null,"creator":"0dae0003590016e5b3865e377b2f8615","auditor":"0dae0003590016e5b3865e377b2f8615","createTime":"2017-06-07 20:34:31","auditTime":"2017-07-24 10:55:21","catalog":"ApplicationService","status":"Approved","description":"","tags":[],"org":"jkzl","code":"OverAllPortal","sourceType":1,"icon":"","releaseFlag":1,"manageType":"backStage","roleType":"1","doctorManageType":null},{"id":"I5kZOtr7eZ","name":"安全与开放","secret":"344z4MCGSQWFKpEH","url":"http://192.168.220.70:8090/ehr/login/signin","outUrl":"http://jksr.srswjw.gov.cn:1235/ehr/login/signin","creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2018-03-02 10:03:24","auditTime":null,"catalog":"MasterInfor","status":"Approved","description":"","tags":[],"org":"jkzl","code":"InformationSecurity","sourceType":1,"icon":"","releaseFlag":1,"manageType":"client","roleType":"1","doctorManageType":""},{"id":"ivnBMgmhK8","name":"数据资源中心管理","secret":"cDKgoIltdkdALee2","url":"http://192.168.220.70:8090/ehr/login/signin","outUrl":"http://jksr.srswjw.gov.cn:1235/ehr/login/signin","creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2018-01-17 16:13:11","auditTime":null,"catalog":"DataCenter","status":"Approved","description":"","tags":[],"org":"jkzl","code":"DataResourceCenter","sourceType":1,"icon":"","releaseFlag":1,"manageType":"backStage","roleType":"1","doctorManageType":null},{"id":"kBOnOtKuuN","name":"采集监管","secret":"hhEFTF5z5dmask2g","url":"http://192.168.220.17:8081/PMC/login","outUrl":"http://jksr.srswjw.gov.cn:1234/PMC/login","creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2017-11-07 15:28:55","auditTime":null,"catalog":"BusinessCollaboration","status":"Approved","description":"","tags":[],"org":"760142722","code":"ruiruan_1","sourceType":0,"icon":"group1:M00/00/00/CrBhBVoBYHSAHhxpAAAW3HAZIS8826.jpg","releaseFlag":1,"manageType":"backStage","roleType":"1","doctorManageType":null},{"id":"lZfekFOy6r","name":"大数据应用平台","secret":"wviSi56FgaMnILBX","url":"http://jksr.srswjw.gov.cn:1235/bigScreenShow/page/bigData/html/medical.html","outUrl":"http://jksr.srswjw.gov.cn:1235/bigScreenShow/page/bigData/html/medical.html","creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2018-07-18 20:22:07","auditTime":null,"catalog":"ApplicationService","status":"Approved","description":"","tags":[],"org":"jkzl","code":"LargeDataServicePlatform","sourceType":1,"icon":"group1:M00/7A/D3/wKgyJVtVb5GAaV94AAAKasghFpc094.png","releaseFlag":1,"manageType":"client","roleType":"1","doctorManageType":""},{"id":"lZsL8KixVs","name":"区域电子病例","secret":"ld5kZZgof80Ogg4Y","url":"http://","outUrl":"http://","creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2018-08-14 11:53:25","auditTime":null,"catalog":"BusinessCollaboration","status":"Approved","description":"","tags":[],"org":"jkzl","code":"RegionalElectronicCases","sourceType":0,"icon":"","releaseFlag":1,"manageType":"client","roleType":"0","doctorManageType":""},{"id":"M13pAosamN","name":"远程会诊服务","secret":"cSRPgkYiON6rGQFI","url":"","outUrl":null,"creator":"0dae0003590016e5b3865e377b2f8615","auditor":"0dae0003590016e5b3865e377b2f8615","createTime":"2017-06-07 20:33:57","auditTime":"2017-07-24 10:55:35","catalog":"BusinessCollaboration","status":"Approved","description":"","tags":[],"org":"jkzl","code":"EHR004","sourceType":1,"icon":"","releaseFlag":1,"manageType":"backStage","roleType":"1","doctorManageType":"OnlineService"},{"id":"Ox8hdRyXVd","name":"医疗资源管理","secret":"imI5OGOBR7G0U5As","url":"http://172.19.103.70:1235/ehr/login/signin","outUrl":"http://172.19.103.70:1235/ehr/login/signin","creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2018-08-13 16:31:22","auditTime":null,"catalog":"MasterInfor","status":"Approved","description":"用于管理医疗资源信息","tags":[],"org":"jkzl","code":"HealthResource","sourceType":1,"icon":"group1:M00/28/E1/rBFuWFtxQbGAauyXAAAJVLeCCv4467.png","releaseFlag":1,"manageType":"client","roleType":"0","doctorManageType":""},{"id":"P1C7SOQe6n","name":"政府服务平台","secret":"CaQIFDOGNUwmg3e5","url":"http://192.168.220.79:9088/gov/gsp/sign.html","outUrl":"http://jksr.srswjw.gov.cn:1235/gov/gsp/sign.html","creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2017-11-23 11:39:59","auditTime":null,"catalog":"ApplicationService","status":"Approved","description":"","tags":[],"org":"jkzl","code":"GovernmentServerPlarform","sourceType":1,"icon":"group1:M00/00/00/wKgyJlrYA_yAawmzAAAQnBumyxo414.png","releaseFlag":1,"manageType":"client","roleType":"1","doctorManageType":null},{"id":"P7dIRS0FvX","name":"城市i健康","secret":"Hv2dWpVYNrwCzht2","url":"http://172.19.103.70:1235/profile/app/mprofile/html/signin.html","outUrl":"http://jksr.srswjw.gov.cn:1235/profile/app/mprofile/html/signin.html","creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2018-06-28 18:54:49","auditTime":null,"catalog":"ApplicationService","status":"Approved","description":"","tags":[],"org":"jkzl","code":"CSIJK","sourceType":1,"icon":"group1:M00/26/B4/rBFuWFs0v-iAXBk4AADCU02KpMo202.png","releaseFlag":1,"manageType":"client","roleType":"0","doctorManageType":null},{"id":"pKQiHuNfR6","name":"采集监管（卡思特）","secret":"426nRQ52zUfDG0GF","url":"http://","outUrl":"http://","creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2018-08-22 11:00:47","auditTime":null,"catalog":"MasterInfor","status":"Approved","description":"","tags":[],"org":"FZKSTXXJSFZKST","code":"CollectionAndSupervision","sourceType":0,"icon":"","releaseFlag":1,"manageType":"client","roleType":"0","doctorManageType":""},{"id":"QubWmghRGL","name":"开放平台","secret":"L7h6bY6BwY7AkMuX","url":"http://","outUrl":null,"creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2018-01-17 14:34:04","auditTime":null,"catalog":"ApplicationService","status":"WaitingForApprove","description":"","tags":[],"org":"jkzl","code":"OpenPlatform","sourceType":1,"icon":"","releaseFlag":1,"manageType":"client","roleType":"1","doctorManageType":null},{"id":"R1yHNdX5Ud","name":"数据资源中心","secret":"lvlGgZFGCBNxp7YU","url":"http://192.168.220.70:8090/ehr/login/signin","outUrl":"http://jksr.srswjw.gov.cn:1235/ehr/login/signin","creator":"0dae0003590016e5b3865e377b2f8615","auditor":"0dae0003590016e5b3865e377b2f8615","createTime":"2017-10-12 13:51:22","auditTime":"2017-10-12 13:51:22","catalog":"DataCenter","status":"Approved","description":"","tags":[],"org":"jkzl","code":"DataResourceCenterClient","sourceType":1,"icon":"group1:M00/00/00/wKgyJlrYA9SAb4OEAAANA0eL0tk362.png","releaseFlag":1,"manageType":"client","roleType":"1","doctorManageType":null},{"id":"rRByNITgAi","name":"江西省平台","secret":"lKGGN3NR8821N22O","url":"xx","outUrl":null,"creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2017-12-28 14:25:15","auditTime":null,"catalog":"BusinessCollaboration","status":"WaitingForApprove","description":"","tags":[],"org":"jiangxi-1","code":"jiangxi_org","sourceType":0,"icon":"","releaseFlag":1,"manageType":"backStage","roleType":"1","doctorManageType":null},{"id":"rWN7tMak7Y","name":"开放平台管理","secret":"xxszMObKK2MGWEml","url":"http://","outUrl":null,"creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2018-01-17 14:35:04","auditTime":null,"catalog":"ApplicationService","status":"WaitingForApprove","description":"","tags":[],"org":"jkzl","code":"OpenPlatformBackstage","sourceType":1,"icon":"","releaseFlag":1,"manageType":"backStage","roleType":"1","doctorManageType":null},{"id":"s6GIkdmW10","name":"卫生应急指挥后台管理","secret":"exmOOlglwPv1vUha","url":"http://192.168.220.70:8090/ehr/login/signin","outUrl":"http://jksr.srswjw.gov.cn:1235/ehr/login/signin","creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2018-01-12 16:00:26","auditTime":null,"catalog":"ApplicationService","status":"Approved","description":"","tags":[],"org":"jkzl","code":"emergencyBackstage","sourceType":1,"icon":"","releaseFlag":1,"manageType":"backStage","roleType":"1","doctorManageType":null},{"id":"sAigwZvAQF","name":"区域检查检验","secret":"vV77GsvAZNBMb71T","url":"","outUrl":null,"creator":"0dae0003590016e5b3865e377b2f8615","auditor":"0dae0003590016e5b3865e377b2f8615","createTime":"2017-06-07 20:31:59","auditTime":"2017-07-24 10:55:26","catalog":"BusinessCollaboration","status":"Approved","description":"","tags":[],"org":"jkzl","code":"EHR002","sourceType":1,"icon":"","releaseFlag":1,"manageType":"backStage","roleType":"1","doctorManageType":null},{"id":"SipVoGVhVz","name":"远程医学教育","secret":"gADrbQ6LZrsVNcs8","url":"","outUrl":null,"creator":"0dae0003590016e5b3865e377b2f8615","auditor":"0dae0003590016e5b3865e377b2f8615","createTime":"2017-06-07 20:36:08","auditTime":"2017-07-24 10:55:37","catalog":"ApplicationService","status":"Approved","description":"","tags":[],"org":"jkzl","code":"EHR008","sourceType":1,"icon":"","releaseFlag":1,"manageType":"backStage","roleType":"1","doctorManageType":"OnlineLearning"},{"id":"TfyMKBNGzG","name":"信息安全管理","secret":"WLRUDcRg2keKgfLC","url":"http://192.168.220.70:8090/ehr/login/signin","outUrl":"http://jksr.srswjw.gov.cn:1235/ehr/login/signin","creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2018-01-12 15:55:14","auditTime":null,"catalog":"MasterInfor","status":"Reject","description":"","tags":[],"org":"jkzl","code":"Information","sourceType":1,"icon":"","releaseFlag":1,"manageType":"backStage","roleType":"1","doctorManageType":null},{"id":"U11VgRplOb","name":"预约挂号","secret":"OGzDUkPpZwymhKYW","url":"http://sso.yihu.cn/YY/sso4XM","outUrl":"http://sso.yihu.cn/YY/sso4XM","creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2018-04-02 13:53:25","auditTime":null,"catalog":"BusinessCollaboration","status":"Approved","description":"","tags":[],"org":"jkzl","code":"Appointment","sourceType":0,"icon":"","releaseFlag":1,"manageType":"client","roleType":"1","doctorManageType":""},{"id":"u5GEgEuoyc","name":"卡思特采集","secret":"MNhQXnCSaaRc8kcS","url":"http://","outUrl":null,"creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2018-04-24 11:33:51","auditTime":null,"catalog":"BusinessCollaboration","status":"Approved","description":"","tags":[],"org":"FZKSTXXJS","code":"KSTCJ","sourceType":0,"icon":"","releaseFlag":1,"manageType":"backStage","roleType":"0","doctorManageType":null},{"id":"uhHlW8gZM5","name":"健康之路平台","secret":"4KaVQesgBGHOsmuc","url":"http://ssotest.yihu.cn/YY/sso4XM","outUrl":"http://ssotest.yihu.cn/YY/sso4XM","creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2018-03-22 17:58:35","auditTime":null,"catalog":"BusinessCollaboration","status":"Approved","description":"","tags":[],"org":"fzjkzl","code":"fzjkzlpt","sourceType":0,"icon":"","releaseFlag":1,"manageType":"backStage","roleType":"0","doctorManageType":null},{"id":"uzs5G0HgTp","name":"档案浏览器","secret":"3Up5wUh3BU4wZyg4","url":"http://192.168.220.72:8010/profile/app/home/html/signin.html","outUrl":"http://jksr.srswjw.gov.cn:1235/profile/app/home/html/signin.html","creator":"0dae0003590016e5b3865e377b2f8615","auditor":"0dae0003590016e5b3865e377b2f8615","createTime":"2017-07-12 17:20:47","auditTime":"2017-07-21 17:17:13","catalog":"","status":"Approved","description":"","tags":[],"org":"jkzl","code":"EhrBrowser","sourceType":1,"icon":"","releaseFlag":1,"manageType":"backStage","roleType":"1","doctorManageType":null},{"id":"VLho13abxY","name":"居民健康档案","secret":"LfNiCZkTGPr7u4pu","url":"http://192.168.220.70:8090/ehr/login/signin","outUrl":"http://jksr.srswjw.gov.cn:1235/ehr/login/signin","creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2018-01-12 15:57:53","auditTime":null,"catalog":"MasterInfor","status":"Approved","description":"","tags":[],"org":"jkzl","code":"healthArchives","sourceType":1,"icon":"","releaseFlag":1,"manageType":"client","roleType":"1","doctorManageType":""},{"id":"VWh4aaifgY","name":"区域电子病历","secret":"0zF5LDzGQKkX36I3","url":"","outUrl":null,"creator":"0dae0003590016e5b3865e377b2f8615","auditor":"0dae0003590016e5b3865e377b2f8615","createTime":"2017-06-07 20:27:15","auditTime":"2017-07-24 10:55:28","catalog":"BusinessCollaboration","status":"Approved","description":"","tags":[],"org":"jkzl","code":"EMR","sourceType":1,"icon":"","releaseFlag":1,"manageType":"backStage","roleType":"1","doctorManageType":null},{"id":"w6QFRUpAG3","name":"医生工作站","secret":"o6XuakAvgX0U8EHA","url":"http://www.baidu.com","outUrl":null,"creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2018-05-02 21:38:32","auditTime":null,"catalog":"ApplicationService","status":"Approved","description":"","tags":[],"org":"jkzl","code":"DoctorWorkManagePlatform","sourceType":1,"icon":"group1:M00/1F/69/wKgyJVrqpwSAdLHVAAAOD2c2feo731.png","releaseFlag":1,"manageType":"client","roleType":"0","doctorManageType":null},{"id":"W8RDizgDIB","name":"资源综合查询","secret":"sz6f6B4xNSZiXuf8","url":"http://192.168.220.70:8090/ehr/login/signinResource","outUrl":"http://jksr.srswjw.gov.cn:8090/ehr/login/signinResource","creator":"0dae0003590016e5b3865e377b2f8615","auditor":"0dae0003590016e5b3865e377b2f8615","createTime":"2017-06-07 20:28:09","auditTime":"2017-07-21 17:17:16","catalog":"DataCenter","status":"Forbidden","description":"","tags":[],"org":"jkzl","code":"DataCentre","sourceType":1,"icon":"","releaseFlag":1,"manageType":"backStage","roleType":"1","doctorManageType":null},{"id":"wQmCg7FUFT","name":"云计算资源","secret":"Z7GBImQwDXGi7kUF","url":"http://223.84.134.42:1234/NoLimitIM/pc/login.html","outUrl":"http://223.84.134.42:1234/NoLimitIM/pc/login.html","creator":"0dae0003590016e5b3865e377b2f8615","auditor":"0dae0003590016e5b3865e377b2f8615","createTime":"2017-06-07 20:29:00","auditTime":"2017-07-24 10:55:19","catalog":"MasterInfor","status":"Approved","description":"","tags":[],"org":"jkzl","code":"ResourceManager","sourceType":1,"icon":"group1:M00/1F/69/wKgyJVrqpbiAXI7EAAAJhbCwNa4425.png","releaseFlag":1,"manageType":"client","roleType":"1","doctorManageType":""},{"id":"WYo0l73F8e","name":"健康上饶APP","secret":"7RUBMVGkkyLTAWXB","url":"www.shangraoapp.com","outUrl":"","creator":"0dae0003590016e5b3865e377b2f8615","auditor":null,"createTime":"2018-03-08 09:54:35","auditTime":null,"catalog":"ApplicationService","status":"Approved","description":"","tags":[],"org":"jkzl","code":"HealthyShangraoAPP","sourceType":1,"icon":"","releaseFlag":1,"manageType":"client","roleType":"0","doctorManageType":null},{"id":"zkGuSIm2Fg","name":"基础信息管理","secret":"gPdvTRAYUhskchxm","url":"http://192.168.220.70:8090/ehr/login/signin","outUrl":"http://jksr.srswjw.gov.cn:1235/ehr/login/signin","creator":"0dae0003590016e5b3865e377b2f8615","auditor":"0dae0003590016e5b3865e377b2f8615","createTime":"2017-07-21 13:57:51","auditTime":"2017-07-21 16:37:39","catalog":"MasterInfor","status":"Approved","description":"智慧医疗云管理后台","tags":["智慧，医疗云，总支撑，健康档案"],"org":"jkzl","code":"EHR","sourceType":1,"icon":"group1:M00/00/00/wKgyJVrYAyqAY0hdAAAGO5fOHCw028.png","releaseFlag":1,"manageType":"backStage","roleType":"1","doctorManageType":null}],"obj":0,"errorMsg":null,"errorCode":0};
                        if (res.successFlg) {
                            var data = res.detailModelList;
                            if (data) {
                                me.type = res.obj;
//                                me.initItmeHtml0(res.detailModelList);
                                me.initItmeHtml1(res.detailModelList);
                            } else {
                                art.dialog({
                                    title: "警告",
                                    time: 2,
                                    content: '返回数据有误'
                                });
                            }
                        } else {
                            art.dialog({
                                title: "警告",
                                time: 2,
                                content: res.message
                            });
                        }
                    })
                },
                getListArrData: function (t) {
                    var me = this, str = '';
                    switch (t) {
                        case 'DataCenter':
                            str = listArr[0];
                            break;
                        case 'MasterInfor':
                            str = listArr[1];
                            break;
                        case 'BusinessCollaboration':
                            str = listArr[2];
                            break;
                        case 'ApplicationService':
                            str = listArr[3];
                            break;
                    }
                    return str;
                },
                initItmeHtml1: function (data) {
                    var me = this;
                    var M_count=0;
                    $.each(data, function (k, da) {
//                        if(me.checkItem(da.id)){
                            var html="";
                            var $div=me.getListArrData(da.catalog);
                            var daclass=itemClass[da.catalog];
                            if(da.catalog=="MasterInfor"){
                                M_count++
                            }
                            if(da.catalog=="MasterInfor" && (da.id=="aikGiriuX0"||da.id=="VLho13abxY")){
                                _.extend(da,itemClass["MasterInfor1"])
                            }else{
                                _.extend(da,daclass)
                            }
                            var newHtml=_jsHelper.render(me.divItem, da, function ($1, d) {
                                if ($1 == 'gourl') {
                                    if (me.type == 1) {
                                        d[$1] = d.url;
                                    } else {
                                        d[$1] = d.outUrl;
                                    }
                                }else  if($1 == 'outclass1'){
                                    if(da.roleType=="0"){
                                        d["outclass1"] = "roletype";
                                    }
                                }else  if($1 == 'outstyle1'){
                                    if(da.roleType=="0"){
                                        d["outstyle1"]+="margin-top:-0.16rem;"
                                    }
                                }

                            });
                            if(da.catalog=="MasterInfor" && M_count==3){
                                html+= '<div class="w3-col" style="width:50%">'+newHtml+'</div>';
                            }else{
                                html+= newHtml;
                            }
//                            $div.find(".innerItem").append(html);
                            $("#"+da.id).append(newHtml);
                            $("#"+da.id).show();
//                        }
                    })
                    me.bindDataEvent();
                },
                initItmeHtml0: function (data) {
                    var me = this;
                    $.each(data, function (k, da) {
                        var html="";
                        var $div=me.getListArrData(da.code);
                        var daclass=itemClass[da.code];
                        if(da.children.length>0){
                            $.each(da.children,function (key,obj) {
                                if(me.checkItem(obj.id)){
                                    if(da.code=="MasterInfor" && key==2){
                                        _.extend(obj,itemClass["MasterInfor1"])
                                    }else{
                                        _.extend(obj,daclass)
                                    }
                                    var newHtml=_jsHelper.render(me.divItem, obj, function ($1, d) {
                                        if ($1 == 'gourl') {
                                            if (me.type == 1) {
                                                d[$1] = d.url;
                                            } else {
                                                d[$1] = d.outUrl;
                                            }
                                        }
                                    });
                                    if(da.code=="MasterInfor" && key==2){
                                        html+= '<div class="w3-col" style="width:50%">'+newHtml+'</div>';
                                    }else{
                                        html+= newHtml;
                                    }
                                }
                            })
                            $div.find(".innerItem").append(html);
                        }
                    })
                    me.bindDataEvent();
                },
                bindDataEvent: function () {
                    //数据控制事件
                    var me = this;
                    $(".clickdiv").on('click', function () {
                        var $me = $(this),
                            type = $me.attr('data-type'),
                            url = $me.attr('data-url'),
                            nav = $me.attr('data-id'),
                            name = $me.attr('data-name'),
                            cate = $me.attr('data-cate'),
                            judgeRole=$me.attr('data-role');
                        if(judgeRole=="0"){
                            $me.addClass("active")
                            me.judgeJurisdiction(nav);
                        }else{
                            sessionStorage.setItem("MenuName",name);
                            var turl = '${contextRoot}/newXZIndex?nav=' + nav + '&type=' + type + '&url=' + url+'&cate=' + cate;
                            var ourl = encodeURI(turl);
                            var surl = encodeURI(ourl);
                            window.open(surl, '_blank');
                        }
                    });
                    me.$homeItem.on('click', function () {
                        var $me = $(this),
                            url = $me.attr('data-url'),
                            nav = $me.attr('data-id'),
                            name = $me.attr('data-name');
                        window.open('${contextRoot}/newXZIndex?nav=' + nav + '&url=' + url, '_blank');
                    });
                    me.$userInfo.on('click', function () {
                        window.open('${contextRoot}/newXZIndex?nav=infoMain&url=doctor/infoMain', '_blank');
                    });
                    me.$loout.on('click', function () {
                        sessionStorage.clear();
//                        loading = artDialog({
//                            lock: true
//                        });
//                        loading.DOM.title.hide();
//                        loading.DOM.close.hide();
                        location.href = '${contextRoot}/logout';
                    });
                    me.$userItem.on('click',function (e) {
                       if(!$(this).hasClass("disabled")){
                            $(".home-down-con").toggle();
                           e.stopPropagation();
                       }
                    });
                    $(document).click(function() {
                        $(".home-down-con").hide();
                    });
                },
                getDictSetting:function(){
                    $.ajax({
                        type: "GET",
                        url: "${contextRoot}/noLandingResources/portalSetting/getLogoByDictAndEntryCode",
                        data: {"dictId":125,"dictEntryCode":"portalHomeLogo","type":1},
                        dataType: "json",
                        success: function(data) {
                            if(data.successFlg) {
                                $(".home-logo").css({
                                    "background": 'url(' + data.detailModelList[0].path + ') no-repeat',
                                    "background-size": "100% 100%"
                                });
                            }
                        }
                    });
                    $.ajax({
                        type: "GET",
                        url: "${contextRoot}/noLandingResources/portalSetting/getLogoByDictAndEntryCode",
                        data: {"dictId":184,"dictEntryCode":"technicalSupport","type":2},
                        dataType: "json",
                        success: function(data) {
                            if(data.successFlg){
                                $(".technicalSupport").html(data.obj.value);}else{$(".technicalSupport").html("健康之路（中国）信息技术有限公司");}
                        }
                    });
                    $.ajax({
                        type: "GET",
                        url: "${contextRoot}/noLandingResources/portalSetting/getLogoByDictAndEntryCode",
                        data: {"dictId":184,"dictEntryCode":"sponsor","type":2},
                        dataType: "json",
                        success: function(data) {
                            if(data.successFlg){
                                $(".sponsor").html(data.obj.value);}else{$(".sponsor").html("市卫生与计划生育委员会");}
                        }
                    });
                },
                checkItem:function (element) {
                    for (var i = 0; i < itemList.length; i++) {
                        if (itemList[i] == element) {
                            return true;
                        }
                    } return false;
                },
                judgeJurisdiction:function (nav) {
                    $.ligerDialog.open({
                        type: 'info',
                        content: '<div class="dialog-judge"><div class="warnning-icon"></div><div style="color:#323232;font-size: 0.1rem;">无权限</div><div style="color:#909090;padding-top: 0.02rem;">很抱歉，您暂无此功能的访问权限，请联系系统管理员</div></div>',
                        buttons: [{ text: '好的', onclick: function(item, dialog){
                            $("#"+nav).find(".clickdiv").removeClass("active");
                            dialog.close();
                        }}]
                    });
                    $(".l-dialog-winbtn").on("click", function(){
                        $("#"+nav).find(".clickdiv").removeClass("active");
                    });
                }
            };
            Home.init();
        });
    })(window, jQuery);
</script>