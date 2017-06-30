package com.yihu.ehr.portal.service.function;

import com.yihu.ehr.portal.common.util.http.HttpHelper;
import com.yihu.ehr.portal.common.util.http.HttpResponse;
import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.BaseService;
import com.yihu.ehr.portal.service.common.OauthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/6/30.
 */
@Service("HealthBusinessService")
public class HealthBusinessService extends BaseService {
    public static final String BEAN_ID = "HealthBusinessService";

    @Autowired
    private OauthService oauthService;

    public Result getHealthBusinessOfChild() {
        try {
            Map<String, Object> header = new HashMap<>();
            header = oauthService.getHeader();

            HttpResponse response = HttpHelper.get(portalUrl + ("/health/getHealthBusinessOfChild"),null, header);
            if (response != null && response.getStatusCode() == 200) {
                return toModel(response.getBody(), ListResult.class);
            } else {
                return Result.error("获取指标分类医疗服务子类目列表请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("访问异常");
        }
    }
}
