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
//资源中心首页统计  控制入口
public class ResourcesStatisticsController {

    @Autowired
    private StatisticsService statisticsService;

    @RequestMapping(value = "/stasticReport/getArchiveReportInfo", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取健康档案图表", notes = "获取健康档案图表")
    public Result getArchiveReportInfo(String requestType) {
        return statisticsService.getArchiveReportInfo(requestType);
    }

    @RequestMapping(value = "/stasticReport/getStatisticsElectronicMedicalCount", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "", notes = "")
    public Result getStatisticsElectronicMedicalCount( ) {
        String url = "/archive/getStatisticsElectronicMedicalCount";
        return statisticsService.getStatisticsData(url);
    }

    @RequestMapping(value = "/stasticReport/getStatisticsMedicalEventTypeCount", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "", notes = "")
    public Result getStatisticsMedicalEventTypeCount( ) {
        String url = "/archive/getStatisticsMedicalEventTypeCount";
        return statisticsService.getStatisticsData(url);
    }

    @RequestMapping(value = "/stasticReport/getStatisticsDemographicsAgeCount", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "", notes = "")
    public Result getStatisticsDemographicsAgeCount( ) {
        String url = "/archive/getStatisticsDemographicsAgeCount";
        return statisticsService.getStatisticsData(url);
    }


}
