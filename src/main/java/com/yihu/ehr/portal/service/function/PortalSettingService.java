package com.yihu.ehr.portal.service.function;

import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.BaseService;
import com.yihu.ehr.util.http.HttpResponse;
import com.yihu.ehr.util.http.HttpUtils;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * @author HZY
 * @vsrsion 1.0
 * Created at 2017/2/22.
 */
@Service
public class PortalSettingService extends BaseService {

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

}
