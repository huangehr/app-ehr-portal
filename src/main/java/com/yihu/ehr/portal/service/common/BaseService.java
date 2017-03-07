package com.yihu.ehr.portal.service.common;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yihu.ehr.portal.common.util.encode.AES;
import com.yihu.ehr.portal.common.util.encode.Base64;
import com.yihu.ehr.portal.common.util.operator.StringUtil;
import org.apache.commons.lang.ArrayUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.Map;
import java.util.UUID;

/**
 * @author lincl
 * @version 1.0
 * @created 2016/4/26
 */
@Service("BaseService")
public class BaseService {

    private static Logger logger = LogManager.getLogger(BaseService.class);
    public static final String BEAN_ID = "BaseService";

    @Autowired
    ObjectMapper objectMapper;


    @Value("${service-gateway.profileUrl}")
    public String profileUrl;
    @Value("${service-gateway.portalUrl}")
    public String portalUrl;



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

}
