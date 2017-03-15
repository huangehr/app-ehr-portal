package com.yihu.ehr.portal.common.thread;

import com.yihu.ehr.portal.common.util.spring.SpringContextHolder;
import com.yihu.ehr.portal.model.AccessToken;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.OauthService;

public class AccessTokenThread implements Runnable
{
    private static AccessToken accessToken;
    private static String clientId;
    private static String userName;
    private static String password;
    private static String portalUrl;

    public AccessTokenThread(String userName, String password, String clientId, String portalUrl) {
        this.userName = userName;
        this.password = password;
        this.clientId = clientId;
        this.portalUrl = portalUrl;
    }

    @Override
    public void run()
    {
        while(true) {
            try{
                OauthService service = (OauthService) SpringContextHolder.getSpringBean("OauthService");
                if(service!=null) {
                    /*Result re = service.getAccessToken(accessToken, userName, password, clientId, portalUrl); // 从微信服务器刷新access_token
                    if (token != null) {
                        AccessTokenThread.setAccessToken(token);
                    } else {
                        System.out.println("get access_token failed");
                    }
                    if (accessToken != null) {
                        Thread.sleep((accessToken.getExpiresIn() - 200) * 1000);    // 休眠7000秒
                    } else {
                        Thread.sleep(60 * 1000);    // 如果access_token为null，60秒后再获取
                    }*/
                }
                else{
                    Thread.sleep(60 * 1000);
                }
            }catch(InterruptedException e){
                try{
                    Thread.sleep(60 * 1000);
                }catch(InterruptedException e1){
                    e1.printStackTrace();
                }
            }

        }
    }
 
    public synchronized static AccessToken getAccessToken() {
        if (accessToken == null) {
            return null;
        } else {
            AccessToken at = new AccessToken();
            at.setAccessToken(accessToken.getAccessToken());
            at.setRefreshToken(accessToken.getRefreshToken());
            at.setExpiresIn(accessToken.getExpiresIn());
            return at;
        }
    }
 
    private synchronized static void setAccessToken(AccessToken accessToken) {
        AccessTokenThread.accessToken = accessToken;
    }
}