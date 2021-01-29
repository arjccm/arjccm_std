/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.house.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

import com.arjjs.ccm.common.beanvalidator.BeanValidators;
import com.arjjs.ccm.common.utils.excel.ImportExcel;
import com.arjjs.ccm.modules.ccm.house.entity.CcmHouseRectification;
import com.arjjs.ccm.modules.pbs.sys.utils.UserUtils;
import com.arjjs.ccm.modules.sys.entity.Dict;
import com.arjjs.ccm.tool.CommUtil;
import com.arjjs.ccm.tool.EntityTools;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.event.entity.CcmEventAmbi;
import com.arjjs.ccm.modules.ccm.house.entity.CcmHouseSchoolrim;
import com.arjjs.ccm.modules.ccm.house.service.CcmHouseSchoolrimService;
import com.arjjs.ccm.modules.ccm.log.entity.CcmLogTail;
import com.arjjs.ccm.modules.ccm.log.service.CcmLogTailService;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeople;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPeopleService;
import com.arjjs.ccm.modules.ccm.sys.entity.SysConfig;
import com.arjjs.ccm.modules.ccm.sys.service.AreaSPService;
import com.arjjs.ccm.modules.sys.entity.Area;
import com.arjjs.ccm.tool.EchartType;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

/**
 * 学校Controller
 * @author wwh
 * @version 2018-01-10
 */
@Controller
@RequestMapping(value = "${adminPath}/house/ccmHouseSchoolrim")
public class CcmHouseSchoolrimController extends BaseController {

	@Autowired
	private CcmHouseSchoolrimService ccmHouseSchoolrimService;
	@Autowired
	private AreaSPService areaSPService;
	@Autowired
	private CcmPeopleService ccmPeopleService;
	@Autowired
	private CcmLogTailService ccmLogTailService;
	
	
	
	//校园周边重点人员
	@RequiresPermissions("house:ccmHouseSchoolrim:view")
	@RequestMapping(value = "popIndex")
	public String popIndex(CcmHouseSchoolrim ccmHouseSchoolrim, HttpServletRequest request, HttpServletResponse response, Model model) {
		return "ccm/house/ccmHouseSchoolrimPopIndex";
	}
	//安全可视化呈现
	@RequiresPermissions("house:ccmHouseSchoolrim:view")
	@RequestMapping(value = "popMapIndex")
	public String popMapIndex(CcmHouseSchoolrim ccmHouseSchoolrim, HttpServletRequest request, HttpServletResponse response, Model model) {
		return "ccm/house/ccmHouseSchoolrimPopMapIndex";
	}
	
	
	//校园周边重点人员列表
	@RequiresPermissions("house:ccmHouseSchoolrim:view")
	@RequestMapping(value = "popList")
	public String popList(CcmHouseSchoolrim ccmHouseSchoolrim, HttpServletRequest request, HttpServletResponse response, Model model) {	
		model.addAttribute("ccmHouseSchoolrim", ccmHouseSchoolrim);
		if(ccmHouseSchoolrim.getArea()==null || StringUtils.isEmpty(ccmHouseSchoolrim.getArea().getId())) {
			List<CcmHouseSchoolrim> school = ccmHouseSchoolrimService.getAreaBySchool();
			String[] schoolArea = new String[school.size()];
			int num = 0;
			for (int i=0;i<school.size();i++) {
				if(school.get(i).getArea()!=null && school.get(i).getArea().getId()!=null){
					if(!Arrays.asList(schoolArea).contains(school.get(i).getArea().getId())){
						schoolArea[num]=school.get(i).getArea().getId();
						num++;
					}
				}
			}
			CcmPeople parampop = new CcmPeople();
			parampop.setListLimite(schoolArea);
			Page<CcmPeople> page = ccmPeopleService.findAllPopByArea(new Page<CcmPeople>(request, response), parampop);
			//数组查询id
			List<CcmPeople> list = page.getList();
			CcmPeople ccmPeople2 = new CcmPeople();
			String[] listLimite = new String[list.size()];
			if(list.size()>0){
				for(int i=0;i<list.size();i++){
					listLimite[i]=list.get(i).getId();
				}
				ccmPeople2.setListLimite(listLimite);
				List<CcmPeople> list2 = ccmPeopleService.findListLimite_V2(ccmPeople2);//数组查询id
				page.setList(list2);
			}
			model.addAttribute("page", page);
		}else {
			CcmPeople ccmPeople = new CcmPeople();
			Area area = new Area();
			if(ccmHouseSchoolrim.getArea()!=null && ccmHouseSchoolrim.getArea().getId()!=null){
				area.setId(ccmHouseSchoolrim.getArea().getId());
				ccmPeople.setAreaComId(area);
			}
			Page<CcmPeople> page = ccmPeopleService.findPagePop(new Page<CcmPeople>(request, response), ccmPeople); 
			//数组查询id
			List<CcmPeople> list = page.getList();
			CcmPeople ccmPeople2 = new CcmPeople();
			String[] listLimite = new String[list.size()];
			if(list.size()>0){
				for(int i=0;i<list.size();i++){
					listLimite[i]=list.get(i).getId();
				}
				ccmPeople2.setListLimite(listLimite);
				List<CcmPeople> list2 = ccmPeopleService.findListLimite_V2(ccmPeople2);//数组查询id
				page.setList(list2);
			}
			model.addAttribute("page", page);
		}
		return "ccm/house/ccmHouseSchoolrimPopList";
	}
	//安全可视化呈现
	@RequiresPermissions("house:ccmHouseSchoolrim:view")
	@RequestMapping(value = "popMap")
	public String popMap(CcmHouseSchoolrim ccmHouseSchoolrim, HttpServletRequest request, HttpServletResponse response, Model model) {	
		if(ccmHouseSchoolrim.getArea()==null || ccmHouseSchoolrim.getArea().getName()==null){
			Area area = new Area();
			area.setName("");
			ccmHouseSchoolrim.setArea(area);
		}
		model.addAttribute("ccmHouseSchoolrim", ccmHouseSchoolrim);

		return "ccm/house/ccmHouseSchoolrimPopMap";
	}
	
	//
	@ModelAttribute
	public CcmHouseSchoolrim get(@RequestParam(required=false) String id) {
		CcmHouseSchoolrim entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = ccmHouseSchoolrimService.get(id);
		}
		if (entity == null){
			entity = new CcmHouseSchoolrim();
		}
		return entity;
	}
	
	@RequiresPermissions("house:ccmHouseSchoolrim:view")
	@RequestMapping(value = {"list", ""})
	public String list(CcmHouseSchoolrim ccmHouseSchoolrim, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CcmHouseSchoolrim> page = ccmHouseSchoolrimService.findPage(new Page<CcmHouseSchoolrim>(request, response), ccmHouseSchoolrim); 
		model.addAttribute("page", page);
		return "ccm/house/ccmHouseSchoolrimList";
	}

	@RequiresPermissions("house:ccmHouseSchoolrim:view")
	@RequestMapping(value = "form")
	public String form(CcmHouseSchoolrim ccmHouseSchoolrim, Model model) {
		// 创建 查询对象 建立查询条件
		CcmLogTail ccmLogTailDto = new CcmLogTail();
		ccmLogTailDto.setRelevanceId(ccmHouseSchoolrim.getId());
		ccmLogTailDto.setRelevanceTable("ccm_house_school");
		List<CcmLogTail > ccmLogTailList = ccmLogTailService.findListByObject(ccmLogTailDto);
		// 返回查询结果
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[]{"createBy","updateBy","currentUser","dbName","global","page","createDate","updateDate","sqlMap"});
		config.setIgnoreDefaultExcludes(false);  //设置默认忽略
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		String jsonDocumentList = JSONArray.fromObject(ccmLogTailList,config).toString(); 
		model.addAttribute("documentList", jsonDocumentList);
		model.addAttribute("documentNumber", ccmLogTailList.size());
		
		model.addAttribute("ccmLogTailList", ccmLogTailList);		
		model.addAttribute("ccmHouseSchoolrim", ccmHouseSchoolrim);
		return "ccm/house/ccmHouseSchoolrimForm";
	}

	@RequiresPermissions("house:ccmHouseSchoolrim:edit")
	@RequestMapping(value = "save")
	public String save(CcmHouseSchoolrim ccmHouseSchoolrim, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, ccmHouseSchoolrim)){
			return form(ccmHouseSchoolrim, model);
		}
		ccmHouseSchoolrimService.save(ccmHouseSchoolrim);
		addMessage(redirectAttributes, "保存学校成功");
		return "redirect:"+Global.getAdminPath()+"/house/ccmHouseSchoolrim/list?repage";
	}
	
	@RequiresPermissions("house:ccmHouseSchoolrim:edit")
	@RequestMapping(value = "delete")
	public String delete(CcmHouseSchoolrim ccmHouseSchoolrim, RedirectAttributes redirectAttributes) {
		ccmHouseSchoolrimService.delete(ccmHouseSchoolrim);
		addMessage(redirectAttributes, "删除学校成功");
		return "redirect:"+Global.getAdminPath()+"/house/ccmHouseSchoolrim/list?repage";
	}
	
	@RequiresPermissions("house:ccmHouseSchoolrim:view")
	@RequestMapping(value ="map")
	public String map(CcmHouseSchoolrim ccmHouseSchoolrim, HttpServletRequest request, HttpServletResponse response, Model model) {
		//系统级别
/*		SysConfig sysConfig = new SysConfig();
		sysConfig = sysConfigService.get("system_level");
		String level = sysConfig.getParamStr();
		model.addAttribute("level", level);
		model.addAttribute("ccmEventAmbi", ccmEventAmbi);*/
		return "dma/schoolsafe/dmaSchoolSafeMap";
	}
	@ResponseBody
	@RequestMapping(value = {"schoolNumAllByOfficeAjax"})
	public JSONArray useNumAllByOfficeAjax(HttpServletRequest request, HttpServletResponse response ,String height,String width , String content,String sid) {
		//top10
		//List<EchartType> list = plmCarUseService.selectUseNumByOffice();
		//用车次数
		List<EchartType> useList = ccmHouseSchoolrimService.selectSchoolNumAllByOffice();
		
		
		
		JSONArray jsondata = JSONArray.fromObject(useList); 
		
		return jsondata;
	}
	
	@ResponseBody
	@RequestMapping(value = "schoolEventAmbiScale")
	public String findScaleMap(CcmEventAmbi ccmEventAmbi, Model model) {
		List<EchartType> listScale = ccmHouseSchoolrimService.selectschoolEventAmbiScale();//矛盾纠纷规模统计
		EchartType newEchartType = new EchartType();//非空判断
		newEchartType.setType("暂无数据");
		newEchartType.setValue("0");
		if(listScale.size()==0){
			listScale.add(newEchartType);
		}
		
		JsonConfig config = new JsonConfig();//PingJson
		config.setExcludes(new String[]{"typeO"});
		config.setIgnoreDefaultExcludes(false);  //设置默认忽略
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		String listScaleString = JSONArray.fromObject(listScale,config).toString(); //Json矛盾纠纷规模统计

		return listScaleString;
	}
	
	
	
	//区域树
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
//		List<Area> list = ccmHouseSchoolrimService.findListSP(new Area());
//		for (int i=0; i<list.size(); i++){
//			Area e = list.get(i);
//			if (StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1)){
//				Map<String, Object> map = Maps.newHashMap();
//				map.put("id", e.getId());
//				map.put("pId", e.getParentId());
//				map.put("name", e.getName());
//				map.put("type", e.getType());
//				mapList.add(map);
//			}
//		}
		List<CcmHouseSchoolrim> list = ccmHouseSchoolrimService.findListSP(new CcmHouseSchoolrim());
		for (int i=0; i<list.size(); i++){
			CcmHouseSchoolrim e = list.get(i);
			if (StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && e.getMore2().indexOf(","+extId+",")==-1)){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getMore1());
				map.put("name", e.getSchoolName());
				map.put("type", e.getMore3());
				mapList.add(map);
			}
		}
		return mapList;
	}

	@ResponseBody
	@RequestMapping(value = {"findCountSchoolByName"})
	public List<CcmHouseSchoolrim> findCountSchoolByName(HttpServletRequest request, HttpServletResponse response , String schoolName, String id) {
		CcmHouseSchoolrim ccmHouseSchoolrim = new CcmHouseSchoolrim();
		ccmHouseSchoolrim.setSchoolName(schoolName);
		List<CcmHouseSchoolrim> result = ccmHouseSchoolrimService.findCountSchoolByName(ccmHouseSchoolrim);
		if(result.size()>0){
			for(int i=0 ; i<result.size() ; i++){
				if(StringUtils.isNotEmpty(id)){
					if(id.equals(result.get(i).getId())){
						result.remove(i);
					}
				}
			}
		}
		return result;
	}



	@RequiresPermissions("house:ccmHouseSchoolrim:edit")
	@RequestMapping(value = "addAttention")
	public String addAttention(CcmHouseSchoolrim ccmHouseSchoolrim, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, ccmHouseSchoolrim)){
			return form(ccmHouseSchoolrim, model);
		}
		ccmHouseSchoolrim.setUpdateBy(UserUtils.getUser());
		ccmHouseSchoolrim.setUpdateDate(new Date());
		ccmHouseSchoolrimService.addAttention(ccmHouseSchoolrim);
		addMessage(redirectAttributes, "学校添加关注成功");
		return "redirect:"+Global.getAdminPath()+"/house/ccmHouseSchoolrim/list?repage";
	}

	@RequiresPermissions("house:ccmHouseSchoolrim:edit")
	@RequestMapping(value = "delAttentionForm")
	public String delAttentionForm(CcmHouseSchoolrim ccmHouseSchoolrim, Model model) {
		model.addAttribute("ccmHouseSchoolrim", ccmHouseSchoolrim);
		return "ccm/house/ccmHouseSchoolrimDelAttention";
	}

	@RequiresPermissions("house:ccmHouseSchoolrim:edit")
	@RequestMapping(value = "delAttention")
	public void delAttention(HttpServletRequest request, HttpServletResponse response, CcmHouseSchoolrim ccmHouseSchoolrim, Model model, RedirectAttributes redirectAttributes) throws IOException {
		if (!beanValidator(model, ccmHouseSchoolrim)){
//			return form(ccmHouseSchoolrim, model);
		}
		ccmHouseSchoolrim.setUpdateBy(UserUtils.getUser());
		ccmHouseSchoolrim.setUpdateDate(new Date());
		ccmHouseSchoolrimService.delAttention(ccmHouseSchoolrim);
		addMessage(redirectAttributes, "学校取消关注成功");
		addMessage(redirectAttributes, "保存社区矫正人员成功");
		PrintWriter out = response.getWriter();
		CommUtil.openWinExpDiv(out, "保存社区矫正人员成功");
	}

	/**
	 * 导入学校数据
	 */
	@RequiresPermissions("house:ccmHouseSchoolrim:edit")
	@RequestMapping(value = "import", method = RequestMethod.POST)
	public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		if (Global.isDemoMode()) {
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:"+Global.getAdminPath()+"/house/ccmHouseSchoolrim/list?repage";
		}
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<CcmHouseSchoolrim> list = ei.getDataList(CcmHouseSchoolrim.class);

			List<CcmHouseSchoolrim> alllist = ccmHouseSchoolrimService.findList(new CcmHouseSchoolrim());
			StringBuilder ishave = new StringBuilder();
			for(int i=0 ; i<alllist.size() ; i++){
				ishave.append(alllist.get(i).getSchoolName() + ",");
			}

			//格式化日期
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			//将电话号获取异常的转为正常电话号（异常包含E10和小数点）
			DecimalFormat df = new DecimalFormat("#");
			for (CcmHouseSchoolrim school : list) {
				try {
					if(EntityTools.isEmpty(school)){
						continue;
					}
					if(StringUtils.isBlank(school.getSchoolName()) ||
							StringUtils.isBlank(school.getSchoolAdd()) ||
							school.getArea() == null ||
							school.getSchoolNum() == null ||
							StringUtils.isBlank(school.getSchoolType()) ||
							StringUtils.isBlank(school.getSchoolEducDepa()) ||
							StringUtils.isBlank(school.getHeadName()) ||
							StringUtils.isBlank(school.getHeadTl()) ||
							StringUtils.isBlank(school.getSecuBranName()) ||
							StringUtils.isBlank(school.getSecuBranTl()) ||
							StringUtils.isBlank(school.getSecuGuardName()) ||
							StringUtils.isBlank(school.getSecuGuardTl()) ||
							StringUtils.isBlank(school.getSecuName()) ||
							StringUtils.isBlank(school.getSecuTl()) ||
							school.getSecuGuardNum() == null ||
							StringUtils.isBlank(school.getIsAttention())
					){
						StringBuilder str = new StringBuilder();
						str.append("(");
						if(StringUtils.isBlank(school.getSchoolName())) {
							str.append("学校名称信息错误;");
						}
						if(StringUtils.isBlank(school.getSchoolAdd())) {
							str.append("学校地址信息错误;");
						}
						if(school.getArea() == null) {
							str.append("所属区域信息错误;");
						}
						if(school.getSchoolNum() == null) {
							str.append("在校学生人数信息错误;");
						}
						if(StringUtils.isBlank(school.getSchoolType())) {
							str.append("学校办学类型信息错误;");
						}
						if(StringUtils.isBlank(school.getSchoolEducDepa())) {
							str.append("学校所属主管教育行政部门信息错误;");
						}
						if(StringUtils.isBlank(school.getHeadName())) {
							str.append("校长姓名信息错误;");
						}
						if(StringUtils.isBlank(school.getHeadTl())) {
							str.append("校长联系方式信息错误;");
						}
						if(StringUtils.isBlank(school.getSecuBranName())) {
							str.append("分管安全保卫责任人姓名信息错误;");
						}
						if(StringUtils.isBlank(school.getSecuBranTl())) {
							str.append("分管安全保卫责任人联系方式信息错误;");
						}
						if(StringUtils.isBlank(school.getSecuGuardName())) {
							str.append("安全保卫责任人姓名信息错误;");
						}
						if(StringUtils.isBlank(school.getSecuGuardTl())) {
							str.append("安全保卫责任人联系方式信息错误;");
						}
						if(StringUtils.isBlank(school.getSecuName())) {
							str.append("治安责任人姓名信息错误;");
						}
						if(StringUtils.isBlank(school.getSecuTl())) {
							str.append("治安责任人联系方式罪信息错误;");
						}
						if(school.getSecuGuardNum() == null) {
							str.append("安全保卫人数信息错误;");
						}
						if(StringUtils.isBlank(school.getIsAttention())) {
							str.append("是否关注信息错误;");
						}
						str.append(")");
						failureMsg.append("<br/>学校名称 " + school.getSchoolName() + " 导入失败：必填项为空。"+str.toString());
						failureNum++;
						continue;
					}

					if(ishave.toString().contains(school.getSchoolName())){
						failureMsg.append("<br/>学校名称 " + school.getSchoolName() + " 导入失败：该学校名称已存在。");
						failureNum++;
						continue;
					}


					if(StringUtils.isNotEmpty(school.getHeadTl())){
						//将导入时电话获取包含“.”或“E10”，的转成正确的电话格式
						if(school.getHeadTl().contains(".") || school.getHeadTl().contains("E")) {
							double bd = Double.valueOf(school.getHeadTl());
							String tel = df.format(bd);
							school.setHeadTl(tel);
						}
					}
					if(StringUtils.isNotEmpty(school.getSecuBranTl())){
						//将导入时电话获取包含“.”或“E10”，的转成正确的电话格式
						if(school.getSecuBranTl().contains(".") || school.getSecuBranTl().contains("E")) {
							double bd = Double.valueOf(school.getSecuBranTl());
							String tel = df.format(bd);
							school.setSecuBranTl(tel);
						}
					}
					if(StringUtils.isNotEmpty(school.getSecuGuardTl())){
						//将导入时电话获取包含“.”或“E10”，的转成正确的电话格式
						if(school.getSecuGuardTl().contains(".") || school.getSecuGuardTl().contains("E")) {
							double bd = Double.valueOf(school.getSecuGuardTl());
							String tel = df.format(bd);
							school.setSecuGuardTl(tel);
						}
					}
					if(StringUtils.isNotEmpty(school.getSecuTl())){
						//将导入时电话获取包含“.”或“E10”，的转成正确的电话格式
						if(school.getSecuTl().contains(".") || school.getSecuTl().contains("E")) {
							double bd = Double.valueOf(school.getSecuTl());
							String tel = df.format(bd);
							school.setSecuTl(tel);
						}
					}

					ccmHouseSchoolrimService.save(school);
					successNum++;
					ishave.append(school.getSchoolName() + ",");
				} catch (ConstraintViolationException ex) {
					failureMsg.append("<br/>学校名称 " + school.getSchoolName() + " 导入失败：");
					List<String> messageList = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
					for (String message : messageList) {
						failureMsg.append(message + "; ");
						failureNum++;
					}
				} catch (Exception ex) {
					failureMsg.append("<br/>学校名称 " + school.getSchoolName() + " 导入失败：" + ex.getMessage());
				}
			}
			if (failureNum > 0) {
				failureMsg.insert(0, "，失败 " + failureNum + " 条学校数据，导入信息如下：");
			}
			addMessage(redirectAttributes, "已成功导入 " + successNum + " 条学校数据" + failureMsg);
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入学校数据失败！失败信息：" + e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/house/ccmHouseSchoolrim/list?repage";
	}
}