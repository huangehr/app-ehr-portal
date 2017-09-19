package com.yihu.ehr.portal.service.common;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yihu.ehr.portal.common.util.http.HttpHelper;
import com.yihu.ehr.portal.common.util.http.HttpResponse;
import com.yihu.ehr.portal.model.AccessToken;
import com.yihu.ehr.portal.model.ObjectResult;
import com.yihu.ehr.portal.model.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author hzp
 */
@Service
public class OauthService extends BaseService {

    @Autowired
    private ObjectMapper objectMapper;
    @Value("${app.oauth2authorize}")
    private String authorize;
    @Value("${service-gateway.portalUrl}")
    private String portalUrl;
    @Value("${app.clientId}")
    private String clientId;

    private final long a1 = getIpNum("10.0.0.0");
    private final long a2 = getIpNum("10.255.255.255");
    private final long b1 = getIpNum("172.16.0.0");
    private final long b2 = getIpNum("172.31.255.255");
    private final long c1 = getIpNum("192.168.0.0");
    private final long c2 = getIpNum("192.168.255.255");
    private final long d1 = getIpNum("10.44.0.0");
    private final long d2 = getIpNum("10.69.0.255");

    /**
     * 用户名密码登录
     */
    public Result login(HttpServletRequest request, String userName, String password) {
        try {
            ObjectResult result = new ObjectResult();
            Map<String, Object> params = new HashMap<>();
            params.put("userName", userName);
            params.put("password", password);
            params.put("clientId", clientId);
            HttpResponse response = HttpHelper.get(portalUrl + "/oauth/login", params);
            if (response!=null && response.getStatusCode() == 200) {
                ObjectResult re = toModel(response.getBody(), ObjectResult.class);
                if (re.isSuccessFlg()){
                    Map userMap = new HashMap<>();
                    userMap.put("user",re.getData());
                    result.setData(userMap);
                    String userId = ((LinkedHashMap) re.getData()).get("id").toString();
                    //获取token
                    Result tokenResponse = getAccessToken(userName, password, clientId);
                    if (tokenResponse.isSuccessFlg()) {
                        initUrlInfo(request);
                        String data = objectMapper.writeValueAsString(((ObjectResult) tokenResponse).getData());
                        AccessToken token = objectMapper.readValue(data,AccessToken.class);
                        request.getSession().setAttribute("isLogin", true);
                        request.getSession().setAttribute("token", token);
                        request.getSession().setAttribute("loginName", userName);
                        request.getSession().setAttribute("userId", userId);
                        result.setSuccessFlg(true);
                        result.setMessage("登录成功");
                        result.setCode(200);
                        return result;
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
     * 初始化内外网IP信息
     * @param request
     */
    public void initUrlInfo(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        if(ip != null) {
            if("0:0:0:0:0:0:0:1".equals(ip)) {
                request.getSession().setAttribute("isInnerIp", true);
            }else {
                if("127.0.0.1".equals(ip) || isInnerIP(ip)) {
                    request.getSession().setAttribute("isInnerIp", true);
                }else {
                    request.getSession().setAttribute("isInnerIp", false);
                }
            }
        }
    }

    public boolean isInnerIP(String ip){
        long n = getIpNum(ip);
        return (n >= a1 && n <= a2) || (n >= b1 && n <= b2) || (n >= c1 && n <= c2) || (n >= d1 && n <= d2);
    }

    public long getIpNum(String ipAddress) {
        String [] ip = ipAddress.split("\\.");
        long a = Integer.parseInt(ip[0]);
        long b = Integer.parseInt(ip[1]);
        long c = Integer.parseInt(ip[2]);
        long d = Integer.parseInt(ip[3]);
        return a * 256 * 256 * 256 + b * 256 * 256 + c * 256 + d;
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

            HttpResponse response = HttpHelper.post(authorize + "oauth/accessToken", params);
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

            HttpResponse response = HttpHelper.post(authorize + "oauth/refreshToken", params);
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
     * 获取存储在缓存中的token信息及clientId信息
     */
    public Map<String, Object> getHeader()
    {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Map<String, Object> header = new HashMap<>();
        AccessToken accessToken = (AccessToken)request.getSession().getAttribute("token");
        header.put("token",accessToken.getAccessToken());
        header.put("clientId",clientId);

        return header;
    }


    /**
     * 校验token
     */
    public Result validToken(String clientId, String accessToken) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("clientId", clientId);
            params.put("accessToken", accessToken);

            HttpResponse response = HttpHelper.post(authorize + "oauth/validToken", params);
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

    public void exit(HttpServletRequest request,HttpServletResponse response ) throws IOException {

        request.getSession().removeAttribute("isLogin");
        request.getSession().removeAttribute("token");
        request.getSession().removeAttribute("loginName");
        request.getSession().removeAttribute("userId");
        response.sendRedirect("/login");
    }

}
