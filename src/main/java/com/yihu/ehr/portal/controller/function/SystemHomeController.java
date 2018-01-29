package com.yihu.ehr.portal.controller.function;

import com.yihu.ehr.portal.controller.common.BaseController;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.function.AppService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;


/**
 * 系统用户管理页面
 * Created by hzp on 2017/2/24.
 */
@Controller
@RequestMapping("/system")
public class SystemHomeController extends BaseController{

    @Autowired
    private AppService appService;

    /******************************** 页面 **********************************/
    @RequestMapping(value = "dataCenterMainHome",method = RequestMethod.GET)
    @ApiOperation("【页面】数据中心管理首页")
    public String dataCenterMainHome(Model model) {
        model.addAttribute("contentPage","/dataCenterMainHome");
        return "pageView";
    }

    /******************************** 页面 **********************************/
    @RequestMapping(value = "echartsTemplate",method = RequestMethod.GET)
    @ApiOperation("【页面】模板页")
    public String echartsTemplate(Model model) {
        model.addAttribute("contentPage","/echartsTemplate");
        return "pageView";
    }

    /******************************** 页面 **********************************/
    @RequestMapping(value = "mainHome",method = RequestMethod.GET)
    @ApiOperation("【页面】基础支撑管理首页")
    public String mainHome(Model model) {
        model.addAttribute("contentPage","/mainHome");
        return "pageView";
    }

    /******************************** 页面 **********************************/
    @RequestMapping(value = "noData",method = RequestMethod.GET)
    @ApiOperation("【页面】后台系统管理首页")
    public String noData(Model model) {
        model.addAttribute("contentPage","/noData");
        return "pageView";
    }





    /******************************************* 首页请求 *************************************************************/

    @RequestMapping(value = "homeMenu",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation("后台管理系统首页菜单")
    public Result demo3() {
        return Result.success("");
    }

    @RequestMapping(value = "/getUserApps", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "应用列表", produces = "application/json", notes = "应用列表")
    public Result getUserApps(
            @ApiParam(name = "userId", value = "用户ID")
            @RequestParam(value = "userId", required = false) String userId) throws Exception {
        return appService.getUserApps(userId);
    }

}
