package com.yihu.ehr.portal.service.doctor;

import com.yihu.ehr.portal.common.util.http.HttpHelper;
import com.yihu.ehr.portal.common.util.http.HttpResponse;
import com.yihu.ehr.portal.model.EHRResponse;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.BaseService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by janseny on 2017/3/15.
 */
@Service("ResourcesService")
public class ResourcesService extends BaseService {
    public static final String BEAN_ID = "ResourcesService";



    public Result getResourcesList() {
        try {
            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.get(portalUrl + ("/portalResourcesTop") );
            if (response!=null && response.getStatusCode() == 200) {
                Map<String, Object> detailMap = new HashMap<>();
                EHRResponse ehrResponse = toModel(response.getBody(),EHRResponse.class);
                Result result = null;
                if (ehrResponse.isSuccessFlg()){
                    result = Result.success("资源列表-数据获取成功");
                    detailMap.put("resourcesList",ehrResponse.getDetailModelList());
                    result.setObjectMap(detailMap);
                }else {
                    result = Result.error("资源列表-接口数据获取失败");
                }
                return result;
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
