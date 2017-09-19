package com.yihu.ehr.portal.service.common;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yihu.ehr.portal.common.util.encode.AES;
import com.yihu.ehr.portal.common.util.encode.Base64;
import com.yihu.ehr.portal.common.util.http.HttpHelper;
import com.yihu.ehr.portal.common.util.http.HttpResponse;
import com.yihu.ehr.portal.common.util.operator.StringUtil;
import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.ObjectResult;
import com.yihu.ehr.portal.model.Result;
import org.apache.commons.lang.ArrayUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;


@Service("BaseService")
public class BaseService {

    private static Logger logger = LogManager.getLogger(BaseService.class);
    public static final String BEAN_ID = "BaseService";
    @Autowired
    protected ObjectMapper objectMapper;
    @Value("${app.clientId}")
    protected String clientId;
    @Value("${service-gateway.profileInnerUrl}")
    protected String profileInnerUrl;
    @Value("${service-gateway.profileOuterUrl}")
    protected String profileOuterUrl;
    @Value("${service-gateway.portalInnerUrl}")
    protected String portalInnerUrl;
    @Value("${service-gateway.portalOuterUrl}")
    protected String portalOuterUrl;
    @Value("${app.oauth2InnerUrl}")
    protected String oauth2InnerUrl;
    @Value("${app.oauth2OuterUrl}")
    protected String oauth2OuterUrl;

    public String readFile(String filePath, String charSet) {

        try {
            return readString(new FileInputStream(new File(filePath)), charSet);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }

    public String readString(InputStream is, String charSet) {

        try {
            return new String(readByte(is), charSet);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }

    public byte[] readByte(InputStream is) {

        try {
            int temp;
            byte[] tempBuffer = new byte[1024];
            byte[] buffer = new byte[0];
            while ((temp = is.read(tempBuffer)) != -1) {
                buffer = ArrayUtils.addAll(buffer, ArrayUtils.subarray(tempBuffer, 0, temp));
            }
            return buffer;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public <T> T toModel(String json,Class<T> targetCls){
        try {
            T model = objectMapper.readValue(json, targetCls);
            return model;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    /**
     * json转为指定对象
     *
     * @param json
     * @param t
     * @param <T>
     * @return
     */
    public <T> T toObj(String json, Class<T> t) {

        try {
            return objectMapper.readValue(json, t);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 对象转json
     *
     * @param obj
     * @return
     */
    public String toJson(Object obj) {

        try {
            return objectMapper.writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return null;
        }
    }



    public Map<String, Object> getDecryptionParms(Map<String, Object> params) throws Exception {
        if(!StringUtil.isEmpty(params.get("userId"))){
            String userId = new String(Base64.decode(params.get("userId").toString()), "utf-8");
            params.put("userId", userId);
            String key = AES.genKey(userId);
            String iv = AES.genIV(userId);
            for (String paramKey : params.keySet()) {
                if (!paramKey.equals("userId") && !StringUtil.isEmpty(params.get(paramKey))) {
                    params.put(paramKey, AES.decrypt(params.get(paramKey).toString(), key, iv));
                }
            }
        }
        return params;
    }


    /**
     * 获取UUID
     * @return
     */
    private static String GetUUID(){
        try {
            return UUID.randomUUID().toString();
        }
        catch (Exception e)
        {
            System.out.print(e.getMessage());
            return "";
        }
    }


    /**
     * 获取省列表
     * @param level
     * @return
     */
    public Result getProvinces(Integer level) {
        try {
            Map<String, Object> request = new HashMap<>();
            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.get(profileInnerUrl + ("/geography_entries/level/" +level), request, header);
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
     * 获取市列表
     * @param pid
     * @return
     */
    public Result getCitys(Integer pid) {
        try {
            Map<String, Object> request = new HashMap<>();
            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.get(profileInnerUrl + ("/geography_entries/pid/" +pid), request, header);
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

    public Result getDictNameById(Integer id) {
        try {
            Map<String, Object> request = new HashMap<>();
            Map<String, Object> header = new HashMap<>();
            HttpResponse response = HttpHelper.get(profileInnerUrl + ("/geography_entries/" +id), request, header);
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

}
