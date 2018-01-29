package com.yihu.ehr.portal.service.function;

import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.BaseService;
import com.yihu.ehr.util.http.HttpResponse;
import com.yihu.ehr.util.http.HttpUtils;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by janseny on 2017/3/15.
 */
@Service
public class MessageRemindService extends BaseService {

    public Result getMessageRemindList(String userId) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        params.put("readed", "0");
        params.put("size", "15");
        params.put("page", "1");
        HttpResponse response = HttpUtils.doGet(profileInnerUrl + "/portal/messageRemind", params);
        if (response.isSuccessFlg()) {
            return toModel(response.getContent(), ListResult.class);
        }
        else {
            return Result.error("消息提醒列表-数据接口请求失败");
        }
    }


    /**
     * 获取消息提醒详情
     * @param messageRemindId
     * @return
     */
    public Result getMessageRemindInfo(String messageRemindId) {
        return null;
    }

    public Result getMessageRemindCount(String userId) throws Exception{
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        params.put("readed", "0");
        HttpResponse response = HttpUtils.doGet(profileInnerUrl + "/portal/messageRemind/count", params);
        if (response.isSuccessFlg()) {
            return toModel(response.getContent(), ListResult.class);
        } else {
            return Result.error("获取消息数量-数据接口请求失败");
        }
    }

    public Result remindReaded(Long remindId) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("remindId", remindId);
        params.put("size", "15");
        params.put("page", "1");
        HttpResponse response = HttpUtils.doGet(profileInnerUrl + "/portal/messageRemind/read/" + remindId ,params);
        if (response.isSuccessFlg()) {
            return toModel(response.getContent(), ListResult.class);
        } else {
            return Result.error("消息提醒列表-数据接口请求失败");
        }
    }
}
