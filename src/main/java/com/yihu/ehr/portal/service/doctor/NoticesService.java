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
     * 公告-数据获取
     */
    public Result getNoticesList(String userType) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("userType", userType);

            Map<String, Object> header = new HashMap<>();
            Map<String, Object> request = new HashMap<>();
            request.put("userType", userType);

            HttpResponse response = HttpHelper.get(portalUrl + ("/portalNoticesTop"), request, header);

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
            HttpResponse response = HttpHelper.get(portalUrl + ("/portalNotices/admin/" + noticeId), params, header);
            if (response!=null && response.getStatusCode() == 200) {
                return toModel(response.getBody(),ObjectResult.class);
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
            if (response!=null && response.getStatusCode() == 200) {
                return toModel(response.getBody(),Result.class);
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
            if (response!=null && response.getStatusCode() == 200) {
                return toModel(response.getBody(),Result.class);
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
