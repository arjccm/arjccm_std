/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.house.web;

import com.arjjs.ccm.common.beanvalidator.BeanValidators;
import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.utils.DateUtils;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.common.utils.excel.ImportExcel;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.event.service.CcmEventCasedealService;
import com.arjjs.ccm.modules.ccm.event.service.CcmEventIncidentService;
import com.arjjs.ccm.modules.ccm.house.entity.CcmHouseAids;
import com.arjjs.ccm.modules.ccm.house.entity.CcmHouseSetting;
import com.arjjs.ccm.modules.ccm.house.service.CcmHouseAidsService;
import com.arjjs.ccm.modules.ccm.log.entity.CcmLogTail;
import com.arjjs.ccm.modules.ccm.log.service.CcmLogTailService;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeople;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPeopleService;
import com.arjjs.ccm.modules.ccm.sys.service.SysConfigService;
import com.arjjs.ccm.modules.sys.entity.Area;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.modules.sys.utils.UserUtils;
import com.arjjs.ccm.tool.CommUtil;
import com.arjjs.ccm.tool.EntityTools;
import com.arjjs.ccm.tool.ExportExcel;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * 艾滋病患者Controller
 *
 * @author arj
 * @version 2018-01-05
 */
@Controller
@RequestMapping(value = "${adminPath}/house/ccmHouseAids")
public class CcmHouseAidsController extends BaseController {

	@Lazy
	@Autowired
	private CcmHouseAidsService ccmHouseAidsService =new CcmHouseAidsService();
	@Autowired
	private CcmPeopleService ccmPeopleService;
	@Autowired
	private CcmLogTailService ccmLogTailService;
	@Autowired
	private CcmEventIncidentService ccmEventIncidentService;
	@Autowired
	private CcmEventCasedealService ccmEventCasedealService;
	@Autowired
	private SysConfigService sysConfigService;

	@ModelAttribute
	public CcmHouseAids get(@RequestParam(value = "id", required = false) String id,
							@RequestParam(value = "peopleId", required = false) String peopleId) {
		CcmHouseAids entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = ccmHouseAidsService.get(id);
		} else if (StringUtils.isNotBlank(peopleId)) {
			entity = ccmHouseAidsService.getPeopleALL(peopleId);
		}
		if (entity == null) {
			entity = new CcmHouseAids();
			// 如果 peopleId 不为空 则 添加该ID
			if (StringUtils.isNotBlank(peopleId)) {
				entity.setPeopleId(peopleId);
			}
		}

		return entity;
	}

	@RequiresPermissions("house:ccmHouseAids:view")
	@RequestMapping(value = { "list", "" })
	public String list(CcmHouseAids ccmHouseAids, HttpServletRequest request, HttpServletResponse response,
					   Model model,@Param("tableType")String tableType) {
//		Page<CcmHouseAids> page = ccmHouseAidsService.findPage(new Page<CcmHouseAids>(request, response), ccmHouseAids);
//		model.addAttribute("page", page);
//		return "ccm/house/ccmHouseAidsList";


		Page<CcmHouseAids> page = new Page();
		String permissionKey = request.getParameter("permissionKey");
		User user = UserUtils.getUser();
		if (user != null && "1".equals(user.getHasPermission())) {//有涉密权限
			page = ccmHouseAidsService.findPage(new Page<CcmHouseAids>(request, response), ccmHouseAids);
		} else if (user != null && "0".equals(user.getHasPermission())) {//无涉密权限
			if (user.getPermissionKey() != null && user.getPermissionKey().equals(permissionKey)) {
				page = ccmHouseAidsService.findPage(new Page<CcmHouseAids>(request, response), ccmHouseAids);
			} else {
				model.addAttribute("message", "涉密权限不正确！");
			}
		}
		model.addAttribute("permissionKey", permissionKey);
		if(StringUtils.isBlank(tableType)) {
			model.addAttribute("page", page);
			return "ccm/house/ccmHouseAidsList";
		}else {
			String isShow = "NO";
			CcmHouseSetting setting = sysConfigService.getTimeInterval("ccmHouseAids");
			if(StringUtils.isNotEmpty(setting.getTimeInterval()) && "1".equals(setting.getSendInfo())){
				isShow = "YES";
				Integer num = Integer.parseInt(setting.getTimeInterval());
				if(page.getList() != null && page.getList().size()>0) {
					for (int i = 0; i < page.getList().size(); i++) {
						CcmHouseAids temp = page.getList().get(i);
						if (temp.getIntervalDate() != null) {
							page.getList().get(i).setNextvalDate(DateUtils.addDays(temp.getIntervalDate(), num));
						} else {
							page.getList().get(i).setIntervalDate(temp.getUpdateDate());
							page.getList().get(i).setNextvalDate(DateUtils.addDays(temp.getUpdateDate(), num));
						}
					}
				}
			}
			model.addAttribute("isShow", isShow);
			model.addAttribute("page", page);
			return "ccm/house/emphasis/ccmHouseAidsList";
		}
	}

	@RequiresPermissions("house:ccmHouseAids:view")
	@RequestMapping(value = "form")
	public String form(CcmHouseAids ccmHouseAids, Model model) {
		// 创建 查询对象 建立查询条件
		CcmLogTail ccmLogTailDto = new CcmLogTail();
		ccmLogTailDto.setRelevanceId(ccmHouseAids.getId());
		ccmLogTailDto.setRelevanceTable("ccm_house_aids");
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
		model.addAttribute("ccmHouseAids", ccmHouseAids);
		return "ccm/house/ccmHouseAidsForm";
	}

	@RequiresPermissions("house:ccmHouseAids:edit")
	@RequestMapping(value = "save")
	public void save(HttpServletRequest request, HttpServletResponse response, CcmHouseAids ccmHouseAids, Model model, RedirectAttributes redirectAttributes) throws IOException {
		if (!beanValidator(model, ccmHouseAids)) {
//			return form(ccmHouseAids, model);
		}
		CcmPeople ccmPop = ccmPeopleService.get(ccmHouseAids.getPeopleId());
		ccmHouseAidsService.save(ccmHouseAids,ccmPop);
		if(ccmPop!=null){
			ccmPop.setIsAids(1);
			ccmPop.setFocuPers(1);
			ccmPeopleService.save(ccmPop);
		}
		addMessage(redirectAttributes, "保存艾滋病患者成功");
//		return "redirect:" + Global.getAdminPath() + "/house/ccmHouseAids/?repage";

		PrintWriter out = response.getWriter();
		CommUtil.openWinExpDiv(out, "保存艾滋病患者成功");
		ccmPop.setMqTitle("新增重点人员(艾滋病患者)");
	}

	@RequiresPermissions("house:ccmHouseAids:edit")
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request, CcmHouseAids ccmHouseAids, RedirectAttributes redirectAttributes) {
		ccmHouseAidsService.delete(ccmHouseAids);
		CcmPeople ccmPop = ccmPeopleService.get(ccmHouseAids.getPeopleId());
		String permissionKey = request.getParameter("permissionKey");
		if(ccmPop!=null){
			ccmPop.setIsAids(0);
			ccmPeopleService.save(ccmPop);
		}
		addMessage(redirectAttributes, "删除艾滋病患者成功");
		return "redirect:" + Global.getAdminPath() + "/house/ccmHouseAids/?repage&permissionKey=" + permissionKey;
	}

	@RequiresPermissions("house:ccmHouseAids:edit")
	@RequestMapping(value = "savePop")
	public String savePop(CcmHouseAids ccmHouseAids, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, ccmHouseAids)) {
			return form(ccmHouseAids, model);
		}
		ccmHouseAidsService.save(ccmHouseAids);
		// 更新 当前人 是 艾滋病患者
		CcmPeople ccmPop = ccmPeopleService.get(ccmHouseAids.getPeopleId());
		if(ccmPop!=null){
			ccmPop.setIsAids(1);
			ccmPop.setFocuPers(1);
			ccmPeopleService.save(ccmPop);
		}

		addMessage(redirectAttributes, "保存艾滋病患者成功");

		return "redirect:" + Global.getAdminPath() + "/pop/ccmPeople/?repage";
	}

	@RequiresPermissions("house:ccmHouseAids:view")
	@RequestMapping(value = "specialform")
	public String specialform(CcmPeople ccmPeople, Model model) {
		model.addAttribute("ccmPeople", ccmPeople);
		CcmHouseAids aids = ccmHouseAidsService.getPeopleALL(ccmPeople.getId());
		if (aids == null) {
			aids = new CcmHouseAids();
		}
		model.addAttribute("ccmHouseAids", aids);
		return "/ccm/house/pop/ccmHousePoPAidsForm";
	}


	/**
	 * 导出艾滋病患者数据
	 *
	 * @param user
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("house:ccmHouseAids:view")
	@RequestMapping(value = "export", method = RequestMethod.POST)
	public String exportFile(CcmHouseAids ccmHouseAids, HttpServletRequest request,
							 HttpServletResponse response, RedirectAttributes redirectAttributes) {
		String [] strArr={"姓名","联系方式","人口类型","现住门（楼）详址","公民身份号码","感染途径","关注程度","帮扶人姓名","收治情况","关注类型","帮扶人联系方式","是否有违法犯罪史","所属网格"};
		try {
			String fileName = "AidsPeople" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";

			List<CcmHouseAids> list = new ArrayList<CcmHouseAids>();
			String permissionKey = request.getParameter("permissionKey");
			User user = UserUtils.getUser();
			if (user != null && "1".equals(user.getHasPermission())) {//有涉密权限
				list = ccmHouseAidsService.findList(ccmHouseAids);
			} else if (user != null && "0".equals(user.getHasPermission())) {//无涉密权限
				if (user.getPermissionKey() != null && user.getPermissionKey().equals(permissionKey)) {
					list = ccmHouseAidsService.findList(ccmHouseAids);
				}
			}

//			List<CcmHouseAids> list = ccmHouseAidsService.findList(ccmHouseAids);
			new ExportExcel("艾滋病患者数据", CcmHouseAids.class,strArr).setDataList(list).write(response, fileName).dispose();
			return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出艾滋病患者失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + adminPath + "/house/ccmHouseAids/?repage";
	}

	/**
	 * 导入艾滋病患者数据
	 *
	 * @param file
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("house:ccmHouseAids:view")
	@RequestMapping(value = "import", method = RequestMethod.POST)
	public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		if (Global.isDemoMode()) {
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:" + adminPath + "/house/ccmHouseAids/?repage";
		}
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<CcmHouseAids> list = ei.getDataList(CcmHouseAids.class);
			//格式化日期
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			//将电话号获取异常的转为正常电话号（异常包含E10和小数点）
			DecimalFormat df = new DecimalFormat("#");
			for (CcmHouseAids HouseAids : list) {
				try {

					if(EntityTools.isEmpty(HouseAids)){
						continue;
					}

					if( StringUtils.isBlank(HouseAids.getInfeRoute()) ||
							StringUtils.isBlank(HouseAids.getAtteType()) ||
							StringUtils.isBlank(HouseAids.getHelpName()) ||
							StringUtils.isBlank(HouseAids.getTreaCase()) ||
							StringUtils.isBlank(HouseAids.getAttention()) ||
							StringUtils.isBlank(HouseAids.getHelpTel()) ||
							HouseAids.getCrimPast()==null
					){
						StringBuilder str = new StringBuilder();
						str.append("(");
						if(HouseAids.getCrimPast()==null) {
							str.append("是否有违法犯罪史信息错误;");
						}
						if(StringUtils.isBlank(HouseAids.getInfeRoute())) {
							str.append("感染途径信息错误;");
						}
						if(StringUtils.isBlank(HouseAids.getAtteType())) {
							str.append("关注程度信息错误;");
						}
						if(StringUtils.isBlank(HouseAids.getHelpName())) {
							str.append("帮扶人姓名信息错误;");
						}
						if(StringUtils.isBlank(HouseAids.getTreaCase())) {
							str.append("收治情况信息错误;");
						}
						if(StringUtils.isBlank(HouseAids.getAttention())) {
							str.append("关注类型信息错误;");
						}
						if(StringUtils.isBlank(HouseAids.getHelpTel())) {
							str.append("帮扶人联系方式信息错误;");
						}
						str.append(")");
						failureMsg.append("<br/>艾滋病患者 " + HouseAids.getName() + " 导入失败：必填项为空。"+str.toString());
						continue;
					}

					// 如果当前用户的身份未填写或者为空或者身份证号码位数不够18位则应该进行 剔除
					if (StringUtils.isBlank(HouseAids.getIdent()) || HouseAids.getIdent().length() != 18) {
						failureMsg.append("<br/>实有人口名" + HouseAids.getName() + " 导入失败：" + "身份证信息错误。");
						HouseAids.setName(HouseAids.getName() + "，失败原因：身份证信息错误");
						failureNum++;
						continue;
					}

					CcmPeople ccmPeople=new CcmPeople();
					ccmPeople.setIdent(HouseAids.getIdent());
					List<CcmPeople> list1 = ccmPeopleService.findList(ccmPeople);
					CcmHouseAids houseAidsFind;

					if(list1.isEmpty()){
						ccmPeople.setIdent(HouseAids.getIdent());
						ccmPeople.setName(HouseAids.getName());
						ccmPeople.setType(HouseAids.getType());
						ccmPeople.setCensu(HouseAids.getCensu());
						if(StringUtils.isEmpty(HouseAids.getSex())){
							String sCardNum = HouseAids.getIdent().substring(16, 17);
							if (Integer.parseInt(sCardNum) % 2 != 0) {
								HouseAids.setSex("0");
							} else {
								HouseAids.setSex("1");
							}
						}else{
							ccmPeople.setSex(HouseAids.getSex());
						}
						if(StringUtils.isNotEmpty(HouseAids.getTelephone())){
							//将导入时电话获取包含“.”或“E10”，的转成正确的电话格式
							if(HouseAids.getTelephone().contains(".") || HouseAids.getTelephone().contains("E")) {
								double bd = Double.valueOf(HouseAids.getTelephone());
								String tel = df.format(bd);
								ccmPeople.setTelephone(tel);
							}
						}
						ccmPeople.setDomiciledetail(HouseAids.getDomiciledetail());
						ccmPeople.setResidencedetail(HouseAids.getResidencedetail());
						ccmPeople.setAreaGridId(HouseAids.getAreaGridId());
						Calendar calendar = Calendar.getInstance();
						calendar.setTime(new Date());
						String year = HouseAids.getIdent().substring(6, 10);
						String month = HouseAids.getIdent().substring(10, 12);
						String day = HouseAids.getIdent().substring(12, 14);
						calendar.set(Calendar.YEAR,Integer.parseInt(year));
						calendar.set(Calendar.MONTH,Integer.parseInt(month));
						calendar.set(Calendar.DAY_OF_MONTH,Integer.parseInt(day));
						calendar.set(Calendar.HOUR_OF_DAY,0);
						calendar.set(Calendar.MINUTE,0);
						calendar.set(Calendar.SECOND,0);
						ccmPeople.setBirthday(calendar.getTime());
						Area area = new Area();
						area.setId(HouseAids.getAreaGridId().getParentId());
						ccmPeople.setAreaComId(area);
						ccmPeopleService.save(ccmPeople);
						list1.add(ccmPeople);
					}

					ccmPeople.setId(list1.get(0).getId());
					ccmPeople.setUpdateBy(UserUtils.getUser());
					ccmPeople.setUpdateDate(new Date());
					ccmPeople.setIsAids(1);;
					ccmPeopleService.updatePeople(ccmPeople);
					houseAidsFind=ccmHouseAidsService.getPeopleALL(list1.get(0).getId());
					BeanValidators.validateWithException(validator, HouseAids);
					if(houseAidsFind == null){
						HouseAids.setPeopleId(list1.get(0).getId());
						ccmHouseAidsService.save(HouseAids);
						successNum++;
					}else{
						failureMsg.append("<br/>艾滋病患者 " + HouseAids.getName() + " 导入失败：记录已存在");
					}
				} catch (ConstraintViolationException ex) {
					failureMsg.append("<br/>艾滋病患者 " + HouseAids.getName() + " 导入失败：");
					List<String> messageList = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
					for (String message : messageList) {
						failureMsg.append(message + "; ");
						failureNum++;
					}
				} catch (Exception ex) {
					failureMsg.append("<br/>登录名 " + HouseAids.getName() + " 导入失败：" + ex.getMessage());
				}
			}
			if (failureNum > 0) {
				failureMsg.insert(0, "，失败 " + failureNum + " 条艾滋病患者，导入信息如下：");
			}
			addMessage(redirectAttributes, "已成功导入 " + successNum + " 条艾滋病患者" + failureMsg);
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入艾滋病患者失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + adminPath + "/house/ccmHouseAids/?repage";
	}


}