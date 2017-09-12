package com.yihu.ehr.portal.controller.function;

import com.yihu.ehr.portal.common.constant.ApiPrefix;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.function.StatisticsService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by wxw on 2017/9/12.
 */
@RequestMapping(ApiPrefix.Root)
@Controller
public class StatisticsController {

    @Autowired
    private StatisticsService statisticsService;

    @RequestMapping(value = "/archive/getArchiveReportInfo", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取健康档案图表", notes = "获取健康档案图表")
    public Result getArchiveReportInfo(String requestType) {
        return statisticsService.getArchiveReportInfo(requestType);
    }
}
