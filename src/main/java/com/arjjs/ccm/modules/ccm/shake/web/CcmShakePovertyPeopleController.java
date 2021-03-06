/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.shake.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.arjjs.ccm.modules.ccm.org.entity.SysArea;
import com.arjjs.ccm.modules.ccm.sys.entity.SysDicts;
import com.arjjs.ccm.modules.ccm.sys.service.SysDictsService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.shake.entity.CcmShakePovertyPeople;
import com.arjjs.ccm.modules.ccm.shake.service.CcmShakePovertyPeopleService;

/**
 * 脱贫攻坚实体类Controller
 *
 * @author chenboyuan
 * @version 2019-06-21
 */
@Controller
@RequestMapping(value = "${adminPath}/shake/ccmShakePovertyPeople")
public class CcmShakePovertyPeopleController extends BaseController {

    @Autowired
    private CcmShakePovertyPeopleService ccmShakePovertyPeopleService;

    @Autowired
    private SysDictsService sysDictsService;

    @ModelAttribute
    public CcmShakePovertyPeople get(@RequestParam(required = false) String id) {
        CcmShakePovertyPeople entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = ccmShakePovertyPeopleService.get(id);
        }
        if (entity == null) {
            entity = new CcmShakePovertyPeople();
        }
        return entity;
    }

    @RequiresPermissions("shake:ccmShakePovertyPeople:view")
    @RequestMapping(value = {"list", ""})
    public String list(CcmShakePovertyPeople ccmShakePovertyPeople, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<CcmShakePovertyPeople> page = ccmShakePovertyPeopleService.findPage(new Page<CcmShakePovertyPeople>(request, response), ccmShakePovertyPeople);
        model.addAttribute("page", page);
        return "ccm/shake/ccmShakePovertyPeopleList";
    }

    @RequiresPermissions("shake:ccmShakePovertyPeople:view")
    @RequestMapping(value = "form")
    public String form(CcmShakePovertyPeople ccmShakePovertyPeople, Model model) {
        model.addAttribute("ccmShakePovertyPeople", ccmShakePovertyPeople);
        return "ccm/shake/ccmShakePovertyPeopleForm";
    }

    @RequiresPermissions("shake:ccmShakePovertyPeople:edit")
    @RequestMapping(value = "save")
    public String save(CcmShakePovertyPeople ccmShakePovertyPeople, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, ccmShakePovertyPeople)) {
            return form(ccmShakePovertyPeople, model);
        }
        ccmShakePovertyPeopleService.save(ccmShakePovertyPeople);
        addMessage(redirectAttributes, "保存脱贫攻坚成功");
        return "redirect:" + Global.getAdminPath() + "/shake/ccmShakePovertyPeople/?repage";
    }

    @RequiresPermissions("shake:ccmShakePovertyPeople:edit")
    @RequestMapping(value = "delete")
    public String delete(CcmShakePovertyPeople ccmShakePovertyPeople, RedirectAttributes redirectAttributes) {
        ccmShakePovertyPeopleService.delete(ccmShakePovertyPeople);
        addMessage(redirectAttributes, "删除脱贫攻坚成功");
        return "redirect:" + Global.getAdminPath() + "/shake/ccmShakePovertyPeople/?repage";
    }


    /**
     * 脱贫属性
     *
     * @return
     */
    @RequestMapping(value = "SpTownlist")
    @ResponseBody
    public Map<String, Object> SpTownlist() {
        Map<String, Object> map = ccmShakePovertyPeopleService.findGroupByTown();
        return map;
    }

    /**
     * 各镇贫困人口及年龄统计
     *
     * @return
     */
    @RequestMapping(value = "BirNumlist")
    @ResponseBody
    public Map<String, Object> BirNumlist() {
        List<CcmShakePovertyPeople> list = ccmShakePovertyPeopleService.findByBirNum();
        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        return map;
    }

    /**
     * 贫困人口劳动技能状况
     *
     * @return
     */
    @RequestMapping(value = "skilllist")
    @ResponseBody
    public Map<String, Object> skilllist() {
        Map<String, Object> map = ccmShakePovertyPeopleService.skilllist();
        return map;
    }

    /**
     * 贫困人口健康状况
     *
     * @return
     */
    @RequestMapping(value = "Healthlist")
    @ResponseBody
    public Map<String, Object> Healthlist() {
        Map<String, Object> map = ccmShakePovertyPeopleService.Healthlist();
        return map;
    }

    /*
     * 贫困户属性分布
     * Poverty household attribute distribution
     * */
    @RequestMapping(value = "getPovertyHouseholdAttributeData")
    @ResponseBody
    public Map<String, Object> getPovertyHouseholdAttributeData() {
        List<SysDicts> typeList = sysDictsService.findAllListByType("ccm_shake_poverty_people_sp_people_alleviation");
        CcmShakePovertyPeople ccmShakePovertyPeople = new CcmShakePovertyPeople();
        //按当所有人找到所有镇
        List<SysArea> town = ccmShakePovertyPeopleService.findTown();
        String[][] srt = new String[town.size()][typeList.size()];
        int[][] count = new int[town.size()][typeList.size()];
        String[] townArr = new String[town.size()];

        for (int j = 0; j < town.size(); j++) {
            for (int i = 0; i < typeList.size(); i++) {
                ccmShakePovertyPeople.setSpPeopleAlleviation(typeList.get(i).getValue());
                ccmShakePovertyPeople.setAreaTownId(town.get(j));
                //找查当前镇的 当前type的数据
                count[j][i] = ccmShakePovertyPeopleService.findList(ccmShakePovertyPeople).size();
                srt[j][i] = typeList.get(i).getLabel();
                townArr[j] = town.get(j).getName();
            }
        }

        Map<String, Object> map = new HashMap<>();
        map.put("title", townArr);
        map.put("type", srt);
        map.put("count", count);

        return map;
    }

    /*
     * 脱贫户户均收入情况统计
     * Statistics on the income of poverty-stricken households
     * */
    @RequestMapping(value = "getPovertyIncomeData")
    @ResponseBody
    public Map<String, Object> getPovertyIncomeData() {
        List<SysDicts> typeList = sysDictsService.findAllListByType("ccm_shake_poverty_people_sp_income_type");
        CcmShakePovertyPeople ccmShakePovertyPeople = new CcmShakePovertyPeople();
        //按当所有人找到所有镇
        List<SysArea> town = ccmShakePovertyPeopleService.findTown();
        String[][] srt = new String[town.size()][typeList.size()];
        int[][] count = new int[town.size()][typeList.size()];
        String[] townArr = new String[town.size()];
        int sum = 0;

        for (int j = 0; j < town.size(); j++) {
            for (int i = 0; i < typeList.size(); i++) {
                ccmShakePovertyPeople.setSpIncomeType(typeList.get(i).getValue());
                ccmShakePovertyPeople.setAreaTownId(town.get(j));
                //找查当前镇的 当前type的数据
                List<CcmShakePovertyPeople> list = ccmShakePovertyPeopleService.findList(ccmShakePovertyPeople);

                if (null != list || list.size() != 0) {
                    for (CcmShakePovertyPeople poverty : list) {
                        if (poverty.getSpIncomeAmount() != null) {
                            sum += poverty.getSpIncomeAmount();
                        }
                    }
                }
                count[j][i] = sum;
                sum = 0;
                srt[j][i] = typeList.get(i).getLabel();
                townArr[j] = town.get(j).getName();
            }
        }

        Map<String, Object> map = new HashMap<>();
        map.put("title", townArr);
        map.put("type", srt);
        map.put("count", count);

        return map;
    }

    /*
     * 致贫原因统计
     * Statistics on the causes of poverty
     * */
    @RequestMapping(value = "getCausesPovertyData")
    @ResponseBody
    public Map<String, Object> getCausesPovertyData() {
        List<SysDicts> typeList = sysDictsService.findAllListByType("ccm_shake_poverty_people_sp_reason");
        CcmShakePovertyPeople ccmShakePovertyPeople = new CcmShakePovertyPeople();
        //按当所有人找到所有镇
        List<SysArea> town = ccmShakePovertyPeopleService.findTown();

        String[][] srt = new String[town.size()][typeList.size()];
        int[][] count = new int[town.size()][typeList.size()];
        String[] townArr = new String[town.size()];

        for (int j = 0; j < town.size(); j++) {
            for (int i = 0; i < typeList.size(); i++) {
                //ccmShakePovertyPeople value
                ccmShakePovertyPeople.setSpReason(typeList.get(i).getValue());
                //ccmShakePovertyPeople id
                ccmShakePovertyPeople.setAreaTownId(town.get(j));
                //找查当前镇的
                count[j][i] = ccmShakePovertyPeopleService.findList(ccmShakePovertyPeople).size();
                srt[j][i] = typeList.get(i).getLabel();
                townArr[j] = town.get(j).getName();
            }
        }

        Map<String, Object> map = new HashMap<>(3);
        map.put("title", townArr);
        map.put("type", srt);
        map.put("count", count);

        return map;
    }

    /*
     * 贫困人口
     * getComprehensiveData
     * */
    @RequestMapping(value = "getComprehensiveData")
    @ResponseBody
    public Map<String, Object> getComprehensiveData() {
        Map<String, Object> map = ccmShakePovertyPeopleService.SelectAll();
        return map;
    }


}