package com.yihu.ehr.portal.service.function;

import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.ObjectResult;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.BaseService;
import com.yihu.ehr.util.http.HttpResponse;
import com.yihu.ehr.util.http.HttpUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by JKZL-A on 2017/7/2.
 */
@Service
public class MainHomeService extends BaseService{

    /*获取指标预警
    * @param id
    * @param filters
    * @return
    * */
    public Result getTjQuotaWarn (String userId) throws Exception {
       Map<String,Object> params = new HashMap<>();
       params.put("userId", userId);
       HttpResponse response = HttpUtils.doGet(profileInnerUrl + "/portal/tj/tjQuotaWarn", params);
       if (response.isSuccessFlg()) {
           return toModel(response.getContent(), ObjectResult.class);
       } else {
           return Result.error("获取预警信息-数据接口请求失败");
       }
    }

    /*获取指标统计报表
   * @param id
   * @param filters
   * @return
   * */
    @Deprecated
    public Result getQuotaReport ( int id, String filters) throws Exception {
        Map<String,Object> params = new HashMap<>();
        params.put("id",id);
        params.put("filters",filters);
        HttpResponse response = HttpUtils.doGet(profileInnerUrl + "/quota/tj/getQuotaReport", params);
        if (response.isSuccessFlg()) {
            return toModel(response.getContent(), ObjectResult.class);

        } else {
            return Result.error("获取指标统计信息-数据接口请求失败");
        }
    }

    /**
     * 获取指标分类医疗服务子类目列表
     * @return
     */
    public Result getQuotaCategoryOfChildList () throws Exception{
        Map<String, String> header = new HashMap<>();
        HttpResponse response = HttpUtils.doGet(profileInnerUrl + "/portal/quotaCategoryOfChild", null, header);
        if (response.isSuccessFlg()) {
            return toModel(response.getContent(), ListResult.class);
        } else {
            return Result.error("获取指标分类医疗服务子类目列表-数据接口请求失败");
        }
    }
}
