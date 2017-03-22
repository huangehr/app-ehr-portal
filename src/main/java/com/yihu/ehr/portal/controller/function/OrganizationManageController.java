package com.yihu.ehr.portal.controller.function;

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
public class OrganizationManageController {


    /******************************** 页面 **********************************/
    @RequestMapping(value = "info",method = RequestMethod.GET)
    @ApiOperation("【页面】机构信息管理")
    public String info(Model model)
    {
        try{
            model.addAttribute("contentPage","/organization/info");
            return "crossView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }

    @RequestMapping(value = "manager",method = RequestMethod.GET)
    @ApiOperation("【页面】部门与人员管理")
    public String manager(Model model)
    {
        try{
            model.addAttribute("contentPage","/organization/manager");
            return "crossView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }

    @RequestMapping(value = "relation",method = RequestMethod.GET)
    @ApiOperation("【页面】上下级关系管理")
    public String relation(Model model)
    {
        try{
            model.addAttribute("contentPage","/organization/relation");
            return "crossView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }

    @RequestMapping(value = "deptRelation",method = RequestMethod.GET)
    @ApiOperation("【页面】上下级机构设置")
    public String deptRelation(Model model)
    {
        try{
            model.addAttribute("contentPage","/organization/deptRelation");
            return "crossView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }
}
