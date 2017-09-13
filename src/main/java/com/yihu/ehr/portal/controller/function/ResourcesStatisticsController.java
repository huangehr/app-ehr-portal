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
    @ApiOperation(value = "电子病历-最近七天采集总数统计，门诊住院数", notes = "电子病历-最近七天采集总数统计，门诊住院数")
    public Result getStatisticsElectronicMedicalCount( ) {
        String url = "/archive/getStatisticsElectronicMedicalCount";
        return statisticsService.getStatisticsData(url);
    }

    @RequestMapping(value = "/stasticReport/getStatisticsMedicalEventTypeCount", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "电子病历 - 今天 门诊住院数统计", notes = "电子病历 - 今天 门诊住院数统计")
    public Result getStatisticsMedicalEventTypeCount( ) {
        String url = "/archive/getStatisticsMedicalEventTypeCount";
        return statisticsService.getStatisticsData(url);
    }

    @RequestMapping(value = "/stasticReport/getStatisticsDemographicsAgeCount", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "全员人口个案库 - 年龄段人数统计", notes = "全员人口个案库 - 年龄段人数统计")
    public Result getStatisticsDemographicsAgeCount( ) {
        String url = "/archive/getStatisticsDemographicsAgeCount";
        return statisticsService.getStatisticsData(url);
    }


}
