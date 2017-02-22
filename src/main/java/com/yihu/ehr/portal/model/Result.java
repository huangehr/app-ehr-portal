package com.yihu.ehr.portal.model;

import java.lang.reflect.Field;
import java.util.Map;

public class Result {
    protected boolean successFlg = true;
    protected String code;
    protected String message;
    protected Map<String, Object> objectMap;

    public boolean isSuccessFlg() {
        return successFlg;
    }

    public void setSuccessFlg(boolean successFlg) {
        this.successFlg = successFlg;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getObjectMap() {
        return objectMap;
    }

    public void setObjectMap(Map<String, Object> objectMap) {
        this.objectMap = objectMap;
    }

    /**
     * 错误消息
     */
    public static Result error(String message) {
        Result re= new Result();
        re.successFlg = false;
        re.message = message;
        return re;
    }

    /**
     * 成功消息
     */
    public static Result success(String message) {
        Result re= new Result();
        re.successFlg = true;
        re.message = message;
        return re;
    }

    public static Result authError(String message) {
        Result re= new Result();
        re.successFlg = false;
        re.message = message;
        re.code = "20001";
        return re;
    }

    public void checkValue() {
        try {
            Field[] fields = this.getClass().getDeclaredFields();
            for (int j = 0; j < fields.length; j++) {
                fields[j].setAccessible(true);
                if (fields[j].getType().getName().equals(String.class.getTypeName())
                        && fields[j].get(this) == null){
                    fields[j].set(this, "");//设置为空字串
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
