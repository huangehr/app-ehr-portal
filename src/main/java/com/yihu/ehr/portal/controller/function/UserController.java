package com.yihu.ehr.portal.controller.function;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yihu.ehr.portal.model.Result;
import com.yihu.ehr.portal.service.function.AppService;
import com.yihu.ehr.util.http.HttpResponse;
import com.yihu.ehr.util.http.HttpUtils;
import com.yihu.ehr.util.rest.Envelop;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;


/**
 * 系统用户管理页面
 * Created by hzp on 2017/2/24.
 */
@Controller
@RequestMapping("/system/userManage/")
public class UserController {

    @Autowired
    private AppService appService;

    @Value("${service-gateway.adminInnerUrl}")
    private String adminInnerUrl;

    @Autowired
    protected ObjectMapper objectMapper;

    /******************************** 页面 **********************************/

    @RequestMapping(value = "userListPage",method = RequestMethod.GET)
    @ApiOperation("用户管理页面")
    public String userManage(Model model) {
        model.addAttribute("contentPage","/userManage/userListPage");
        return "pageView";
    }

    /* ******************************  用户权限内应用展示状态更新  ********************************************* */
    @RequestMapping(value = "app/show", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ApiOperation(value = "用户权限内应用展示状态更新", produces = "application/json", notes = "用户权限内应用展示状态更新")
    @ResponseBody
    public Result infoData(
            @ApiParam(name = "id", value = "用户应用ID", required = true)
            @RequestParam(value = "id") String id,
            @ApiParam(name = "flag", value = "用户类型", required = true)
            @RequestParam(value = "flag") String flag) throws Exception {
        return appService.updateShowFlag(id, flag);
    }

    /**
     * 根据条件，获取APP类型及其所拥有的应用
     * @param manageType APP管理类型，backStage：后台管理，client：客户端。为空则两者都获取。
     * @return
     */
    @RequestMapping(value = "getAppTypeAndApps", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    public Result getAppTypeAndApps(String manageType) throws Exception {
        return appService.getAppTypeAndApps(manageType);
    }

    /**
     * 根据条件，获取APP类型及其所拥有的应用
     * @param userId APP管理类型，backStage：后台管理，client：客户端。为空则两者都获取。
     * @return
     */
    @RequestMapping(value = "getUserRoleApps", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    public Envelop getUserRoleApps(String userId) throws Exception {
        return appService.getUserRoleApp(userId);
    }

    @RequestMapping("showImage")
    @ResponseBody
    public String showImage(String imgRemotePath, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String res = "";
        if (!StringUtils.isEmpty(imgRemotePath)) {
            Map<String, Object> params = new HashMap<>();
            params.put("fileId", imgRemotePath);
            HttpResponse resp = HttpUtils.doGet(adminInnerUrl + "/basic/api/v1.0/file/getFileStorage", params);
            if(StringUtils.isNotEmpty(resp.getContent())){
                res = objectMapper.readValue(resp.getContent(), Envelop.class).getObj().toString();
            }
        }
        return res;
    }


}
