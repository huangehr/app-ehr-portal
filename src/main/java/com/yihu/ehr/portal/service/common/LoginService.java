package com.yihu.ehr.portal.service.common;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yihu.ehr.portal.common.util.http.HttpHelper;
import com.yihu.ehr.portal.common.util.http.HttpResponse;
import com.yihu.ehr.portal.model.EHRResponse;
import com.yihu.ehr.portal.model.Result;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

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

    public Result getUserByNameAndPassword(String userName, String password) {
        try {


            Map<String, Object> params = new HashMap<>();
            params.put("userName", userName);
            params.put("password", password);

            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.get(portalUrl + "/login", params, header);

            if (response!=null && response.getStatusCode() == 200) {
                Map<String, Object> detailMap = new HashMap<>();
                EHRResponse ehrResponse = toModel(response.getBody(),EHRResponse.class);
                Result result = null;
                if (ehrResponse.isSuccessFlg()){
                    result = Result.success("登录成功");
                    detailMap.put("appList",ehrResponse.getDetailModelList());
                    result.setObjectMap(detailMap);
                }else {
                    result = Result.error("登录失败，用户名密码不正确");
                }

                return result;

            }
            else {
                return Result.error("云平台-登录接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("云平台-访问异常");
        }
    }
}
