package com.yihu.ehr.portal.service.common;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yihu.ehr.portal.common.thread.AccessTokenThread;
import com.yihu.ehr.portal.common.util.auth.TokenUtil;
import com.yihu.ehr.portal.common.util.http.HttpHelper;
import com.yihu.ehr.portal.common.util.http.HttpResponse;
import com.yihu.ehr.portal.model.AccessToken;
import com.yihu.ehr.portal.model.EHRResponse;
import com.yihu.ehr.portal.model.Envelop;
import com.yihu.ehr.portal.model.Result;
import org.apache.http.HttpRequest;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @author lincl
 * @version 1.0
 * @created 2016/4/26
 */
@Service("LoginService")
public class LoginService extends BaseService {

    private static Logger logger = LogManager.getLogger(LoginService.class);
    public static final String BEAN_ID = "LoginService";

    @Autowired
    ObjectMapper objectMapper;


    @Value("${service-gateway.portalUrl}")
    public String portalUrl;


    @Value("${app.clientId}")
    public String clientId;

    public Result getUserByNameAndPassword(HttpServletRequest request, String userName, String password) {
        try {


            Map<String, Object> params = new HashMap<>();
            params.put("userName", userName);
            params.put("password", password);
            params.put("clientId", clientId);

            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.get(portalUrl + "/login", params, header);

            if (response!=null && response.getStatusCode() == 200) {
                Envelop envelop = toModel(response.getBody(), Envelop.class);

                Result result;
                if (envelop.isSuccessFlg()){
                    AccessToken token = TokenUtil.getAccessToken(userName, password, clientId, portalUrl);
                    request.getSession().setAttribute("isLogin", true);
                    request.getSession().setAttribute("token", token);
                    result = Result.success("登录成功");
                }else {
                    result = Result.error("登录失败，用户名密码不正确");
                }

                return result;

            } else {
                return Result.error("云平台-登录接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("云平台-访问异常");
        }
    }
}
