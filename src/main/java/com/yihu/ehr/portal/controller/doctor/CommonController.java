package com.yihu.ehr.portal.controller.doctor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * 医生端系统页面
 * Created by hzp on 2017/2/21.
 */
@RequestMapping("/doctor")
@Controller
public class CommonController {


    /******************************** 页面 **********************************/
    /*
    系统参数页面
     */
    @RequestMapping(value = "index",method = RequestMethod.GET)
    public String paramManager(Model model)
    {
        try{
            model.addAttribute("contentPage","index");
            return "doctorPageView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }


}
