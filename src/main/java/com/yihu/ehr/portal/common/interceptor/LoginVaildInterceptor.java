package com.yihu.ehr.portal.common.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class LoginVaildInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object isLogin = request.getSession().getAttribute("isLogin");
        if (isLogin != null && isLogin.equals(true)) {
            return true;
        } else {
            response.sendRedirect("/login");
            return true;
        }
    }
}
