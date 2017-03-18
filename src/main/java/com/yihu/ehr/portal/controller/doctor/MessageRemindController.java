package com.yihu.ehr.portal.controller.doctor;

import com.yihu.ehr.portal.common.constant.ApiPrefix;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.doctor.MessageRemindService;
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
public class MessageRemindController {
    @Resource(name = MessageRemindService.BEAN_ID)
    private MessageRemindService messageRemindService;

    @RequestMapping(value = "messageRemind",method = RequestMethod.GET)
    public String login(Model model)
    {
        try{
            model.addAttribute("title","消息提醒");
            model.addAttribute("contentPage","protal/messageRemind/messageRemind");
            return "crossView";
        }
        catch (Exception ex)
        {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }

    /* ******************************  数据接口  ********************************************* */
    @RequestMapping(value = "/messageRemindList", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "消息提醒信息列表的获取", produces = "application/json", notes = "消息提醒信息列表的获取")
    public Result infoData(
            @ApiParam(name = "userId", value = "用户ID", required = true)
            @RequestParam(value = "userId") String userId )
    {

        return messageRemindService.getMessageRemindList(userId);
    }

    @RequestMapping(value = "/messageRemind/info", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "消息提醒信息的获取", produces = "application/json", notes = "消息提醒信息的获取")
    public Result getMessageRemindInfo(
            @ApiParam(name = "messageRemindId", value = "消息提醒的ID", required = true)
            @RequestParam(value = "messageRemindId") String messageRemindId) {
        return messageRemindService.getMessageRemindInfo(messageRemindId);
    }

    @RequestMapping(value = "/messageRemindCount", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "消息提醒信息的个数", produces = "application/json", notes = "消息提醒信息的获取")
    public Result getMessageRemingdCount(
            @ApiParam(name = "userId", value = "用户ID", required = true)
            @RequestParam(value = "userId") String userId
    ) {
        return messageRemindService.getMessageRemindCount(userId);
    }
}
