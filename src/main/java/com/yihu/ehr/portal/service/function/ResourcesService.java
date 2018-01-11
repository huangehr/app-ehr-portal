package com.yihu.ehr.portal.service.function;

import com.yihu.ehr.portal.common.util.http.HttpHelper;
import com.yihu.ehr.portal.common.util.http.HttpResponse;
import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.BaseService;
import com.yihu.ehr.portal.service.common.LoginService;
import com.yihu.ehr.util.log.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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

    public Result getResourcesList() {
        try {
            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.get(profileInnerUrl + "/portal/resource/top", header );
            if (response!=null && response.getStatusCode() == 200) {
                return toModel(response.getBody(), ListResult.class);
            }
            else {
                return Result.error("资源列表-数据接口请求失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("资源列表-访问异常");
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

    public void getResourcesuploadFile(String storagePath,HttpServletResponse outResponse) throws IOException{
            if(org.apache.commons.lang3.StringUtils.isNotEmpty(storagePath)){
                OutputStream outputStream = null;
                try {
                    Map<String,Object> params = new HashMap<>();
                    storagePath = URLEncoder.encode(storagePath, "ISO8859-1");
                    String fileName = System.currentTimeMillis() + storagePath.substring(storagePath.indexOf(".")-1);
                    params.put("storagePath",storagePath);

                    String imageOutStream ="";
                    Map<String, Object> header = new HashMap<>();
                    HttpResponse httpResponse = HttpHelper.get(profileInnerUrl + "/image_view", params, header );
                    if (httpResponse!=null && httpResponse.getStatusCode() == 200) {
//                        ObjectResult objectResult = toModel(httpResponse.getBody(), ObjectResult.class);
                        imageOutStream = httpResponse.getBody().toString();
                        outResponse.setContentType("application/octet-stream");
                        outResponse.setHeader("Content-Disposition", "attachment;fileName="+fileName);
                        outputStream = outResponse.getOutputStream();
                        byte[] bytes = Base64.getDecoder().decode(imageOutStream);
                        outputStream.write(bytes);
                        outputStream.flush();
                    }

                } catch (IOException e) {
                    LogService.getLogger(ResourcesService.class).error(e.getMessage());
                } finally {
                    if (outputStream != null)
                        outputStream.close();
                }
            }
    }


}
