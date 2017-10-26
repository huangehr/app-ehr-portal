<%--
  Created by IntelliJ IDEA.
  User: JKZL-A
  Date: 2017/9/27
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/commonInclude.jsp" %>

<style>
    html,body{height: 100%}
    .m-body{position: absolute;top: 0px;left: 0px;right:0px;bottom:0px;overflow: auto;padding: 10px;background: #fff;border: 1px solid #ccc;}
    .m-item{border-bottom: 1px solid #ccc;position: relative;overflow: hidden}
    .m-i-left{text-align: center;padding: 20px 40px;position: absolute;left: 0;top: 50%;
        -webkit-transform: translateY(-50%);
        -moz-transform: translateY(-50%);
        -ms-transform: translateY(-50%);
        -o-transform: translateY(-50%);
        transform: translateY(-50%);}
    .m-i-left p{padding-top: 30px;font-size: 18px;}
    .m-i-right{min-height: 248px;padding-left: 176px;}
    .m-i-item{width: 230px;display: inline-block;margin-top: 20px;margin-right: 35px;padding-bottom: 20px;vertical-align: middle;}
    .m-i-item img{width: 32px;height: 32px;vertical-align: middle}
    .m-i-item span{width: 118px;display: inline-block;vertical-align: middle;overflow: hidden;padding: 0 10px;white-space: nowrap;font-size: 16px;/*color: #20ABDF*/}
    .m-i-item a{color: #000;}
    /*.m-i-item a:hover{color: #ccc;}*/
    .m-i-item a.m-i-i-a{display: inline-block;vertical-align: middle;color: #000;text-decoration: none;}
    .m-i-item a.m-i-i-a:active{color: #ccc;text-decoration: none;}
    .m-i-item p{height: 46px;padding-top: 10px;font-size: 14px;/*color: #15AAEA*/    overflow: hidden;}
</style>

<%--show--%>
<div class="m-body">
    <ul id="listMain">
        <%--item--%>
    </ul>
</div>

<%--item template--%>
<script type="text/html" id="itemTmp">
    <li class="m-item">
        <div class="m-i-left">
            <img src="{{imgUrl}}" alt="{{value}}">
            <p>{{value}}</p>
        </div>
        <div class="m-i-right">
            <ul>
                {{content}}
            </ul>
        </div>
    </li>
</script>

<%--item content template--%>
<script type="text/html" id="itemITmp">
    <li class="m-i-item">
        <a href="javascript:;" class="m-i-i-a" data-url="{{gourl}}" data-type="{{manageType}}" data-id="{{id}}" data-name="{{name}}">
            <img src="{{icon}}" alt="">
            <span>{{name}}</span>
            <p>{{description}}</p>
        </a>
    </li>
</script>