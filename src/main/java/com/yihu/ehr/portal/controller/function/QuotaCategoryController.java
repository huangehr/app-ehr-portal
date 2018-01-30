package com.yihu.ehr.portal.controller.function;

import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.function.QuotaCategoryService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by wxw on 2017/8/31.
 */
@RequestMapping("/doctor")
@Controller
public class QuotaCategoryController {

    @Autowired
    private QuotaCategoryService quotaCategoryService;

    @RequestMapping(value = "/getQuotaCategoryOfChild", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取指标分类医疗服务子类目列表", notes = "获取指标分类医疗服务子类目列表")
    public Result getQuotaCategoryOfChild() throws Exception {
        return quotaCategoryService.getQuotaCategoryOfChild();
    }
}
