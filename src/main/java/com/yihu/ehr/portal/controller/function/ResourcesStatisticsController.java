package com.yihu.ehr.portal.controller.function;

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
@Controller
//资源中心首页统计  控制入口
public class ResourcesStatisticsController {

    @Autowired
    private StatisticsService statisticsService;

    @RequestMapping(value = "/stasticReport/getArchiveReportInfo", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取健康档案图表", notes = "获取健康档案图表")
    public Result getArchiveReportInfo(String requestType) throws Exception {
        return statisticsService.getArchiveReportInfo(requestType);
    }

    @RequestMapping(value = "/stasticReport/getStatisticsElectronicMedicalCount", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "电子病历-最近七天采集总数统计，门诊住院数", notes = "电子病历-最近七天采集总数统计，门诊住院数")
    public Result getStatisticsElectronicMedicalCount( ) throws Exception {
        String url = "/stasticReport/getStatisticsElectronicMedicalCount";
        return statisticsService.getStatisticsData(url);
    }

    @RequestMapping(value = "/stasticReport/getStatisticsMedicalEventTypeCount", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "电子病历 - 今天 门诊住院数统计", notes = "电子病历 - 今天 门诊住院数统计")
    public Result getStatisticsMedicalEventTypeCount( ) throws Exception{
        String url = "/stasticReport/getStatisticsMedicalEventTypeCount";
        return statisticsService.getStatisticsData(url);
    }

    @RequestMapping(value = "/stasticReport/getStatisticsDemographicsAgeCount", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "全员人口个案库 - 年龄段人数统计", notes = "全员人口个案库 - 年龄段人数统计")
    public Result getStatisticsDemographicsAgeCount( ) throws Exception {
        String url = "/stasticReport/getStatisticsDemographicsAgeCount";
        return statisticsService.getStatisticsData(url);
    }

    @RequestMapping(value = "/stasticReport/getStatisticsUserCards", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取健康卡绑定量", notes = "获取健康卡绑定量")
    public Result getStatisticsUserCards( ) throws Exception {
        String url = "/tj/getStatisticsUserCards";
        return statisticsService.getStatisticsData(url);
    }

    @RequestMapping(value = "/stasticReport/getStatisticsDoctorByRoleType", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "按机构医生、护士、床位的统计", notes = "按机构医生、护士、床位的统计")
    public Result getStatisticsDoctorByRoleType( ) throws Exception {
        String url = "/tj/getStatisticsDoctorByRoleType";
        return statisticsService.getStatisticsData(url);
    }

    @RequestMapping(value = "/stasticReport/getStatisticsCityDoctorByRoleType", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "全市医生、护士、床位的统计", notes = "全市医生、护士、床位的统计")
    public Result getStatisticsCityDoctorByRoleType( ) throws Exception{
        String url = "/tj/getStatisticsCityDoctorByRoleType";
        return statisticsService.getStatisticsData(url);
    }


}
