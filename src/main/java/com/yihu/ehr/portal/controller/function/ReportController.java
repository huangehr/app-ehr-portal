package com.yihu.ehr.portal.controller.function;

import com.yihu.ehr.portal.service.function.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by janseny on 2017/11/2.
 */
@RequestMapping("/doctor")
@Controller
public class ReportController {

    @Autowired
    private ReportService reportService;

    /**
     * 获取报表模版内容及其各个图形数据
     */
    @ResponseBody
    @RequestMapping("/getTemplateData")
    public Object getTemplateData(@RequestParam String reportCode) {
        return reportService.getTemplateData(reportCode);
    }

}
