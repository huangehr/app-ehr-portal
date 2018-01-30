package com.yihu.ehr.portal.service.function;

import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.BaseService;
import com.yihu.ehr.util.http.HttpResponse;
import com.yihu.ehr.util.http.HttpUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * Created by wxw on 2017/8/31.
 */
@Service
public class QuotaCategoryService extends BaseService {

    public Result getQuotaCategoryOfChild() throws Exception {
        HttpResponse response = HttpUtils.doGet(profileInnerUrl + ("/portal/quotaCategoryOfChild"),null);
        if (response.isSuccessFlg()) {
            return toModel(response.getContent(), ListResult.class);
        } else {
            return Result.error("获取指标分类医疗服务子类目列表请求失败");
        }
    }
}
