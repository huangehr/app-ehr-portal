package com.yihu.ehr.portal.common.interceptor;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yihu.ehr.portal.common.util.auth.TokenUtil;
import com.yihu.ehr.portal.common.util.http.HttpResponse;
import com.yihu.ehr.portal.model.AccessToken;
import com.yihu.ehr.portal.model.Envelop;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class AccessTokenInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private ObjectMapper objectMapper;
    @Value("${service-gateway.portalUrl}")
    public String portalUrl;


    @Value("${app.clientId}")
    public String clientId;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        AccessToken token = (AccessToken) request.getSession().getAttribute("token");
        if(token == null) {
            response.sendRedirect("/login");
            return true;
        } else {
            String accessToken = token.getAccessToken();
            HttpResponse result1 = TokenUtil.validToken(accessToken, clientId, portalUrl);
            Envelop envelop1 = objectMapper.readValue(result1.getBody(), Envelop.class);

            if (envelop1.isSuccessFlg()) {
                JsonNode jsonNode = objectMapper.readTree(envelop1.getObj().toString());
                if (jsonNode.get("status").asText().equals("10000")) {
                    return true;
                } else if (jsonNode.get("status").asText().equals("10001")) {
                    AccessToken newToken = TokenUtil.refreshToken(token.getRefreshToken(), clientId, portalUrl);
                    if (newToken == null ) {
                        response.sendRedirect("/login");
                        return true;
                    } else {
                        request.getSession().setAttribute("token", newToken);
                    }
                }
                return true;
            } else {
                response.sendRedirect("/login");
                return true;
            }
        }
    }
}
