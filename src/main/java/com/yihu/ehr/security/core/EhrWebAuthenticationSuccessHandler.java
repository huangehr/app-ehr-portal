package com.yihu.ehr.security.core;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yihu.ehr.util.http.IPInfoUtils;
import com.yihu.ehr.util.rest.Envelop;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.session.FindByIndexNameSessionRepository;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Handler - 登陆成功后的末端处理器
 * 初始化登陆成功后所需要的数据，如有其他业务需求，请新增方法进行包装，不要直接在原来的代码里面添加太多业务逻辑
 * Created by progr1mmer on 2018/1/26.
 */
public class EhrWebAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private ObjectMapper objectMapper;
    @Autowired
    private FindByIndexNameSessionRepository findByIndexNameSessionRepository;

    /**
     * Step 4
     * @param httpServletRequest
     * @param httpServletResponse
     * @param authentication
     * @throws IOException
     * @throws ServletException
     */
    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        Envelop envelop = new Envelop();
        envelop.setSuccessFlg(true);
        Map userMap = new HashMap();
        String id = (String) httpServletRequest.getAttribute("id");
        String username = (String) httpServletRequest.getAttribute("username");
        String realName = (String) httpServletRequest.getAttribute("realName");
        userMap.put("id", id);
        userMap.put("username", username);
        userMap.put("realName", realName);
        envelop.setObj(userMap);
        //Map<String, Object> sessionMap = findByIndexNameSessionRepository.findByIndexNameAndIndexValue(FindByIndexNameSessionRepository.PRINCIPAL_NAME_INDEX_NAME, "admin");
        init(httpServletRequest);
        httpServletResponse.setContentType(MediaType.APPLICATION_JSON_UTF8_VALUE);
        httpServletResponse.getWriter().print(objectMapper.writeValueAsString(envelop));
    }


    private void init(HttpServletRequest request) {
        String id = (String) request.getAttribute("id");
        String username = (String) request.getAttribute("username");
        String ip = IPInfoUtils.getIPAddress(request);
        if(ip != null) {
            if("0:0:0:0:0:0:0:1".equals(ip)) {
                request.getSession().setAttribute("isInnerIp", true);
            }else {
                if("127.0.0.1".equals(ip) || IPInfoUtils.isInnerIP(ip)) {
                    request.getSession().setAttribute("isInnerIp", true);
                }else {
                    request.getSession().setAttribute("isInnerIp", false);
                }
            }
        }
        request.getSession().setAttribute("userId", id);
        request.getSession().setAttribute("username", username);
    }

}
