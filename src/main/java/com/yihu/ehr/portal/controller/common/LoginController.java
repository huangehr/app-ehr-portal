package com.yihu.ehr.portal.controller.common;

import com.yihu.ehr.portal.common.constant.ApiPrefix;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.LoginService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;


/**
 * 系统页面
 * Created by hzp on 2017/2/21.
 */
@RequestMapping(ApiPrefix.Root + "login")
@Controller
public class LoginController {

    @Resource(name = LoginService.BEAN_ID)
    private LoginService loginService;
    /*
    登录页面
     */
    @RequestMapping(value = "",method = RequestMethod.GET)
    public String login(Model model)
    {
        try{
            model.addAttribute("title","登录页面");
            model.addAttribute("contentPage","login");
            return "crossView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }

    /*
   登录页面
    */
    @RequestMapping(value = "login",method = RequestMethod.GET)
    @ApiOperation(value = "用户登录验证", notes = "用户登录验证")
    Result getUserByNameAndPassword(
            @ApiParam(name = "userName", value = "登录账号", defaultValue = "")
            @RequestParam(value = "userName") String userName,
            @ApiParam(name = "password", value = "密码", defaultValue = "")
            @RequestParam(value = "password") String password) {
            return loginService.getUserByNameAndPassword(userName, password);
    }
}
