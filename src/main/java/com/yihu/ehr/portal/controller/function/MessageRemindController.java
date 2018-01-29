package com.yihu.ehr.portal.controller.function;

import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.function.MessageRemindService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * @author HZY
 * @vsrsion 1.0
 * Created at 2017/2/22.
 */
@Controller
@RequestMapping("/doctor")
public class MessageRemindController {

    @Autowired
    private MessageRemindService messageRemindService;

    @RequestMapping(value = "messageRem",method = RequestMethod.GET)
    public String getMessgeRemind(Model model) {
        model.addAttribute("contentPage", "doctor/messageReminds/messageRemind");
        return "crossView";
    }

    @RequestMapping(value = "messageRemind",method = RequestMethod.GET)
    public String login(Model model) {
        model.addAttribute("title","消息提醒");
        model.addAttribute("contentPage","protal/messageRemind/messageRemind");
        return "crossView";
    }

    /* ******************************  数据接口  ********************************************* */
    @RequestMapping(value = "/messageRemindList", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "消息提醒信息列表的获取", produces = "application/json", notes = "消息提醒信息列表的获取")
    public Result infoData(
            @ApiParam(name = "userId", value = "用户ID", required = true)
            @RequestParam(value = "userId") String userId ) throws Exception{
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

    @RequestMapping(value = "/messageRemind/{remindId}", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "消息阅读状态更新", produces = "application/json", notes = "消息阅读状态更新")
    public Result remindReaded(
            @ApiParam(name = "remindId", value = "待办事项ID")
            @PathVariable(value = "remindId") Long remindId ) throws Exception {
        return messageRemindService.remindReaded(remindId);
    }

    @RequestMapping(value = "/messageRemindCount", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
      @ResponseBody
      @ApiOperation(value = "消息提醒信息的个数", produces = "application/json", notes = "消息提醒信息的获取")
      public Result getMessageRemingdCount(
            @ApiParam(name = "userId", value = "用户ID", required = true)
            @RequestParam(value = "userId") String userId) throws Exception{
        return messageRemindService.getMessageRemindCount(userId);
    }
}
