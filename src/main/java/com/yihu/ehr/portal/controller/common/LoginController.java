package com.yihu.ehr.portal.controller.common;

import com.yihu.ehr.agModel.user.AccessToken;
import com.yihu.ehr.portal.common.constant.ApiPrefix;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.OauthService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 系统页面
 * Created by hzp on 2017/2/21.
 */
@RequestMapping(ApiPrefix.Root + "login")
@Controller
public class LoginController extends BaseController {

    @Autowired
    private OauthService oauthService;
    @Value("${app.oauth2InnerUrl}")
    public String oauth2InnerUrl;
    @Value("${app.oauth2OuterUrl}")
    private String oauth2OuterUrl;

    /*
     * 登录页面
     */
    @RequestMapping(value = "",method = RequestMethod.GET)
    public String login(Model model) {
        try{
            model.addAttribute("title","登录页面");
            model.addAttribute("contentPage","login");
            return "crossView";
        }
        catch (Exception ex) {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }

    /**
     * 登陆验证
     * @param request
     * @param userName
     * @param password
     * @return
     */
    @RequestMapping(value = "login",method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation(value = "用户登录验证", notes = "用户登录验证")
    public Result login(HttpServletRequest request,
            @ApiParam(name = "userName", value = "登录账号", defaultValue = "")
            @RequestParam(value = "userName") String userName,
            @ApiParam(name = "password", value = "密码", defaultValue = "")
            @RequestParam(value = "password") String password) {
            return oauthService.login(request, userName, password);
    }

    /**
     * 退出登陆
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping(value = "exit",method = RequestMethod.GET)
    @ApiOperation(value = "用户安全退出", notes = "用户安全退出")
    public void exit(HttpServletRequest request,HttpServletResponse response) throws IOException {
             oauthService.exit(request,response);
    }

    /**
     * 单点登陆
     * @param request
     * @param response
     * @param clientId
     * @param url
     * @throws Exception
     */
    @RequestMapping(value = "signin",method = RequestMethod.GET)
    public void signin(HttpServletRequest request, HttpServletResponse response, String clientId, String url) throws Exception {
        AccessToken token = (AccessToken)request.getSession().getAttribute("token");
        String user = token.getUser();
        String userId = request.getSession().getAttribute("userId").toString();
        boolean isInnerIp = (Boolean) request.getSession().getAttribute("isInnerIp");
        System.out.println("isInnerIp:" + isInnerIp);
        System.out.println("url:" + url);
        if(isInnerIp) {
            response.sendRedirect(oauth2InnerUrl + "oauth/authorize?response_type=token&client_id=" + clientId +
                    "&redirect_uri=" + url + "&scope=read&user=" + user + "&userId=" + userId);
        }else {
            response.sendRedirect(oauth2OuterUrl + "oauth/authorize?response_type=token&client_id=" + clientId +
                    "&redirect_uri=" + url + "&scope=read&user=" + user + "&userId=" + userId);
        }
    }
}
