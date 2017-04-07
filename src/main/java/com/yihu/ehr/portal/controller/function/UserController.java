package com.yihu.ehr.portal.controller.function;

import com.yihu.ehr.portal.common.constant.ApiPrefix;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.OauthService;
import com.yihu.ehr.portal.service.function.AppService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 系统用户管理页面
 * Created by hzp on 2017/2/24.
 */
@RequestMapping(ApiPrefix.System+"/userManage/")
@Controller
public class UserController {

    @Autowired
    private AppService appService;

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

    /* ******************************  用户权限内应用展示状态更新  ********************************************* */
    @RequestMapping(value = "app/show", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ApiOperation(value = "用户权限内应用展示状态更新", produces = "application/json", notes = "用户权限内应用展示状态更新")
    public Result infoData(HttpServletRequest request,
                           @ApiParam(name = "id", value = "用户应用ID", required = true)
                           @RequestParam(value = "id") String id,
                           @ApiParam(name = "flag", value = "用户类型", required = true)
                           @RequestParam(value = "flag") String flag
    ) {
        return appService.updateShowFlag(id ,flag);
    }
}
