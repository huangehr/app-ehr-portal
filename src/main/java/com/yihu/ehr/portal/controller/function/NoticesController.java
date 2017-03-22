package com.yihu.ehr.portal.controller.function;

import com.yihu.ehr.portal.common.constant.ApiPrefix;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.function.NoticesService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @author HZY
 * @vsrsion 1.0
 * Created at 2017/2/22.
 */
@RequestMapping(ApiPrefix.Doctor)
@Controller
public class NoticesController {
    @Resource(name = NoticesService.BEAN_ID)
    private NoticesService noticesService;


    //公告列表
    @RequestMapping(value = "/notices/notice",method = RequestMethod.GET)
    public String notice(String userType,Model model)
    {
        try{
            model.addAttribute("title","公告");
            model.addAttribute("userType",userType);
            model.addAttribute("contentPage","doctor/notices/notice");
            return "crossView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }
    //公告详情
    @RequestMapping(value = "/notices/noticeInfo",method = RequestMethod.GET)
    public String noticeInfo(String noticeId, Model model)
    {
        try{
            model.addAttribute("title","公告");
            model.addAttribute("noticeId",noticeId);
            model.addAttribute("contentPage","doctor/notices/noticeInfo");
            return "crossView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }

    /* ******************************  数据接口  ********************************************* */
    @RequestMapping(value = "/getNotices", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "公告信息列表的获取", produces = "application/json", notes = "公告信息列表的获取")
    public Result infoData(HttpServletRequest request,
            @ApiParam(name = "userType", value = "用户类型", required = true)
            @RequestParam(value = "userType") String userType
    ) {
        return noticesService.getNoticesList(request ,userType);
    }

    @RequestMapping(value = "/notice/info", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "公告基本信息的获取", produces = "application/json", notes = "公告基本信息的获取")
    public Result updateDoctor(
            @ApiParam(name = "noticeId", value = "公告的ID", required = true)
            @RequestParam(value = "noticeId") String noticeId) {

        return noticesService.getNoticeInfo(noticeId);
    }
}