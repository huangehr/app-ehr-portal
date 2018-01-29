package com.yihu.ehr.portal.controller.function;

import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.function.DoctorService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Base64;

/**
 * @author HZY
 * @vsrsion 1.0
 * Created at 2017/2/22.
 */
@Controller
@RequestMapping("/doctor")
public class DoctorController {

    @Autowired
    private DoctorService doctorService;

    /* ******************************  页面接口  ********************************************* */

    //主页-个人中心-模块页
    @RequestMapping(value = "/infoMain", method = RequestMethod.GET)
    public String infoMain(Model model) {
        try {
            model.addAttribute("contentPage", "/doctor/info/infoMain");
            return "crossView";
        } catch (Exception ex) {
            model.addAttribute("errorMessage", ex.getMessage());
            return "errorPage";
        }
    }

    //个人中心-个人信息嵌入页
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

    //个人信息-修改密码页
    @RequestMapping(value = "/resetPwdPage", method = RequestMethod.GET)
    public String resetPwdPage(Model model) {
        try {
            model.addAttribute("contentPage", "/doctor/info/resetPwd");
            return "crossView";
        } catch (Exception ex) {
            model.addAttribute("errorMessage", ex.getMessage());
            return "errorPage";
        }
    }

    @RequestMapping(value = "/suggestPage", method = RequestMethod.GET)
    public String suggestPage(Model model) {
        try {
            model.addAttribute("contentPage", "/doctor/info/suggest");
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
            @RequestParam(value = "userId", required = true) String userId) throws Exception {
        return doctorService.getDoctorInfo(userId);
    }

    @RequestMapping(value = "/getDoctorInfo", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "基本信息获取", produces = "application/json", notes = "基本信息获取")
    public Result getDoctorInfo(HttpSession session,
                           @ApiParam(name = "userId", value = "用户ID", required = true)
                           @RequestParam(value = "userId", required = true) String userId) throws Exception {
        Result result = doctorService.getDoctorInfo(userId,session);
        return result;
    }

    @RequestMapping(value = "/update", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value = "基本信息保存", produces = "application/json", notes = "基本信息保存")
    public Result updateDoctor(
            @ApiParam(name = "doctor", value = "doctor信息", required = true)
            @RequestParam(value = "doctor", required = true ) String doctor) throws Exception{
        return doctorService.updateDoctor(doctor);
    }

    @RequestMapping(value = "/resetPwd", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value = "修改用户密码", produces = "application/json", notes = "修改用户密码")
    public Result resetPwd(
            @ApiParam(name = "userId", value = "用户ID", required = true)
            @RequestParam(value = "userId") String userId,
            @ApiParam(name = "oldPassword", value = "旧密码", required = true)
            @RequestParam(value = "oldPassword") String oldPassword,
            @ApiParam(name = "password", value = "新密码", required = true)
            @RequestParam(value = "password") String password) throws Exception{
        return doctorService.resetPassWord(userId, password);
    }

    @RequestMapping(value = "/checkPwd",  method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "根据登陆用户名及密码验证用户", produces = "application/json", notes = "根据登陆用户名及密码验证用户")
    public Result checkPwd(
            @ApiParam(name = "password", value = "密码", required = true)
            @RequestParam(value = "password") String password) throws Exception {
        return doctorService.checkPassWord( password);
    }

    @RequestMapping(value = "/sendSuggest", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value = "发送意见反馈", produces = "application/json", notes = "发送意见反馈")
    public Result sendSuggest(
            @ApiParam(name = "userId", value = "用户ID", required = true)
            @RequestParam(value = "userId", required = true) String userId,
            @ApiParam(name = "content", value = "反馈信息", required = true)
            @RequestParam(value = "content", required = true ) String content) throws Exception {
        return doctorService.sendSuggest(userId,content);
    }

    @RequestMapping("/showImage")
    @ResponseBody
    public void showImage(String timestamp, HttpSession session, HttpServletResponse response) throws Exception {
        response.setContentType("text/html; charset=UTF-8");
        response.setContentType("image/jpeg");
        OutputStream outputStream = null;
        String fileStream = (String) session.getAttribute("userImageStream");
        try {
            outputStream = response.getOutputStream();
            byte[] bytes = Base64.getDecoder().decode(fileStream);
            outputStream.write(bytes);
            outputStream.flush();
        } finally {
            if (outputStream != null) {
                outputStream.close();
            }
        }
    }

}
