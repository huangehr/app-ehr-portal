package com.yihu.ehr.portal.controller.function;

import com.yihu.ehr.portal.common.constant.ApiPrefix;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.function.HealthBusinessService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/6/30.
 */
@RequestMapping(ApiPrefix.Doctor)
@Controller
public class HealthBusinessController {
    @Resource(name = HealthBusinessService.BEAN_ID)
    private HealthBusinessService healthBusinessService;

    @RequestMapping(value = "/getHealthBusinessOfChild", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取指标分类医疗服务子类目列表", notes = "获取指标分类医疗服务子类目列表")
    public Result getHealthBusinessOfChild() {

        return healthBusinessService.getHealthBusinessOfChild();
    }
}
