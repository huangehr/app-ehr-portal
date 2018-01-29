package com.yihu.ehr.portal.service.function;

import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.ObjectResult;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.BaseService;
import com.yihu.ehr.util.http.HttpResponse;
import com.yihu.ehr.util.http.HttpUtils;
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
    public Result getNoticesList(HttpServletRequest request ,String userType) throws Exception{
        HttpResponse response = HttpUtils.doGet(profileInnerUrl  + "/portal/notices/top", null);
        if (response.isSuccessFlg()) {
            return toModel(response.getContent(), ListResult.class);
        } else {
            return Result.error("公告-数据接口请求失败");
        }
    }

    /**
     * 获取公告详情
     * @param noticeId
     * @return
     */
    public Result getNoticeInfo(String noticeId) throws Exception{
        Map<String, Object> params = new HashMap<>();
        params.put("portalNotice_id", noticeId);
        HttpResponse response = HttpUtils.doGet(profileInnerUrl + "/portal/notices/admin/" + noticeId, params);
        if (response.isSuccessFlg()) {
            return toModel(response.getContent(), ObjectResult.class);
        } else {
            return Result.error("获取公告信息-数据接口请求失败");
        }
    }

    /**
     * 发送意见反馈
     * @param userId    用户Id
     * @param content 内容
     * @return
     */
    public Result sendSuggest(String userId,String content) throws Exception{
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        params.put("content", content);
        Map<String, Object> request = new HashMap<>();
        request.put("portalFeedback_json_data", toJson(params));
        HttpResponse response = HttpUtils.doPost(profileInnerUrl  + "/portal/feedback", request);
        if (response.isSuccessFlg()) {
            return toModel(response.getContent(), ObjectResult.class);
        } else {
            return Result.error("提交意见反馈信息-数据接口请求失败");
        }
    }

}
