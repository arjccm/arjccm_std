/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.place.religion.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.modules.ccm.place.religion.entity.CcmReligionActivity;
import com.arjjs.ccm.modules.ccm.place.religion.service.CcmReligionActivityService;
import com.arjjs.ccm.tool.EchartType;
import com.google.common.collect.Maps;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.common.utils.StringUtils;

import java.util.List;
import java.util.Map;

/**
 * 宗教活动表Controller
 *
 * @author lgh
 * @version 2020-02-11
 */
@Controller
@RequestMapping(value = "${adminPath}/religion/ccmReligionActivity")
public class CcmReligionActivityController extends BaseController {

    @Autowired
    private CcmReligionActivityService ccmReligionActivityService;

    @ModelAttribute
    public CcmReligionActivity get(@RequestParam(required = false) String id) {
        CcmReligionActivity entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = ccmReligionActivityService.get(id);
        }
        if (entity == null) {
            entity = new CcmReligionActivity();
        }
        return entity;
    }


    @ResponseBody
    @RequestMapping(value = "scale")
    public List<EchartType> findByScale() {
        return ccmReligionActivityService.findByScale();
    }

    @ResponseBody
    @RequestMapping(value = "type")
    public List<EchartType> findByType() {
        return  ccmReligionActivityService.findByType();
    }

    @ResponseBody
    @RequestMapping(value = "typeAndScale")
    public Map<String,List<EchartType>> typeAndScale() {
        Map<String, List<EchartType>> map = Maps.newHashMapWithExpectedSize(2);
        map.put("leftData",ccmReligionActivityService.findByType());
        map.put("rightData",ccmReligionActivityService.findByScale());
        return  map;
    }


    @RequiresPermissions("religion:ccmReligionActivity:view")
    @RequestMapping(value = {"list", ""})
    public String list(CcmReligionActivity ccmReligionActivity, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<CcmReligionActivity> page = ccmReligionActivityService.findPage(new Page<CcmReligionActivity>(request, response), ccmReligionActivity);
        model.addAttribute("page", page);
        return "ccm/place/religion/ccmReligionActivityList";
    }

    @RequiresPermissions("religion:ccmReligionActivity:view")
    @RequestMapping(value = "form")
    public String form(CcmReligionActivity ccmReligionActivity, Model model) {
        model.addAttribute("ccmReligionActivity", ccmReligionActivity);
        return "ccm/place/religion/ccmReligionActivityForm";
    }

    @RequiresPermissions("religion:ccmReligionActivity:edit")
    @RequestMapping(value = "save")
    public String save(CcmReligionActivity ccmReligionActivity, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, ccmReligionActivity)) {
            return form(ccmReligionActivity, model);
        }
        ccmReligionActivityService.save(ccmReligionActivity);
        addMessage(redirectAttributes, "保存宗教活动成功");
        return "redirect:" + Global.getAdminPath() + "/religion/ccmReligionActivity/?repage";
    }

    @RequiresPermissions("religion:ccmReligionActivity:edit")
    @RequestMapping(value = "delete")
    public String delete(CcmReligionActivity ccmReligionActivity, RedirectAttributes redirectAttributes) {
        ccmReligionActivityService.delete(ccmReligionActivity);
        addMessage(redirectAttributes, "删除宗教活动成功");
        return "redirect:" + Global.getAdminPath() + "/religion/ccmReligionActivity/?repage";
    }

}