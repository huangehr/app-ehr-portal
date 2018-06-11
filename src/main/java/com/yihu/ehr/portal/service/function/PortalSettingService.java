package com.yihu.ehr.portal.service.function;

import com.yihu.ehr.agModel.dict.SystemDictEntryModel;
import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.BaseService;
import com.yihu.ehr.util.http.HttpResponse;
import com.yihu.ehr.util.http.HttpUtils;
import com.yihu.ehr.util.rest.Envelop;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @author HZY
 * @vsrsion 1.0
 * Created at 2017/2/22.
 */
@Service
public class PortalSettingService extends BaseService {
    @Value("${service-gateway.adminInnerUrl}")
    private String adminInnerUrl;

    /**
     * 获取门户配置信息
     * @return
     */
    public Result getPortalSettingList() throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("page", 1);
        params.put("size", 10);
        HttpResponse response = HttpUtils.doGet(profileInnerUrl + "/portal/setting",params);
        if (response.isSuccessFlg()) {
            return toModel(response.getContent(), ListResult.class);
        } else {
            return Result.error("门户配置-数据接口请求失败");
        }
    }

    /**
     * 获取门户LOGO配置信息
     * @return
     */
    public Envelop getLogoByDictAndEntryCode(long dictId,String dictEntryCode,String type) throws Exception {
        Map<String, Object> params = new HashMap<>();
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        //获取内外网IP信息，将信息传递给前端
        boolean isInnerIp = (Boolean) session.getAttribute("isInnerIp");
        params.put("dictId", dictId);
        params.put("code", dictEntryCode);
        String url="";
        //1代表获取logo，2代表主办方文字
        if(type.equals("1")){
            url="/dfs/api/v1.0/open/fastDfs/getFileByDictEntry";
        }else{
            url="/basic/api/v1.0/open/dictionaries/getDictEntryByDictIdAndEntryCode";
        }
        HttpResponse  response = HttpUtils.doGet(adminInnerUrl + url,params);
        Envelop envelop = toModel(response.getContent(), Envelop.class);
        LinkedHashMap item;
        //外网
        if(!isInnerIp){
            item = (LinkedHashMap) envelop.getDetailModelList().get(0);
            String path = item.get("path").toString();
            path =zuulOuterUrl + "/file/" +  path.substring(path.indexOf("/group1"));
            item.put("path",path);
        }



        return envelop;
    }

}
