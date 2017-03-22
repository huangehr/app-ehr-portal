package com.yihu.ehr.portal.service.function;

import com.yihu.ehr.portal.common.util.http.HttpHelper;
import com.yihu.ehr.portal.common.util.http.HttpResponse;
import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.BaseService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * @author HZY
 * @vsrsion 1.0
 * Created at 2017/2/27.
 */
@Service("AppService")
public class AppService extends BaseService {
    public static final String BEAN_ID = "AppService";


    public Result getAppList(String filters) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("filters", filters);
//            params = getDecryptionParms(params);//TODO 参数加密解密


            Map<String, Object> request = new HashMap<>();
            request.put("filters", params.get("filters"));
            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.get(profileUrl + ("/apps/no_paging" + params.get("filters")), request, header);
            if (response!=null && response.getStatusCode() == 200) {
                return toModel(response.getBody(),ListResult.class);
            }
            else {
                return Result.error(response.getStatusCode(),response.getBody());
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error(e.getMessage());
        }
    }
}
