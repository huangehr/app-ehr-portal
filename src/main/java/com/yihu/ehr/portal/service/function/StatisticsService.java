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
 * Created by wxw on 2017/9/12.
 */
@Service
public class StatisticsService extends BaseService {

    @Autowired
    private OauthService oauthService;

    public Result getArchiveReportInfo(String requestType) {
        try {
            Map<String, Object> header = new HashMap<>();
            header = oauthService.getHeader();
            Map<String, Object> params = new HashMap<>();
            params.put("requestType", requestType);
            HttpResponse response = HttpHelper.get(portalInnerUrl + ("/stasticReport/getArchiveReportInfo"),params, header);
            if (response != null && response.getStatusCode() == 200) {
                return toModel(response.getBody(), ListResult.class);
            } else {
                return Result.error("获取健康档案图表请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("访问异常");
        }
    }

    public Result getStatisticsData(String url) {
        try {
            Map<String, Object> header = new HashMap<>();
            header = oauthService.getHeader();
            Map<String, Object> params = new HashMap<>();
            HttpResponse response = HttpHelper.get(portalInnerUrl + url,params, header);
            if (response != null && response.getStatusCode() == 200) {
                return toModel(response.getBody(), ListResult.class);
            } else {
                return Result.error("获取图表请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("访问异常");
        }
    }
}
