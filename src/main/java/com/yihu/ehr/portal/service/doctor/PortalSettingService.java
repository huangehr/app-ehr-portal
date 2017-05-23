package com.yihu.ehr.portal.service.doctor;

import com.yihu.ehr.portal.common.util.http.HttpHelper;
import com.yihu.ehr.portal.common.util.http.HttpResponse;
import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.ObjectResult;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.BaseService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * @author HZY
 * @vsrsion 1.0
 * Created at 2017/2/22.
 */
@Service("PortalSettingService")
public class PortalSettingService extends BaseService {
    public static final String BEAN_ID = "PortalSettingService";

    /**
     * 获取门户配置信息
     * @return
     */
    public Result getPortalSettingList() {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("size", 10);
            params.put("page", 1);
            Map<String, Object> header = new HashMap<>();
            header.put("token","e04c5630-8f5e-47b4-b1d9-1165a241058c1");
            header.put("clientId","zkGuSIm2Fg");
            HttpResponse response = HttpHelper.get(portalUrl + ("/portalSetting"),params, header);
            if (response != null && response.getStatusCode() == 200) {
                return toModel(response.getBody(), ListResult.class);
            } else {
                return Result.error("门户配置-数据接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("门户配置-访问异常");
        }
    }

}
