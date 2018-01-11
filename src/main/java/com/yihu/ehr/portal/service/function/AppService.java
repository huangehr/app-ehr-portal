package com.yihu.ehr.portal.service.function;

import com.yihu.ehr.agModel.app.AppModel;
import com.yihu.ehr.agModel.dict.SystemDictEntryModel;
import com.yihu.ehr.constants.ServiceApi;
import com.yihu.ehr.portal.common.util.http.HttpHelper;
import com.yihu.ehr.portal.common.util.http.HttpResponse;
import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.BaseService;
import com.yihu.ehr.portal.service.common.LoginService;
import com.yihu.ehr.util.rest.Envelop;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author HZY
 * @vsrsion 1.0
 * Created at 2017/2/27.
 */
@Service
public class AppService extends BaseService {

    public Result getUserApps(String userId) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("userId", userId);
//            params = getDecryptionParms(params);//TODO 参数加密解密
            Map<String, Object> header = new HashMap<>();
            header = getHeader();
            String url = "/portal/userApp/list";
            HttpResponse response = HttpHelper.get(profileInnerUrl + url, params, header);
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
            header = getHeader();
            String url = "/portal/userApp/show";
            HttpResponse response = HttpHelper.get(profileInnerUrl + url, params, header);
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

    public Result getAppTypeAndApps(String manageType) {
        try {
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            HttpSession session = request.getSession();
            String userId=(String) session.getAttribute("userId");
            Map<String, Object> params = new HashMap<>();
            params.put("userId",userId);
            params.put("manageType",manageType);
            Map<String, Object> header = new HashMap<>();
            header = getHeader();
            HttpResponse response = HttpHelper.get(profileInnerUrl + ServiceApi.Apps.getAppTypeAndApps, params, header);
            if (response != null ) {
                if(response.getStatusCode() == 200){
                    ListResult resultList = toModel(response.getBody(), ListResult.class);
                    // 获取客户端管理类型APP时，给【基础支撑】APP类型添加【基础信息管理】应用。
                    if ("client".equals(manageType)) {
                        for (int i = 0; i < resultList.getDetailModelList().size(); i++) {
                            LinkedHashMap item = (LinkedHashMap) resultList.getDetailModelList().get(i);
                            SystemDictEntryModel dict = (SystemDictEntryModel) toModel(toJson(item), SystemDictEntryModel.class);
                            if (dict.getCode().equals("MasterInfor")) {
                                resultList.getDetailModelList().remove(i);
                                String url = profileInnerUrl + ServiceApi.Apps.Apps + "/" + baseClientId;
                                String appStr = HttpHelper.get(url, params).getBody();
                                LinkedHashMap baseApp = (LinkedHashMap) toModel(appStr, Envelop.class).getObj();
                                dict.getChildren().add(toModel(toJson(baseApp), AppModel.class));
                                resultList.getDetailModelList().add(i, dict);
                            }
                        }
                    }
                    //获取内外网IP信息，将信息传递给前端
                    boolean isInnerIp = (Boolean) session.getAttribute("isInnerIp");
                    if(isInnerIp){
                        resultList.setObj(1);
                    }else {
                        resultList.setObj(0);
                    }
                    return resultList;
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
