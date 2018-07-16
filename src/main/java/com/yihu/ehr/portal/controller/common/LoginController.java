package com.yihu.ehr.portal.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 系统页面
 * Created by hzp on 2017/2/21.
 */
@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {

    /*
     * 登录页面
     */
    @RequestMapping(method = RequestMethod.GET)
    public String login(Model model) {
        model.addAttribute("title","登录页面");
        model.addAttribute("contentPage","login");
        return "crossView";
    }

    /**
     * 单点登陆
     * @param request
     * @param response
     * @param clientId
     * @param url
     * @throws Exception
     */
    @RequestMapping(value = "/signin",method = RequestMethod.GET)
    public void signin(HttpServletRequest request, HttpServletResponse response, String clientId, String url) throws Exception {
        String userId = request.getSession().getAttribute("userId").toString();
        String username = request.getSession().getAttribute("username").toString();
        boolean isInnerIp = (Boolean) request.getSession().getAttribute("isInnerIp");
        //System.out.println("isInnerIp:" + isInnerIp);
        //System.out.println("url:" + url);
        if (isInnerIp) {
            response.sendRedirect(adminInnerUrl + "/authentication/oauth/sso?response_type=token&client_id=" + clientId +
                    "&redirect_uri=" + url + "&scope=read&user=" + username);
        } else {
            response.sendRedirect(zuulOuterUrl + "/authentication/oauth/sso?response_type=token&client_id=" + clientId +
                    "&redirect_uri=" + url + "&scope=read&user=" + username);
        }
    }
}
