package com.yihu.ehr.portal.controller.function;

import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.function.PortalSettingService;
import com.yihu.ehr.portal.service.function.ResourcesService;
import com.yihu.ehr.util.rest.Envelop;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;

/**
 * @author HZY
 * @vsrsion 1.0
 * Created at 2017/2/22.
 * 免登陆接口--登录页logo, 下载中心
 */
@RequestMapping("/noLandingResources")
@Controller
public class ResourcesController {
    @Autowired
    private ResourcesService resourcesService;
    @Autowired
    private PortalSettingService portalSettingService;

    @RequestMapping(value = "/resource",method = RequestMethod.GET)
    public String login(Model model) {
        model.addAttribute("title","资源");
        model.addAttribute("contentPage","doctor/resource/resourceCenter");
        return "crossView";
    }

    //资源中心主题内容
    @RequestMapping(value = "/resource/resCenCon",method = RequestMethod.GET)
    public String resourceCenterCon(Model model) {
        model.addAttribute("title","资源");
        model.addAttribute("contentPage","doctor/resource/resourceCenterCon");
        return "crossView";
    }

    /* ******************************  数据接口  ********************************************* */
    @RequestMapping(value = "/resourcesList", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "资源信息列表的获取", produces = "application/json", notes = "资源信息列表的获取")
    public Result infoData() throws Exception{
        return resourcesService.getResourcesList();
    }

    @RequestMapping(value = "/resources/info", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "资源基本信息的获取", produces = "application/json", notes = "资源基本信息的获取")
    public Result updateDoctor(
            @ApiParam(name = "resourcesId", value = "资源的ID", required = true)
            @RequestParam(value = "resourcesId") String resourcesId) throws Exception{
        return resourcesService.getResourcesInfo(resourcesId);
    }

    @RequestMapping(value = "/resources/uploadFile", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    public void uploadFile(String storagePath,HttpServletResponse response) throws Exception {
         resourcesService.getResourcesuploadFile(storagePath,response);
    }

    @RequestMapping(value = "/portalSetting/getLogoByDictAndEntryCode",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "云门户/基础支撑LOGO获取")
    public Envelop getLogoByDictAndEntryCode(
            @ApiParam(name = "dictId", value = "字典id", required = true)
            @RequestParam(value = "dictId", required = true) long dictId,
            @ApiParam(name = "dictEntryCode", value = "字典项编码", required = true)
            @RequestParam(value = "dictEntryCode", required = true) String dictEntryCode,
            @ApiParam(name = "type", value = "1代表获取logo，2代表主办方文字", required = true)
            @RequestParam(value = "type", required = true) String type) throws Exception{
        return portalSettingService.getLogoByDictAndEntryCode(dictId,dictEntryCode,type);
    }

}
