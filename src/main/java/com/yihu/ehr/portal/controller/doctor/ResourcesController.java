package com.yihu.ehr.portal.controller.doctor;

import com.yihu.ehr.portal.common.constant.ApiPrefix;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.doctor.ResourcesService;
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
 * @author HZY
 * @vsrsion 1.0
 * Created at 2017/2/22.
 */
@RequestMapping(ApiPrefix.Doctor)
@Controller
public class ResourcesController {
    @Resource(name = ResourcesService.BEAN_ID)
    private ResourcesService resourcesService;

    @RequestMapping(value = "resources",method = RequestMethod.GET)
    public String login(Model model)
    {
        try{
            model.addAttribute("title","资源");
            model.addAttribute("contentPage","protal/resources/notice");
            return "crossView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }

    /* ******************************  数据接口  ********************************************* */
    @RequestMapping(value = "/resourcesList", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "资源信息列表的获取", produces = "application/json", notes = "资源信息列表的获取")
    public Result infoData(){
        return resourcesService.getResourcesList();
    }

    @RequestMapping(value = "/resources/info", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "资源基本信息的获取", produces = "application/json", notes = "资源基本信息的获取")
    public Result updateDoctor(
            @ApiParam(name = "resourcesId", value = "资源的ID", required = true)
            @RequestParam(value = "resourcesId") String resourcesId) {

        return resourcesService.getResourcesInfo(resourcesId);
    }
}
