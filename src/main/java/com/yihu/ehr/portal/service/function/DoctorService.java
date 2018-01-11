package com.yihu.ehr.portal.service.function;

import com.yihu.ehr.portal.common.util.http.HttpHelper;
import com.yihu.ehr.portal.common.util.http.HttpResponse;
import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.ObjectResult;
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
 * Created at 2017/2/22.
 */
@Service
public class DoctorService extends BaseService {

    @Value("${fast-dfs.public-server}")
    private String fastDfsPublicServers;
    /**
     * 获取医生信息
     * @param userId
     * @return
     */
    public Result getDoctorInfo(String userId,HttpSession session) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("userId", userId);
            Map<String, Object> request = new HashMap<>();
            request.put("userId", params.get("userId"));
            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.get(profileInnerUrl + ("/users/admin/" + params.get("userId")), request, header);
            if (response != null && response.getStatusCode() == 200) {
                ListResult listResult=toModel(response.getBody(), ListResult.class);
                Object obj = listResult.getObj();
                String imgRemotePath = "";
                if(null!=((LinkedHashMap) obj).get("imgRemotePath")){
                    params = new HashMap<>();
                    params.put("object_id", userId);
                    request = new HashMap<>();
                    request.put("object_id", params.get("object_id"));
                    HttpResponse imageOutStream =   HttpHelper.get(profileInnerUrl + "/files", request, header);
                    Envelop envelop = new Envelop();
                        envelop = toModel(imageOutStream.getBody(),Envelop.class);
                        if (null!=envelop.getDetailModelList()&&envelop.getDetailModelList().size()>0){
                            session.removeAttribute("userImageStream");
                            session.setAttribute("userImageStream",imageOutStream == null ? "" :envelop.getDetailModelList().get(envelop.getDetailModelList().size()-1));
                        }

                }
                if(null==((LinkedHashMap) obj).get("provinceId")||"0".equals(((LinkedHashMap) obj).get("provinceId").toString())){
                    ((LinkedHashMap) obj).put("provinceId",null);
                    listResult.setObj(obj);
                }
                if(null==((LinkedHashMap) obj).get("cityId")||"0".equals(((LinkedHashMap) obj).get("cityId").toString())){
                    ((LinkedHashMap) obj).put("cityId",null);
                    listResult.setObj(obj);
                }
                if(null==((LinkedHashMap) obj).get("areaId")||"0".equals(((LinkedHashMap) obj).get("areaId").toString())){
                    ((LinkedHashMap) obj).put("areaId",null);
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
            HttpResponse response = HttpHelper.get(profileInnerUrl + ("/users/admin/" + params.get("userId")), request, header);
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
                    HttpResponse resp =   HttpHelper.get(profileInnerUrl + ("/users/getImage/" + params.get("imageId")), request, header);
                    imgRemotePath=resp.getBody();
                    ((LinkedHashMap) obj).put("imgRemotePath",imgRemotePath);
                    listResult.setObj(obj);
                }
                if(null==((LinkedHashMap) obj).get("provinceId")||"0".equals(((LinkedHashMap) obj).get("provinceId").toString())){
                    ((LinkedHashMap) obj).put("provinceId",null);
                    listResult.setObj(obj);
                }
                if(null==((LinkedHashMap) obj).get("cityId")||"0".equals(((LinkedHashMap) obj).get("cityId").toString())){
                    ((LinkedHashMap) obj).put("cityId",null);
                    listResult.setObj(obj);
                }
                if(null==((LinkedHashMap) obj).get("areaId")||"0".equals(((LinkedHashMap) obj).get("areaId").toString())){
                    ((LinkedHashMap) obj).put("areaId",null);
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
            HttpResponse response = HttpHelper.put(profileInnerUrl + ("/user"), request, header);
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
            HttpResponse response = HttpHelper.put(profileInnerUrl + ("/users/changePassWord"), request, header);
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
            HttpResponse response = HttpHelper.get(profileInnerUrl + ("/users/verification/" + userName), request1, header);
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
            header = getHeader();
            HttpResponse response = HttpHelper.post(profileInnerUrl  + "/portal/feedback", request, header);
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
