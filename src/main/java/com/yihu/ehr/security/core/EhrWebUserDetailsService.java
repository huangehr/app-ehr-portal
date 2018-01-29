package com.yihu.ehr.security.core;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yihu.ehr.agModel.user.UserDetailModel;
import com.yihu.ehr.util.http.HttpResponse;
import com.yihu.ehr.util.http.HttpUtils;
import com.yihu.ehr.util.rest.Envelop;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.util.Assert;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by progr1mmer on 2018/1/26.
 */
public class EhrWebUserDetailsService implements UserDetailsService {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private final ObjectMapper objectMapper = new ObjectMapper();
    private final String profileInnerUrl;

    public EhrWebUserDetailsService(String profileInnerUrl){
        Assert.hasText(profileInnerUrl, "ProfileInnerUrl must not be empty or null");
        this.profileInnerUrl = profileInnerUrl;
    }

    /**
     * Step 2
     * @param s
     * @return
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("login_code", s);
            HttpResponse httpResponse = HttpUtils.doGet(profileInnerUrl + "/users/" + s, params);
            if(httpResponse.isSuccessFlg()) {
                Envelop envelop = this.objectMapper.readValue(httpResponse.getContent(), Envelop.class);
                if (envelop.isSuccessFlg()){
                    String user = this.objectMapper.writeValueAsString(envelop.getObj());
                    UserDetailModel userDetailModel = this.objectMapper.readValue(user, UserDetailModel.class);
                    String password = userDetailModel.getPassword();
                    HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
                    //登陆成功后需要的属性
                    request.setAttribute("id", userDetailModel.getId());
                    request.setAttribute("username", s);
                    request.setAttribute("realName", userDetailModel.getRealName());
                    return new User(s, password, getGrantedAuthorities(s));
                }
                logger.error(httpResponse.getContent());
                logger.error(envelop.getErrorMsg());
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        throw new UsernameNotFoundException(s);
    }

    private Collection<GrantedAuthority> getGrantedAuthorities(String username) {
        Collection<GrantedAuthority> authorities = new ArrayList<>(1);
        authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
        return authorities;
    }

}
