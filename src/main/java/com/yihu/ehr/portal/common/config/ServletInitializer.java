package com.yihu.ehr.portal.common.config;

import com.yihu.ehr.portal.AppEhrPortal;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;

/**
 * Created by Administrator on 2016.10.14.
 */
public class ServletInitializer extends SpringBootServletInitializer {
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(AppEhrPortal.class);
    }
}
