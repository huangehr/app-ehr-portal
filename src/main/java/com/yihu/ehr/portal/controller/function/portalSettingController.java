package com.yihu.ehr.portal.controller.function;

import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.function.PortalSettingService;
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

/**
 * @author HZY
 * @vsrsion 1.0
 * Created at 2017/2/22.
 */
@RequestMapping("/doctor")
@Controller
public class portalSettingController {

    @Autowired
    private PortalSettingService portalSettingService;
    @RequestMapping(value = "portalSetting",method = RequestMethod.GET)
    public String login(Model model) {
        model.addAttribute("title","门户配置");
        model.addAttribute("contentPage","doctor/portalSetting/portalSetting");
        return "crossView";
    }

    /* ******************************  数据接口  ********************************************* */
    @RequestMapping(value = "/getPortalSettingList", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "门户配置信息列表的获取", produces = "application/json", notes = "门户配置信息列表的获取")
    public Result infoData() throws Exception {
        return portalSettingService.getPortalSettingList();
    }


    @RequestMapping(value = "portalSetting/getLogoByDictAndEntryCode",method = RequestMethod.GET)
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
