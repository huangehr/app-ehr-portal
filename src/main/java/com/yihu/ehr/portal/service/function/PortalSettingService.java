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
    public Envelop getLogoByDictAndEntryCode(String dictEntryCode,String type) throws Exception {
        Envelop envelop = new Envelop();
        Map<String, Object> params = new HashMap<>();
        String url="/resource/api/v1.0/resources/system_dict_entries";
        StringBuffer filters = new StringBuffer();
        filters.append("dictCode=" + 125 + ";");
        if (!StringUtils.isEmpty(dictEntryCode)) {
            filters.append("code=" + dictEntryCode + ";");
        }
        params.put("filters", filters.toString());
        params.put("fields", "");
        params.put("sorts", 1);
        params.put("page", 1);
        params.put("size", 10);
        HttpResponse response = HttpUtils.doGet(adminInnerUrl + url,params);
        if (response.isSuccessFlg()) {
            envelop = toModel(response.getContent(), Envelop.class);
            if(type.equals("1")){
                if(null != envelop && null!=envelop.getDetailModelList() && envelop.getDetailModelList().size()>0){
                    LinkedHashMap item = (LinkedHashMap) envelop.getDetailModelList().get(0);
                    SystemDictEntryModel dict = (SystemDictEntryModel) toModel(toJson(item), SystemDictEntryModel.class);
                    //根据图片名称 获取图片路径
                    url="/dfs/api/v1.0/fastDfs/page";
                    params = new HashMap<>();
                    filters = new StringBuffer();
                    filters.append("[{\"andOr\":\"and\",\"condition\":\"=\",\"field\":\"name\",\"value\":\""+dict.getValue()+"\"}]" + ";");
                    params.put("filters", filters.toString());
                    params.put("page", 1);
                    params.put("size", 10);
                    response = HttpUtils.doGet(adminInnerUrl + url,params);
                    envelop = toModel(response.getContent(), Envelop.class);
                }
            }
            return envelop;
        } else {
            envelop.setSuccessFlg(false);
            return envelop;
        }
    }




}
