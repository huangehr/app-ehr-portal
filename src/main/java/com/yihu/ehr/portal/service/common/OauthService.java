package com.yihu.ehr.portal.service.common;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yihu.ehr.portal.common.util.http.HttpHelper;
import com.yihu.ehr.portal.common.util.http.HttpResponse;
import com.yihu.ehr.portal.model.AccessToken;
import com.yihu.ehr.portal.model.ObjectResult;
import com.yihu.ehr.portal.model.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @author hzp
 */
@Service
public class OauthService extends BaseService {


    @Autowired
    ObjectMapper objectMapper;


    @Value("${service-gateway.portalUrl}")
    public String portalUrl;


    @Value("${app.clientId}")
    public String clientId;

    /**
     * 用户名密码登录
     */
    public Result login(HttpServletRequest request, String userName, String password) {
        try {


            Map<String, Object> params = new HashMap<>();
            params.put("userName", userName);
            params.put("password", password);
            params.put("clientId", clientId);

            HttpResponse response = HttpHelper.get(portalUrl + "/oauth/login", params);

            if (response!=null && response.getStatusCode() == 200) {
                Result re = toModel(response.getBody(), Result.class);

                if (re.isSuccessFlg()){
                    //获取token
                    Result tokenResponse = getAccessToken(userName, password, clientId);
                    if (tokenResponse.isSuccessFlg()) {
                        String data = String.valueOf(((ObjectResult) tokenResponse).getData());
                        AccessToken token = objectMapper.readValue(data,AccessToken.class);
                        request.getSession().setAttribute("isLogin", true);
                        request.getSession().setAttribute("token", token);
                        return Result.success("登录成功");
                    }
                    else{
                        return tokenResponse;
                    }
                }
                else {
                    return re;
                }

            } else {
                return Result.error(response.getStatusCode(),response.getBody());
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error(e.getMessage());
        }
    }

    /**
     * 通过用户名密码获取token
     */
    public Result getAccessToken(String userName, String password, String clientId) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("userName", userName);
            params.put("password", password);
            params.put("clientId", clientId);

            HttpResponse response = HttpHelper.post(portalUrl + "/oauth/accessToken", params);
            if (response!=null && response.getStatusCode() == 200) {
                return toModel(response.getBody(),ObjectResult.class);
            }
            else {
                return Result.error(response.getStatusCode(),response.getBody());
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error(e.getMessage());
        }
    }

    /**
     * 刷新token
     */
    public Result refreshToken(String refreshToken, String clientId) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("refreshToken", refreshToken);
            params.put("clientId", clientId);

            HttpResponse response = HttpHelper.post(portalUrl + "/oauth/refreshToken", params);
            if (response!=null && response.getStatusCode() == 200) {
                return toModel(response.getBody(),ObjectResult.class);
            }
            else {
                return Result.error(response.getStatusCode(),response.getBody());
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error(e.getMessage());
        }
    }

}
