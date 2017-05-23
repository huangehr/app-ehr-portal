package com.yihu.ehr.portal.controller.system;

import com.yihu.ehr.portal.common.constant.ApiPrefix;
import com.yihu.ehr.portal.model.Result;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 系统用户管理页面
 * Created by hzp on 2017/2/24.
 */
@RequestMapping(ApiPrefix.System+"/userManage/")
@Controller
public class UserController {


    /******************************** 页面 **********************************/

    @RequestMapping(value = "userListPage",method = RequestMethod.GET)
    @ApiOperation("用户管理页面")
    public String userManage(Model model)
    {
        try{
            model.addAttribute("contentPage","/userManage/userListPage");
            return "pageView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }




}
