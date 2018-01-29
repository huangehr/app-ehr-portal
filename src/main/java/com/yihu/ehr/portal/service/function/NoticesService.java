package com.yihu.ehr.portal.service.function;

import com.yihu.ehr.portal.common.util.http.HttpHelper;
import com.yihu.ehr.portal.common.util.http.HttpResponse;
import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.ObjectResult;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.BaseService;
import com.yihu.ehr.portal.service.common.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @author HZY
 * @vsrsion 1.0
 * Created at 2017/2/22.
 */
@Service
public class NoticesService extends BaseService {

    /**
     * 获取公告信息
     * @param userType
     * @return
     */
    public Result getNoticesList(HttpServletRequest request ,String userType) {
        try {
            Object token  = request.getSession().getAttribute("token");
            Map<String, Object> header = new HashMap<>();
            header = getHeader();
            HttpResponse response = HttpHelper.get(profileInnerUrl  + "/portal/notices/top", null, header);
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
            header = getHeader();
            HttpResponse response = HttpHelper.get(profileInnerUrl + "/portal/notices/admin/" + noticeId, params, header);
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
                return Result.error("提交意见反馈信息-数据接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("提交意见反馈信息-访问异常");
        }
    }

}
