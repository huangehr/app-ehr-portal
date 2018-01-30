package com.yihu.ehr.portal.controller.function;

import com.yihu.ehr.portal.model.Result;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 *  机构管理页面
 * Created by hzp on 2017/2/28.
 */
@Controller
@RequestMapping("/organization")
public class OrganizationHomeController {


    /******************************** 页面 **********************************/
    @RequestMapping(value = "home", method = RequestMethod.GET)
    @ApiOperation("【页面】机构管理首页")
    public String home(Model model) {
        model.addAttribute("contentPage","/organization/home");
        return "crossView";
    }

    /******************************************* 首页请求 *************************************************************/
    @RequestMapping(value = "homeMenu", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation("机构管理菜单")
    public Result homeMenu() {
        return Result.success("");
    }

}
