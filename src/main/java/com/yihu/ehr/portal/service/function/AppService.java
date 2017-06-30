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
 * @author HZY
 * @vsrsion 1.0
 * Created at 2017/2/27.
 */
@Service("AppService")
public class AppService extends BaseService {
    public static final String BEAN_ID = "AppService";
    @Autowired
    private OauthService oauthService;

    public Result getUserApps(String userId) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("userId", userId);
//            params = getDecryptionParms(params);//TODO 参数加密解密

            Map<String, Object> header = new HashMap<>();
            header = oauthService.getHeader();
            HttpResponse response = HttpHelper.get(portalUrl + ("/userAppList"), params, header);
            if (response!=null ) {
                if(response.getStatusCode() == 200){
                    return toModel(response.getBody(),ListResult.class);
                }else if(response.getBody().equals("/ by zero")){
                    return Result.error(0,"暂时没有应用，请配置！");
                }else {
                    return Result.error(response.getStatusCode(),response.getBody());
                 }
            }
            else {
                return Result.error(response.getStatusCode(),response.getBody());
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error(e.getMessage());
        }
    }

    public Result updateShowFlag(String id,String flag) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("id", id);
            params.put("flag", flag);

            Map<String, Object> header = new HashMap<>();
            header = oauthService.getHeader();
            HttpResponse response = HttpHelper.get(portalUrl + ("/userApp/show"), params, header);
            if (response!=null ) {
                if(response.getStatusCode() == 200){
                    return Result.success("更新成功");
                }else {
                    return Result.error(response.getStatusCode(),response.getBody());
                }
            }
            else {
                return Result.error(response.getStatusCode(),response.getBody());
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error(e.getMessage());
        }
    }
    public Result getAppTreeByType() {
        try {
            Map<String, Object> params = new HashMap<>();
            Map<String, Object> header = new HashMap<>();
            header = oauthService.getHeader();
            HttpResponse response = HttpHelper.get(portalUrl + ("/getAppTreeByType"), params, header);
            if (response!=null ) {
                if(response.getStatusCode() == 200){
                    return toModel(response.getBody(),ListResult.class);
                }else if(response.getBody().equals("/ by zero")){
                    return Result.error(0,"暂时没有应用，请配置！");
                }else {
                    return Result.error(response.getStatusCode(),response.getBody());
                }
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
