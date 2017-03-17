package com.yihu.ehr.portal.controller.common;

import com.yihu.ehr.portal.common.constant.ApiPrefix;
import com.yihu.ehr.portal.model.AccessToken;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.BaseService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
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
