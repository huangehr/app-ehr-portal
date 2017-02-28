package com.yihu.ehr.portal.controller.organization;

import com.yihu.ehr.portal.common.constant.ApiPrefix;
import com.yihu.ehr.portal.model.Result;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 *  机构管理页面
 * Created by hzp on 2017/2/28.
 */
@RequestMapping(ApiPrefix.Organization)
@Controller
public class OrganizationHomeController {


    /******************************** 页面 **********************************/
    @RequestMapping(value = "home",method = RequestMethod.GET)
    @ApiOperation("【页面】机构管理首页")
    public String home(Model model)
    {
        try{
            model.addAttribute("contentPage","/organization/home");
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
    @ApiOperation("机构管理菜单")
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
