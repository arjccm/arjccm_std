package com.arjjs.ccm.modules.ccm.rest.web;

import java.io.*;
import java.net.URLDecoder;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.house.entity.CcmHouseBuildmanage;
import com.arjjs.ccm.modules.ccm.house.service.CcmHouseBuildmanageService;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeople;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPopTenant;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPeopleService;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPopTenantService;
import com.arjjs.ccm.modules.ccm.rest.entity.*;
import com.arjjs.ccm.modules.ccm.sys.entity.SysDicts;
import com.arjjs.ccm.modules.ccm.sys.service.SysDictsService;
import com.arjjs.ccm.modules.pbs.sys.utils.UserUtils;
import com.arjjs.ccm.modules.sys.dao.UserDao;
import com.arjjs.ccm.modules.sys.entity.Area;
import com.arjjs.ccm.tool.LjpTools;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.event.dao.wechat.CcmWechatEventAttachmentDao;
import com.arjjs.ccm.modules.ccm.event.dao.wechat.CcmWechatEventDao;
import com.arjjs.ccm.modules.ccm.event.entity.wechat.CcmWechatEvent;
import com.arjjs.ccm.modules.ccm.event.entity.wechat.CcmWechatEventAttachment;
import com.arjjs.ccm.modules.ccm.event.service.wechat.CcmWechatEventAttachmentService;
import com.arjjs.ccm.modules.ccm.event.service.wechat.CcmWechatEventService;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.tool.CommUtilRest;

/**
 * 楼栋接口类
 *
 * @author pengjianqiang
 * @version 2018-02-02
 */
@Controller
@RequestMapping(value = "${appPath}/rest/wechat")
public class CcmRestWechat extends BaseController {

	@Autowired
	private CcmWechatEventService ccmWechatEventService;
	@Autowired
	private CcmWechatEventDao ccmWechatEventDao;
	@Autowired
	private CcmWechatEventAttachmentService ccmWechatEventAttachmentService;
	@Autowired
	private CcmPopTenantService ccmPopTenantService;

	@Autowired
	private CcmHouseBuildmanageService ccmHouseBuildmanageService;
	@Autowired
	private UserDao userDao;
	@Autowired
	private SysDictsService sysDictsService;
	@Autowired
	private CcmPeopleService ccmPeopleService;


	/**
	 * @see 获取单个微信上报登记
	 * @param id
	 *           微信上报ID
	 * @return
	 * @author fuxinshuang
	 * @version 2018-03-15
	 */
	@ResponseBody
	@RequestMapping(value = "/getWechatEvent", method = RequestMethod.GET)
	public CcmRestResult getRequest(String userId, HttpServletRequest req, HttpServletResponse resp, String id)
			throws IOException {
		// 获取results
		CcmRestResult result = CommUtilRest.getResult(userId, req, resp, id);
		// 如果当前的 flag 为返回
		if (result.isReturnFlag()) {
			result.setCode(CcmRestType.ERROR_PARAM);
			return result;
		}
		// 当前 是否为空
		CcmWechatEvent ccmWechatEvent = ccmWechatEventService.get(id);
		result.setCode(CcmRestType.OK);
		result.setResult(ccmWechatEvent);

		return result;
	}

	/**
	 * @see 查询微信上报信息
	 * @param pageNo
	 *            页码
	 * @param pageSiz
	 *            分页大小
	 * @return
	 * @author fuxinshuang
	 * @version 2018-03-15
	 */
	@ResponseBody
	@RequestMapping(value = "/queryWechatEvent", method = RequestMethod.GET)
	public CcmRestResult queryRequest(String userId, HttpServletRequest req, HttpServletResponse resp,
									  CcmWechatEvent ccmWechatEvent) throws IOException {
		// 获取结果
		CcmRestResult result = CommUtilRest.queryResult(userId, req, resp);
		// 如果当前的 flag 为返回
		if (result.isReturnFlag()) {
			return result;
		}
		// 设置当前的 微信上报不为空
		ccmWechatEvent = (null == ccmWechatEvent) ? new CcmWechatEvent() : ccmWechatEvent;
		// 获取userId
		User userEntity = new User();
		userEntity.setId(userId);
		ccmWechatEvent.setCreateBy(userEntity);
		Page<CcmWechatEvent> page = ccmWechatEventService.findPage(new Page<CcmWechatEvent>(req, resp),
				(null == ccmWechatEvent) ? new CcmWechatEvent() : ccmWechatEvent);
		result.setCode(CcmRestType.OK);
		result.setResult(page.getList());
		// 输出结果
		return result;
	}

	/**
	 * @see 填加微信上报登记
	 *            微信上报对象
	 * @author fuxinshuang
	 * @version 2018-03-13
	 */
	@ResponseBody
	@RequestMapping(value = "/saveWechatEvent", method = RequestMethod.POST)
	public CcmRestResult saveRequest(CcmWechatEvent ccmWechatEvent, HttpServletRequest req,
									 HttpServletResponse resp) throws IOException {
		// 获取结果
		CcmRestResult result = new CcmRestResult();
		// 如果当前的 flag 为返回

		ccmWechatEvent.setCreateBy(new User("0"));
		ccmWechatEvent.setCreateDate(new Date());
		ccmWechatEvent.setReportTime(new Date());
		ccmWechatEvent.setUpdateBy(new User("0"));
		ccmWechatEvent.setUpdateDate(new Date());
		ccmWechatEvent.setStatus("01");
		ccmWechatEventDao.insert(ccmWechatEvent);
		// 返回
		result.setCode(CcmRestType.OK);
		result.setResult("成功");
		return result;
	}
	/**
	 * @see 填加微信上报附件添加
	 *            微信上报对象
	 * @author fuxinshuang
	 * @version 2018-03-13
	 */
	@ResponseBody
	@RequestMapping(value = "/saveWechatEventAtta", method = RequestMethod.POST)
	public CcmRestResult saveWechatEventAtta(CcmWechatEventAttachment ccmWechatEventAttachment, HttpServletRequest req,
											 HttpServletResponse resp) throws IOException {
		// 获取结果
		CcmRestResult result = new CcmRestResult();
		// 如果创建者为空
		ccmWechatEventAttachment.setCreateBy(new User("0"));
		ccmWechatEventAttachment.setUpdateBy(new User("0"));
		ccmWechatEventAttachmentService.save(ccmWechatEventAttachment);
		// 返回
		result.setCode(CcmRestType.OK);
		result.setResult("成功");
		return result;
	}


	@RequestMapping(value = "login")
	@ResponseBody
	public CcmRestResult login(User user,HttpServletRequest request){
		CcmRestResult result = new CcmRestResult();
		if(LjpTools.isExistBlank(user.getLoginName(),user.getPassword())){
			result.setCode(CcmRestType.ERROR_PARAM);
			return result;
		}
		User userDB = userDao.getByLoginName(user);
		if(userDB==null) {
			result.setCode(CcmRestType.ERROR_NO_USER);
			return result;
		}else if (!user.getPassword().equals(userDB.getPassword())) {
			result.setCode(CcmRestType.ERROR_NO_USER);
			return result;
		}
		if (request.getSession().getAttribute("user")==null) {
			request.getSession().setAttribute("user",userDB);
		}
		result.setCode(CcmRestType.OK);

		return result;

	}


	/**
	 * 获取楼栋list
	 * @param ccmHouseBuildmanage
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/queryBuilding")
	public CcmRestResult queryBuilding(CcmHouseBuildmanage ccmHouseBuildmanage,Integer pageNo,Integer pageSize,HttpServletRequest request){
		CcmRestResult result = new CcmRestResult();

		if(request.getSession().getAttribute("user")==null){
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}

		if(LjpTools.isExistNullOrZero(pageNo,pageSize)){
			result.setCode(CcmRestType.ERROR_PARAM);
			return result;
		}
		ccmHouseBuildmanage.setFindAll(true);
		Page<CcmHouseBuildmanage> page = ccmHouseBuildmanageService.findPage(new Page<>(pageNo, pageSize), ccmHouseBuildmanage);

		result.setResult(page);
		result.setCode(CcmRestType.OK);

		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/queryTenant")
	public CcmRestResult queryTenant(String buildingId,String doorNum,Integer pageNo,Integer pageSize,HttpServletRequest request) {
		CcmRestResult result = new CcmRestResult();
		if(request.getSession().getAttribute("user")==null){
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		if (LjpTools.isExistNullOrZero(pageNo, pageSize)|| StringUtils.isBlank(buildingId)) {
			result.setCode(CcmRestType.ERROR_PARAM);
			return result;
		}
		CcmPopTenant ccmPopTenant = new CcmPopTenant();
		ccmPopTenant.setBuildingId(new CcmHouseBuildmanage(buildingId));
		ccmPopTenant.setDoorNum(doorNum);
		Page<CcmPopTenant> page = ccmPopTenantService.findPage(new Page<>(pageNo, pageSize),ccmPopTenant);

		result.setResult(page);
		result.setCode(CcmRestType.OK);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/saveTenant")
	public CcmRestResult saveTenant(CcmPopTenant ccmPopTenant,String areaId,HttpServletRequest request) {
		CcmRestResult result = new CcmRestResult();
		User user = (User) request.getSession().getAttribute("user");
		if(user ==null){
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}

		if(StringUtils.isNotEmpty(areaId)){
			Area area = new Area();
			area.setId(areaId);
			ccmPopTenant.setArea(area);
		}

		if(StringUtils.isNotEmpty(ccmPopTenant.getBuildingId().getId())){
			CcmHouseBuildmanage ccmHouseBuildmanage = ccmHouseBuildmanageService.get(ccmPopTenant.getBuildingId().getId());
			ccmPopTenant.setHousePlace(ccmHouseBuildmanage.getResidencedetail());
		}

		ccmPopTenant.setCreateBy(user);
		ccmPopTenant.setUpdateBy(user);
		ccmPopTenantService.save(ccmPopTenant);
		result.setResult(ccmPopTenant);
		result.setCode(CcmRestType.OK);
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "/delTenant")
	public CcmRestResult delTenant(CcmPopTenant ccmPopTenant,HttpServletRequest request) {
		CcmRestResult result = new CcmRestResult();
		if(request.getSession().getAttribute("user")==null){
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		if(StringUtils.isBlank(ccmPopTenant.getId())){
			result.setCode(CcmRestType.ERROR_PARAM);
			return result;
		}

		ccmPopTenantService.delete(ccmPopTenant);
		result.setResult(ccmPopTenant);
		result.setCode(CcmRestType.OK);
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "/getDict")
	public CcmRestResult getDict(String type,HttpServletRequest request) {
		CcmRestResult result = new CcmRestResult();
		if(request.getSession().getAttribute("user")==null){
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		if(StringUtils.isBlank(type)){
			result.setCode(CcmRestType.ERROR_PARAM);
			return result;
		}

		List<SysDicts> allListByType = sysDictsService.findAllListByType(type);
		result.setResult(allListByType);
		result.setCode(CcmRestType.OK);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/queryTenantByIdCard")
	public Map<String, Object> queryTenantByIdCard(String ident,Integer pageNo,Integer pageSize,HttpServletRequest request) {
		if(request.getSession().getAttribute("user")==null){
			return null;
		}
		if (LjpTools.isExistNullOrZero(pageNo, pageSize)|| StringUtils.isBlank(ident)) {
			return null;
		}
		CcmPopTenant ccmPopTenant = new CcmPopTenant();
		ccmPopTenant.setIdenNum(ident);
		Page<CcmPopTenant> page = ccmPopTenantService.findPage(new Page<>(pageNo, pageSize),ccmPopTenant);
		List<RentalHousingVO> res = new ArrayList<>();
		List<CcmPopTenant> list = page.getList();
		for (CcmPopTenant ccmPopTenant1 : list) {
			RentalHousingVO rentalHousingVO = new RentalHousingVO();
			rentalHousingVO.setId(ccmPopTenant1.getId());
			rentalHousingVO.setAddressDetail(ccmPopTenant1.getHousePlace());
			UserVO userVO = new UserVO();
			userVO.setRealName(ccmPopTenant1.getHouseName());
			userVO.setCardId(ccmPopTenant1.getIdenNum());
			userVO.setTelephone(ccmPopTenant1.getHouseTl());
			rentalHousingVO.setUserVO(userVO);
			res.add(rentalHousingVO);
		}
		Map<String, Object> map = Maps.newHashMapWithExpectedSize(4);
		map.put("count", page.getCount());
		map.put("rentalHousings", res);
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/queryTenantById")
	public RentalHousingVO queryTenantById(String id,HttpServletRequest request) {
		if(request.getSession().getAttribute("user")==null){
			return null;
		}
		if (StringUtils.isBlank(id)) {
			return null;
		}
		CcmPopTenant ccmPopTenant = ccmPopTenantService.get(id);
		CcmPeople ccmPeople = new CcmPeople();
		ccmPeople.setRoomId(ccmPopTenant);
		List<CcmPeople> list = ccmPeopleService.getHousePopList(ccmPeople);
		RentalHousingVO rentalHousingVO = new RentalHousingVO();
		rentalHousingVO.setId(ccmPopTenant.getId());
		rentalHousingVO.setAddressDetail(ccmPopTenant.getHousePlace());
		UserVO userVO = new UserVO();
		userVO.setRealName(ccmPopTenant.getHouseName());
		userVO.setCardId(ccmPopTenant.getIdenNum());
		userVO.setTelephone(ccmPopTenant.getHouseTl());
		rentalHousingVO.setUserVO(userVO);
		List<TenantVO> res = new ArrayList<>();
		for (CcmPeople people:list) {
			TenantVO tenantVO = new TenantVO();
			tenantVO.setId(people.getId());
			tenantVO.setRentalHouseId(ccmPopTenant.getId());
			tenantVO.setTenantIdCard(people.getIdent());
			tenantVO.setTenantName(people.getName());
			tenantVO.setTenantPhone(people.getTelephone());
			res.add(tenantVO);
		}
		rentalHousingVO.setTenants(res);
		return rentalHousingVO;
	}

	@ResponseBody
	@RequestMapping(value = "/saveMyTenantPop")
	public CcmRestResult saveMyTenantPop(@RequestBody RentalHousingDTO rentalHousingDTO, HttpServletRequest request) throws UnsupportedEncodingException {
		CcmRestResult result = new CcmRestResult();
//		if(request.getSession().getAttribute("user")==null){
//			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
//			return result;
//		}
		String address = URLDecoder.decode(rentalHousingDTO.getAddressDetail(),"UTF-8");
		rentalHousingDTO.setAddressDetail(address);
		CcmPopTenant ccmPopTenant = null;
		if(StringUtils.isNotEmpty(rentalHousingDTO.getId())){
			ccmPopTenant = ccmPopTenantService.get(rentalHousingDTO.getId());
			ccmPopTenant.setHousePlace(rentalHousingDTO.getAddressDetail());
			ccmPopTenantService.save(ccmPopTenant);
		}else{
			ccmPopTenant = new CcmPopTenant();
			ccmPopTenant.setHousePlace(rentalHousingDTO.getAddressDetail());
			ccmPopTenant.setHouseType("02");
			ccmPopTenant.setHouseName(rentalHousingDTO.getUserVO().getRealName());
			ccmPopTenant.setIdenNum(rentalHousingDTO.getUserVO().getCardId());
			ccmPopTenant.setHouseTl(rentalHousingDTO.getUserVO().getTelephone());
			ccmPopTenantService.save(ccmPopTenant);
		}
		for (TenantDTO tenant : rentalHousingDTO.getTenantDTOList()) {
			if(StringUtils.isNotEmpty(tenant.getId())){
				CcmPeople people = ccmPeopleService.get(tenant.getId());
				people.setRoomId(ccmPopTenant);
				people.setName(tenant.getTenantName());
				people.setTelephone(tenant.getTenantPhone());
				people.setIdent(tenant.getTenantIdCard());
				ccmPeopleService.save(people);
			}else{
				CcmPeople people = new CcmPeople();
				people.setIdent(tenant.getTenantIdCard());
				List<CcmPeople> list = ccmPeopleService.findList(people);
				if(list.size()==0){
					people.setRoomId(ccmPopTenant);
					people.setName(tenant.getTenantName());
					people.setTelephone(tenant.getTenantPhone());
					people.setAreaGridId(ccmPopTenant.getArea());
					people.setAreaComId(ccmPopTenant.getArea());
					User user = UserUtils.get("1");
					people.setCreateBy(user);
					people.setCreateDate(new Date());
					people.setUpdateBy(user);
					people.setUpdateDate(new Date());
					people.setDelFlag("0");
					ccmPeopleService.save(people);
				}else{
					CcmPeople ccmPeople = ccmPeopleService.get(list.get(0).getId());
					ccmPeople.setRoomId(ccmPopTenant);
					ccmPeople.setName(tenant.getTenantName());
					ccmPeople.setTelephone(tenant.getTenantPhone());
					ccmPeopleService.save(ccmPeople);
				}
			}
		}
		result.setResult("保存成功");
		result.setCode(CcmRestType.OK);
		return result;
	}

	/**
	 * @see 填加微信上报附件添加
	 *            微信上报对象
	 * @author fuxinshuang
	 * @version 2018-03-13
	 */
	/*@ResponseBody
	@RequestMapping(value = "/saveWechatEventAtta", method = RequestMethod.POST)
	public CcmRestResult saveWechatEventAtta(CcmWechatEventAttachment ccmWechatEventAttachment, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		CcmRestResult result = new CcmRestResult();
	//===================获取附件===========

		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request
				.getSession().getServletContext());
//		String realPath = request.getSession().getServletContext().getRealPath("/upload") + "/";
		long fileSize = 0L;
		CcmEntityFileUpload retVo = null;

		if (multipartResolver.isMultipart(request)) {
			// 转换成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 取得request中的所有文件名
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// 取得上传文件
				MultipartFile file = multiRequest.getFile(iter.next());
				if (file != null) {
					// 取得当前上传文件的文件名称
					String myFileName = file.getOriginalFilename();
					InputStream inputStream = file.getInputStream();
					fileSize=file.getSize();
					// 客户端提交的参数名
//					String clientFileName = file.getName();
					// 如果名称不为“”,说明该文件存在，否则说明该文件不存在
					if (myFileName.trim() != "") {
						System.out.println("上传文件名=>>" + myFileName);
						// 重命名上传后的文件类型
						String ext = myFileName.substring(myFileName.lastIndexOf(".") + 1,
								myFileName.length());
						// 重命名上传后的文件名
						String fileName = UUID.randomUUID().toString().replace("-", "_") + "." + ext;
						// 定义上传路径

						CcmEntityProgress progress = new CcmEntityProgress();
				        if (request.getParameter("progressId") != null && !"".equals(request.getParameter("progressId"))) {
				        	progress.setUuid(request.getParameter("progressId"));
				        } else {
				        	progress.setUuid("");
				        }
				        progress.setTotalBytes(fileSize);
						String path = Global.getConfig("FILE_UPLOAD_PATH");//文件上传存储路径
						int fileUploadR = uploadFile(inputStream, path, fileName, progress);
				        if (fileUploadR != 0) {
				            result.setCode(6);
				            return result;
				        }
				        String fileUrl = Global.getConfig("FILE_UPLOAD_URL");//文件上传存储路径
				        String pathr = path.substring(path.indexOf(":")+2);
						retVo = new CcmEntityFileUpload();
				        retVo.setData(UUID.randomUUID().toString());
				        retVo.setName(pathr.replace("\\", "/") + fileName.replace("\\", "/"));	//数据库存储路径
				        retVo.setSrc(fileUrl+pathr.replace("\\", "/") + fileName.replace("\\", "/"));	//全路径
				        retVo.setType(ext);	//文件类型
				        retVo.setFileName(myFileName);	//上传文件名
					}
				}
			}
		}
		//===================获取附件结束===========
		//拿到附件路径 设置为path
		// retVo.getName();
//		ccmWechatEventAttachment.设置path为附件获取的图片路径 retVo.getName()
		System.out.println("地址-------------"+retVo.getName());
		ccmWechatEventAttachment.setPath(retVo.getName());
		ccmWechatEventAttachment.setFileType(retVo.getType());
		ccmWechatEventAttachment.setFileName(retVo.getFileName());
		// 如果创建者为空
		ccmWechatEventAttachment.setCreateBy(new User("0"));
		ccmWechatEventAttachment.setUpdateBy(new User("0"));
		System.out.println("存储对象-------------"+ccmWechatEventAttachment);
		ccmWechatEventAttachmentService.save(ccmWechatEventAttachment);
		// 返回
		result.setCode(CcmRestType.OK);
		result.setResult("成功");
		return result;
	}*/


	/**
	 * 上传文件
	 * @param inputStream  文件流数据
	 * @param path         保存路径
	 * @param fileName     文件名称
	 * @param progress     上传进度
	 * @return
	 * @author pengjianqiang
	 * @version 2018-02-27
	 */
	/*public int uploadFile(InputStream inputStream, String path, String fileName, CcmEntityProgress progress) {
		int flag = -1;
		FileOutputStream fileOut = null;
		BufferedInputStream bf = null;
		try {
		    fileName = fileName.replace("\\", "/");
		    fileOut = new FileOutputStream(path + fileName, false);
			bf = new BufferedInputStream(inputStream);
			byte[] bt = new byte[8192];
			int n = bf.read(bt);
			long readUpload = 0;

			while (n != -1) {
				if (!"".equals(progress.getUuid())) { //有progressid，则进行进度处理
					readUpload+=8192;
					progress.setUploadedBytes(readUpload);
					CcmRestFile.map.put(progress.getUuid(),progress);
//					System.out.println("MAP:"+this.map.get(progress.getUuid()).toString());
				}

				fileOut.write(bt, 0, n);
				fileOut.flush();
				n = bf.read(bt);
			}

			flag = 0;
//			log.debug("文件传输结束...");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != fileOut)
					fileOut.close();
				if (null != bf)
					inputStream.close();
				bf.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return flag;
	}*/
}