package com.yihu.ehr.security.core;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yihu.ehr.util.http.HttpResponse;
import com.yihu.ehr.util.http.HttpUtils;
import com.yihu.ehr.util.rest.Envelop;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.util.Assert;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Sso integrated
 * Created by progr1mmer on 2018/1/27.
 */
public class EhrWebUsernamePasswordAuthenticationFilter extends AbstractAuthenticationProcessingFilter {

    private static Logger logger = LoggerFactory.getLogger(EhrWebUsernamePasswordAuthenticationFilter.class);

    public static final String SPRING_SECURITY_FORM_USERNAME_KEY = "username";
    public static final String SPRING_SECURITY_FORM_PASSWORD_KEY = "password";
    private ObjectMapper objectMapper = new ObjectMapper();
    private String usernameParameter = "username";
    private String passwordParameter = "password";
    private String clientIdParameter = "clientId";
    private String accessTokenParameter = "accessToken";
    private boolean postOnly = true;

    private final String adminInnerUrl;
    private final String clientId;

    public EhrWebUsernamePasswordAuthenticationFilter(String adminInnerUrl, String clientId) {
        super(new AntPathRequestMatcher("/login", "POST"));
        Assert.hasText(adminInnerUrl, "adminInnerUrl must not be empty or null");
        Assert.hasText(clientId, "clientId must not be empty or null");
        this.adminInnerUrl = adminInnerUrl;
        this.clientId = clientId;
    }

    /**
     * Step 1
     * @param request
     * @param response
     * @return
     * @throws AuthenticationException
     */
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
        if (this.postOnly && !request.getMethod().equals("POST")) {
            throw new AuthenticationServiceException("Authentication method not supported: " + request.getMethod());
        } else {
            String username = null;
            String password = null;
            if (isSso(request)) {
                Map<String, Object> params = new HashMap<>();
                params.put("clientId", this.obtainClientId(request));
                params.put("accessToken", this.obtainAccessToken(request));
                try {
                    HttpResponse httpResponse = HttpUtils.doPost(adminInnerUrl + "/authentication/oauth/validToken", params);
                    if (httpResponse.isSuccessFlg()) {
                        Map<String, Object> map = objectMapper.readValue(httpResponse.getContent(), Map.class);
                        username = (String) map.get("user");
                        httpResponse = HttpUtils.doGet(adminInnerUrl + "/basic/api/v1.0/users/" + username, params);
                        Map userMap = this.objectMapper.readValue(httpResponse.getContent(), Map.class);
                        password = UUID.randomUUID().toString();
                        userMap.put("password", password);
                        userMap.put("user", map.get("user"));
                        userMap.put("accessToken", map.get("accessToken"));
                        userMap.put("refreshToken", map.get("refreshToken"));
                        userMap.put("tokenType", map.get("tokenType"));
                        userMap.put("expiresIn", map.get("expiresIn"));
                        request.setAttribute(username, userMap);
                    } else {
                        logger.error(httpResponse.getErrorMsg());
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                Map<String, Object> params = new HashMap<>();
                params.put("client_id", clientId);
                params.put("username", this.obtainUsername(request));
                params.put("password", this.obtainPassword(request));
                try {
                    HttpResponse httpResponse = HttpUtils.doPost(adminInnerUrl + "/authentication/oauth/login", params);
                    if (httpResponse.isSuccessFlg()) {
                        Map<String, Object> map = objectMapper.readValue(httpResponse.getContent(), Map.class);
                        username = (String) map.get("user");
                        password = UUID.randomUUID().toString();
                        map.put("password", password);
                        request.setAttribute(username, map);
                    } else {
                        logger.error(httpResponse.getErrorMsg());
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            if (username == null) {
                username = "";
            }
            if (password == null) {
                password = "";
            }

            username = username.trim();
            UsernamePasswordAuthenticationToken authRequest = new EhrWebAuthenticationToken(username, password, isSso(request)); //单点登陆集成

            this.setDetails(request, authRequest);
            return this.getAuthenticationManager().authenticate(authRequest);
        }
    }

    //单点登陆集成 ------------ Start -------------
    protected String obtainClientId(HttpServletRequest request) {
        return request.getParameter(this.clientIdParameter);
    }

    protected String obtainAccessToken(HttpServletRequest request) {
        return request.getParameter(this.accessTokenParameter);
    }
    //单点登陆集成 ------------ End -------------

    protected String obtainPassword(HttpServletRequest request) {
        return request.getParameter(this.passwordParameter);
    }

    protected String obtainUsername(HttpServletRequest request) {
        return request.getParameter(this.usernameParameter);
    }

    public void setPostOnly(boolean postOnly) {
        this.postOnly = postOnly;
    }

    protected void setDetails(HttpServletRequest request, UsernamePasswordAuthenticationToken authRequest) {
        authRequest.setDetails(this.authenticationDetailsSource.buildDetails(request));
    }

    //单点登陆集成 ------------ Start -------------
    public void setClientIdParameter(String clientIdParameter) {
        Assert.hasText(clientIdParameter, "ClientId parameter must not be empty or null");
        this.clientIdParameter = clientIdParameter;
    }

    public void setAccessTokenParameter(String accessTokenParameter) {
        Assert.hasText(accessTokenParameter, "AccessTokenParameter parameter must not be empty or null");
        this.accessTokenParameter = accessTokenParameter;
    }
    //单点登陆集成 ------------ End -------------

    public void setUsernameParameter(String usernameParameter) {
        Assert.hasText(usernameParameter, "Username parameter must not be empty or null");
        this.usernameParameter = usernameParameter;
    }

    public void setPasswordParameter(String passwordParameter) {
        Assert.hasText(passwordParameter, "Password parameter must not be empty or null");
        this.passwordParameter = passwordParameter;
    }

    public final String getClientIdParameter() {
        return this.clientIdParameter;
    }

    public final String getAccessTokenParameter() {
        return this.accessTokenParameter;
    }

    public final String getUsernameParameter() {
        return this.usernameParameter;
    }

    public final String getPasswordParameter() {
        return this.passwordParameter;
    }

    private boolean isSso(HttpServletRequest request){
        return null != request.getParameter(accessTokenParameter);
    }

}
