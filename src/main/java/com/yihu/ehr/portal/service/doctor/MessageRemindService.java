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
 * Created by janseny on 2017/3/15.
 */
@Service("MessageRemindService")
public class MessageRemindService extends BaseService {
    public static final String BEAN_ID = "MessageRemindService";



    public Result getMessageRemindList(String userId) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("userId", userId);
            params.put("readed", "0");
            params.put("size", "15");
            params.put("page", "1");
            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.get(portalUrl + ("/messageRemind"),params, header);
            if (response!=null && response.getStatusCode() == 200) {
                Map<String, Object> detailMap = new HashMap<>();
                EHRResponse ehrResponse = toModel(response.getBody(),EHRResponse.class);
                Result result = null;
                if (ehrResponse.isSuccessFlg()){
                    result = Result.success("消息提醒列表-数据获取成功");
                    detailMap.put("messageRemindList",ehrResponse.getDetailModelList());
                    result.setObjectMap(detailMap);
                }else {
                    result = Result.error("消息提醒列表-接口数据获取失败");
                }

                return result;

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
            HttpResponse response = HttpHelper.get(portalUrl + ("/messageRemindCount"), params, header);
            if (response != null && response.getStatusCode() == 200) {
                Map<String, Object> detailMap = new HashMap<>();
                EHRResponse ehrResponse = toModel(response.getBody(), EHRResponse.class);
                Result result = null;
                if (ehrResponse.isSuccessFlg()) {
                    result = Result.success("获取消息数量-成功");
                    detailMap.put("messageRemindCount", ehrResponse.getObj());
                    result.setObjectMap(detailMap);
                } else {
                    result = Result.error("获取消息数量-接口执行失败");
                }
                return result;
            } else {
                return Result.error("获取消息数量-数据接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("修改资源信息-访问异常");
        }
    }


}
