package com.yihu.ehr.portal.service.function;

import com.fasterxml.jackson.core.type.TypeReference;
import com.yihu.ehr.agModel.resource.RsReportModel;
import com.yihu.ehr.agModel.resource.RsReportViewModel;
import com.yihu.ehr.agModel.resource.RsResourcesModel;
import com.yihu.ehr.constants.ServiceApi;
import com.yihu.ehr.portal.common.util.http.HttpHelper;
import com.yihu.ehr.portal.common.util.http.HttpResponse;
import com.yihu.ehr.portal.model.MChartInfoModel;
import com.yihu.ehr.portal.service.common.BaseService;
import com.yihu.ehr.portal.service.common.LoginService;
import com.yihu.ehr.util.rest.Envelop;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by janseny on 2017/11/2.
 */
@Service("ReportService")
public class ReportService extends BaseService {

    @Autowired
    private LoginService oauthService;

    public Object getTemplateData(String reportCode) {

        Envelop envelop = new Envelop();
        Map<String, Object> params = new HashMap<>();
        Map<String, Object> resultMap = new HashMap<>();
        List<Map<String, Object>> viewInfos = new ArrayList<>();
        List<Map<String, Object>> options = new ArrayList<>();
        try {
            // 获取报表模版内容
            params.put("reportCode", reportCode);
            String templateContent = getHttpRespons(params,ServiceApi.Resources.RsReportTemplateContent);
            resultMap.put("templateContent", templateContent);

            // 获取报表视图
            params.clear();
            params.put("code", reportCode);
            String reportEnvelopStr = getHttpRespons(params,ServiceApi.Resources.RsReportFindByCode);
            RsReportModel rsReportModel = objectMapper.readValue(reportEnvelopStr, RsReportModel.class);
            params.clear();
            params.put("reportId", rsReportModel.getId());
            String viewListEnvelopStr = getHttpRespons(params,ServiceApi.Resources.RsReportViews);
            List<RsReportViewModel> rsReportViewList = objectMapper.readValue(viewListEnvelopStr, new TypeReference<List<RsReportViewModel>>() {});

            // 获取图形配置
            for (RsReportViewModel view : rsReportViewList) {
                String resourceEnvelopStr = getHttpRespons(params,ServiceApi.Resources.Resources+ "/" + view.getResourceId());
                RsResourcesModel rsResourcesModel = objectMapper.readValue(resourceEnvelopStr, RsResourcesModel.class);
                params.clear();
                params.put("resourceId", view.getResourceId());
                String queryEnvelopStr = getHttpRespons(params,ServiceApi.Resources.QueryByResourceId);
                String queryStr = "";
                if(StringUtils.isNotEmpty(queryEnvelopStr) && queryEnvelopStr.length()> 4){
                    objectMapper.readValue(queryEnvelopStr, Envelop.class).getObj().toString();
                }

                Map<String, Object> viewInfo = new HashMap<>();
//                Map<String, Object> conditions = translateViewCondition(rsResourcesModel.getDataSource(), queryStr);
//                viewInfo.put("conditions", conditions); // 视图数据过滤条件。
                if (rsResourcesModel.getDataSource() == 1) {
                    // 档案视图场合
                    viewInfo.put("type", "record");
                    viewInfo.put("resourceCode", rsResourcesModel.getCode());
                    viewInfo.put("searchParams", queryStr);
                    // 获取展示的列名
                    params.clear();
                    params.put("resourcesCode", rsResourcesModel.getCode());
                    String rowsEnvelopStr = getHttpRespons(params,ServiceApi.Resources.ResourceBrowseResourceMetadata);
                    List columns = objectMapper.readValue(rowsEnvelopStr, new TypeReference<List<String>>() {});
                    viewInfo.put("columns", columns);
                    viewInfos.add(viewInfo);
                } else if (rsResourcesModel.getDataSource() == 2) {
                    // 指标视图场合
//                    viewInfo.put("type", "quota");
//                    viewInfo.put("resourceId", view.getResourceId());
                    params.clear();
                    params.put("resourceId", view.getResourceId());
//                    List<String> userOrgList = (List<String>) request.getSession().getAttribute(AuthorityKey.UserOrgSaas);
//                    params.put("userOrgList", userOrgList);
                    params.put("dimension", "slaveKey1");
                    String chartInfoListStr = getHttpRespons(params,ServiceApi.Resources.GetRsQuotaPreview);
                    List<MChartInfoModel> chartInfoList = objectMapper.readValue(chartInfoListStr, new TypeReference<List<MChartInfoModel>>() {
                    });
                    for (MChartInfoModel chartInfo : chartInfoList) {
                        Map<String, Object> option = new HashMap<>();
                        option.put("quotaCode", chartInfo.getQuotaCode());
                        option.put("quotaId", chartInfo.getQuotaId());
//                        option.put("dimensionList", chartInfo.getListMap());
//                        option.put("dimensionOptions", chartInfo.getDimensionMap());
                        option.put("option", chartInfo.getOption());
                        options.add(option);
                    }
                    viewInfo.put("options", options); // 视图包含的指标echart图形的option。
                    viewInfos.add(viewInfo);
                }
            }
            resultMap.put("viewInfos", viewInfos);

            envelop.setObj(resultMap);
            envelop.setSuccessFlg(true);
            return envelop;
        } catch (Exception e) {
            e.printStackTrace();
            envelop.setErrorMsg("获取报表数据发生异常");
            return envelop;
        }

    }

    public String getHttpRespons( Map<String, Object> params,String url) throws IOException {
        Map<String, Object> header = new HashMap<>();
        header = getHeader();
        String resultStr = "";
        HttpResponse response = HttpHelper.get(profileInnerUrl + url, params, header);
        if (response != null && response.getStatusCode() == 200) {
            if(url.equals(ServiceApi.Resources.RsReportTemplateContent)){
                resultStr = objectMapper.readValue(response.getBody(), Envelop.class).getObj().toString();
            }else if(url.equals(ServiceApi.Resources.RsReportViews) || url.equals(ServiceApi.Resources.ResourceBrowseResourceMetadata)){
                resultStr = objectMapper.writeValueAsString(objectMapper.readValue(response.getBody(), Envelop.class).getDetailModelList());
            }else if(url.equals(ServiceApi.Resources.GetRsQuotaPreview)){
                resultStr = response.getBody();
            }else {
                resultStr = objectMapper.writeValueAsString(objectMapper.readValue(response.getBody(), Envelop.class).getObj());
            }
        }
        return resultStr;
    }



}

