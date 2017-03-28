package com.yihu.ehr.portal.controller.function;

import com.yihu.ehr.portal.common.constant.ApiPrefix;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.function.AppService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;


/**
 * 系统用户管理页面
 * Created by hzp on 2017/2/24.
 */
@RequestMapping(ApiPrefix.System)
@Controller
public class SystemHomeController {

    @Resource(name = AppService.BEAN_ID)
    private AppService appService;


    /******************************** 页面 **********************************/
    @RequestMapping(value = "home",method = RequestMethod.GET)
    @ApiOperation("【页面】后台系统管理首页")
    public String home(Model model)
    {
        try{
            model.addAttribute("contentPage","/system/home");
            return "crossView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }





    /******************************************* 首页请求 *************************************************************/

    @RequestMapping(value = "homeMenu",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation("后台管理系统首页菜单")
    public Result demo3()
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




    @RequestMapping(value = "/getUserApps", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "应用列表", produces = "application/json", notes = "应用列表")
    public Result getUserApps(
            @ApiParam(name = "userId", value = "用户ID",defaultValue = "")
            @RequestParam(value = "userId", required = false) String userId
    ) {
        return appService.getUserApps(userId);
    }

}
