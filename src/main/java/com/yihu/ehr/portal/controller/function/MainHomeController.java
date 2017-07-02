package com.yihu.ehr.portal.controller.function;

import com.yihu.ehr.portal.common.constant.ApiPrefix;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.function.DoctorService;
import com.yihu.ehr.portal.service.function.MainHomeService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by JKZL-A on 2017/7/2.
 */
@RequestMapping(ApiPrefix.System+"/quota/tj/")
@Controller
public class MainHomeController {
    @Resource(name= MainHomeService.BEAN_ID)
    private MainHomeService mainHomeService;

    @RequestMapping(value = "getQuotaReport", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取指标统计报表", produces = "application/json", notes = "获取指标统计报表")
    public Result getQuotaReport(@ApiParam(name = "id", value = "ID", required = true)
                                @RequestParam(value = "id", required = true) int id,
                                @ApiParam(name = "filters", value = "filters", required = false)
                                @RequestParam(value = "filters", required = false) String filters) {
        Result result=mainHomeService.getQuotaReport( id, filters);
        return result;
    }

    @RequestMapping(value = "getTjQuotaWarn", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取预警列表", produces = "application/json", notes = "获取预警列表")
    public Result getTjQuotaWarn(@ApiParam(name = "userId", value = "userId", required = true)
                                 @RequestParam(value = "userId", required = true) String userId) {
        Result result=mainHomeService.getTjQuotaWarn( userId);
        return result;
    }


}
