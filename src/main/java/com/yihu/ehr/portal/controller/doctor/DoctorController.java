package com.yihu.ehr.portal.controller.doctor;

import com.yihu.ehr.portal.common.constant.ApiPrefix;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.doctor.DoctorService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author HZY
 * @vsrsion 1.0
 * Created at 2017/2/22.
 */
@RequestMapping(ApiPrefix.Doctor)
@Controller
public class DoctorController {

    @Resource(name = DoctorService.BEAN_ID)
    private DoctorService doctorService;

        /* ******************************  页面接口  ********************************************* */


    //主页-个人信息
    @RequestMapping(value = "/infoMain", method = RequestMethod.GET)
    public String demoPage(Model model) {
        try {
            model.addAttribute("contentPage", "/doctor/info/infoMain");
            return "crossView";
        } catch (Exception ex) {
            model.addAttribute("errorMessage", ex.getMessage());
            return "errorPage";
        }
    }

    //个人信息-嵌入页
    @RequestMapping(value = "/infoPage", method = RequestMethod.GET)
    public String infoPage(Model model) {
        try {
            model.addAttribute("contentPage", "/doctor/info/info");
            return "crossView";
        } catch (Exception ex) {
            model.addAttribute("errorMessage", ex.getMessage());
            return "errorPage";
        }
    }


    /* ******************************  数据接口  ********************************************* */

    @RequestMapping(value = "/infoData", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "基本信息获取", produces = "application/json", notes = "基本信息获取")
    public Result infoData(
            @ApiParam(name = "userId", value = "用户ID", required = true)
            @RequestParam(value = "userId", required = true, defaultValue = "0dae000356bfda059b10c52338ddea55") String userId
    ) {
        return doctorService.getDoctorInfo(userId);
    }

    @RequestMapping(value = "/update", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value = "基本信息保存", produces = "application/json", notes = "基本信息保存")
    public Result updateDoctor(
            @ApiParam(name = "doctor", value = "doctor信息", required = true)
            @RequestParam(value = "doctor", required = true ) String doctor
    ) {
        return doctorService.updateDoctor(doctor);
    }


}
