package com.yihu.ehr.portal.service.function;

import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.BaseService;
import com.yihu.ehr.util.http.HttpResponse;
import com.yihu.ehr.util.http.HttpUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by janseny on 2017/3/15.
 */
@Service
public class ResourcesService extends BaseService {

    public Result getResourcesList() throws Exception{
        Map<String, Object> header = new HashMap<>();
        HttpResponse response = HttpUtils.doGet(profileInnerUrl + "/portal/resource/top", header );
        if (response.isSuccessFlg()) {
            return toModel(response.getContent(), ListResult.class);
        } else {
            return Result.error("资源列表-数据接口请求失败");
        }
    }


    /**
     * 获取资源详情
     * @param resourcesId
     * @return
     */
    public Result getResourcesInfo(String resourcesId) {
        //暂时保留
        return null;
    }

    public void getResourcesuploadFile(String storagePath,HttpServletResponse outResponse) throws Exception{
        if(!StringUtils.isEmpty(storagePath)){
            OutputStream outputStream = null;
            try {
                Map<String,Object> params = new HashMap<>();
                storagePath = URLEncoder.encode(storagePath, "ISO8859-1");
                String fileName = System.currentTimeMillis() + storagePath.substring(storagePath.indexOf(".")-1);
                params.put("storagePath",storagePath);
                String imageOutStream = "";
                HttpResponse httpResponse = HttpUtils.doGet(profileInnerUrl + "/image_view", params);
                if (httpResponse.isSuccessFlg()) {
//                        ObjectResult objectResult = toModel(httpResponse.getBody(), ObjectResult.class);
                    imageOutStream = httpResponse.getContent();
                    outResponse.setContentType("application/octet-stream");
                    outResponse.setHeader("Content-Disposition", "attachment;fileName="+fileName);
                    outputStream = outResponse.getOutputStream();
                    byte[] bytes = Base64.getDecoder().decode(imageOutStream);
                    outputStream.write(bytes);
                    outputStream.flush();
                }
            } finally {
                if (outputStream != null) {
                    outputStream.close();
                }
            }
        }
    }
}
