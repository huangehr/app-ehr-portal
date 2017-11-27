package com.yihu.ehr.portal.controller.function;

import com.yihu.ehr.portal.common.constant.ApiPrefix;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.function.ReportService;
import com.yihu.ehr.portal.service.function.ResourcesService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by janseny on 2017/11/2.
 */
@RequestMapping(ApiPrefix.Doctor)
@Controller
public class ReportController {

    @Autowired
    private ReportService reportService;

    /**
     * 获取报表模版内容及其各个图形数据
     */
    @RequestMapping("/getTemplateData")
    @ResponseBody
    public Object getTemplateData(@RequestParam String reportCode, HttpServletRequest request) {
        return reportService.getTemplateData(reportCode);
    }

}
