package com.yihu.ehr.portal.controller.common;

import com.yihu.ehr.util.rest.Envelop;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;


/**
 * 系统页面
 * Created by hzp on 2017/2/21.
 */
@Controller
public class IndexController extends BaseController{

    /******************************** 页面 **********************************/

    /**
     *  首页页面
     */
    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("title","健康之路");
        model.addAttribute("contentPage","home");
        return "crossView";
    }

    /*
        系统参数页面
         */
    @RequestMapping(value = "/appIndex", method = RequestMethod.GET)
    public String appIndex(String nav, String name, String type, String url, String menuId, Model model) {
        try{
            model.addAttribute("nav", nav);
            model.addAttribute("name", name);
            model.addAttribute("type", type);
            model.addAttribute("url", url);
            model.addAttribute("menuId", menuId);
            model.addAttribute("contentPage","appIndex");
            return "crossView";
        } catch (Exception ex) {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }

    /*
    系统参数页面
     */
    @RequestMapping(value = "/xzIndex",method = RequestMethod.GET)
    public String xzIndex(Model model) {
        try{
            model.addAttribute("title","健康之路");
            model.addAttribute("contentPage","xzIndex");
            return "crossView";
        }
        catch (Exception ex) {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }

    /*
    系统参数页面
     */
    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public String home(Model model) {
        try{
            model.addAttribute("title","健康之路");
            model.addAttribute("contentPage","home");
            return "crossView";
        }
        catch (Exception ex) {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }

    /*
    系统参数页面
     */
    @RequestMapping(value = "/newXZIndex",method = RequestMethod.GET)
    public String newXZIndex(String nav, String name, String type, String url, String menuId, Model model) {
        try{
            model.addAttribute("title", "健康之路");
            model.addAttribute("nav", nav);
            model.addAttribute("name", name);
            model.addAttribute("type", type);
            model.addAttribute("url", url);
            model.addAttribute("menuId", menuId);
            model.addAttribute("contentPage", "newXZIndex");
            return "crossView";
        } catch (Exception ex) {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }

    /*
    系统参数页面
     */
    @RequestMapping(value = "/main",method = RequestMethod.GET)
    public String getMain(Model model) {
        try{
            model.addAttribute("title","健康之路");
            model.addAttribute("contentPage","main");
            return "crossView";
        }
        catch (Exception ex) {
            model.addAttribute("errorMessage",ex.getMessage());
            return "errorPage";
        }
    }


    @RequestMapping(value = "/provinces", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取省列表数据", produces = "application/json", notes = "获取省列表数据")
    public Envelop provinces(
            @ApiParam(name = "level", value = "等级", required = true)
            @RequestParam(value = "level", defaultValue = "1") Integer level) throws Exception{
        return getProvinces(level);
    }

    @RequestMapping(value = "/citys", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "获取市列表数据", produces = "application/json", notes = "获取市列表数据")
    public Envelop city(
            @ApiParam(name = "pid", value = "父级ID", required = true)
            @RequestParam(value = "pid") Integer pid) throws Exception {
        return getCity(pid);
    }

    @ResponseBody
    @RequestMapping(value = "/dictName", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ApiOperation(value = "获取字典值数据", produces = "application/json", notes = "根据字典ID获取字典值数据")
    public Envelop getNameById(
            @ApiParam(name = "id", value = "字典ID", required = true)
            @RequestParam(value = "id") Integer id) throws Exception {
        return getDictNameById(id);
    }

}
