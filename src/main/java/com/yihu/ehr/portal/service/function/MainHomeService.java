package com.yihu.ehr.portal.service.function;

import com.yihu.ehr.portal.common.util.http.HttpHelper;
import com.yihu.ehr.portal.common.util.http.HttpResponse;
import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.ObjectResult;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.BaseService;
import com.yihu.ehr.portal.service.common.OauthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by JKZL-A on 2017/7/2.
 */
@Service("mainHomeService")
public class MainHomeService extends BaseService{

    public static final String BEAN_ID = "mainHomeService";

    @Autowired
    private OauthService oauthService;
    @Value("${fast-dfs.public-server}")
    private String fastDfsPublicServers;

    /*获取指标预警
    * @param id
    * @param filters
    * @return
    * */
    public Result getTjQuotaWarn ( String userId) {
       try {
           Map<String,Object> params = new HashMap<>();
           params.put("userId",userId);
           Map<String, Object> header = new HashMap<>();
           header = oauthService.getHeader();
           HttpResponse response = HttpHelper.get(portalUrl + ("/quota/tj/getTjQuotaWarn"), params, header);
           if (response != null && response.getStatusCode() == 200) {
               return toModel(response.getBody(), ObjectResult.class);

           } else {
               return Result.error("获取预警信息-数据接口请求失败");
           }
       } catch (Exception e) {
           e.printStackTrace();
           return Result.error("获取指标预警信息-访问异常");
       }
    }

    /*获取指标统计报表
   * @param id
   * @param filters
   * @return
   * */
    public Result getQuotaReport ( int id, String filters) {
        try {
            Map<String,Object> params = new HashMap<>();
            params.put("id",id);
            params.put("filters",filters);
            Map<String, Object> header = new HashMap<>();
            header = oauthService.getHeader();
            System.out.println("id="+id);
            HttpResponse response = HttpHelper.get(portalUrl + ("/quota/tj/getQuotaReport"), params, header);
            if (response != null && response.getStatusCode() == 200) {
                return toModel(response.getBody(), ObjectResult.class);

            } else {
                return Result.error("获取指标统计信息-数据接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("获取指标统计信息-访问异常");
        }
    }
    /*获取指标分类医疗服务子类目列表
   * @return
   * */
    public Result getQuotaCategoryOfChildList () {
        try {
            Map<String, Object> header = new HashMap<>();
            header = oauthService.getHeader();
            HttpResponse response = HttpHelper.get(portalUrl + ("/quota/getQuotaCategoryOfChild"), null,header);
            if (response != null && response.getStatusCode() == 200) {
                return toModel(response.getBody(), ListResult.class);

            } else {
                return Result.error("获取指标分类医疗服务子类目列表-数据接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("获取指标分类医疗服务子类目列表-访问异常");
        }
    }
}
