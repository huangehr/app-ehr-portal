package com.yihu.ehr.portal.controller.doctor;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yihu.ehr.portal.common.constant.ApiPrefix;
import com.yihu.ehr.portal.common.util.http.HttpHelper;
import com.yihu.ehr.portal.common.util.http.HttpResponse;
import com.yihu.ehr.portal.controller.common.BaseController;
import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.Result;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;


/**
 * 医生端系统页面
 * Created by hzp on 2017/2/21.
 */
@RequestMapping(ApiPrefix.Doctor)
@Controller
public class DoctorHomeController extends BaseController {


    /******************************** 页面 **********************************/
    @RequestMapping(value = "index",method = RequestMethod.GET)
    @ApiOperation("【页面】医生端首页完整")

    public String index(Model model)
    {
        try{
            model.addAttribute("contentPage","/doctor/index");
            return "crossView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }

    /*
    医生端首页
     */
    @RequestMapping(value = "home",method = RequestMethod.GET)
    @ApiOperation("【页面】医生端首页")
    public String home(Model model)
    {
        try{
            model.addAttribute("contentPage","/doctor/home");
            return "crossView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }

    /*
   首页对话框
    */
    @RequestMapping(value = "im/chatbox",method = RequestMethod.GET)
    @ApiOperation("【页面】医生端首页对话框")
    public String chatbox(Model model)
    {
        try{
            model.addAttribute("contentPage","/doctor/im/chatbox");
            return "crossView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }




    /******************************* 首页例子页面 *******************************************************/
    /*
    例子1
     */
    @RequestMapping(value = "demo/demo1",method = RequestMethod.GET)
    @ApiOperation("【页面】医生端例子1")
    public String demo1(Model model)
    {
        try{
            model.addAttribute("contentPage","/doctor/demo/demo1");
            return "crossView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }
    /*
    例子2
     */
    @RequestMapping(value = "demo/demo2",method = RequestMethod.GET)
    @ApiOperation("【页面】医生端例子2")
    public String demo2(Model model)
    {
        try{
            model.addAttribute("contentPage","/doctor/demo/demo2");
            return "crossView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }
    /*
   例子3
    */
    @RequestMapping(value = "demo/demo3",method = RequestMethod.GET)
    @ApiOperation("【页面】医生端例子3")
    public String demo3(Model model)
    {
        try{
            model.addAttribute("contentPage","/doctor/demo/demo3");
            return "crossView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }


    @Value("${service-gateway.portalUrl}")
    public String portalUrl;

    /******************************************* 首页请求 *************************************************************/
    @RequestMapping(value = "portalNoticesTop",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation("获取通知公告前10数据【Demo】")
    public Result portalNoticesTop()
    {
        try{
            HttpResponse response = HttpHelper.get(portalUrl  + "/doctor/portalNoticesTop", null, getHeader());
            if (response != null && response.getStatusCode() == 200) {
                //业务处理
                String re = response.getBody();
                ObjectMapper om = new ObjectMapper();
                return om.readValue(response.getBody(),ListResult.class);
            }
            else {
                return Result.error(response.getStatusCode(),response.getBody());
            }
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
            return Result.error(ex.getMessage());
        }
    }


    @RequestMapping(value = "homeMenu",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation("医生端首页菜单")
    public Result homeMenu()
    {
        try{

            return Result.success("");
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
            return Result.error(ex.getMessage());
        }
    }

}
