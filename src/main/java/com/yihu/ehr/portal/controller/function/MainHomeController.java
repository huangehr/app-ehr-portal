package com.yihu.ehr.portal.controller.function;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.function.MainHomeService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by JKZL-A on 2017/7/2.
 */
@Controller
@RequestMapping("/system/quota/tj/")
public class MainHomeController {

    @Autowired
    private MainHomeService mainHomeService;
    @Autowired
    private ObjectMapper objectMapper;

    @RequestMapping(value = "getQuotaReport", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取指标统计报表", produces = "application/json", notes = "获取指标统计报表")
    public Result getQuotaReport(
            @ApiParam(name = "id", value = "ID", required = true)
            @RequestParam(value = "id", required = true) int id,
            @ApiParam(name = "开始时间", value = "startTime", required = false)
            @RequestParam(value = "startTime", required = false) String startTime,
            @ApiParam(name = "结束时间", value = "endTime", required = false)
            @RequestParam(value = "endTime", required = false) String endTime,
            @ApiParam(name = "就诊类型", value = "1 住院 0 门诊", required = false)
            @RequestParam(value = "eventType", required = false) String eventType) throws Exception {
        Map<String,String> parm = new HashMap<>();
        parm.put("id",String.valueOf(id));
        if(!StringUtils.isEmpty(startTime)){
            parm.put("startTime",startTime);
        }
        if(!StringUtils.isEmpty(startTime)){
            parm.put("endTime",endTime);
        }
        if(!StringUtils.isEmpty(startTime)){
            parm.put("slaveKey1",eventType);
        }
        Result result = mainHomeService.getQuotaReport( id, objectMapper.writeValueAsString(parm));
        return result;
    }

    @RequestMapping(value = "getTjQuotaWarn", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取预警列表", produces = "application/json", notes = "获取预警列表")
    public Result getTjQuotaWarn(
            @ApiParam(name = "userId", value = "userId", required = true)
            @RequestParam(value = "userId", required = true) String userId) throws Exception {
        Result result = mainHomeService.getTjQuotaWarn( userId);
        return result;
    }

    @RequestMapping(value = "getQuotaCategoryOfChild", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取指标分类医疗服务子类目列表", produces = "application/json", notes = "获取指标分类医疗服务子类目列表")
    public Result getQuotaCategoryOfChild() throws Exception {
        Result result = mainHomeService.getQuotaCategoryOfChildList();
        return result;
    }

}
