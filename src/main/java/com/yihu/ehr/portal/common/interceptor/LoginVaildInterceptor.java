package com.yihu.ehr.portal.common.interceptor;

import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class LoginVaildInterceptor extends HandlerInterceptorAdapter {

    @Value("${spring.loginVaild}")
    Boolean loginVaild;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(loginVaild) {
            Object isLogin = request.getSession().getAttribute("isLogin");
            if (isLogin == null || !isLogin.equals(true)) {
                response.sendRedirect("/login");
            }
        }

        return true;
    }
}
