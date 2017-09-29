package com.yihu.ehr.portal.controller.common;

import com.yihu.ehr.portal.common.constant.ApiPrefix;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.BaseService;
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
 * 系统页面
 * Created by hzp on 2017/2/21.
 */
@RequestMapping(ApiPrefix.Root)
@Controller
public class CommonController {

    @Resource(name = BaseService.BEAN_ID)
    private BaseService baseService;

    /******************************** 页面 **********************************/
    /*
    系统参数页面
     */
    @RequestMapping(value = "index",method = RequestMethod.GET)
    public String index(int activeIndex,int headIndex,Model model)
    {
        try{
            model.addAttribute("title","健康之路");
            model.addAttribute("activeIndex",activeIndex);
            model.addAttribute("headIndex",headIndex);
            model.addAttribute("contentPage","index");
            return "crossView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }
    /*
        系统参数页面
         */
    @RequestMapping(value = "appIndex",method = RequestMethod.GET)
    public String appIndex(String nav, String name, Model model)
    {
        try{
            model.addAttribute("nav", nav);
            model.addAttribute("name", name);
            model.addAttribute("contentPage","appIndex");
            return "crossView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }
    /*
    系统参数页面
     */
    @RequestMapping(value = "xzIndex",method = RequestMethod.GET)
    public String xzIndex(Model model)
    {
        try{
            model.addAttribute("title","健康之路");
            model.addAttribute("contentPage","xzIndex");
            return "crossView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }



    /*
    系统参数页面
     */
    @RequestMapping(value = "newXZIndex",method = RequestMethod.GET)
    public String newXZIndex(String nav, Model model)
    {
        try{
            model.addAttribute("title","健康之路");
            model.addAttribute("nav",nav);
            model.addAttribute("contentPage","newXZIndex");
            return "crossView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }

    /*
    系统参数页面
     */
    @RequestMapping(value = "main",method = RequestMethod.GET)
    public String getMain(Model model)
    {
        try{
            model.addAttribute("title","健康之路");
            model.addAttribute("contentPage","main");
            return "crossView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }


    @RequestMapping(value = "/provinces", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取省列表数据", produces = "application/json", notes = "获取省列表数据")
    public Result provinces(
            @ApiParam(name = "level", value = "等级", required = true)
            @RequestParam(value = "level", required = true, defaultValue = "1") Integer level
    ) {
        return baseService.getProvinces(level);
    }

    @RequestMapping(value = "/citys", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取市列表数据", produces = "application/json", notes = "获取市列表数据")
    public Result citys(
            @ApiParam(name = "pid", value = "父级ID", required = true)
            @RequestParam(value = "pid", required = true, defaultValue = "") Integer pid
    ) {
        return baseService.getCitys(pid);
    }

    @RequestMapping(value = "/dictName", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取字典值数据", produces = "application/json", notes = "根据字典ID获取字典值数据")
    public Result getNameById(
            @ApiParam(name = "id", value = "字典ID", required = true)
            @RequestParam(value = "id", required = true, defaultValue = "") Integer id
    ) {
        return baseService.getDictNameById(id);
    }

}
