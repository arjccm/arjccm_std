/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.pop.web;

import com.arjjs.ccm.common.beanvalidator.BeanValidators;
import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.utils.DateUtils;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.common.utils.excel.ImportExcel;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.cpp.dao.CppPopPopDao;
import com.arjjs.ccm.modules.ccm.cpp.dao.CppPopVehileDao;
import com.arjjs.ccm.modules.ccm.cpp.entity.CppPopPop;
import com.arjjs.ccm.modules.ccm.cpp.entity.CppPopVehile;
import com.arjjs.ccm.modules.ccm.cpp.service.CppPopPopService;
import com.arjjs.ccm.modules.ccm.house.entity.*;
import com.arjjs.ccm.modules.ccm.house.service.*;
import com.arjjs.ccm.modules.ccm.log.entity.CcmLogTail;
import com.arjjs.ccm.modules.ccm.log.service.CcmLogTailService;
import com.arjjs.ccm.modules.ccm.org.entity.CcmOrgArea;
import com.arjjs.ccm.modules.ccm.org.entity.SysArea;
import com.arjjs.ccm.modules.ccm.org.service.CcmOrgAreaService;
import com.arjjs.ccm.modules.ccm.org.service.SysAreaService;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeople;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeopleExport;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPopTenant;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPeopleService;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPopTenantService;
import com.arjjs.ccm.modules.ccm.report.entity.CcmPeopleAmount;
import com.arjjs.ccm.modules.ccm.report.entity.CcmPeopleStat;
import com.arjjs.ccm.modules.ccm.report.service.CcmPeopleAmountService;
import com.arjjs.ccm.modules.ccm.report.service.CcmPeopleStatService;
import com.arjjs.ccm.modules.ccm.sys.entity.SysDicts;
import com.arjjs.ccm.modules.ccm.sys.service.SysDictsService;
import com.arjjs.ccm.modules.ccm.tenant.entity.CcmTenantRecord;
import com.arjjs.ccm.modules.ccm.tenant.service.CcmTenantRecordService;
import com.arjjs.ccm.modules.sys.entity.Area;
import com.arjjs.ccm.modules.sys.entity.Dict;
import com.arjjs.ccm.modules.sys.service.AreaService;
import com.arjjs.ccm.modules.sys.service.DictService;
import com.arjjs.ccm.tool.*;
import com.google.common.collect.Maps;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 实有人口Controller
 *
 * @author liang
 * @version 2018-01-04
 */
@Controller
@RequestMapping(value = "${adminPath}/pop/ccmPeople")
public class CcmPeopleController extends BaseController {

	@Autowired
	private CcmPeopleService ccmPeopleService;
	@Autowired
	private CcmHouseDrugsService ccmHouseDrugsService;
	@Autowired
	private CcmLogTailService ccmLogTailService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private CcmOrgAreaService ccmOrgAreaService;
	@Autowired
	private CcmHouseBuildmanageService ccmHouseBuildmanageService;
	@Autowired
	private CcmPeopleAmountService ccmPeopleAmountService;
	@Autowired
	private CcmPeopleStatService ccmPeopleStatService;
	@Autowired
	private CcmPopTenantService ccmPopTenantService;
	@Autowired
	private CcmHarmNationalSecurityService ccmHarmNationalSecurityService;
	@Autowired
	private CcmSeriousCriminalOffenseService ccmSeriousCriminalOffenseService;
	@Autowired
	private DictService dictService;
	@Autowired
	private CcmHouseEscapeService ccmHouseEscapeService;
	@Autowired
	private CppPopPopDao cppPopPopDao;
	@Autowired
	private CppPopVehileDao cppPopVehileDao;
	@Autowired
	private CcmHouseDisputeService ccmHouseDisputeService;
	@Autowired
	private CcmTenantRecordService ccmTenantRecordService;
	@Autowired
	private SysAreaService sysAreaService;
	//数据字典
	@Autowired
	private SysDictsService sysDictsService;
	@Autowired
	private CppPopPopService cppPopPopService;

	@ModelAttribute
	public CcmPeople get(@RequestParam(required = false) String id) {
		CcmPeople entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = ccmPeopleService.get(id);
		}
		if (entity == null) {
			entity = new CcmPeople();
		}
		return entity;
	}

	@RequestMapping(value = "relation")
	@ResponseBody
	public Object getRelationData(@RequestParam(value = "id") String id) {

		CcmPeople ccmPeople = ccmPeopleService.get(id);
		Map<String, Object> map = Maps.newHashMap();
//		List<CppPopPop> cppPopPoplList = cppPopPopDao.getByIdCard(ccmPeople.getIdent());
        CppPopPop cppPopPop = new CppPopPop();
        cppPopPop.setIdCard1(ccmPeople.getIdent());
        List<CppPopPop> cppPopPoplList =cppPopPopService.findList(cppPopPop);
		List<CppPopVehile> cppPopVehilelList = cppPopVehileDao.getByRelation(ccmPeople.getIdent());
		map.put("cppPopPop", cppPopPoplList);
		map.put("cppPopVehile", cppPopVehilelList);

		return map;
	}

	@RequiresPermissions("pop:ccmPeople:view")
	@RequestMapping(value = { "list", "" })
	public String list(CcmPeople ccmPeople, String updataDate,HttpServletRequest request, HttpServletResponse response, Model model) {
//		Page<CcmPeople> page = ccmPeopleService.findPage(new Page<CcmPeople>(request, response), ccmPeople);
//		List<CcmPeople> list = page.getList();
//      int countnum = ccmPeopleService.findCount();
		Pagecount page = new Pagecount<CcmPeople>(request, response);
		int countnum = page.getPageSize()*8;
		if(page.getPageNo()>= 6){
			countnum+=page.getPageNo()/6*page.getPageSize()*8;
		}
		page.setCount(countnum);
		page.initialize();
		ccmPeople.setMinnum((page.getPageNo()-1)*page.getPageSize());
		ccmPeople.setMaxnum(page.getPageSize());
		if(StringUtils.isNotEmpty(ccmPeople.getName())){
			ccmPeople.setIsOrderBy("true");
		}
		if(StringUtils.isNotEmpty(ccmPeople.getIdent())){
			ccmPeople.setIsOrderBy("true");
		}
		List<CcmPeople> list = ccmPeopleService.findListBylimit(ccmPeople);
		CcmPeople ccmPeople2 = new CcmPeople();
		String[] listLimite = new String[list.size()];
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				listLimite[i] = list.get(i).getId();
			}
			ccmPeople2.setListLimite(listLimite);
			List<CcmPeople> list2 = ccmPeopleService.findListLimite_V2(ccmPeople2);// 数组查询id
/*			page.setOrderBy(ccmPeople.getUpdateDate());*/
			page.setList(list2);
		}
		if(list.size()< 10){
			page.setCount(10);
			page.initialize();
		}
		// List<CcmPeople> list2 = new ArrayList<>();
		// if(list.size()>0){
		// for(CcmPeople p:list){
		// p = ccmPeopleService.get(p.getId());
		// list2.add(p);
		// }
		// page.setList(list2);
		// }
		model.addAttribute("page", page);
		model.addAttribute("che",ccmPeople.getChe());
		return "ccm/pop/ccmPeopleList";
	}

	// 党员
	@RequiresPermissions("pop:ccmPeople:view")
	@RequestMapping(value = "listCommunist")
	public String listCommunist(CcmPeople ccmPeople, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		Page<CcmPeople> page = ccmPeopleService.findCommunistPage(new Page<CcmPeople>(request, response), ccmPeople);
		// 数组查询id
		List<CcmPeople> list = page.getList();
		CcmPeople ccmPeople2 = new CcmPeople();
		String[] listLimite = new String[list.size()];
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				listLimite[i] = list.get(i).getId();
			}
			ccmPeople2.setListLimite(listLimite);
			List<CcmPeople> list2 = ccmPeopleService.findListLimite_V2(ccmPeople2);// 数组查询id
			page.setList(list2);
		}

		model.addAttribute("page", page);
		return "ccm/pop/ccmPeopleCommunistList";
	}

	// 党员表单
	@RequiresPermissions("pop:ccmPeople:view")
	@RequestMapping(value = "formCommunist")
	public String formCommunist(CcmPeople ccmPeople, Model model) {
		// 创建 查询对象 建立查询条件
		CcmLogTail ccmLogTailDto = new CcmLogTail();
		ccmLogTailDto.setRelevanceId(ccmPeople.getId());
		ccmLogTailDto.setRelevanceTable("ccm_people");
		List<CcmLogTail> ccmLogTailList = ccmLogTailService.findListByObject(ccmLogTailDto);
		// 返回查询结果
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "createBy", "updateBy", "currentUser", "dbName", "global", "page",
				"createDate", "updateDate", "sqlMap" });
		config.setIgnoreDefaultExcludes(false); // 设置默认忽略
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		String jsonDocumentList = JSONArray.fromObject(ccmLogTailList, config).toString();
		model.addAttribute("documentList", jsonDocumentList);
		model.addAttribute("documentNumber", ccmLogTailList.size());

		model.addAttribute("ccmLogTailList", ccmLogTailList);
		model.addAttribute("ccmPeople", ccmPeople);
		return "ccm/pop/ccmPeopleCommunistForm";
	}

	// 党员删除
	@RequiresPermissions("pop:ccmPeople:edit")
	@RequestMapping(value = "deleteCommunist")
	public String deleteCommunist(CcmPeople ccmPeople, RedirectAttributes redirectAttributes) {
		ccmPeopleService.delete(ccmPeople);
		addMessage(redirectAttributes, "删除实有人口成功");
		return "redirect:" + Global.getAdminPath() + "/pop/ccmPeople/listCommunist/?repage";
	}

	// 党员保存
	@RequiresPermissions("pop:ccmPeople:edit")
	@RequestMapping(value = "saveCommunist")
	public String saveCommunist(CcmPeople ccmPeople, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, ccmPeople)) {
			return form(ccmPeople, model);
		}
		// 注入楼栋id
		if (ccmPeople.getRoomId() != null && ccmPeople.getRoomId().getId() != null
				&& !"".equals(ccmPeople.getRoomId().getId())) {
			CcmPopTenant ccmPopTenant = ccmPopTenantService.get(ccmPeople.getRoomId().getId());
			if (ccmPopTenant != null && ccmPopTenant.getBuildingId() != null
					&& ccmPopTenant.getBuildingId().getId() != null && ccmPopTenant.getBuildingId().getId() != "") {
				ccmPeople.setBuildId(ccmPopTenant.getBuildingId());
			}
		}
        ccmPeopleService.save(ccmPeople);
		addMessage(redirectAttributes, "保存实有人口成功");
		return "redirect:" + Global.getAdminPath() + "/pop/ccmPeople/listCommunist/?repage";
	}

	// 老年人
	@RequiresPermissions("pop:ccmOlder:view")
	@RequestMapping(value = "listOlder")
	public String listOlder(CcmPeople ccmPeople, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.add(Calendar.YEAR, 0 - PlmTypes.OLD_AGE);
		ccmPeople.setBirthday(calendar.getTime());
//		Page<CcmPeople> page = ccmPeopleService.findOlderPage(new Page<CcmPeople>(request, response), ccmPeople);
        Pagecount page = new Pagecount<CcmPeople>(request, response);
        int countnum = page.getPageSize()*8;
        if(page.getPageNo()>= 6){
            countnum+=page.getPageNo()/6*page.getPageSize()*8;
        }
        page.setCount(countnum);
        page.initialize();
        ccmPeople.setMinnum((page.getPageNo()-1)*page.getPageSize());
        ccmPeople.setMaxnum(page.getPageSize());
        List<CcmPeople> list = ccmPeopleService.findOlderPageBylimit(ccmPeople);
		// 数组查询id
//		List<CcmPeople> list = page.getList();
		CcmPeople ccmPeople2 = new CcmPeople();
		String[] listLimite = new String[list.size()];
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				listLimite[i] = list.get(i).getId();
			}
			ccmPeople2.setListLimite(listLimite);
			List<CcmPeople> list2 = ccmPeopleService.findListLimite_V2(ccmPeople2);// 数组查询id
			page.setList(list2);
		}
		if(list.size()< 10){
			page.setCount(10);
			page.initialize();
		}
		model.addAttribute("page", page);
		return "ccm/pop/ccmPeopleOlderList";
	}

	// 老年人表单
	@RequiresPermissions("pop:ccmOlder:view")
	@RequestMapping(value = "formOlder")
	public String formOlder(CcmPeople ccmPeople, Model model) {
		// 创建 查询对象 建立查询条件
		CcmLogTail ccmLogTailDto = new CcmLogTail();
		ccmLogTailDto.setRelevanceId(ccmPeople.getId());
		ccmLogTailDto.setRelevanceTable("ccm_people");
		List<CcmLogTail> ccmLogTailList = ccmLogTailService.findListByObject(ccmLogTailDto);
		// 返回查询结果
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "createBy", "updateBy", "currentUser", "dbName", "global", "page",
				"createDate", "updateDate", "sqlMap" });
		config.setIgnoreDefaultExcludes(false); // 设置默认忽略
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		String jsonDocumentList = JSONArray.fromObject(ccmLogTailList, config).toString();
		model.addAttribute("documentList", jsonDocumentList);
		model.addAttribute("documentNumber", ccmLogTailList.size());

		model.addAttribute("ccmLogTailList", ccmLogTailList);
		model.addAttribute("ccmPeople", ccmPeople);
		return "ccm/pop/ccmPeopleOlderForm";
	}

	// 老年人删除
	@RequiresPermissions("pop:ccmOlder:edit")
	@RequestMapping(value = "deleteOlder")
	public String deleteOlder(CcmPeople ccmPeople, RedirectAttributes redirectAttributes) {
		ccmPeopleService.delete(ccmPeople);
		addMessage(redirectAttributes, "删除实有人口成功");
		return "redirect:" + Global.getAdminPath() + "/pop/ccmPeople/listOlder/?repage";
	}

	// 老年人保存
	@RequiresPermissions("pop:ccmOlder:edit")
	@RequestMapping(value = "saveOlder")
	public void saveOlder(CcmPeople ccmPeople, Model model, RedirectAttributes redirectAttributes,HttpServletResponse response) {
		if (!beanValidator(model, ccmPeople)) {
			//return form(ccmPeople, model);
		}
		// 注入楼栋id
		if (ccmPeople.getRoomId() != null && ccmPeople.getRoomId().getId() != null
				&& !"".equals(ccmPeople.getRoomId().getId())) {
			CcmPopTenant ccmPopTenant = ccmPopTenantService.get(ccmPeople.getRoomId().getId());
			if (ccmPopTenant != null && ccmPopTenant.getBuildingId() != null
					&& ccmPopTenant.getBuildingId().getId() != null && ccmPopTenant.getBuildingId().getId() != "") {
				ccmPeople.setBuildId(ccmPopTenant.getBuildingId());
			}
		}
		ccmPeopleService.save(ccmPeople);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		CommUtil.openWinExpDiv(out,"保存实有人口成功");
		//addMessage(redirectAttributes, "保存实有人口成功");
		//return "redirect:" + Global.getAdminPath() + "/pop/ccmPeople/listOlder/?repage";
	}

	// 特殊关怀First
	@RequiresPermissions("pop:ccmCare:view")
	@RequestMapping(value = "listCareFirst")
	public String listCareFirst(CcmPeople ccmPeople, HttpServletRequest request, HttpServletResponse response,
			Model model) {
//		Page<CcmPeople> page = ccmPeopleService.findCareFirst(new Page<CcmPeople>(request, response), ccmPeople);
		Pagecount page = new Pagecount<CcmPeople>(request, response);
		int countnum = page.getPageSize()*8;
		if(page.getPageNo()>= 6){
			countnum+=page.getPageNo()/6*page.getPageSize()*8;
		}
		page.setCount(countnum);
		page.initialize();
		ccmPeople.setMinnum((page.getPageNo()-1)*page.getPageSize());
		ccmPeople.setMaxnum(page.getPageSize());
		List<CcmPeople> list = ccmPeopleService.findCareFirstBylimit(ccmPeople);
		// 数组查询id
//		List<CcmPeople> list = page.getList();
		CcmPeople ccmPeople2 = new CcmPeople();
		String[] listLimite = new String[list.size()];
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				listLimite[i] = list.get(i).getId();
			}
			ccmPeople2.setListLimite(listLimite);
			List<CcmPeople> list2 = ccmPeopleService.findListLimite_V2(ccmPeople2);// 数组查询id
			page.setList(list2);
		}
		if(list.size()< 10){
			page.setCount(10);
			page.initialize();
		}
		model.addAttribute("page", page);
		return "ccm/pop/ccmPeopleCareList";
	}

	// 特殊关怀
	@RequiresPermissions("pop:ccmCare:view")
	@RequestMapping(value = "listCare")
	public String listCare(CcmPeople ccmPeople, HttpServletRequest request, HttpServletResponse response, Model model) {
		String specialCareTypeStr = "";
		if (ccmPeople.getSpecialCareType() != null && !"".equals(ccmPeople.getSpecialCareType())) {
			String[] specialCareTypes = ccmPeople.getSpecialCareType().split(",");
			for (int i = 0; i < specialCareTypes.length; i++) {// 去掉空字符串和null字符串
				if (specialCareTypes[i] != null && !"".equals(specialCareTypes[i])
						&& !"null".equals(specialCareTypes[i])) {
					specialCareTypeStr = specialCareTypeStr + specialCareTypes[i] + ",";
				}
			}
			ccmPeople.setSpecialCareTypes(specialCareTypeStr.split(","));
		}
		if ("".equals(specialCareTypeStr)) {// 传过来值中没有有效的内容，则查询全部
			Dict dict = new Dict();
			dict.setType("pop_special_care_type");
			List<Dict> dictList = dictService.findList(dict);
			String[] specialCareTypes = new String[dictList.size()];
			for (int i = 0; i < specialCareTypes.length; i++) {
				specialCareTypes[i] = dictList.get(i).getValue();
			}
			ccmPeople.setSpecialCareTypes(specialCareTypes);
		}
		Pagecount page = new Pagecount<CcmPeople>(request, response);
		int countnum = page.getPageSize()*8;
		if(page.getPageNo()>= 6){
			countnum+=page.getPageNo()/6*page.getPageSize()*8;
		}
		page.setCount(countnum);
		page.initialize();
		ccmPeople.setMinnum((page.getPageNo()-1)*page.getPageSize());
		ccmPeople.setMaxnum(page.getPageSize());
//		Page<CcmPeople> page = ccmPeopleService.findCarePage(new Page<CcmPeople>(request, response), ccmPeople);
		List<CcmPeople> list = ccmPeopleService.findCareListBylimit(ccmPeople);

		// 数组查询id
//		List<CcmPeople> list = page.getList();
		CcmPeople ccmPeople2 = new CcmPeople();
		String[] listLimite = new String[list.size()];
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				listLimite[i] = list.get(i).getId();
			}
			ccmPeople2.setListLimite(listLimite);
			List<CcmPeople> list2 = ccmPeopleService.findListLimite_V2(ccmPeople2);// 数组查询id
			page.setList(list2);
		}
		if(list.size()< 10){
			page.setCount(10);
			page.initialize();
		}
		model.addAttribute("page", page);
		return "ccm/pop/ccmPeopleCareList";
	}

	// 特殊关怀表单
	@RequiresPermissions("pop:ccmCare:view")
	@RequestMapping(value = "formCare")
	public String formCare(CcmPeople ccmPeople, Model model) {
		// 创建 查询对象 建立查询条件
		CcmLogTail ccmLogTailDto = new CcmLogTail();
		ccmLogTailDto.setRelevanceId(ccmPeople.getId());
		ccmLogTailDto.setRelevanceTable("ccm_people");
		List<CcmLogTail> ccmLogTailList = ccmLogTailService.findListByObject(ccmLogTailDto);
		// 返回查询结果
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "createBy", "updateBy", "currentUser", "dbName", "global", "page",
				"createDate", "updateDate", "sqlMap" });
		config.setIgnoreDefaultExcludes(false); // 设置默认忽略
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		String jsonDocumentList = JSONArray.fromObject(ccmLogTailList, config).toString();
		model.addAttribute("documentList", jsonDocumentList);
		model.addAttribute("documentNumber", ccmLogTailList.size());

		model.addAttribute("ccmLogTailList", ccmLogTailList);
		model.addAttribute("ccmPeople", ccmPeople);
		return "ccm/pop/ccmPeopleCareForm";
	}

	// 特殊关怀删除
	@RequiresPermissions("pop:ccmCare:edit")
	@RequestMapping(value = "deleteCare")
	public String deleteCare(CcmPeople ccmPeople, RedirectAttributes redirectAttributes) {
		ccmPeopleService.delete(ccmPeople);
		addMessage(redirectAttributes, "删除实有人口成功");
		return "redirect:" + Global.getAdminPath() + "/pop/ccmPeople/listCareFirst/?repage";
	}

	// 特殊关怀保存
	@RequiresPermissions("pop:ccmCare:edit")
	@RequestMapping(value = "saveCare")
	public void saveCare(CcmPeople ccmPeople, Model model, RedirectAttributes redirectAttributes,HttpServletResponse response) {
		if (!beanValidator(model, ccmPeople)) {
			//return form(ccmPeople, model);
		}
		// 注入楼栋id
		if (ccmPeople.getRoomId() != null && ccmPeople.getRoomId().getId() != null
				&& !"".equals(ccmPeople.getRoomId().getId())) {
			CcmPopTenant ccmPopTenant = ccmPopTenantService.get(ccmPeople.getRoomId().getId());
			if (ccmPopTenant != null && ccmPopTenant.getBuildingId() != null
					&& ccmPopTenant.getBuildingId().getId() != null && ccmPopTenant.getBuildingId().getId() != "") {
				ccmPeople.setBuildId(ccmPopTenant.getBuildingId());
			}
		}
		ccmPeopleService.save(ccmPeople);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		CommUtil.openWinExpDiv(out,"保存实有人口成功");
		//return "redirect:" + Global.getAdminPath() + "/pop/ccmPeople/listCareFirst/?repage";
	}

	// 人员信息弹框
	@ResponseBody
	@RequestMapping(value = "getHousePopForm")
	public CcmPeople getHousePopForm(CcmPeople ccmPeople, Model model) {
		// 返回对象结果
		ccmPeople = ccmPeopleService.getHousePopForm(ccmPeople);
		String nation = ccmPeopleService.getNation(ccmPeople);
		if (nation == null || nation == "") {
			ccmPeople.setNation("");
		} else {
			ccmPeople.setNation(nation);
		}
		return ccmPeople;
	}

	// 户籍户号调用
	@RequiresPermissions("pop:ccmPeople:view")
	@RequestMapping(value = "listAccount")
	public String listAccount(CcmPeople ccmPeople, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		Page<CcmPeople> page = ccmPeopleService.listAccount(new Page<CcmPeople>(request, response), ccmPeople);
		model.addAttribute("page", page);
		model.addAttribute("ccmPeopleAccount", ccmPeople);
		return "ccm/pop/ccmPeopleListAccount";
	}

	// 保存户籍家庭人员户籍列表
	@RequiresPermissions("pop:ccmPeople:edit")
	@RequestMapping(value = "saveAccount")
	public void saveAccount(CcmPeople ccmPeople, Model model, RedirectAttributes redirectAttributes,HttpServletResponse response) {
		if (!beanValidator(model, ccmPeople)) {
			//return form(ccmPeople, model);
		}
		// 注入楼栋id
		if (ccmPeople.getRoomId() != null && ccmPeople.getRoomId().getId() != null
				&& !"".equals(ccmPeople.getRoomId().getId())) {
			CcmPopTenant ccmPopTenant = ccmPopTenantService.get(ccmPeople.getRoomId().getId());
			if (ccmPopTenant != null && ccmPopTenant.getBuildingId() != null
					&& ccmPopTenant.getBuildingId().getId() != null && ccmPopTenant.getBuildingId().getId() != "") {
				ccmPeople.setBuildId(ccmPopTenant.getBuildingId());
			}
		}
		ccmPeopleService.save(ccmPeople);		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		CommUtil.openWinExpDiv(out,"保存实有人口成功");
		//return "redirect:" + Global.getAdminPath() + "/pop/ccmPeople/listAccount?account=" + ccmPeople.getAccount()
		//		+ "&repage";
	}

	// 删除户籍家庭人员
	@RequiresPermissions("pop:ccmPeople:edit")
	@RequestMapping(value = "deleteAccount")
	public String deleteAccount(CcmPeople ccmPeople, RedirectAttributes redirectAttributes) {
		ccmPeopleService.delete(ccmPeople);
		addMessage(redirectAttributes, "删除户籍家庭人员成功");
		return "redirect:" + Global.getAdminPath() + "/pop/ccmPeople/listAccount?account=" + ccmPeople.getAccount()
				+ "&repage";
	}

	// 户籍户号调用（从户籍跟踪信息跳回户籍列表）
	@RequiresPermissions("pop:ccmPeople:view")
	@RequestMapping(value = "listAccountFind")
	public String listAccountFind(CcmPeople ccmPeople, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		ccmPeople = ccmPeopleService.get(ccmPeople);
		Page<CcmPeople> page = ccmPeopleService.listAccount(new Page<CcmPeople>(request, response), ccmPeople);
		model.addAttribute("page", page);
		model.addAttribute("ccmPeopleAccount", ccmPeople);
		return "ccm/pop/ccmPeopleListAccount";
	}

	// 校园周边重点人员显示
	@RequiresPermissions("pop:ccmPeople:view")
	@RequestMapping(value = "formPop")
	public String formPop(CcmPeople ccmPeople, Model model) {
		// 创建 查询对象 建立查询条件
		CcmLogTail ccmLogTailDto = new CcmLogTail();
		ccmLogTailDto.setRelevanceId(ccmPeople.getId());
		ccmLogTailDto.setRelevanceTable("ccm_house_schoolrim");
		List<CcmLogTail> ccmLogTailList = ccmLogTailService.findListByObject(ccmLogTailDto);
		// 返回查询结果
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "createBy", "updateBy", "currentUser", "dbName", "global", "page",
				"createDate", "updateDate", "sqlMap" });
		config.setIgnoreDefaultExcludes(false); // 设置默认忽略
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		String jsonDocumentList = JSONArray.fromObject(ccmLogTailList, config).toString();
		model.addAttribute("documentList", jsonDocumentList);
		model.addAttribute("documentNumber", ccmLogTailList.size());

		model.addAttribute("ccmLogTailList", ccmLogTailList);
		model.addAttribute("ccmPeople", ccmPeople);
		return "ccm/pop/ccmPeopleFormPop";
	}

	@RequiresPermissions("pop:ccmPeople:view")
	@RequestMapping(value = "form")
	public String form(CcmPeople ccmPeople, Model model) {
		// 创建 查询对象 建立查询条件
		CcmLogTail ccmLogTailDto = new CcmLogTail();
		ccmLogTailDto.setRelevanceId(ccmPeople.getId());
		ccmLogTailDto.setRelevanceTable("ccm_people");
		List<CcmLogTail> ccmLogTailList = ccmLogTailService.findListByObject(ccmLogTailDto);
		// 返回查询结果
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "createBy", "updateBy", "currentUser", "dbName", "global", "page",
				"createDate", "updateDate", "sqlMap" });
		config.setIgnoreDefaultExcludes(false); // 设置默认忽略
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		String jsonDocumentList = JSONArray.fromObject(ccmLogTailList, config).toString();
		int ageIdent = 0;
		try {
			String ident = ccmPeople.getIdent();
			if(StringUtils.isNotEmpty(ident)){
				Date birthDate = CommUtil.getBirthDay(ident);
				ageIdent = CommUtil.getAge(birthDate);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		int ageBirth = 0;
		try {
			Date birthday = ccmPeople.getBirthday();
			if(birthday!=null){
				ageBirth = CommUtil.getAge(birthday);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(ageIdent < 13 || ageIdent > 19 || ageBirth < 13 || ageBirth > 19) {
			ccmPeople.setIsKym(2);
		}
		model.addAttribute("documentList", jsonDocumentList);
		model.addAttribute("documentNumber", ccmLogTailList.size());

		model.addAttribute("ccmLogTailList", ccmLogTailList);
		model.addAttribute("ccmPeople", ccmPeople);

		List<SysDicts> dictsList = sysDictsService.findAllListByType("ccm_buss_cate");
		model.addAttribute("unitCategory",dictsList);
		return "ccm/pop/ccmPeopleForm";
	}

	// 户籍人口添加
	@RequiresPermissions("pop:ccmPeople:view")
	@RequestMapping(value = "formAccount")
	public String formAccount(CcmPeople ccmPeople, Model model) {
		// 创建 查询对象 建立查询条件
		CcmLogTail ccmLogTailDto = new CcmLogTail();
		ccmLogTailDto.setRelevanceId(ccmPeople.getId());
		ccmLogTailDto.setRelevanceTable("ccm_people");
		List<CcmLogTail> ccmLogTailList = ccmLogTailService.findListByObject(ccmLogTailDto);
		// 返回查询结果
		model.addAttribute("ccmLogTailList", ccmLogTailList);
		model.addAttribute("ccmPeople", ccmPeople);
		return "ccm/pop/ccmPeopleFormAccount";
	}

	@RequiresPermissions("pop:ccmPeople:edit")
	@RequestMapping(value = "save")
	public String save(CcmPeople ccmPeople, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, ccmPeople)) {
			return form(ccmPeople, model);
		}
		// 注入楼栋id
		if (ccmPeople.getRoomId() != null && ccmPeople.getRoomId().getId() != null
				&& !"".equals(ccmPeople.getRoomId().getId())) {
			CcmPopTenant ccmPopTenant = ccmPopTenantService.get(ccmPeople.getRoomId().getId());
			if (ccmPopTenant != null && ccmPopTenant.getBuildingId() != null
					&& ccmPopTenant.getBuildingId().getId() != null && ccmPopTenant.getBuildingId().getId() != "") {
				ccmPeople.setBuildId(ccmPopTenant.getBuildingId());
			}
		}
		//如果有特殊类型被标记，是否为重点人员改为 是
        if (sign(ccmPeople)){
            ccmPeople.setFocuPers(1);
        }
        else {
            ccmPeople.setFocuPers(0);
        }
		ccmPeopleService.save(ccmPeople);
		addMessage(redirectAttributes, "保存实有人口成功");
		return "redirect:" + Global.getAdminPath() + "/pop/ccmPeople/?repage";
	}

	@RequiresPermissions("pop:ccmPeople:edit")
	@RequestMapping(value = "delete")
	public String delete(CcmPeople ccmPeople, RedirectAttributes redirectAttributes) {
		ccmPeopleService.delete(ccmPeople);
		addMessage(redirectAttributes, "删除实有人口成功");
		return "redirect:" + Global.getAdminPath() + "/pop/ccmPeople/?repage";
	}

	@RequiresPermissions("pop:ccmPeople:view")
	@RequestMapping(value = "specialform")
	public String specialform(CcmPeople ccmPeople, Model model) {
		model.addAttribute("ccmPeople", ccmPeople);
		CcmHouseDrugs Drugs = ccmHouseDrugsService.getPeopleALL(ccmPeople.getId());
		if (Drugs == null) {
			Drugs = new CcmHouseDrugs();
		}
		model.addAttribute("ccmHouseDrugs", Drugs);
		return "/ccm/house/pop/ccmHousePoPDrugsForm";
	}

	@RequiresPermissions("pop:ccmPeople:view")
	@RequestMapping(value = "seriousCriminalOffenseform")
	public String seriousCriminalOffenseform(CcmPeople ccmPeople, Model model) {
		model.addAttribute("ccmPeople", ccmPeople);
		CcmSeriousCriminalOffense SeriousCriminalOffense = ccmSeriousCriminalOffenseService
				.getPeopleALL(ccmPeople.getId());
		if (SeriousCriminalOffense == null) {
			SeriousCriminalOffense = new CcmSeriousCriminalOffense();
		}
		model.addAttribute("ccmSeriousCriminalOffense", SeriousCriminalOffense);
		return "/ccm/house/pop/ccmHousePoPSeriousCriminalOffenseForm";
	}

	@RequiresPermissions("pop:ccmPeople:view")
	@RequestMapping(value = "specialHarmNationalform")
	public String specialHarmNationalform(CcmPeople ccmPeople, Model model) {
		model.addAttribute("ccmPeople", ccmPeople);
		CcmHarmNationalSecurity HarmNationalSecurity = ccmHarmNationalSecurityService.getPeopleALL(ccmPeople.getId());
		if (HarmNationalSecurity == null) {
			HarmNationalSecurity = new CcmHarmNationalSecurity();
		}
		model.addAttribute("ccmHarmNationalSecurity", HarmNationalSecurity);
		return "/ccm/house/pop/ccmHousePoPHarmNationalForm";
	}

	@RequiresPermissions("pop:ccmPeople:view")
	@RequestMapping(value = "escapePeopleform")
	public String escapePeopleform(CcmPeople ccmPeople, Model model) {
		model.addAttribute("ccmPeople", ccmPeople);
		CcmHouseEscape HouseEscape = ccmHouseEscapeService.getPeopleALL(ccmPeople.getId());
		if (HouseEscape == null) {
			HouseEscape = new CcmHouseEscape();
		}
		model.addAttribute("ccmHouseEscape", HouseEscape);
		return "/ccm/house/pop/ccmHousePoPEscapeForm";
	}

	@RequiresPermissions("pop:ccmPeople:view")
	@RequestMapping(value = "specialHouseDisputeform")
	public String specialHouseDisputeform(CcmPeople ccmPeople, Model model) {
		model.addAttribute("ccmPeople", ccmPeople);
		CcmHouseDispute HouseDispute = ccmHouseDisputeService.getPeopleALL(ccmPeople.getId());
		if (HouseDispute == null) {
			HouseDispute = new CcmHouseDispute();
		}
		model.addAttribute("ccmHouseDispute", HouseDispute);
		return "/ccm/house/pop/ccmHousePoPDisputeForm";
	}

	/**
	 * 导出实有人口数据
	 * @param ccmPeople
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("pop:ccmPeople:view")
	@RequestMapping(value = "export", method = RequestMethod.POST)
	public String exportFile(CcmPeople ccmPeople, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttributes) {
		String [] strArr={"姓名","联系方式","所属社区","所属网格","公民身份号码"};

		try {

			String fileName = "PeopleExport" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";
			List<CcmPeople> list = ccmPeopleService.getExportList(ccmPeople);
			new ExportExcel("实有人口数据", CcmPeople.class,strArr).setDataList(list).write(response, fileName).dispose();
			return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出实有人口失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + adminPath + "/pop/ccmPeople/?repage";
	}

	@RequiresPermissions("pop:ccmPeople:view")
	@RequestMapping(value = "exportByType", method = RequestMethod.POST)
	public String exportByType(CcmPeople ccmPeople, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttributes) {
		String [] strArr={"姓名","联系方式","所属社区","所属网格","公民身份号码"};

		try {


			List<CcmPeople> list = ccmPeopleService.getExportList(ccmPeople);
			if("10".equals(ccmPeople.getType())) {
				String fileName = "CensusPeopleExport" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";
				new ExportExcel("户籍人口数据", CcmPeople.class,strArr).setDataList(list).write(response, fileName).dispose();
			}else if("20".equals(ccmPeople.getType())) {
				String fileName = "FlowPeopleExport" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";
				new ExportExcel("流动人口数据", CcmPeople.class,strArr).setDataList(list).write(response, fileName).dispose();
			}else if("30".equals(ccmPeople.getType())) {
				String fileName = "AbroadPeopleExport" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";
				new ExportExcel("境外人口数据", CcmPeople.class,strArr).setDataList(list).write(response, fileName).dispose();
			}else {
				String fileName = "NoSettledPeopleExport" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";
				new ExportExcel("未落户人口数据", CcmPeople.class,strArr).setDataList(list).write(response, fileName).dispose();
			}
			return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出实有人口失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + adminPath + "/pop/ccmPeople/?repage";
	}

	/**
	 * 导入实有人口数据
	 *
	 * @param file
	 * @param redirectAttributes
	 * 修改：彭建强 20190522 导入数据时，能够自动添加楼栋和房屋，各类关联数据放入到内存中，减少频繁操作数据库带来的压力
	 * @return
	 */
	public static final List<CcmPeople> reslist = new ArrayList<CcmPeople>();
	@RequiresPermissions("pop:ccmPeople:view")
	@RequestMapping(value = "import", method = RequestMethod.POST)
	public String importFile(MultipartFile file, RedirectAttributes redirectAttributes,HttpServletRequest request, HttpServletResponse response) {
		if (Global.isDemoMode()) {
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:" + adminPath + "/pop/ccmPeople/?repage";
		}
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<CcmPeople> list = ei.getDataList(CcmPeople.class);

			//系统中所有人口数据
			Map<String, Object> peopleMap = ccmPeopleService.queryAllToMap();

			//系统中所有楼栋数据
			List<CcmHouseBuildmanage> listBuild = ccmHouseBuildmanageService.queryAllForImport();

			//系统中所有房屋数据
			List<CcmPopTenant> listRoom = ccmPopTenantService.queryAllForImport();

			//声明3个临时变量，用于优化网格、楼栋、房屋处理前的判断
			CcmHouseBuildmanage tmpBuild = new CcmHouseBuildmanage();
			boolean buildNotHas;
			CcmPopTenant tmpRoom = new CcmPopTenant();
			boolean roomNotHas;
			//格式化日期
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			//将电话号获取异常的转为正常电话号（异常包含E10和小数点）
			DecimalFormat df = new DecimalFormat("#");

			//导入过程中失败的数据，进行汇总并导出
			List<CcmPeople> listFailure = new ArrayList<CcmPeople>();

			for (CcmPeople People : list) {

				if(EntityTools.isEmpty(People)){
					continue;
				}

				//用于标记房屋楼栋数据是否新增
				buildNotHas = false;
				roomNotHas = false;

				// 如果当前用户的身份未填写或者为空或者身份证号码位数不够18位则应该进行 剔除
				if (StringUtils.isBlank(People.getIdent()) || People.getIdent().length() != 18) {
					failureMsg.append("<br/>实有人口名" + People.getName() + " 导入失败：" + "身份证信息错误");
					People.setName(People.getName() + "，失败原因：身份证信息错误");
					listFailure.add(People);
					failureNum++;
					continue;
				}

				//验证身份证符合标准后，再从从身份证中去获取出生日期
				if(People.getBirthday()==null) {
					String birthStr = People.getIdent().substring(6, 14);
					People.setBirthday(sdf.parse(birthStr));
				}

				//在身份证号中获取性别
				if(StringUtils.isEmpty(People.getSex())) {
					if (Integer.parseInt(People.getIdent().substring(16).substring(0, 1)) % 2 == 0) {// 判断性别
						People.setSex("1");
			        } else {
			        	People.setSex("0");
			        }
				}

				// 验证必填项
				if ( StringUtils.isBlank(People.getName()) ||
						StringUtils.isBlank(People.getType()) ||
						StringUtils.isBlank(People.getSex()) ||
						People.getBirthday() == null ||
						StringUtils.isBlank(People.getIdent()) ||
						StringUtils.isBlank(People.getTelephone()) ||
						StringUtils.isBlank(People.getNation()) ||
						StringUtils.isBlank(People.getCensu()) ||
						StringUtils.isBlank(People.getMarriage()) ||
						StringUtils.isBlank(People.getPolitics()) ||
						StringUtils.isBlank(People.getEducation()) ||
						StringUtils.isBlank(People.getDomiciledetail()) ||
						StringUtils.isBlank(People.getResidencedetail()) ||
						StringUtils.isBlank(People.getIsPermanent()) ||
						StringUtils.isBlank(People.getAreaGridId().getName()) ||
						StringUtils.isBlank(People.getBuildName()) ||
						StringUtils.isBlank(People.getElemNum()) ||
						StringUtils.isBlank(People.getBuildDoorNum()) ||
						People.getPilesNum() == null ||
						People.getFloorNum() == null ||
						StringUtils.isBlank(People.getRoomName()) ||
						StringUtils.isBlank(People.getAccount()) ||
						StringUtils.isBlank(People.getDomicile()) ||
						StringUtils.isBlank(People.getAccountidentity()) ||
						StringUtils.isBlank(People.getAreaPoint())
				) {
					StringBuilder str = new StringBuilder();
					str.append("(");
					if(StringUtils.isBlank(People.getName())) {
						str.append("姓名为空;");
					}
					if(StringUtils.isBlank(People.getType())) {
						str.append("人口类型为空;");
					}
					if(StringUtils.isBlank(People.getSex())) {
						str.append("性别为空;");
					}
					if(People.getBirthday() == null) {
						str.append("出生日期为空;");
					}
					if(StringUtils.isBlank(People.getIdent())) {
						str.append("公民身份证号码为空;");
					}
					if(StringUtils.isBlank(People.getTelephone())) {
						str.append("联系方式为空;");
					}
					if(StringUtils.isBlank(People.getNation())) {
						str.append("民族为空;");
					}
					if(StringUtils.isBlank(People.getCensu())) {
						str.append("籍贯为空;");
					}
					if(StringUtils.isBlank(People.getMarriage())) {
						str.append("婚姻状况为空;");
					}
					if(StringUtils.isBlank(People.getPolitics())) {
						str.append("政治面貌为空;");
					}
					if(StringUtils.isBlank(People.getEducation())) {
						str.append("学历为空;");
					}
					if(StringUtils.isBlank(People.getDomiciledetail())) {
						str.append("户籍门（楼）详址为空;");
					}
					if(StringUtils.isBlank(People.getResidencedetail())) {
						str.append("现住门（楼）详址为空;");
					}
					if(StringUtils.isBlank(People.getIsPermanent())) {
						str.append("是否常住为空;");
					}
					if(StringUtils.isBlank(People.getAreaGridId().getName())) {
						str.append("所属网格为空;");
					}
					if(StringUtils.isBlank(People.getBuildName())) {
						str.append("所属楼栋为空;");
					}
					if(StringUtils.isBlank(People.getElemNum())) {
						str.append("楼栋单元总数为空;");
					}
					if(StringUtils.isBlank(People.getBuildDoorNum())) {
						str.append("所属单元为空;");
					}
					if(People.getPilesNum() == null) {
						str.append("楼栋总层数为空;");
					}
					if(People.getFloorNum() == null) {
						str.append("房屋楼层为空;");
					}
					if(StringUtils.isBlank(People.getRoomName())) {
						str.append("所属房屋为空;");
					}
					if(StringUtils.isBlank(People.getAccount())) {
						str.append("户号为空;");
					}
					if(StringUtils.isBlank(People.getDomicile())) {
						str.append("户籍地为空;");
					}
					if(StringUtils.isBlank(People.getAccountidentity())) {
						str.append("户主公民身份证号码为空;");
					}
					if(StringUtils.isBlank(People.getAreaPoint())) {
						str.append("所在楼栋中心点为空;");
					}
					str.append(")");
					failureMsg.append("<br/>实有人口名" + People.getName() + " 导入失败：" + "必填项为空。"+str.toString());
					People.setName(People.getName() + "，失败原因：必填项为空。"+str.toString());
					listFailure.add(People);
					failureNum++;
					continue;
				}

				//将导入时电话获取包含“.”或“E10”，的转成正确的电话格式
				if(People.getTelephone().contains(".") || People.getTelephone().contains("E")) {
					double bd = Double.valueOf(People.getTelephone());
					String tel = df.format(bd);
					People.setTelephone(tel);
				}

				//电话验证
				if( NumberTools.isPhone(People.getTelephone())==false) {
					failureMsg.append("<br/>实有人口名" + People.getName() + " 导入失败：" + "联系方式数据不合法。");
					People.setName(People.getName() + "，失败原因：联系方式数据不合法。");
					listFailure.add(People);
					failureNum++;
					continue;
				}

				//出生年月日是否合法
				if ( DateTools.getIntYearByDate(People.getBirthday())  <  DateTools.getIntYear() -150 || DateTools.getIntYearByDate(People.getBirthday()) >  DateTools.getIntYear()) {
					failureMsg.append("<br/>实有人口名" + People.getName() + " 导入失败：" + "出生年月数据不合法");
					People.setName(People.getName() + "，失败原因：出生年月数据不合法");
					listFailure.add(People);
					failureNum++;
					continue;
				}

				// 进行身份证验证 ,如果已经存在则进行 失败条目的添加。 并跳过当前的内容
				if (peopleMap.containsKey(People.getIdent())) {
					failureMsg.append("<br/>实有人口名" + People.getName() + " 导入失败：" + "当前的用户的身份证材料已经存在于当前的数据库中。");
					People.setName(People.getName() + "，失败原因：身份证信息已存在");
					listFailure.add(People);
					failureNum++;
					continue;
				}

				// 户主身份证号验证
				if("10".equals(People.getType())){
					if (StringUtils.isBlank(People.getAccountidentity()) || People.getAccountidentity().length() != 18) {
						failureMsg.append("<br/>实有人口名" + People.getName() + " 导入失败：" + "户主身份证信息错误。");
						People.setName(People.getName() + "，失败原因：户主身份证信息错误。");
						failureNum++;
						continue;
					}

					if (StringUtils.isEmpty(People.getAccount())) {
						failureMsg.append("<br/>实有人口名" + People.getName() + " 导入失败：" + "户号信息错误。");
						People.setName(People.getName() + "，失败原因：户号信息为空。");
						failureNum++;
						continue;
					}
				}

				try {
					BeanValidators.validateWithException(validator, People);
					/***网格数据赋值*直接从Excel获取到**/
					if (People.getAreaGridId() == null || "".equals(People.getAreaGridId().getName())) {//网格为空，则数据不导入
						failureMsg.append("<br/>实有人口名" + People.getName() + " 导入失败：" + "网格数据错误。");
						People.setName(People.getName() + "，失败原因：网格数据错误");
						listFailure.add(People);
						failureNum++;
						continue;
					}

					/**楼栋数据非空判断**/
					if (StringUtils.isBlank(People.getBuildName())) {//楼栋为空，则数据不导入
						failureMsg.append("<br/>实有人口名" + People.getName() + " 导入失败：" + "所属楼栋为空。");
						People.setName(People.getName() + "，失败原因：所属楼栋为空");
						listFailure.add(People);
						failureNum++;
						continue;
					}
					/***楼栋数据赋值***/
					if (tmpBuild.getName() != null && tmpBuild.getName().equals(People.getBuildName())
							&& tmpBuild.getArea().getName().equals(People.getAreaGridId().getName())) {//楼栋名称相等 且 网格名称相等
						CcmHouseBuildmanage build = new CcmHouseBuildmanage();
						build.setId(tmpBuild.getId());
						People.setBuildId(build);
					} else {
						boolean isBuildExist = false;
						for (CcmHouseBuildmanage buildmanage : listBuild) {
							if (buildmanage.getBuildname().equals(People.getBuildName())
									&& buildmanage.getArea().getName().equals(People.getAreaGridId().getName())) {//楼栋名称相等 且 网格名称相等
								tmpBuild = buildmanage;//赋值临时变量
								CcmHouseBuildmanage build = new CcmHouseBuildmanage();
								build.setId(tmpBuild.getId());
								People.setBuildId(build);
								isBuildExist = true;
								break;
							}
						}
						if (!isBuildExist) {//楼栋不存在，增加楼栋
							buildNotHas = true;
							CcmHouseBuildmanage build = new CcmHouseBuildmanage();
							build.setId(UUID.randomUUID().toString());
							build.setBuildname(People.getBuildName());
							if (People.getAreaGridId() != null) {
								build.setArea(People.getAreaGridId());
							}
							build.setPilesNum(People.getPilesNum());
							if(StringUtils.isNotEmpty(People.getAreaPoint())) {
								build.setAreaPoint(People.getAreaPoint());
							}
							build.setResidencedetail(People.getAreaComId().getName() + People.getAreaGridId().getName() + People.getBuildName());
							build.setIsNewRecord(true);
							//设置单元总数信息pengjianqiang20191114
							if (CommUtil.isNumeric(People.getElemNum())) {//Excel中读取过来的单元数是数字
								build.setElemNum(Integer.valueOf(People.getElemNum()));
							} else {//不匹配时默认赋值总共1单元
								build.setElemNum(Integer.valueOf("1"));
							}
							ccmHouseBuildmanageService.save(build);
							listBuild.add(build);
							tmpBuild = build;//赋值临时变量
							People.setBuildId(build);
						}
					}

					/**房屋数据非空判断**/
					if (StringUtils.isBlank(People.getRoomName())) {//网格为空，则数据不导入
						failureMsg.append("<br/>实有人口名" + People.getName() + " 导入失败：" + "所属房屋为空。");
						People.setName(People.getName() + "，失败原因：所属房屋为空");
						listFailure.add(People);
						failureNum++;
						continue;
					}
					/***房屋数据赋值***/
					if (tmpRoom.getHouseBuild() != null && tmpRoom.getHouseBuild().equals(People.getRoomName())
							&& tmpRoom.getBuildingId().getBuildname().equals(People.getBuildName())) {//房屋编号相等 且 楼栋名称相等
						CcmPopTenant room2 = new CcmPopTenant();
						room2.setId(tmpRoom.getId());
						People.setRoomId(room2);
					} else {
						boolean isRoomExist = false;
						for (CcmPopTenant roomEntity : listRoom) {
							if (roomEntity.getHouseBuild().equals(People.getRoomName())
									&& roomEntity.getBuildingId().getBuildname().equals(People.getBuildName())) {
								tmpRoom = roomEntity;//赋值临时变量
								CcmPopTenant room2 = new CcmPopTenant();
								room2.setId(tmpRoom.getId());
								People.setRoomId(room2);
								isRoomExist = true;
								break;
							}
						}
						if (!isRoomExist) {//房屋不存在，增加房屋
							roomNotHas = true;
							CcmPopTenant room2 = new CcmPopTenant();
							room2.setId(UUID.randomUUID().toString());
							//将导入时电话获取包含“.”或“E10”，的转成正确的电话格式
							if(People.getRoomName().contains(".")) {
								double bd = Double.valueOf(People.getRoomName());
								String roomName = df.format(bd);
								room2.setHouseBuild(roomName);
							}else{
								room2.setHouseBuild(People.getRoomName());  //房屋编号
							}
							if (People.getAreaGridId() != null) {
								room2.setArea(People.getAreaGridId());  //所在区域
							}
							room2.setFloorNum(People.getFloorNum()+"");
							room2.setHousePlace(tmpBuild.getResidencedetail());  //房屋地址
							room2.setBuildingId(tmpBuild);   			//所属楼栋
							room2.setIsNewRecord(true);
							room2.setHouseType("01");  // 类型
							//设置单元信息pengjianqiang20191114
							if (CommUtil.isNumeric(People.getBuildDoorNum())) {//Excel中读取过来的单元数是数字
								room2.setBuildDoorNum(People.getBuildDoorNum());
							} else {//不匹配时默认赋值1单元
								room2.setBuildDoorNum("1");
							}
							ccmPopTenantService.save(room2);
							listRoom.add(room2);
							tmpRoom = room2;//赋值临时变量
							People.setRoomId(room2);
						}
					}

					//性别
					if (!CommUtil.isNumeric(People.getSex())) {//Excel中读取过来的和数据字典中的不匹配的
						if (People.getSex() != null && People.getSex().contains("男")) {
							People.setSex("0");
						} else if (People.getSex() != null && People.getSex().contains("女")) {
							People.setSex("1");
						} else {//未指定性别时，从身份证中去获取性别
							String sex = Integer.parseInt(People.getIdent().substring(
									People.getIdent().length() - 4, People.getIdent().length() - 1)
									) % 2 == 0 ? "1" : "0";
							People.setSex(sex);
						}
					}

					//民族
					if (!CommUtil.isNumeric(People.getNation())) {//Excel中读取过来的和数据字典中的不匹配的
						if (People.getNation() != null) {
							People.setNation(CommUtil.getNationValue(People.getNation()));
						}
					}

					//婚姻
					if (!CommUtil.isNumeric(People.getMarriage())) {//Excel中读取过来的和数据字典中的不匹配的
						if (People.getMarriage() != null && People.getMarriage().contains("未")) {
							People.setMarriage("10");
						} else if (People.getMarriage() != null && People.getMarriage().contains("已")) {
							People.setMarriage("20");
						} else if (People.getMarriage() != null && People.getMarriage().contains("丧")) {
							People.setMarriage("30");
						} else if (People.getMarriage() != null && People.getMarriage().contains("离")) {
							People.setMarriage("40");
						} else {//未说明的婚姻状况
							People.setMarriage("90");
						}
					}


					//学历
					if (!CommUtil.isNumeric(People.getEducation())) {//Excel中读取过来的和数据字典中的不匹配的
						if (People.getEducation() != null && People.getEducation().contains("文盲")) {
							People.setEducation("90");//其他
						} else if (People.getEducation() != null && People.getEducation().contains("小学")) {
							People.setEducation("50");//高中以下
						} else if (People.getEducation() != null && People.getEducation().contains("初中")) {
							People.setEducation("50");//高中以下
						} else if (People.getEducation() != null && People.getEducation().contains("高中")) {
							People.setEducation("60");
						} else if (People.getEducation() != null && People.getEducation().contains("中专")) {
							People.setEducation("40");
						} else if (People.getEducation() != null && People.getEducation().contains("大专")) {
							People.setEducation("40");
						} else if (People.getEducation() != null && (People.getEducation().contains("大学") || People.getEducation().contains("本科"))) {
							People.setEducation("40");
						} else if (People.getEducation() != null && People.getEducation().contains("研究")) {
							People.setEducation("14");
						} else if (People.getEducation() != null && People.getEducation().contains("博士")) {
							People.setEducation("11");
						} else {
							People.setEducation("90");
						}
					}

					//宗教信仰
					if (!CommUtil.isNumeric(People.getBelief())) {//Excel中读取过来的和数据字典中的不匹配的
						if (People.getBelief() != null) {
							People.setBelief(CommUtil.getBeliefValue(People.getBelief()));
						}
					}


					//人口类型O
					if (!CommUtil.isNumeric(People.getType())) {//Excel中读取过来的和数据字典中的不匹配的
						if (People.getType() != null && (People.getType().contains("流动") || People.getType().contains("非本地") || People.getType().contains("外来"))) {
							People.setType("20");//流动
						} else if (People.getType() != null && (People.getType().contains("境外") || People.getType().contains("外国"))) {
							People.setType("30");//境外
						} else if (People.getType() != null && (People.getType().contains("本地") || People.getType().contains("户籍"))) {
							People.setType("10");//户籍
						}  else if (People.getType() != null && People.getType().contains("未")) {
							People.setType("40");//未落户
						} else {//流动
							People.setType("20");
						}
					}

					//政治面貌
					if (!CommUtil.isNumeric(People.getPolitics())) {//Excel中读取过来的和数据字典中的不匹配的
						if (People.getPolitics() != null && People.getPolitics().contains("党")) {
							People.setPolitics("01");
						} else if (People.getPolitics() != null && People.getPolitics().contains("团")) {
							People.setPolitics("03");
						} else if (People.getPolitics() != null && People.getPolitics().contains("群")) {
							People.setPolitics("09");
						}
					}



					ccmPeopleService.save(People);
					peopleMap.put(People.getIdent(),People.getId());
					if(buildNotHas){
						listBuild.add(People.getBuildId());
					}
					if(roomNotHas){
						listRoom.add(People.getRoomId());
					}
					successNum++;
				} catch (ConstraintViolationException ex) {
					failureMsg.append("<br/>实有人口名 " + People.getName() + " 导入失败：");
					List<String> messageList = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
					for (String message : messageList) {
						failureMsg.append(message + "; ");
						failureNum++;
					}
				} catch (Exception ex) {
					failureMsg.append("<br/>实有人口名 " + People.getName() + " 导入失败：" + ex.getMessage());
				}
			}
			if (failureNum > 0) {
				failureMsg.insert(0, "，失败 " + failureNum + " 条实有人口，导入信息如下：");
				reslist.addAll(listFailure);
			}
			addMessage(redirectAttributes, "已成功导入 " + successNum + " 条实有人口" + failureMsg);
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入实有人口失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + adminPath + "/pop/ccmPeople/?repage";
	}

	@RequestMapping(value = "failureexport", method = RequestMethod.POST)
	public void failureexport(HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttributes) {
		try {
			String fileName = "PeopleImportFailure-" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";
			new ExportExcel("实有人口导入失败数据", CcmPeople.class).setDataList(reslist).write(response, fileName).dispose();
			reslist.clear();
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出实有人口失败！失败信息：" + e.getMessage());
		}
	}

	/**
	 * 导出实有人口数据---特殊关怀人员
	 *
	 * @param user
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("pop:ccmPeople:view")
	@RequestMapping(value = "exportSpecialCare", method = RequestMethod.POST)
	public String exportSpecialCareFile(CcmPeople ccmPeople, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttributes) {
		try {
			String fileName = "SpecialCarePeople" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";

			String specialCareTypeStr = "";
			if (ccmPeople.getSpecialCareType() != null && !"".equals(ccmPeople.getSpecialCareType())) {
				String[] specialCareTypes = ccmPeople.getSpecialCareType().split(",");
				for (int i = 0; i < specialCareTypes.length; i++) {// 去掉空字符串和null字符串
					if (specialCareTypes[i] != null && !"".equals(specialCareTypes[i])
							&& !"null".equals(specialCareTypes[i])) {
						specialCareTypeStr = specialCareTypeStr + specialCareTypes[i] + ",";
					}
				}
				ccmPeople.setSpecialCareTypes(specialCareTypeStr.split(","));
			}
			if ("".equals(specialCareTypeStr)) {// 传过来值中没有有效的内容，则查询全部
				Dict dict = new Dict();
				dict.setType("pop_special_care_type");
				List<Dict> dictList = dictService.findList(dict);
				String[] specialCareTypes = new String[dictList.size()];
				for (int i = 0; i < specialCareTypes.length; i++) {
					specialCareTypes[i] = dictList.get(i).getValue();
				}
				ccmPeople.setSpecialCareTypes(specialCareTypes);
			}

			List<CcmPeople> list = ccmPeopleService.findCareList(ccmPeople);
			CcmPeople ccmPeople2 = new CcmPeople();
			String[] listLimite = new String[list.size()];
			List<CcmPeopleExport> list2 = new ArrayList<CcmPeopleExport>();
			if (list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					listLimite[i] = list.get(i).getId();
				}
				ccmPeople2.setListLimite(listLimite);
				list2 = ccmPeopleService.findAllCareList(ccmPeople2);// 数组查询id
			}
			//将多选字段转为字典了label
			Dict dict = new Dict();
			dict.setType("pop_special_care_type");
			List<Dict> carelist = dictService.findList(dict);
			for (CcmPeopleExport ccmPeopleExport : list2) {
				String[] care = ccmPeopleExport.getSpecialCareType().split(",");
				StringBuilder str1 = new StringBuilder();
				for(int i=0;i<carelist.size();i++) {
					for(int j=0;j<care.length;j++) {
						if(carelist.get(i).getValue().equals(care[j])) {
							str1.append(","+carelist.get(i).getLabel());
						}
					}
				}
				str1.append(",");
				ccmPeopleExport.setSpecialCareType(str1.toString());
			}
			new ExportExcel("实有人口特殊关怀人员数据", CcmPeopleExport.class).setDataList(list2).write(response, fileName).dispose();
			return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出实有人口失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + adminPath + "/pop/ccmPeople/?repage";
	}

	/**
	 * 导出实有人口数据---老年人
	 *
	 * @param user
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("pop:ccmPeople:view")
	@RequestMapping(value = "exportOlder", method = RequestMethod.POST)
	public String exportOlderFile(CcmPeople ccmPeople, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttributes) {
		try {
			String fileName = "Older" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date());
			calendar.add(Calendar.YEAR, 0 - PlmTypes.OLD_AGE);
			ccmPeople.setBirthday(calendar.getTime());
			List<CcmPeople> list = ccmPeopleService.getExportList(ccmPeople);
			new ExportExcel("实有人口老年人数据", CcmPeople.class).setDataList(list).write(response, fileName).dispose();
			return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出实有人口失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + adminPath + "/pop/ccmPeople/?repage";
	}

	/**
	 * 导出实有人口数据---党员
	 *
	 * @param user
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("pop:ccmPeople:view")
	@RequestMapping(value = "exportCommunist", method = RequestMethod.POST)
	public String exportCommunistFile(CcmPeople ccmPeople, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttributes) {
		try {
			String fileName = "实有人口党员数据" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";
			List<CcmPeople> list = ccmPeopleService.findCommunist(ccmPeople);
			new ExportExcel("实有人口党员数据", CcmPeople.class).setDataList(list).write(response, fileName).dispose();
			return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出实有人口失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + adminPath + "/pop/ccmPeople/?repage";
	}

	// 人员信息弹框
	@RequestMapping(value = "getMapPopForm")
	public String getMapPopForm(CcmPeople ccmPeople, Model model) {
		// 返回对象结果
		ccmPeople = ccmPeopleService.getHousePopForm(ccmPeople);
		model.addAttribute("ccmPeople", ccmPeople);
		List<CcmPeople> listAccount = new ArrayList<CcmPeople>();
		if (!StringUtils.isBlank(ccmPeople.getAccount())) {
			listAccount = ccmPeopleService.listAccount(ccmPeople);
		}
		// 户籍家庭列表
		model.addAttribute("listAccount", listAccount);
		return "/modules/mapping/houseBuild/mapPop";
	}

	// 首页社区弹出
	@RequestMapping(value = "getMapAreaForm")
	public String getMapAreaForm(CcmPeople ccmPeople, Model model) {
		// 返回对象结果
		if (ccmPeople.getId() != null) {
			CcmOrgArea ccmOrgArea = new CcmOrgArea();
			ccmOrgArea.setId(ccmPeople.getId());
			ccmOrgArea = ccmOrgAreaService.get(ccmOrgArea);// 区域外表
			Area area = new Area();
			area.setId(ccmOrgArea.getArea().getId());
			area = areaService.get(area);// 区域
			//
			// Area area2 = new Area();
			// area2.setParentIds(area.getId());
			// List<Area> areaNetAll = new ArrayList<>();
			// areaNetAll = ccmOrgAreaService.findAreaNet(area2);//
			// 子集-社区and网格（通过父键查子集）area借用ccmOrgArea
			// List<Area> areaNet = new ArrayList<>();//网格
			// if(areaNetAll.size()>0){
			// for(Area a:areaNetAll){
			// if("7".equals(a.getType())){
			// areaNet.add(a);//网格
			// }
			// }
			// }
			//
			// List<CcmOrgArea> ccmOrgAreaNet = new ArrayList<>();
			// CcmOrgArea ccmOrgArea2 = new CcmOrgArea();
			// List<CcmHouseBuildmanage> listBuildmanage = new ArrayList<>();
			// List<CcmHouseBuildmanage> listBuildmanage2 = new ArrayList<>();
			// CcmHouseBuildmanage ccmHouseBuildmanage2 = new CcmHouseBuildmanage();
			// double BuildmanageArea = 0;
			// for (Area net : areaNet) {
			// ccmOrgArea2.setArea(net);
			// ccmOrgArea2 = ccmOrgAreaService.findCcmOrgArea(ccmOrgArea2);
			// if(ccmOrgArea2==null){
			// CcmOrgArea ccmOrgArea3 = new CcmOrgArea();
			// ccmOrgArea2 = ccmOrgArea3;
			// }
			// ccmOrgAreaNet.add(ccmOrgArea2);// 社区网格外表（通过社区网格id查外表）
			//
			// ccmHouseBuildmanage2.setArea(net);
			// listBuildmanage2 = ccmHouseBuildmanageService.findList(ccmHouseBuildmanage2);
			// for (CcmHouseBuildmanage buildmanage : listBuildmanage2) {
			// listBuildmanage.add(buildmanage);// 社区网格楼栋（通过网格area查楼栋）
			// if(buildmanage.getFloorArea()==null||"".equals(buildmanage.getFloorArea())){
			// buildmanage.setFloorArea(0.0);
			// }
			// BuildmanageArea += buildmanage.getFloorArea();// 楼栋总面积
			// }
			// }
			CcmPeopleAmount ccmPeopleAmount = new CcmPeopleAmount();
			ccmPeopleAmount.setArea(area);
			ccmPeopleAmount = ccmPeopleAmountService.findMonthAreaAmount(ccmPeopleAmount);// 首页社区弹框：人口结构
			CcmPeopleStat ccmPeopleStat = new CcmPeopleStat();// 首页社区弹框：本月新增数据
			ccmPeopleStat.setArea(area);// 首页社区弹框：本月新增数据
			ccmPeopleStat = ccmPeopleStatService.findMonthAreaStat(ccmPeopleStat);// 首页社区弹框：本月新增数据
			// List<CcmPopTenant> listCcmPopTenant = new ArrayList<>();// 首页社区弹框:出租屋数据
			// List<CcmPopTenant> listCcmPopTenant2 = new ArrayList<>();
			// CcmPopTenant ccmPopTenant = new CcmPopTenant();
			// for (CcmHouseBuildmanage build : listBuildmanage) {
			// ccmPopTenant.setBuildingId(build);
			// listCcmPopTenant2 = ccmPopTenantService.findHouseRentArea(ccmPopTenant);
			// for (CcmPopTenant build2 : listCcmPopTenant2) {
			// listCcmPopTenant.add(build2);// 首页社区弹框:出租屋数据
			// }
			// }
			// 首页社区弹框:预测下个月人口总数
			List<SearchTabMore> listLineCoefficient = ccmPeopleAmountService.findPopTrendByArea(ccmPeopleAmount);
			double[] y = new double[listLineCoefficient.size()];
			// double[] y = {23 , 44 , 32 , 56 , 33 , 34 , 55 , 65 , 45 , 55 ,
			// 11 , 12 } ;
			for (int i = 0; i < listLineCoefficient.size(); i++) {
				y[i] = 0;
				if (listLineCoefficient.get(i).getValue6() != null) {
					y[i] += (Double.valueOf(listLineCoefficient.get(i).getValue6()));
				}
				if (listLineCoefficient.get(i).getValue7() != null) {
					y[i] += (Double.valueOf(listLineCoefficient.get(i).getValue7()));
				}
				if (listLineCoefficient.get(i).getValue8() != null) {
					y[i] += (Double.valueOf(listLineCoefficient.get(i).getValue8()));
				}
				if (listLineCoefficient.get(i).getValue() != null) {
					y[i] += (Double.valueOf(listLineCoefficient.get(i).getValue()));
				}

			}
			double forecast1 = LineCoefficient.lineCoefficientNum(y);
			int forecast = (int) forecast1;// 首页社区弹框:预测下个月人口总数
			int subForecast = 0;
			if (y.length > 0) {
				subForecast = forecast - (int) y[y.length - 1];// 首页社区弹框:预测下个月人口变化
			}

			int popAll = 0;
			double sexScale = 0;
			int emphasisPopAll = 0;
			if (ccmPeopleAmount != null) {
				// 非空
				CcmPeopleAmount ccmPeopleAmount2 = new CcmPeopleAmount();
				ccmPeopleAmount2.setId(ccmPeopleAmount.getId() == null ? "100000" : ccmPeopleAmount.getId());
				ccmPeopleAmount2.setArea(area); // 区域id
				ccmPeopleAmount2.setPersonAmount(
						ccmPeopleAmount.getPersonAmount() == null ? 0 : ccmPeopleAmount.getPersonAmount()); // 户籍总数量
				ccmPeopleAmount2.setOverseaAmount(
						ccmPeopleAmount.getOverseaAmount() == null ? 0 : ccmPeopleAmount.getOverseaAmount()); // 外籍总数量
				ccmPeopleAmount2.setFloatAmount(
						ccmPeopleAmount.getFloatAmount() == null ? 0 : ccmPeopleAmount.getFloatAmount()); // 流动总数量
				ccmPeopleAmount2.setUnsettleAmount(
						ccmPeopleAmount.getUnsettleAmount() == null ? 0 : ccmPeopleAmount.getUnsettleAmount()); // 未落户总数量
				ccmPeopleAmount2.setPermanentAmount(
						ccmPeopleAmount.getPermanentAmount() == null ? 0 : ccmPeopleAmount.getPermanentAmount()); // 常住总数量
				ccmPeopleAmount2
						.setAidsAmount(ccmPeopleAmount.getAidsAmount() == null ? 0 : ccmPeopleAmount.getAidsAmount()); // 艾滋病患者总数量
				ccmPeopleAmount2.setPsychogenyAmount(
						ccmPeopleAmount.getPsychogenyAmount() == null ? 0 : ccmPeopleAmount.getPsychogenyAmount()); // 肇事肇祸等严重精神障碍患者总数量
				ccmPeopleAmount2.setRectificationAmount(ccmPeopleAmount.getRectificationAmount() == null ? 0
						: ccmPeopleAmount.getRectificationAmount()); // 社区矫正总数量
				ccmPeopleAmount2.setReleaseAmount(
						ccmPeopleAmount.getReleaseAmount() == null ? 0 : ccmPeopleAmount.getReleaseAmount()); // 刑释总数量
				ccmPeopleAmount2.setDrugsAmount(
						ccmPeopleAmount.getDrugsAmount() == null ? 0 : ccmPeopleAmount.getDrugsAmount()); // 吸毒总数量
				ccmPeopleAmount2.setBehindAmount(
						ccmPeopleAmount.getBehindAmount() == null ? 0 : ccmPeopleAmount.getBehindAmount()); // 留守总数量
				ccmPeopleAmount2
						.setKymAmount(ccmPeopleAmount.getKymAmount() == null ? 0 : ccmPeopleAmount.getKymAmount()); // 重点青少年总数量
				ccmPeopleAmount2.setVisitAmount(
						ccmPeopleAmount.getVisitAmount() == null ? 0 : ccmPeopleAmount.getVisitAmount()); // 重点上访总数量
				ccmPeopleAmount2.setHeresyAmount(
						ccmPeopleAmount.getHeresyAmount() == null ? 0 : ccmPeopleAmount.getHeresyAmount()); // 涉教人员总数量
				ccmPeopleAmount2.setDangerousAmount(
						ccmPeopleAmount.getDangerousAmount() == null ? 0 : ccmPeopleAmount.getDangerousAmount()); // 危险品从业人员总数量
				ccmPeopleAmount2.setAgeChild(ccmPeopleAmount.getAgeChild() == null ? 0 : ccmPeopleAmount.getAgeChild()); // 0-15年龄段
				ccmPeopleAmount2.setAgeAdult(ccmPeopleAmount.getAgeAdult() == null ? 0 : ccmPeopleAmount.getAgeAdult()); // 16-40年龄段
				ccmPeopleAmount2
						.setAgeMiddle(ccmPeopleAmount.getAgeMiddle() == null ? 0 : ccmPeopleAmount.getAgeMiddle()); // 41-64年龄段
				ccmPeopleAmount2.setAgeOld(ccmPeopleAmount.getAgeOld() == null ? 0 : ccmPeopleAmount.getAgeOld()); // 65及以上年龄段
				ccmPeopleAmount2
						.setAgeNewborn(ccmPeopleAmount.getAgeNewborn() == null ? 0 : ccmPeopleAmount.getAgeNewborn()); // 一岁以下新生儿
				ccmPeopleAmount2.setSexMale(ccmPeopleAmount.getSexMale() == null ? 0 : ccmPeopleAmount.getSexMale()); // 男性总数
				ccmPeopleAmount2
						.setSexFemale(ccmPeopleAmount.getSexFemale() == null ? 0 : ccmPeopleAmount.getSexFemale()); // 女性总数
				ccmPeopleAmount2.setSexMaleSingle(
						ccmPeopleAmount.getSexMaleSingle() == null ? 0 : ccmPeopleAmount.getSexMaleSingle()); // 未婚男性总数
				ccmPeopleAmount2.setSexFemaleSingle(
						ccmPeopleAmount.getSexFemaleSingle() == null ? 0 : ccmPeopleAmount.getSexFemaleSingle()); // 未婚女性总数
				ccmPeopleAmount2
						.setEduDoctor(ccmPeopleAmount.getEduDoctor() == null ? 0 : ccmPeopleAmount.getEduDoctor()); // 博士及以上
				ccmPeopleAmount2
						.setEduMaster(ccmPeopleAmount.getEduMaster() == null ? 0 : ccmPeopleAmount.getEduMaster()); // 研究生
				ccmPeopleAmount2
						.setEduCollege(ccmPeopleAmount.getEduCollege() == null ? 0 : ccmPeopleAmount.getEduCollege()); // 大学
				ccmPeopleAmount2
						.setEduSenior(ccmPeopleAmount.getEduSenior() == null ? 0 : ccmPeopleAmount.getEduSenior()); // 高中
				ccmPeopleAmount2
						.setEduJunior(ccmPeopleAmount.getEduJunior() == null ? 0 : ccmPeopleAmount.getEduJunior()); // 初中及以下
				ccmPeopleAmount2.setAtteHigh(ccmPeopleAmount.getAtteHigh() == null ? 0 : ccmPeopleAmount.getAtteHigh()); // 关注程度-高
				ccmPeopleAmount2
						.setAtteMiddle(ccmPeopleAmount.getAtteMiddle() == null ? 0 : ccmPeopleAmount.getAtteMiddle()); // 关注程度-中
				ccmPeopleAmount2.setAtteLow(ccmPeopleAmount.getAtteLow() == null ? 0 : ccmPeopleAmount.getAtteLow()); // 关注程度-低
				ccmPeopleAmount2.setNativeFloating(
						ccmPeopleAmount.getNativeFloating() == null ? "100000" : ccmPeopleAmount.getNativeFloating()); // 流动人员来源地
				ccmPeopleAmount = ccmPeopleAmount2;

				//
				popAll = ccmPeopleAmount.getPersonAmount() + ccmPeopleAmount.getOverseaAmount()
						+ ccmPeopleAmount.getFloatAmount() + ccmPeopleAmount.getUnsettleAmount();// 首页社区弹框：人口总数

				sexScale = ccmPeopleAmount.getSexMale() / (ccmPeopleAmount.getSexFemale() * 1.0);// 首页社区弹框：人口结构的男女比例

				emphasisPopAll = ccmPeopleAmount.getAidsAmount() + ccmPeopleAmount.getPsychogenyAmount()
						+ ccmPeopleAmount.getRectificationAmount() + ccmPeopleAmount.getReleaseAmount()
						+ ccmPeopleAmount.getDrugsAmount() + ccmPeopleAmount.getVisitAmount()
						+ ccmPeopleAmount.getHeresyAmount() + ccmPeopleAmount.getDangerousAmount();// 首页社区弹框：重点人口总人次

			} else {
				CcmPeopleAmount ccmPeopleAmount2 = new CcmPeopleAmount();
				ccmPeopleAmount2.setId("100000");
				ccmPeopleAmount2.setArea(area); // 区域id
				ccmPeopleAmount2.setPersonAmount(0); // 户籍总数量
				ccmPeopleAmount2.setOverseaAmount(0); // 外籍总数量
				ccmPeopleAmount2.setFloatAmount(0); // 流动总数量
				ccmPeopleAmount2.setUnsettleAmount(0); // 未落户总数量
				ccmPeopleAmount2.setPermanentAmount(0); // 常住总数量
				ccmPeopleAmount2.setAidsAmount(0); // 艾滋病患者总数量
				ccmPeopleAmount2.setPsychogenyAmount(0); // 肇事肇祸等严重精神障碍患者总数量
				ccmPeopleAmount2.setRectificationAmount(0);// 社区矫正总数量
				ccmPeopleAmount2.setReleaseAmount(0); // 刑释总数量
				ccmPeopleAmount2.setDrugsAmount(0); // 吸毒总数量
				ccmPeopleAmount2.setBehindAmount(0); // 留守总数量
				ccmPeopleAmount2.setKymAmount(0); // 重点青少年总数量
				ccmPeopleAmount2.setVisitAmount(0); // 重点上访总数量
				ccmPeopleAmount2.setHeresyAmount(0); // 涉教人员总数量
				ccmPeopleAmount2.setDangerousAmount(0); // 危险品从业人员总数量
				ccmPeopleAmount2.setAgeChild(0); // 0-15年龄段
				ccmPeopleAmount2.setAgeAdult(0); // 16-40年龄段
				ccmPeopleAmount2.setAgeMiddle(0); // 41-64年龄段
				ccmPeopleAmount2.setAgeOld(0); // 65及以上年龄段
				ccmPeopleAmount2.setAgeNewborn(0); // 一岁以下新生儿
				ccmPeopleAmount2.setSexMale(0); // 男性总数
				ccmPeopleAmount2.setSexFemale(0); // 女性总数
				ccmPeopleAmount2.setSexMaleSingle(0); // 未婚男性总数
				ccmPeopleAmount2.setSexFemaleSingle(0); // 未婚女性总数
				ccmPeopleAmount2.setEduDoctor(0); // 博士及以上
				ccmPeopleAmount2.setEduMaster(0); // 研究生
				ccmPeopleAmount2.setEduCollege(0); // 大学
				ccmPeopleAmount2.setEduSenior(0); // 高中
				ccmPeopleAmount2.setEduJunior(0); // 初中及以下
				ccmPeopleAmount2.setAtteHigh(0); // 关注程度-高
				ccmPeopleAmount2.setAtteMiddle(0); // 关注程度-中
				ccmPeopleAmount2.setAtteLow(0); // 关注程度-低
				ccmPeopleAmount2.setNativeFloating("100000"); // 流动人员来源地
				ccmPeopleAmount = ccmPeopleAmount2;
			}

			String sexScale1 = String.format("%.2f", sexScale);// 首页社区弹框：人口结构的男女比例
			sexScale = Double.valueOf(sexScale1);// 首页社区弹框：人口结构的男女比例

			double areaNew = 0;
			double popPop = 0;
			if (ccmOrgArea != null) {
				if (ccmOrgArea.getNetArea() != null) {
					areaNew = ccmOrgArea.getNetArea() / 1000;// 区域面积
				}
				/*
				 * if(ccmOrgArea.getMannum()!=null){ popPop = ccmOrgArea.getMannum() /
				 * (ccmOrgArea.getNetPeoNum() * 1.0);// 工作负荷指数 }
				 */
				if (ccmOrgArea.getNetPeoNum() != null && ccmOrgArea.getNetPeoNum() != 0) {
					popPop = emphasisPopAll / (ccmOrgArea.getNetPeoNum() * 1.0);// 工作负荷指数
				}

			}

			int popArea = 0;
			if (areaNew != 0) {
				popArea = (int) (popAll / areaNew);// 人口密度
			}

			String areaNew1 = String.format("%.2f", areaNew);// 区域面积
			areaNew = Double.valueOf(areaNew1);// 区域面积
			String popPop1 = String.format("%.2f", popPop);// 工作负荷指数
			popPop = Double.valueOf(popPop1);// 工作负荷指数
			//
			// double BuildmanageAreaPop = 0;
			// if(popAll!=0){
			// BuildmanageAreaPop = BuildmanageArea / popAll;// 人均住房面积
			// }
			//
			// String BuildmanageAreaPop1 = String.format("%.2f", BuildmanageAreaPop);//
			// 人均住房面积
			// BuildmanageAreaPop = Double.valueOf(BuildmanageAreaPop1);// 人均住房面积
			//
			//
			int ccmPeopleStatAll = 0;
			if (ccmPeopleStat != null) {
				if (ccmPeopleStat.getPersonNew() != null) {
					ccmPeopleStatAll += ccmPeopleStat.getPersonNew();// 首页社区弹框：本月新增人口
				}
				if (ccmPeopleStat.getFloatNew() != null) {
					ccmPeopleStatAll += ccmPeopleStat.getFloatNew();// 首页社区弹框：本月新增人口
				}
				if (ccmPeopleStat.getOverseaNew() != null) {
					ccmPeopleStatAll += ccmPeopleStat.getOverseaNew();// 首页社区弹框：本月新增人口
				}
				if (ccmPeopleStat.getUnsettleNew() != null) {
					ccmPeopleStatAll += ccmPeopleStat.getUnsettleNew();// 首页社区弹框：本月新增人口
				}

			}
			/*
			 * else{ CcmPeopleStat ccmPeopleStat2 = new CcmPeopleStat();
			 * ccmPeopleStat2.setId("100000"); ccmPeopleStat = ccmPeopleStat2; }
			 */
			//
			// int listCcmPopTenantNum = listCcmPopTenant.size();// 首页社区弹框:出租屋总数
			//
			model.addAttribute("popAll", popAll);// 首页社区弹框：人口总数
			model.addAttribute("areaNew", areaNew);// 区域面积
			model.addAttribute("popArea", popArea);// 人口密度
			model.addAttribute("popPop", popPop);// 工作负荷指数
			model.addAttribute("ccmOrgArea", ccmOrgArea);// 区域外表
			model.addAttribute("area", area);// 区域
			// model.addAttribute("BuildmanageArea", BuildmanageArea);// 楼栋总面积
			// model.addAttribute("BuildmanageAreaPop", BuildmanageAreaPop);// 人均住房面积
			model.addAttribute("ccmPeopleAmount", ccmPeopleAmount);// 首页社区弹框：人口结构
			model.addAttribute("sexScale", sexScale);// 首页社区弹框：人口结构的男女比例
			model.addAttribute("emphasisPopAll", emphasisPopAll);// 首页社区弹框：重点人口总人次
			model.addAttribute("ccmPeopleStat", ccmPeopleStat);// 首页社区弹框：本月新增数据
			model.addAttribute("ccmPeopleStatAll", ccmPeopleStatAll);// 首页社区弹框：本月新增人口
			// model.addAttribute("listCcmPopTenant", listCcmPopTenant);// 首页社区弹框:出租屋数据
			// model.addAttribute("listCcmPopTenantNum", listCcmPopTenantNum);//
			// 首页社区弹框:出租屋总数
			model.addAttribute("forecast", forecast);// 首页社区弹框:预测下个月人口总数
			model.addAttribute("subForecast", subForecast);// 首页社区弹框:预测下个月人口变化

		}

		// return "/modules/sys/map/statPop";
		return "/modules/mapping/houseBuild/mapArea";
	}

	// getNetAreaForm社区选择网格
	@RequestMapping(value = "getNetAreaForm")
	public String getNetAreaForm(CcmPeople ccmPeople, Model model) {
		String areaIds = ccmPeople.getUsedname();// 社区id
		String areaNets = ccmPeople.getName();// 网格id
		Area area = new Area();
		area = areaService.get(areaNets);
		model.addAttribute("areaIds", areaIds);
		model.addAttribute("area", area);
		return "/ccm/pop/area/netArea";
	}


	// getHouseAreaForm网格选择房屋
	@RequestMapping(value = "getHouseAreaForm")
	public String getHouseAreaForm(CcmPeople ccmPeople, Model model) {
		String netIds = ccmPeople.getUsedname();// 网格id
		String areaHouses = ccmPeople.getName();// 房屋id
		CcmPopTenant ccmPopTenant = new CcmPopTenant();
		ccmPopTenant = ccmPopTenantService.get(areaHouses);// 房屋
		model.addAttribute("netIds", netIds);
		model.addAttribute("ccmPopTenant", ccmPopTenant);
		return "/ccm/pop/area/houseArea";
	}

	// 返回相关信息
	@RequestMapping(value = "getMapPopListIndex")
	public String getMapPopListIndex(List<CcmPeople> list, Model model) {
		System.out.println(list.size());
		return adminPath;
	}

	// 返回相关内容
	@RequestMapping(value = "getMapPopSingleIndex")
	public String getMapPopSingleIndex(CcmPeople ccmPeople, Model model) {

		return adminPath;
	}

	// 从房屋查看人员列表
	@RequestMapping(value = "getPeoListByHouse")
	public String getPeoListByHouse(@RequestParam(required = false) String type,
			@RequestParam(required = false) String houseId, @RequestParam(required = false) String buildId,
			HttpServletRequest request, HttpServletResponse response, Model model, String netId) {
		// 人员查询Dto
		CcmPeople ccmPeopleDto = new CcmPeople();
		// 获取房屋ID
		CcmPopTenant ccmPopTenant = new CcmPopTenant();
		ccmPopTenant.setId(houseId);
		ccmPeopleDto.setRoomId(ccmPopTenant);
		// 查询 人员列表
		Page<CcmPeople> page = ccmPeopleService.findPage(new Page<CcmPeople>(request, response), ccmPeopleDto);

		List<CcmPeople> list = page.getList();
		//
		CcmPeople ccmPeople2 = new CcmPeople();
		String[] listLimite = new String[list.size()];
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				listLimite[i] = list.get(i).getId();
			}
			ccmPeople2.setListLimite(listLimite);
			List<CcmPeople> list2 = ccmPeopleService.findListLimite(ccmPeople2);// 数组查询id
			page.setList(list2);
		}
		// 向页面 传递值
		model.addAttribute("page", page);
		model.addAttribute("houseId", houseId);
		model.addAttribute("buildId", buildId);
		model.addAttribute("netId", netId);
		// 通过 房屋进行查询
		if ("house".equals(type)) {
			model.addAttribute("PeoTypeBy", "ByHouse");
		}else if("hire".equals(type)) {
			model.addAttribute("PeoTypeBy", "ByHouse_hire");
		}else {
			model.addAttribute("PeoTypeBy", "ByHouse_Build");
		}
		System.out.println(""+model.toString());
		return "ccm/pop/popByHouse/ccmPeopleListForHouse";
	}

	// 从房屋查看人员表单
	@RequestMapping(value = "getPeoFromByHouse")
	public String getPeoFromByHouse(@RequestParam(required = false) String ptype,
			@RequestParam(required = false) String houseId, @RequestParam(required = false) String buildId,
			CcmPeople ccmPeople, HttpServletRequest request, HttpServletResponse response, Model model) {
		// 人员查询Dto
		CcmLogTail ccmLogTailDto = new CcmLogTail();
		ccmLogTailDto.setRelevanceId(ccmPeople.getId());
		ccmLogTailDto.setRelevanceTable("ccm_people");
		List<CcmLogTail> ccmLogTailList = ccmLogTailService.findListByObject(ccmLogTailDto);

		if (ccmPeople.getId() == null) {
			if (houseId != null && !"".equals(houseId)) {
				CcmPopTenant ccmPopTenant = new CcmPopTenant();
				ccmPopTenant.setId(houseId);
				ccmPopTenant = ccmPopTenantService.get(ccmPopTenant);
				if (ccmPopTenant != null && !"".equals(ccmPopTenant)) {
					ccmPeople.setRoomId(ccmPopTenant);// 房屋ID
					CcmHouseBuildmanage ccmHouseBuildmanage = new CcmHouseBuildmanage();
					if (ccmPopTenant.getBuildingId() != null && !"".equals(ccmPopTenant.getBuildingId())) {
						if (ccmPopTenant.getBuildingId().getId() != null
								&& !"".equals(ccmPopTenant.getBuildingId().getId())) {
							ccmHouseBuildmanage.setId(ccmPopTenant.getBuildingId().getId());
							ccmHouseBuildmanage = ccmHouseBuildmanageService.get(ccmHouseBuildmanage);// 楼栋
							if (ccmHouseBuildmanage != null && !"".equals(ccmHouseBuildmanage)) {
								if (ccmHouseBuildmanage.getArea() != null
										&& !"".equals(ccmHouseBuildmanage.getArea())) {
									if (ccmHouseBuildmanage.getArea().getId() != null
											&& !"".equals(ccmHouseBuildmanage.getArea().getId())) {
										Area areaGridId = new Area();
										areaGridId.setId(ccmHouseBuildmanage.getArea().getId());
										areaGridId = areaService.get(areaGridId);
										if (areaGridId != null && !"".equals(areaGridId)) {
											ccmPeople.setAreaGridId(areaGridId);// 网格ID
											Area areaComId = new Area();
											if (areaGridId.getParentId() != null
													&& !"".equals(areaGridId.getParentId())) {
												areaComId.setId(areaGridId.getParentId());
												areaComId = areaService.get(areaComId);
												ccmPeople.setAreaComId(areaComId);// 社区ID
											}

										}

									}
								}

							}
						}
					}

				}
			}
		}

		// 返回查询结果
		model.addAttribute("ccmLogTailList", ccmLogTailList);
		model.addAttribute("ccmPeople", ccmPeople);
		model.addAttribute("houseId", houseId);
		model.addAttribute("buildId", buildId);
		// 通过 房屋进行查询
		if (("house").equals(ptype)) {
			model.addAttribute("PeoTypeBy", "ByHouse");
		}else if(("hire").equals(ptype)) {
			model.addAttribute("PeoTypeBy", "ByHouse_hire");
		} else {
			model.addAttribute("PeoTypeBy", "ByHouse_Build");
		}
		return "ccm/pop/popByHouse/ccmPeopleFormForHouse";
	}

	// 人员批量添加-房屋
	@RequestMapping(value = "listPopAdd")
	public String listPopAdd(@RequestParam(required = false) String houseId, CcmPeople ccmPeople,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		// 获取房屋ID
		Page<CcmPeople> page = new Page<CcmPeople>(request, response);
		int countnum = page.getPageSize()*8;
		if(page.getPageNo()>= 6){
			countnum+=page.getPageNo()/6*page.getPageSize()*8;
		}
		page.setCount(countnum);
		page.initialize();
		ccmPeople.setMinnum((page.getPageNo()-1)*page.getPageSize());
		ccmPeople.setMaxnum(page.getPageSize());
		if(StringUtils.isNotEmpty(ccmPeople.getName())){
			ccmPeople.setIsOrderBy("true");
		}
		if(StringUtils.isNotEmpty(ccmPeople.getIdent())){
			ccmPeople.setIsOrderBy("true");
		}
		CcmPopTenant ccmPopTenant = new CcmPopTenant();
		ccmPopTenant.setId(houseId);
		ccmPeople.setRoomId(ccmPopTenant);
		// 查询 人员列表
		List<CcmPeople> list = ccmPeopleService.findListexists(new Page<CcmPeople>(request, response), ccmPeople);
		//
		CcmPeople ccmPeople2 = new CcmPeople();
		String[] listLimite = new String[list.size()];
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				listLimite[i] = list.get(i).getId();
			}
			ccmPeople2.setListLimite(listLimite);
			List<CcmPeople> list2 = ccmPeopleService.findListLimite(ccmPeople2);// 数组查询id
			page.setList(list2);
		}

		model.addAttribute("page", page);
		model.addAttribute("ccmPeople", ccmPeople);
		model.addAttribute("houseId", houseId);

		return "ccm/pop/ccmPeopleListAdd";
	}

	// 人员批量添加保存-房屋
	@ResponseBody
	@RequestMapping(value = "savePopAdd")
	public List<String> savePopAdd(@RequestParam(required = false) String houseId, CcmPeople ccmPeople, Model model,
			RedirectAttributes redirectAttributes) {

		ccmPeople = ccmPeopleService.get(ccmPeople.getId());

		if (houseId != null && !"".equals(houseId)) {
			CcmPopTenant ccmPopTenant = new CcmPopTenant();
			ccmPopTenant.setId(houseId);
			ccmPopTenant = ccmPopTenantService.get(ccmPopTenant);// 房屋
			if (ccmPopTenant != null && !"".equals(ccmPopTenant)) {
				ccmPeople.setRoomId(ccmPopTenant);// 写入房屋ID
				CcmHouseBuildmanage ccmHouseBuildmanage = new CcmHouseBuildmanage();
				if (ccmPopTenant.getBuildingId() != null && !"".equals(ccmPopTenant.getBuildingId())) {
					if (ccmPopTenant.getBuildingId().getId() != null
							&& !"".equals(ccmPopTenant.getBuildingId().getId())) {
						ccmHouseBuildmanage.setId(ccmPopTenant.getBuildingId().getId());
						ccmHouseBuildmanage = ccmHouseBuildmanageService.get(ccmHouseBuildmanage);// 楼栋
						if (ccmHouseBuildmanage != null && !"".equals(ccmHouseBuildmanage)) {
							ccmPeople.setBuildId(ccmHouseBuildmanage);// 写入楼栋ID
							if (ccmHouseBuildmanage.getArea() != null && !"".equals(ccmHouseBuildmanage.getArea())) {
								if (ccmHouseBuildmanage.getArea().getId() != null
										&& !"".equals(ccmHouseBuildmanage.getArea().getId())) {
									Area areaGridId = new Area();
									areaGridId.setId(ccmHouseBuildmanage.getArea().getId());
									areaGridId = areaService.get(areaGridId);// 网格
									if (areaGridId != null && !"".equals(areaGridId)) {
										ccmPeople.setAreaGridId(areaGridId);// 写入网格ID
										Area areaComId = new Area();
										if (areaGridId.getParentId() != null && !"".equals(areaGridId.getParentId())) {
											areaComId.setId(areaGridId.getParentId());
											areaComId = areaService.get(areaComId);// 社区
											ccmPeople.setAreaComId(areaComId);// 写入社区ID
										}

									}

								}
							}

						}
					}
				}

			}
		}

		ccmPeopleService.save(ccmPeople);
		addMessage(redirectAttributes, "添加成员成功");

		List<String> list = new ArrayList<>();
		list.add(ccmPeople.getId());
		list.add("添加成员成功");
		return list;
	}

	/**
	 * @see 保存人口返回房屋页面列表
	 * @param ccmPeople
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("pop:ccmPeople:edit")
	@RequestMapping(value = "saveByHouse")
	public void saveByHouse(CcmPeople ccmPeople, Model model, RedirectAttributes redirectAttributes,HttpServletResponse response) {
		if (!beanValidator(model, ccmPeople)) {
			//return form(ccmPeople, model);
		}
		// 注入楼栋id
		if (ccmPeople.getRoomId() != null && ccmPeople.getRoomId().getId() != null
				&& !"".equals(ccmPeople.getRoomId().getId())) {
			CcmPopTenant ccmPopTenant = ccmPopTenantService.get(ccmPeople.getRoomId().getId());
			if (ccmPopTenant != null && ccmPopTenant.getBuildingId() != null
					&& ccmPopTenant.getBuildingId().getId() != null && ccmPopTenant.getBuildingId().getId() != "") {
				ccmPeople.setBuildId(ccmPopTenant.getBuildingId());
			}
		}
		ccmPeopleService.save(ccmPeople);
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        CommUtil.openWinExpDiv(out,"保存房屋成员成功");
		//addMessage(redirectAttributes, "保存房屋成员成功");
		/*return "redirect:" + Global.getAdminPath() + "/pop/ccmPeople/getPeoListByHouse?houseId="
				+ ccmPeople.getRoomId().getId() + "&type=house&repage";*/
	}

	// 删除人口返回房屋页面列表
	@RequiresPermissions("pop:ccmPeople:edit")
	@RequestMapping(value = "deleteByHouse")
	public String deleteByHouse(CcmPeople ccmPeople, RedirectAttributes redirectAttributes) {
		ccmPeopleService.delete(ccmPeople);
		addMessage(redirectAttributes, "删除实有人口成功");
		return "redirect:" + Global.getAdminPath() + "/pop/ccmPeople/getPeoListByHouse?houseId="
				+ ccmPeople.getRoomId().getId() + "&type=house&repage";
	}

	@RequiresPermissions("pop:ccmPeople:view")
	@RequestMapping(value ="map")
	public String map(CcmPeople ccmPeople, HttpServletRequest request, HttpServletResponse response, Model model) {
		//系统级别
/*		SysConfig sysConfig = new SysConfig();
		sysConfig = sysConfigService.get("system_level");
		String level = sysConfig.getParamStr();
		model.addAttribute("level", level);
		model.addAttribute("ccmEventAmbi", ccmEventAmbi);*/
		return "dma/schoolsafe/dmaSchoolSafeMap";
	}

	@RequiresPermissions("pop:ccmPeople:view")
	@RequestMapping(value ="pop")
	public String pop(CcmPeople ccmPeople, HttpServletRequest request, HttpServletResponse response, Model model) {
		//系统级别
/*		SysConfig sysConfig = new SysConfig();
		sysConfig = sysConfigService.get("system_level");
		String level = sysConfig.getParamStr();
		model.addAttribute("level", level);
		model.addAttribute("ccmEventAmbi", ccmEventAmbi);*/
		return "dma/judiciarysubject/dmaJudiciarySubjectMap";
	}

	@ResponseBody
	@RequestMapping(value = "popNumAllByPolitics")
	public List<com.arjjs.ccm.tool.EchartType> selectPopNumAllByPolitics(Model model) {
	    // 返回对象结果
	    List<EchartType> list = ccmPeopleService.selectPopNumAllByPolitics();
	    return list;
	}

	@ResponseBody
	@RequestMapping(value = "PopNumAllByRectification")
	public List<com.arjjs.ccm.tool.EchartType> selectPopNumAllByRectification(Model model) {
	    // 返回对象结果
	    List<EchartType> list = ccmPeopleService.selectPopNumAllByRectification();
	    return list;
	}


	// 批量添加的移除人员
	@RequiresPermissions("pop:ccmPeople:edit")
	@RequestMapping(value = "deletePeople")
	public String deletePeople(String id, String type, String houseId, String buildId, String netId,
			RedirectAttributes redirectAttributes) {
		CcmPeople ccmPeople = new CcmPeople();
		ccmPeople = ccmPeopleService.get(id);
		String houseIdString = ccmPeople.getRoomId().getId();
		// ccmPeopleService.delete(ccmPeople);
		CcmPopTenant ccmPopTenant = new CcmPopTenant(); // 移除房屋ID
		ccmPeople.setRoomId(ccmPopTenant);
		ccmPeopleService.save(ccmPeople);
		// 修改记录表离开时间
		CcmTenantRecord ccmTenantRecord = new CcmTenantRecord();
		ccmTenantRecord.setHouseId(houseIdString);
		ccmTenantRecord.setIdCard(ccmPeople.getIdent());
		List<CcmTenantRecord> list = ccmTenantRecordService.findList(ccmTenantRecord);

		if (list.size() != 0) {
			for (int i = 0; i < list.size(); i++) {
				for (int j = 0; j < list.size() - i - 1; j++) {// 注意第二重循环的条件 
					long a =list.get(j).getLiveDate().getTime();
					long b = list.get(j + 1).getLiveDate().getTime();
					if (a > b) {
						CcmTenantRecord temp = list.get(j);
						list.set(j, list.get(j + 1));
						list.set(j + 1, temp);
					}
				}
			}
			CcmTenantRecord ccmTenantRecord2 = list.get(list.size() - 1);
			ccmTenantRecord2.setLeaveDate(new Date());
			ccmTenantRecordService.save(ccmTenantRecord2);
		}

		/*if (ccmTenantRecordList.size() != 0) {
			for (CcmTenantRecord ccmTenantRecord2 : ccmTenantRecordList) {
				ccmTenantRecord2.setLeaveDate(new Date());
				ccmTenantRecordService.save(ccmTenantRecord2);
			}
		}*/
		addMessage(redirectAttributes, "移除成员成功");
		if ("ByHouse".equals(type)) {
			return "redirect:" + Global.getAdminPath() + "/pop/ccmPeople/getPeoListByHouse?houseId=" + houseIdString
					+ "&type=house&repage";
		}else if("ByHouse_hire".equals(type)) {
			return "redirect:" + Global.getAdminPath() + "/pop/ccmPeople/getPeoListByHouse?houseId=" + houseIdString
					+ "&type=hire&repage";
		} else {
			return "redirect:" + Global.getAdminPath() + "/pop/ccmPeople/getPeoListByHouse?houseId=" + houseId
					+ "&type=houseBuild&buildId=" + buildId + "&netId=" + netId + "&repage";
		}
	}

	/**
	 * 重点人员社交关系（家庭、同住）信息弹框
	 *
	 * @author pengjianqiang
	 * @version 2018-07-22
	 */
	@RequestMapping(value = "getSocialConnections")
	public String getSocialConnections(CcmPeople ccmPeople, Model model) {
		/**** 社会关系成员 ****/
		CppPopPop cppPopPop = new CppPopPop();
		cppPopPop.setIdCard1(ccmPeople.getIdent());
		List<CcmPeople> ccmPeople3 = new ArrayList<CcmPeople>();
		List<CcmPeople> listSocial = new ArrayList<CcmPeople>();
		List<CppPopPop> list = cppPopPopService.findList(cppPopPop);
		if(list.size()!=0) {
			for(int i=0;i<list.size();i++) {
				if(list.get(i).getIdCard1().equals(ccmPeople.getIdent())) {
                    List<CcmPeople> ccmPeople4= new ArrayList<CcmPeople>();
                    CcmPeople ccmPop= new CcmPeople();
                    ccmPop.setIdent(list.get(i).getIdCard2());
                    ccmPop.setName(list.get(i).getName2());
//                  ccmPeople3 = ccmPeopleService.getByIdent(list.get(i).getIdCard2());
                    ccmPeople4.add(ccmPop);
                    ccmPeople3=ccmPeople4;
					if(ccmPeople3==null || ccmPeople3.size() <= 0) {
						continue;
					}
					for (CcmPeople people3 : ccmPeople3) {
						people3.setCpptype(list.get(i).getType());
						listSocial.add(people3);
					}
				}else {
					ccmPeople3 = ccmPeopleService.getByIdent(list.get(i).getIdCard1());
					if(ccmPeople3==null || ccmPeople3.size() <= 0) {
						continue;
					}
					for (CcmPeople people3 : ccmPeople3) {
						people3.setCpptype(list.get(i).getType());
						listSocial.add(people3);
					}
				}
			}
		}
		model.addAttribute("listSocial", listSocial);
		/**** 户籍家庭成员 ****/
		ccmPeople = ccmPeopleService.getHousePopForm(ccmPeople);
		model.addAttribute("ccmPeople", ccmPeople);
		List<CcmPeople> listAccount = new ArrayList<CcmPeople>();
		if (null != ccmPeople.getAccount()&&!"".equals(ccmPeople.getAccount())) {
			listAccount = ccmPeopleService.listAccount(ccmPeople);
			// 不带本人的情况
//			for (int i = 0; i < listAccount.size(); i++) {
//				if(listAccount.get(i).getIdent().equals(ccmPeople.getIdent())){
//					listAccount.remove(i);
//					break;
//				}
//			}
		}
		model.addAttribute("listAccount", listAccount);

		/**** 同一房屋人员 ****/
		List<CcmPeople> listRoomPeople = new ArrayList<CcmPeople>();
		if (!StringUtils.isBlank(ccmPeople.getRoomIdString())) {
			listRoomPeople = ccmPeopleService.getHousePopList(ccmPeople);
		}
		model.addAttribute("listRoomPeople", listRoomPeople);
		model.addAttribute("ident", ccmPeople.getIdent());

		return "ccm/pop/ccmPeopleSocialConnections";
	}
	// 实有人口总数
	@ResponseBody
	@RequestMapping(value = "findCount")
	public String findCount(CcmPeople ccmPeople, Model model,RedirectAttributes redirectAttributes) {
		int count = ccmPeopleService.findCount();
		return String.valueOf(count);
	}

	@RequestMapping(value = "mapvForm")
	public String mapvForm(CcmPeople ccmPeople, HttpServletRequest request, HttpServletResponse response, Model model) {
		ccmPeople = ccmPeopleService.get(ccmPeople.getId());
		model.addAttribute("ccmPeople", ccmPeople);
		return "ccm/pop/ccmPeopleMapvForm";
	}

	//重点人员top5
	@ResponseBody
	@RequestMapping(value = "getKeypeopleTop")
	public List<EchartType> getKeypeopleTop(){
		List<EchartType> list = ccmPeopleService.getKeypeopleTop();
		return list;
	}


	//根据户主身份证号码查询户主下的人员数据
	@ResponseBody
	@RequestMapping(value = "queryByIdent")
	public List<CcmPeople> queryByIdent(String ident){
		return ccmPeopleService.queryByIdent(ident);
	}

	// 根据身份证号码查询该人员是否已存在
	@ResponseBody
	@RequestMapping(value = "queryByPersonalIdent")
	public List<CcmPeople> queryByPersonalIdent(String pident,String id) {
		List<CcmPeople> ccmPeoples = ccmPeopleService.queryByPersonalIdent(pident, id);
		return ccmPeoples;
	}

    /*根据标记类型修改重点人员*/
    public boolean sign(CcmPeople ccmPeople){

    	int i=0;
    	// 是否留守
        if (ccmPeople.getIsBehind()!=null&&ccmPeople.getIsBehind()==1){
            i++;
        }
        // 是否安置帮教
        if (ccmPeople.getIsRelease()!=null&&ccmPeople.getIsRelease()==1){
            i++;
        }
        // 是否社区矫正
        if (ccmPeople.getIsRectification()!=null&&ccmPeople.getIsRectification()==1){
            i++;
        }
        // 是否艾滋病患者
        if (ccmPeople.getIsAids()!=null&&ccmPeople.getIsAids()==1){
            i++;
        }
        // 是否肇事肇祸等严重精神障碍患者
        if (ccmPeople.getIsPsychogeny()!=null&&ccmPeople.getIsPsychogeny()==1){
            i++;
        }
        // 是否吸毒
        if (ccmPeople.getIsDrugs()!=null&&ccmPeople.getIsDrugs()==1){
            i++;
        }
        //是否危害国家安全
        if (ccmPeople.getIsHarmNational()!=null&&ccmPeople.getIsHarmNational()==1){
            i++;
        }
        //是否故意犯法释放
        if (ccmPeople.getIsDeliberatelyIllegal()!=null&&ccmPeople.getIsDeliberatelyIllegal()==1){
            i++;
        }
        //是否严重犯罪嫌疑
        if (ccmPeople.getIsCriminalOffense()!=null&&ccmPeople.getIsCriminalOffense()==1){
            i++;
        }
        //是否在逃
        if (ccmPeople.getIsEscape()!=null&&ccmPeople.getIsEscape()==1){
            i++;
        }
        // 是否重点上访
        if (ccmPeople.getIsVisit()!=null&&ccmPeople.getIsVisit()==1){
            i++;
        }
        // 是否涉教
        if (ccmPeople.getIsHeresy()!=null&&ccmPeople.getIsHeresy()==1){
            i++;
        }
        // 是否危险品从业人员
        if (ccmPeople.getIsDangerous()!=null&&ccmPeople.getIsDangerous()==1){
            i++;
        }

        if (i>0){
            return true;
        }
            return false;
    }





}