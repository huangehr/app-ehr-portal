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
 * Created by wxw on 2017/9/12.
 */
@Service
public class StatisticsService extends BaseService {

    public Result getArchiveReportInfo(String requestType) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("requestType", requestType);
        HttpResponse response = HttpUtils.doGet(profileInnerUrl + "/stasticReport/getArchiveReportInfo", params);
        if (response.isSuccessFlg()) {
            return toModel(response.getContent(), ListResult.class);
        } else {
            return Result.error("获取健康档案图表请求失败");
        }
    }

    public Result getStatisticsData(String url) throws Exception {
        Map<String, Object> params = new HashMap<>();
        HttpResponse response = HttpUtils.doGet(profileInnerUrl + url, params);
        if (response.isSuccessFlg()) {
            return toModel(response.getContent(), ListResult.class);
        } else {
            return Result.error("获取图表请求失败");
        }
    }
}
