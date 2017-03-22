package com.yihu.ehr.portal.service.function;

import com.yihu.ehr.portal.common.util.http.HttpHelper;
import com.yihu.ehr.portal.common.util.http.HttpResponse;
import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.BaseService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by janseny on 2017/3/15.
 */
@Service("MessageRemindService")
public class MessageRemindService extends BaseService {
    public static final String BEAN_ID = "MessageRemindService";

    @Value("${app.clientId}")
    public String clientId;

    @Value("${app.token}")
    public String token;


    public Result getMessageRemindList(String userId) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("userId", userId);
            params.put("readed", "0");
            params.put("size", "15");
            params.put("page", "1");

            Map<String, Object> header = new HashMap<>();
            params.put("token", token);
            params.put("clientId",clientId);

            HttpResponse response = HttpHelper.get(portalUrl + ("/messageRemind"),params, header);
            if (response!=null && response.getStatusCode() == 200) {
                return toModel(response.getBody(), ListResult.class);
            }
            else {
                return Result.error("消息提醒列表-数据接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("消息提醒列表-访问异常");
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

    public Result getMessageRemindCount(String userId) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("userId", userId);
            params.put("readed", "0");

            Map<String, Object> header = new HashMap<>();
            header.put("token", userId);
            header.put("clientId", "0");

            HttpResponse response = HttpHelper.get(portalUrl + ("/messageRemindCount"), params, header);
            if (response != null && response.getStatusCode() == 200) {
                return toModel(response.getBody(), ListResult.class);
            } else {
                return Result.error("获取消息数量-数据接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("修改资源信息-访问异常");
        }
    }

    public Result remindReaded(Long remindId) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("remindId", remindId);
            params.put("size", "15");
            params.put("page", "1");
            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.get(portalUrl + ("/messageRemind/readed/"+ remindId ),params, header);
            if (response!=null && response.getStatusCode() == 200) {
                return toModel(response.getBody(), ListResult.class);
            }
            else {
                return Result.error("消息提醒列表-数据接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("消息提醒列表-访问异常");
        }
    }


}
