package com.yihu.ehr.security.config;

import com.yihu.ehr.security.core.EhrWebAuthenticationProvider;
import com.yihu.ehr.security.core.EhrWebAuthenticationSuccessHandler;
import com.yihu.ehr.security.core.EhrWebUserDetailsService;
import com.yihu.ehr.security.core.EhrWebUsernamePasswordAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.encoding.PlaintextPasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.session.ConcurrentSessionControlAuthenticationStrategy;

/**
 * Created by progr1mmer on 2018/1/26.
 */
@Configuration
@EnableWebSecurity
public class EhrWebSecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Value("${service-gateway.adminInnerUrl}")
    private String adminInnerUrl;
    @Value("${app.clientId}")
    private String clientId;

    @Autowired
    private EhrWebAuthenticationProvider ehrWebAuthenticationProvider;
    @Autowired
    private EhrWebAuthenticationSuccessHandler ehrWebAuthenticationSuccessHandler;
    //@Autowired
    //private EhrWebAccessDecisionManager ehrWebAccessDecisionManager;
    @Autowired
    private SessionRegistry sessionRegistry;


    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/doctor/**"); //忽略授权地址
        web.ignoring().antMatchers("/WEB-INF/jsp/common/**");
        web.ignoring().antMatchers("/lib/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // ---------- 自定义Filter Start ----------
        EhrWebUsernamePasswordAuthenticationFilter ehrWebUsernamePasswordAuthenticationFilter = new EhrWebUsernamePasswordAuthenticationFilter(adminInnerUrl, clientId);
        ehrWebUsernamePasswordAuthenticationFilter.setAuthenticationSuccessHandler(ehrWebAuthenticationSuccessHandler);
        ehrWebUsernamePasswordAuthenticationFilter.setAuthenticationManager(authenticationManagerBean());
        ConcurrentSessionControlAuthenticationStrategy concurrentSessionControlAuthenticationStrategy = new ConcurrentSessionControlAuthenticationStrategy(sessionRegistry);
        concurrentSessionControlAuthenticationStrategy.setMaximumSessions(10);
        ehrWebUsernamePasswordAuthenticationFilter.setSessionAuthenticationStrategy(concurrentSessionControlAuthenticationStrategy);
        http.addFilterBefore(ehrWebUsernamePasswordAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);
        // ---------- 自定义Filter End ----------
        http.sessionManagement().maximumSessions(10).expiredUrl("/login?expired").sessionRegistry(sessionRegistry);
        http.authorizeRequests()
                //.accessDecisionManager(ehrWebAccessDecisionManager)
                .antMatchers("/login/**").permitAll()
                .antMatchers("/**").hasRole("USER")
                .and().formLogin().loginPage("/login")
                .and().logout().logoutUrl("/logout").logoutSuccessUrl("/login")
                .and().headers().frameOptions().disable()
                .and().csrf().disable();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(ehrWebAuthenticationProvider); //自定义认证提供者
    }

    @Bean
    EhrWebUserDetailsService ehrWebUserDetailsService(){
        return new EhrWebUserDetailsService();
    }

    @Bean
    EhrWebAuthenticationProvider ehrWebAuthenticationProvider(UserDetailsService userDetailsService, SessionRegistry sessionRegistry) {
        EhrWebAuthenticationProvider ehrWebAuthenticationProvider = new EhrWebAuthenticationProvider(userDetailsService, sessionRegistry);
        ehrWebAuthenticationProvider.setPasswordEncoder(new PlaintextPasswordEncoder());
        return ehrWebAuthenticationProvider;
    }

    @Bean
    EhrWebAuthenticationSuccessHandler ehrWebAuthenticationSuccessHandler(){
        return new EhrWebAuthenticationSuccessHandler();
    }

    /**
    @Bean
    EhrWebAccessDecisionManager ehrWebAccessDecisionManager() {
        return new EhrWebAccessDecisionManager(null);
    }
    */

}
