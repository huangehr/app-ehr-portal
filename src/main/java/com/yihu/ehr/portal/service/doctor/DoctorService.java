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
public class DoctorService extends BaseService{
    public static final String BEAN_ID = "DoctorService";


    public Result getPatientArea(String userId) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("userId", userId);
//            params = getDecryptionParms(params);//TODO 参数加密解密


            Map<String, Object> request = new HashMap<>();
            request.put("userId", params.get("userId"));
            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.get(profileurl + ("/users/admin/" + params.get("userId") ), request, header);
            if (response!=null && response.getStatusCode() == 200) {
                Map<String, Object> detailMap = new HashMap<>();
                EHRResponse ehrResponse = toModel(response.getBody(),EHRResponse.class);
                Result result = null;
                if (ehrResponse.isSuccessFlg()){
                     result = Result.success("医生个人信息-数据获取成功");
                    detailMap.put("doctorInfo",ehrResponse.getObj());
                    result.setObjectMap(detailMap);
                }else {
                    result = Result.error("医生个人信息-接口数据获取失败");
                }

                return result;

            }
            else {
                return Result.error("医生个人信息-数据接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("医生个人信息-访问异常");
        }
    }


}
