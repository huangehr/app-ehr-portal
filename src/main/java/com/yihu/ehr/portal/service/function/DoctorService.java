package com.yihu.ehr.portal.service.function;

import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.ObjectResult;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.BaseService;
import com.yihu.ehr.util.http.HttpResponse;
import com.yihu.ehr.util.http.HttpUtils;
import com.yihu.ehr.util.rest.Envelop;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
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

    /**
     * 获取医生信息
     * @param userId
     * @return
     */
    public Result getDoctorInfo(String userId,HttpSession session) throws Exception{
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        Map<String, Object> request = new HashMap<>();
        request.put("userId", params.get("userId"));
        HttpResponse response = HttpUtils.doGet(profileInnerUrl + ("/users/admin/" + params.get("userId")), request);
        if (response.isSuccessFlg()) {
            ListResult listResult = toModel(response.getContent(), ListResult.class);
            Object obj = listResult.getObj();
            String imgRemotePath = (String) ((LinkedHashMap) obj).get("imgRemotePath");
            if(!StringUtils.isEmpty(imgRemotePath)){
                params = new HashMap<>();
                params.put("object_id", userId);
                request = new HashMap<>();
                request.put("object_id", params.get("object_id"));
                HttpResponse imageOutStream = HttpUtils.doGet(profileInnerUrl + "/files", request);
                Envelop envelop = new Envelop();
                    envelop = toModel(imageOutStream.getContent(), Envelop.class);
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
            return Result.error(response.getStatus(), response.getContent());
        }
    }

    /**
     * 获取医生信息
     * @param userId
     * @return
     */
    public Result getDoctorInfo(String userId) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        Map<String, Object> request = new HashMap<>();
        request.put("userId", params.get("userId"));
        HttpResponse response = HttpUtils.doGet(profileInnerUrl + ("/users/admin/" + params.get("userId")), request);
        if (response.isSuccessFlg()) {
            ListResult listResult = toModel(response.getContent(), ListResult.class);
            Object obj = listResult.getObj();
            String imgRemotePath = "";
            if(null!=((LinkedHashMap) obj).get("imgRemotePath")){
                imgRemotePath = ((LinkedHashMap) obj).get("imgRemotePath").toString();
                params = new HashMap<>();
                params.put("imageId", imgRemotePath);
                request = new HashMap<>();
                request.put("imageId", params.get("imageId"));
                HttpResponse resp = HttpUtils.doGet(profileInnerUrl + ("/users/getImage/" + params.get("imageId")), request);
                imgRemotePath = resp.getContent();
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
            return Result.error(response.getStatus(), response.getContent());
        }
    }

    /**
     * 更新医生信息
     * @param doctor 医生信息json数据
     * @return
     */
    public Result updateDoctor(String doctor) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("doctor", doctor);
        Map<String, Object> request = new HashMap<>();
        request.put("user_json_data", params.get("doctor"));
        HttpResponse response = HttpUtils.doPut(profileInnerUrl + ("/user"), request);
        ObjectResult result =  toModel(response.getContent(), ObjectResult.class);
        if (result.isSuccessFlg()) {
            return result;
        } else {
            return Result.error(result.getErrorMsg());
        }
    }

    /**
     * 密码修改
     * @param userId    用户Id
     * @param newPwd    新密码
     * @return
     */
    public Result resetPassWord(String userId, String newPwd) throws Exception {
        Map<String, Object> request = new HashMap<>();
        request.put("userId", userId);
        request.put("password", newPwd);
        HttpResponse response = HttpUtils.doPut(profileInnerUrl + ("/users/changePassWord"), request);
        if (response.isSuccessFlg()) {
            return toModel(response.getContent(), ObjectResult.class);
        } else {
            return Result.error(response.getStatus(), response.getContent());
        }
    }

    /**
     * 验证用户
     * @param newPwd
     * @return
     */
    public Result checkPassWord( String newPwd) throws Exception {
        Map<String, Object> request1 = new HashMap<>();
        request1.put("psw", newPwd);
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String userName = (String) request.getSession().getAttribute("username");
        HttpResponse response = HttpUtils.doGet(profileInnerUrl + ("/users/verification/" + userName), request1);
        if (response.isSuccessFlg()) {
            return toModel(response.getContent(), Result.class);
        } else {
            return Result.error(response.getStatus(),response.getContent());
        }
    }


    /**
     * 发送意见反馈
     * @param userId    用户Id
     * @param content 内容
     * @return
     */
    public Result sendSuggest(String userId,String content) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        params.put("content", content);
        Map<String, Object> request = new HashMap<>();
        request.put("portalFeedback_json_data", toJson(params));
        HttpResponse response = HttpUtils.doPost(profileInnerUrl  + "/portal/feedback", request);
        if (response.isSuccessFlg()) {
            return toModel(response.getContent(), ObjectResult.class);
        } else {
            return Result.error(response.getStatus(), response.getContent());
        }
    }

}
