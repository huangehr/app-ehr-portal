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
 * @author HZY
 * @vsrsion 1.0
 * Created at 2017/2/22.
 */
@Service("DoctorService")
public class DoctorService extends BaseService {
    public static final String BEAN_ID = "DoctorService";


    public Result getDoctorInfo(String level) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("userId", level);
//            params = getDecryptionParms(params);//TODO 参数加密解密


            Map<String, Object> request = new HashMap<>();
            request.put("userId", params.get("userId"));
            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.get(profileUrl + ("/users/admin/" + params.get("userId")), request, header);
            if (response != null && response.getStatusCode() == 200) {
                Map<String, Object> detailMap = new HashMap<>();
                EHRResponse ehrResponse = toModel(response.getBody(), EHRResponse.class);
                Result result = null;
                if (ehrResponse.isSuccessFlg()) {
                    result = Result.success("医生个人信息-数据获取成功");
                    detailMap.put("doctorInfo", ehrResponse.getObj());
                    result.setObjectMap(detailMap);
                } else {
                    result = Result.error("医生个人信息-接口数据获取失败");
                }

                return result;

            } else {
                return Result.error("医生个人信息-数据接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("医生个人信息-访问异常");
        }
    }


    public Result updateDoctor(String doctor) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("doctor", doctor);

            Map<String, Object> request = new HashMap<>();
            request.put("user_json_data", params.get("doctor"));
            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.put(profileUrl + ("/user"), request, header);
            if (response != null && response.getStatusCode() == 200) {
                Map<String, Object> detailMap = new HashMap<>();
                EHRResponse ehrResponse = toModel(response.getBody(), EHRResponse.class);
                Result result = null;
                if (ehrResponse.isSuccessFlg()) {
                    result = Result.success("修改医生信息-成功");
                    detailMap.put("doctorInfo", ehrResponse.getObj());
                    result.setObjectMap(detailMap);
                } else {
                    result = Result.error("修改医生信息-接口执行失败");
                }

                return result;

            } else {
                return Result.error("修改医生信息-数据接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("修改医生信息-访问异常");
        }
    }

    public Result changePassWord(String userId, String newPwd) {
        try {
            Map<String, Object> request = new HashMap<>();
            request.put("user_id", userId);
            request.put("password", newPwd);

            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.put(profileUrl + ("/users/changePassWord"), request, header);
            if (response != null && response.getStatusCode() == 200) {
                Map<String, Object> detailMap = new HashMap<>();
                EHRResponse ehrResponse = toModel(response.getBody(), EHRResponse.class);
                if (ehrResponse.isSuccessFlg()) {
                    return Result.success("修改用户密码-成功");
                } else {
                    return Result.error("修改用户密码-接口执行失败");
                }
            } else {
                return Result.error("修改用户密码-数据接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("修改用户密码-访问异常");
        }
    }

    /**
     * 验证用户
     * @param userName
     * @param newPwd
     * @return
     */
    public Result checkPassWord(String userName, String newPwd) {
        try {
            Map<String, Object> request = new HashMap<>();
            request.put("psw", newPwd);

            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.get(profileUrl + ("/users/verification/" + userName), request, header);
            if (response != null && response.getStatusCode() == 200) {
                Map<String, Object> detailMap = new HashMap<>();
                EHRResponse ehrResponse = toModel(response.getBody(), EHRResponse.class);
                if (ehrResponse.isSuccessFlg()) {
                    return Result.success("验证用户信息-成功");
                } else {
                    return Result.error("验证用户信息-失败，用户名或密码错误！");
                }
            } else {
                return Result.error("验证用户信息-数据接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("验证用户信息-访问异常");
        }
    }


    public Result sendSuggest(String userId,String content) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("userId", userId);
            params.put("content", content);

            Map<String, Object> request = new HashMap<>();
            request.put("portalFeedback_json_data", toJson(params));
            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.post(profileUrl  + "/portalFeedback", request, header);
            if (response != null && response.getStatusCode() == 200) {
                Map<String, Object> detailMap = new HashMap<>();
                EHRResponse ehrResponse = toModel(response.getBody(), EHRResponse.class);
                Result result = null;
                if (ehrResponse.isSuccessFlg()) {
                    result = Result.success("提交意见反馈信息-成功");
                    detailMap.put("doctorInfo", ehrResponse.getObj());
                    result.setObjectMap(detailMap);
                } else {
                    result = Result.error("提交意见反馈信息-接口执行失败");
                }

                return result;

            } else {
                return Result.error("提交意见反馈信息-数据接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("提交意见反馈信息-访问异常");
        }
    }

}
