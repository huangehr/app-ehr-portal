package com.yihu.ehr.portal.service.function;

import com.yihu.ehr.agModel.user.UserDetailModel;
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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author HZY
 * @vsrsion 1.0
 * Created at 2017/2/22.
 */
@Service("DoctorService")
public class DoctorService extends BaseService {
    public static final String BEAN_ID = "DoctorService";

    @Autowired
    private OauthService oauthService;
    @Value("${fast-dfs.public-server}")
    private String fastDfsPublicServers;
    /**
     * 获取医生信息
     * @param userId
     * @return
     */
    public Result getDoctorInfo(String userId) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("userId", userId);
            Map<String, Object> request = new HashMap<>();
            request.put("userId", params.get("userId"));
            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.get(profileUrl + ("/users/admin/" + params.get("userId")), request, header);
            if (response != null && response.getStatusCode() == 200) {
                ListResult listResult=toModel(response.getBody(), ListResult.class);
                Object obj = listResult.getObj();
                String imgRemotePath="";
                if(null!=((LinkedHashMap) obj).get("imgRemotePath")){
                    imgRemotePath= ((LinkedHashMap) obj).get("imgRemotePath").toString();
                    params = new HashMap<>();
                    params.put("imageId", imgRemotePath);
                    request = new HashMap<>();
                    request.put("imageId", params.get("imageId"));
                    header = new HashMap<>();
                    HttpResponse resp =   HttpHelper.get(profileUrl + ("/users/getImage/" + params.get("imageId")), request, header);
                    imgRemotePath=resp.getBody();
                    ((LinkedHashMap) obj).put("imgRemotePath",imgRemotePath);
                    listResult.setObj(obj);
                }
                if(null!=((LinkedHashMap) obj).get("province_id")&&"0".equals(((LinkedHashMap) obj).get("province_id"))){
                    ((LinkedHashMap) obj).put("province_id",null);
                    listResult.setObj(obj);
                }
                if(null!=((LinkedHashMap) obj).get("city_id")&&"0".equals(((LinkedHashMap) obj).get("city_id"))){
                    ((LinkedHashMap) obj).put("city_id",null);
                    listResult.setObj(obj);
                }
                if(null!=((LinkedHashMap) obj).get("area_id")&&"0".equals(((LinkedHashMap) obj).get("area_id"))){
                    ((LinkedHashMap) obj).put("area_id",null);
                    listResult.setObj(obj);
                }

                return listResult;
            }
            else {
                return Result.error(response.getStatusCode(),response.getBody());
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error(e.getMessage());
        }
    }

    /**
     * 更新医生信息
     * @param doctor 医生信息json数据
     * @return
     */
    public Result updateDoctor(String doctor) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("doctor", doctor);

            Map<String, Object> request = new HashMap<>();
            request.put("user_json_data", params.get("doctor"));
            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.put(profileUrl + ("/user"), request, header);
            ObjectResult result =  toModel(response.getBody(), ObjectResult.class);
            if (result.isSuccessFlg() ) {
                return result;
            } else {
                return Result.error(result.getErrorMsg());
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error(e.getMessage());
        }
    }

    /**
     * 密码修改
     * @param userId    用户Id
     * @param newPwd    新密码
     * @return
     */
    public Result resetPassWord(String userId, String newPwd) {
        try {
            Map<String, Object> request = new HashMap<>();
            request.put("user_id", userId);
            request.put("password", newPwd);

            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.put(profileUrl + ("/users/changePassWord"), request, header);
            if (response != null && response.getStatusCode() == 200) {
                return toModel(response.getBody(), ObjectResult.class);
            } else {
                return Result.error(response.getStatusCode(),response.getBody());
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error(e.getMessage());
        }
    }

    /**
     * 验证用户
     * @param newPwd
     * @return
     */
    public Result checkPassWord( String newPwd) {
        try {
            Map<String, Object> request1 = new HashMap<>();
            request1.put("psw", newPwd);
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            String userName = (String) request.getSession().getAttribute("loginName");
            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.get(profileUrl + ("/users/verification/" + userName), request1, header);
            if (response != null && response.getStatusCode() == 200) {
                return toModel(response.getBody(), Result.class);
            } else {
                return Result.error(response.getStatusCode(),response.getBody());
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error(e.getMessage());
        }
    }


    /**
     * 发送意见反馈
     * @param userId    用户Id
     * @param content 内容
     * @return
     */
    public Result sendSuggest(String userId,String content) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("userId", userId);
            params.put("content", content);

            Map<String, Object> request = new HashMap<>();
            request.put("portalFeedback_json_data", toJson(params));
            Map<String, Object> header = new HashMap<>();
            header = oauthService.getHeader();
            HttpResponse response = HttpHelper.post(portalUrl  + "/portalFeedback", request, header);
            if (response != null && response.getStatusCode() == 200) {
                return toModel(response.getBody(), ObjectResult.class);

            } else {
                return Result.error(response.getStatusCode(),response.getBody());
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error(e.getMessage());
        }
    }

}
