package com.yihu.ehr.portal.service.function;

import com.yihu.ehr.agModel.app.AppModel;
import com.yihu.ehr.agModel.dict.SystemDictEntryModel;
import com.yihu.ehr.constants.ServiceApi;
import com.yihu.ehr.portal.model.ListResult;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.common.BaseService;
import com.yihu.ehr.util.http.HttpResponse;
import com.yihu.ehr.util.http.HttpUtils;
import com.yihu.ehr.util.rest.Envelop;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @author HZY
 * @vsrsion 1.0
 * Created at 2017/2/27.
 */
@Service
public class AppService extends BaseService {
    @Value("${fast-dfs.public-OutServer}")
    private String fastDfsPublicOutServers;

    public Result getUserApps(String userId) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        String url = "/portal/userApp/list";
        HttpResponse response = HttpUtils.doGet(profileInnerUrl + url, params);
        if (response.isSuccessFlg() ) {
            if(response.getContent().equals("/ by zero")){
                return Result.error(0,"暂时没有应用，请配置！");
            }
            return toModel(response.getContent(), ListResult.class);
        }else {
            return Result.error(response.getStatus(), response.getErrorMsg());
        }
    }

    public Result updateShowFlag(String id,String flag) throws Exception {
            Map<String, Object> params = new HashMap<>();
            params.put("id", id);
            params.put("flag", flag);
            String url = "/portal/userApp/show";
            HttpResponse response = HttpUtils.doGet(profileInnerUrl + url, params);
            if(response.isSuccessFlg()){
                return Result.success("更新成功");
            }else {
                return Result.error(response.getStatus(), response.getErrorMsg());
            }
    }

    public Result getAppTypeAndApps(String manageType) throws Exception {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        Map<String, Object> params = new HashMap<>();
        //获取内外网IP信息，将信息传递给前端
        boolean isInnerIp = (Boolean) session.getAttribute("isInnerIp");
        params.put("userId", userId);
        params.put("manageType",manageType);
        HttpResponse response = HttpUtils.doGet(profileInnerUrl + ServiceApi.Apps.getAppTypeAndApps, params);
        if(response.isSuccessFlg()){
            ListResult resultList = toModel(response.getContent(), ListResult.class);
            ListResult resultListNew = new ListResult();
            resultListNew.setCurrPage(resultList.getCurrPage());
            resultListNew.setObj(resultList.getObj());
            resultListNew.setPageSize(resultList.getPageSize());
            resultListNew.setTotalCount(resultList.getTotalCount());
            resultListNew.setTotalPage(resultList.getTotalPage());
            resultListNew.setCode(resultList.getCode());
            resultListNew.setMessage(resultList.getMessage());
            resultListNew.setSuccessFlg(resultList.isSuccessFlg());
            List<SystemDictEntryModel> detailModelList =new ArrayList<>();
            // 获取客户端管理类型APP时，给【基础支撑】APP类型添加【基础信息管理】应用。
            if ("client".equals(manageType)) {
                for (int i = 0; i < resultList.getDetailModelList().size(); i++) {
                    LinkedHashMap item = (LinkedHashMap) resultList.getDetailModelList().get(i);
                    SystemDictEntryModel dict = (SystemDictEntryModel) toModel(toJson(item), SystemDictEntryModel.class);
                    if (dict.getCode().equals("MasterInfor")) {
                        resultList.getDetailModelList().remove(i);
                        String url = profileInnerUrl + ServiceApi.Apps.Apps + "/" + baseClientId;
                        String appStr = HttpUtils.doGet(url, params).getContent();
                        LinkedHashMap baseApp = (LinkedHashMap) toModel(appStr, Envelop.class).getObj();
                        dict.getChildren().add(toModel(toJson(baseApp), AppModel.class));
                        resultList.getDetailModelList().add(i, dict);
                    }

                    if(!isInnerIp){
                        //如果是外网IP，则将应用图标改成外网地址
                        SystemDictEntryModel dictNew = new SystemDictEntryModel();
                        dictNew.setCatalog(dict.getCatalog());
                        dictNew.setCode(dict.getCode());
                        dictNew.setDictId(dict.getDictId());
                        dictNew.setPhoneticCode(dict.getPhoneticCode());
                        dictNew.setSort(dict.getSort());
                        dictNew.setValue(dict.getValue());
                        List<AppModel> list =new ArrayList<>();
                        for(int j = 0; j < dict.getChildren().size(); j++){
                            AppModel  appModel = toModel(toJson(dict.getChildren().get(j)), AppModel.class);
                            if(StringUtils.isNotEmpty(appModel.getIcon())){
                                String icon = appModel.getIcon().substring(appModel.getIcon().indexOf("/group1"));
                                icon =fastDfsPublicOutServers+ icon;
                                appModel.setIcon(icon);
                                list.add(appModel);
                            }
                        }
                        dictNew.setChildren(list);
                        detailModelList.add(dictNew);
                    }
                }
                resultListNew.setDetailModelList(detailModelList);
            }
            if(isInnerIp){
                resultList.setObj(1);
            }else {
                resultListNew.setObj(0);
                return resultListNew;
            }
            return resultList;
        }else if(response.getContent().equals("/ by zero")){
            return Result.error(0,"暂时没有应用，请配置！");
        }else {
            return Result.error(response.getStatus(), response.getErrorMsg());
        }
    }

}
