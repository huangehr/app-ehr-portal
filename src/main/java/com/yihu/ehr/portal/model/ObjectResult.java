package com.yihu.ehr.portal.model;


/**
 * Created by hzp on 20170315.
 */
public class ObjectResult extends Result {
    private Object data;

    private Object obj;

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public Object getObj() {
        return obj;
    }

    public void setObj(Object obj) {
        this.obj = obj;
    }

    public ObjectResult()
    {}

    public ObjectResult(boolean successFlg,String message){
        super.setSuccessFlg(successFlg);
        super.setMessage(message);
    }

}
