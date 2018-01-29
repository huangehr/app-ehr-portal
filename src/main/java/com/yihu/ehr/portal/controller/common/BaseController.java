package com.yihu.ehr.portal.controller.common;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yihu.ehr.agModel.user.AccessToken;
import com.yihu.ehr.util.encrypt.AES;
import com.yihu.ehr.util.encrypt.Base64;
import com.yihu.ehr.util.http.HttpResponse;
import com.yihu.ehr.util.http.HttpUtils;
import com.yihu.ehr.util.rest.Envelop;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;


/**
 * 公用方法
 * Created by hzp on 2017/3/17.
 */
public class BaseController {

    @Autowired
    protected ObjectMapper objectMapper;
    @Value("${app.baseClientId}")
    protected String baseClientId;
    @Value("${app.clientId}")
    protected String clientId;
    @Value("${service-gateway.profileInnerUrl}")
    protected String profileInnerUrl;
    @Value("${service-gateway.profileOuterUrl}")
    protected String profileOuterUrl;
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
        if(!StringUtils.isEmpty(params.get("userId"))){
            String userId = new String(Base64.decode(params.get("userId").toString()), "utf-8");
            params.put("userId", userId);
            String key = AES.genKey(userId);
            String iv = AES.genIV(userId);
            for (String paramKey : params.keySet()) {
                if (!paramKey.equals("userId") && !StringUtils.isEmpty(params.get(paramKey))) {
                    params.put(paramKey, AES.decrypt(params.get(paramKey).toString(), key, iv));
                }
            }
        }
        return params;
    }

    /**
     * 获取省列表
     * @param level
     * @return
     */
    public Envelop getProvinces(Integer level) throws Exception {
        Map<String, Object> request = new HashMap<>();
        HttpResponse response = HttpUtils.doGet(profileInnerUrl + ("/geography_entries/level/" +level), request);
        return toModel(response.getContent(), Envelop.class);
    }

    /**
     * 获取市列表
     * @param pid
     * @return
     */
    public Envelop getCity(Integer pid) throws Exception {
        Map<String, Object> request = new HashMap<>();
        HttpResponse response = HttpUtils.doGet(profileInnerUrl + ("/geography_entries/pid/" + pid), request);
        return toModel(response.getContent(), Envelop.class);
    }

    public Envelop getDictNameById(Integer id) throws Exception{
        Envelop envelop = new Envelop();
        if (null == id) {
            envelop.setErrorMsg("Id不能为空！");
            envelop.setErrorCode(400);
            return envelop;
        }
        Map<String, Object> request = new HashMap<>();
        HttpResponse response = HttpUtils.doGet(profileInnerUrl + ("/geography_entries/" + id), request);
        return toModel(response.getContent(), Envelop.class);
    }

    protected Map<String, String> getHeader() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Map<String, String> header = new HashMap<>();
        AccessToken accessToken = (AccessToken)request.getSession().getAttribute("token");
        header.put("token", accessToken.getAccessToken());
        header.put("clientId", clientId);
        return header;
    }

}
