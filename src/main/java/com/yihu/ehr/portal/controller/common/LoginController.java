package com.yihu.ehr.portal.controller.common;

import com.yihu.ehr.portal.common.constant.ApiPrefix;
import com.yihu.ehr.portal.common.util.http.HttpHelper;
import com.yihu.ehr.portal.model.AccessToken;
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

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;


/**
 * 系统页面
 * Created by hzp on 2017/2/21.
 */
@RequestMapping(ApiPrefix.Root + "login")
@Controller
public class LoginController extends BaseController {

    @Autowired
    private OauthService oauthService;
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


    @RequestMapping(value = "login",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "用户登录验证", notes = "用户登录验证")
    public Result login(HttpServletRequest request,
            @ApiParam(name = "userName", value = "登录账号", defaultValue = "")
            @RequestParam(value = "userName") String userName,
            @ApiParam(name = "password", value = "密码", defaultValue = "")
            @RequestParam(value = "password") String password) {
            return oauthService.login(request, userName, password);
    }

    @RequestMapping(value = "exit",method = RequestMethod.GET)
    @ApiOperation(value = "用户安全退出", notes = "用户安全退出")
    public void exit(HttpServletRequest request,HttpServletResponse response) throws IOException {
             oauthService.exit(request,response);
    }


    //@Value("${app.oauth2authorize}")
    //上饶-外网登录
    @Value("${app.oauth2OutSize}")
    private String authorize;


    /*
    单点登录
     */
    @RequestMapping(value = "signin",method = RequestMethod.GET)
    public void signin(HttpServletRequest request,HttpServletResponse response, String clientId,String url) throws Exception
    {

        //response.sendRedirect("http://localhost:10260/oauth/authorize?response_type=token&client_id=111111&redirect_uri=http://localhost:8011/login/test&user=me");
        //获取code
        AccessToken token = (AccessToken)request.getSession().getAttribute("token");
        String user = token.getUser();
        response.sendRedirect(authorize + "oauth/authorize?response_type=token&client_id="+clientId+"&redirect_uri="+url+"&scope=read&user="+user);


    }


}
