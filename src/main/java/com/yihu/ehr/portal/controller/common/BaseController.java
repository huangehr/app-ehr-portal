package com.yihu.ehr.portal.controller.common;

import com.yihu.ehr.agModel.user.AccessToken;
import com.yihu.ehr.portal.common.constant.ApiPrefix;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;


/**
 * 公用方法
 * Created by hzp on 2017/3/17.
 */
@RequestMapping(ApiPrefix.Root)
@Controller
public class BaseController {

    @Value("${app.clientId}")
    public String clientId;

    protected Map<String, Object> getHeader()
    {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        ;
        Map<String, Object> header = new HashMap<>();
        AccessToken accessToken = (AccessToken)request.getSession().getAttribute("token");
        header.put("token",accessToken.getAccessToken());
        header.put("clientId",clientId);

        return header;
    }

}
