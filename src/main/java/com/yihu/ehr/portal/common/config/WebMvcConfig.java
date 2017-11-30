package com.yihu.ehr.portal.common.config;

import com.yihu.ehr.portal.common.interceptor.LoginVaildInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * @author Sand
 * @version 1.0
 * @created 2016.03.03 21:50
 */
@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {

    @Autowired
    private LoginVaildInterceptor loginVaildInterceptor;

    /**
     * 注册截取器
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginVaildInterceptor).excludePathPatterns("/login").excludePathPatterns("/doctor/resource")
                .excludePathPatterns("/doctor/resourcesList").excludePathPatterns("/doctor/resources/uploadFile")
                .excludePathPatterns("/login/*").addPathPatterns("/**");
    }
}
