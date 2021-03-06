package com.yihu.ehr.security.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

/**
 * Created by progr1mmer on 2018/1/27.
 */
@Configuration
@EnableRedisHttpSession
public class EhrWebHttpSessionConfiguration {

    @Bean
    SessionRegistry sessionRegistry(){
        return new SessionRegistryImpl();
    }
}
