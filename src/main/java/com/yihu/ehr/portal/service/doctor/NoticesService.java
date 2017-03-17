package com.yihu.ehr.portal.service.doctor;

import com.yihu.ehr.portal.common.util.http.HttpHelper;
import com.yihu.ehr.portal.common.util.http.HttpResponse;
import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.ObjectResult;
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
@Service("NoticesService")
public class NoticesService extends BaseService {
    public static final String BEAN_ID = "NoticesService";

    /**
     * 获取公告信息
     * @param userType
     * @return
     */
    public Result getNoticesList(String userType) {
        try {


            Map<String, Object> header = new HashMap<>();
            Map<String, Object> request = new HashMap<>();
//            request.put("userType", userType);
            header.put("token","e04c5630-8f5e-47b4-b1d9-1165a241058c1");
            header.put("clientId","zkGuSIm2Fg");
            HttpResponse response = HttpHelper.get(portalUrl  + "/doctor/portalNoticesTop", null, header);


            if (response != null && response.getStatusCode() == 200) {
                return toModel(response.getBody(), ListResult.class);
            } else {
                return Result.error("公告-数据接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("公告-访问异常");
        }
    }

    /**
     * 获取公告详情
     * @param noticeId
     * @return
     */
    public Result getNoticeInfo(String noticeId) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("portalNotice_id", noticeId);

            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.get(portalUrl + ("/doctor/portalNotices/admin/" + noticeId), params, header);
            if (response != null && response.getStatusCode() == 200) {
                return toModel(response.getBody(), ObjectResult.class);

            } else {
                return Result.error("获取公告信息-数据接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("修改公告信息-访问异常");
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
                return toModel(response.getBody(), ObjectResult.class);
            } else {
                return Result.error("验证用户信息-数据接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("验证用户信息-访问异常");
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
            HttpResponse response = HttpHelper.post(portalUrl  + "/portalFeedback", request, header);
            if (response != null && response.getStatusCode() == 200) {
                return toModel(response.getBody(), ObjectResult.class);

            } else {
                return Result.error("提交意见反馈信息-数据接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("提交意见反馈信息-访问异常");
        }
    }

}
