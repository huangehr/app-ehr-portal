package com.yihu.ehr.portal.controller.doctor;

import com.yihu.ehr.portal.common.constant.ApiPrefix;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * 医生端系统页面
 * Created by hzp on 2017/2/21.
 */
@RequestMapping(ApiPrefix.Doctor)
@Controller
public class HomeController {


    /******************************** 页面 **********************************/
    /*
    医生端首页
     */
    @RequestMapping(value = "home",method = RequestMethod.GET)
    public String home(Model model)
    {
        try{
            model.addAttribute("contentPage","home");
            return "doctorPageView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }

    /*
   首页对话框
    */
    @RequestMapping(value = "im/chatbox",method = RequestMethod.GET)
    public String chatbox(Model model)
    {
        try{
            model.addAttribute("contentPage","im/chatbox");
            return "doctorPageView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }
}
