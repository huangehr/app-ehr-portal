package com.yihu.ehr.portal.service.function;

import com.yihu.ehr.portal.common.util.http.HttpHelper;
import com.yihu.ehr.portal.common.util.http.HttpResponse;
import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.ObjectResult;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.BaseService;
import com.yihu.ehr.portal.service.common.OauthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by janseny on 2017/3/15.
 */
@Service("ResourcesService")
public class ResourcesService extends BaseService {
    public static final String BEAN_ID = "ResourcesService";
    @Autowired
    private OauthService oauthService;


    public Result getResourcesList() {
        try {
            Map<String, Object> header = new HashMap<>();
            header = oauthService.getHeader();
            HttpResponse response = HttpHelper.get(portalUrl + ("/portalResourcesTop"),header );
            if (response!=null && response.getStatusCode() == 200) {
                return toModel(response.getBody(), ListResult.class);
            }
            else {
                return Result.error("资源列表-数据接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("资源列表-访问异常");
        }
    }


    /**
     * 获取资源详情
     * @param resourcesId
     * @return
     */
    public Result getResourcesInfo(String resourcesId) {
        //暂时保留
        return null;
    }
}
