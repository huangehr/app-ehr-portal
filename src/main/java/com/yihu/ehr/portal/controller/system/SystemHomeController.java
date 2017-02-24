package com.yihu.ehr.portal.controller.system;

import com.yihu.ehr.portal.common.constant.ApiPrefix;
import com.yihu.ehr.portal.model.Result;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 系统用户管理页面
 * Created by hzp on 2017/2/24.
 */
@RequestMapping(ApiPrefix.System)
@Controller
public class SystemHomeController {


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

}
