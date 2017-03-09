package com.yihu.ehr.portal.common.util.auth;


import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yihu.ehr.portal.common.util.http.HttpHelper;
import com.yihu.ehr.portal.common.util.http.HttpResponse;
import com.yihu.ehr.portal.model.AccessToken;
import com.yihu.ehr.portal.model.EHRResponse;
import com.yihu.ehr.portal.model.Envelop;

import java.util.HashMap;
import java.util.Map;

public class TokenUtil {
    private static ObjectMapper objectMapper = new ObjectMapper();
    public static AccessToken getAccessToken(String userName, String password, String clientId, String portalUrl) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("userName", userName);
            params.put("password", password);
            params.put("clientId", clientId);

            Map<String, Object> header = new HashMap<>();
            HttpResponse tokenResponse = HttpHelper.post(portalUrl + "/oauth/accessToken", params, header);
            EHRResponse ehrResponse = objectMapper.readValue(tokenResponse.getBody(), EHRResponse.class);
            if (!ehrResponse.isSuccessFlg()) {
                return null;
            }
            JsonNode jsonNode = objectMapper.readTree(ehrResponse.getObj().toString());
            AccessToken accessToken = new AccessToken();
            accessToken.setAccessToken(jsonNode.get("access_token").asText());
            accessToken.setRefreshToken(jsonNode.get("refresh_token").asText());
            accessToken.setExpiresIn(jsonNode.get("expires_in").asInt());
            return accessToken;
        } catch (Exception e) {
            return null;
        }
    }

    public static AccessToken refreshToken(String refreshToken, String clientId, String portalUrl) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("refreshToken", refreshToken);
            params.put("clientId", clientId);

            Map<String, Object> header = new HashMap<>();
            HttpResponse tokenResponse = HttpHelper.post(portalUrl + "/oauth/refreshToken", params, header);
            Envelop envelop = objectMapper.readValue(tokenResponse.getBody(), Envelop.class);
            JsonNode jsonNode = objectMapper.readTree(envelop.getObj().toString());
            AccessToken accessToken = new AccessToken();
            accessToken.setAccessToken(jsonNode.get("access_token").asText());
            accessToken.setRefreshToken(jsonNode.get("refresh_token").asText());
            accessToken.setExpiresIn(jsonNode.get("expires_in").asInt());
            return accessToken;
        } catch (Exception e) {
            return null;
        }
    }

    public static HttpResponse validToken(String accessToken, String clientId, String portalUrl) {
        Map<String, Object> params = new HashMap<>();
        params.put("clientId", clientId);
        params.put("accessToken", accessToken);

        Map<String, Object> header = new HashMap<>();
        HttpResponse result = HttpHelper.post(portalUrl + "/oauth/validToken", params, header, null, null, null);
        return result;
    }

    public static AccessToken getOrRefreshToken(AccessToken accessToken, String userName, String password, String clientId, String portalUrl) {

        try {
            if (accessToken == null) {
                return getAccessToken(userName, password, clientId, portalUrl);
            } else {
                return refreshToken(accessToken.getRefreshToken(), clientId, portalUrl);
            }
        } catch (Exception e) {
            return null;
        }
    }
}
