package com.arjjs.ccm.modules.ccm.rest.web;

import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.house.entity.CcmHouseBuildentrance;
import com.arjjs.ccm.modules.ccm.house.entity.CcmHouseBuildentranceVo;
import com.arjjs.ccm.modules.ccm.house.entity.CcmHouseBuildmanage;
import com.arjjs.ccm.modules.ccm.house.service.CcmHouseBuildmanageService;
import com.arjjs.ccm.modules.ccm.org.entity.SysArea;
import com.arjjs.ccm.modules.ccm.org.service.CcmOrgAreaService;
import com.arjjs.ccm.modules.ccm.org.service.SysAreaService;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeople;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPopTenant;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPopTenantVo;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPeopleService;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPopTenantService;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.ccm.rest.service.CcmRestAreaService;
import com.arjjs.ccm.modules.sys.entity.Area;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.tool.TransGPS;
import com.arjjs.ccm.tool.geoJson.Features;
import com.arjjs.ccm.tool.geoJson.GeoJSON;
import com.arjjs.ccm.tool.geoJson.Geometry;
import com.arjjs.ccm.tool.geoJson.Properties;
import com.google.common.collect.Lists;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 楼栋接口类
 *
 * @author pengjianqiang
 * @version 2018-02-02
 */
@Controller
@RequestMapping(value = "${appPath}/rest/building")
@Api(description = "楼栋接口相关")
public class CcmRestBuilding extends BaseController {

	@Autowired
	private SysAreaService sysAreaService;
	@Autowired
	private CcmRestIncidentPolice ccmRestIncidentPolice;
	@Autowired
	private CcmOrgAreaService ccmOrgAreaService;
	@Autowired
	private CcmHouseBuildmanageService ccmHouseBuildmanageService;
	@Autowired
	private CcmPopTenantService ccmPopTenantService;
	@Autowired
	private CcmPeopleService ccmPeopleService;
	@Autowired
	private CcmRestAreaService ccmRestAreaService;




	/**
	 * @see  获取单个楼栋信息
	 * @param id  楼栋ID
	 * @return 
	 * @author pengjianqiang
	 * @version 2018-02-02
	 */
	@ResponseBody
	@RequestMapping(value="/get", method = RequestMethod.GET)
	public CcmRestResult get(String userId,HttpServletRequest req, HttpServletResponse resp, String id) throws IOException {
		logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
		logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
		logger.info("当前方法运行参数为》》》id : " + id + "  userId : " + userId);
		CcmRestResult result = new CcmRestResult();
		User sessionUser = (User) req.getSession().getAttribute("user");
		if (sessionUser== null) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		String sessionUserId = sessionUser.getId();
		if (userId== null || "".equals(userId) ||!userId.equals(sessionUserId)) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		if (id == null || "".equals(id)) {//参数id不对
			result.setCode(CcmRestType.ERROR_PARAM);
			return result;
		}
		String fileUrl = Global.getConfig("FILE_UPLOAD_URL");
		CcmHouseBuildmanage ccmHouseBuild = ccmHouseBuildmanageService.get(id);
		if(StringUtils.isNotEmpty(ccmHouseBuild.getImages())){
			ccmHouseBuild.setImages(fileUrl + ccmHouseBuild.getImages());
		}
		result.setCode(CcmRestType.OK);
		result.setResult(ccmHouseBuild);

		return result;
	}

	/**
	 * @see  查询楼栋信息
	 * @param name  小区（单位）名称
	 * @param buildname  楼栋名称
	 * @param pageNo 页码
	 * @param pageSize 分页大小
	 * @return
	 * @author fuxinshuang
	 * @version 2018-02-03
	 */
	@ResponseBody
	@RequestMapping(value="/query", method = RequestMethod.GET)
	public CcmRestResult query(String userId,CcmHouseBuildmanage build,HttpServletRequest req, HttpServletResponse resp,Integer pageNo) throws IOException {
		logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
		logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
		logger.info("当前方法运行参数为》》》CcmHouseBuildmanage : " + String.valueOf(build) + "  userId : " + userId);
		CcmRestResult result = new CcmRestResult();
		User sessionUser = (User) req.getSession().getAttribute("user");
		if (sessionUser== null) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		String sessionUserId = sessionUser.getId();
		if (userId== null || "".equals(userId) ||!userId.equals(sessionUserId)) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		build.setCheckUser(sessionUser);
		String fileUrl = Global.getConfig("FILE_UPLOAD_URL");
		Page page = new Page<CcmHouseBuildmanage>(req, resp);
		int countnum = page.getPageSize()*8;
		if(page.getPageNo()>= 6){
			countnum+=page.getPageNo()/6*page.getPageSize()*8;
		}
		page.setCount(countnum);
		page.initialize();
		build.setMinnum((page.getPageNo()-1)*page.getPageSize());
		build.setMaxnum(page.getPageSize());
		List<CcmHouseBuildmanage> list = ccmHouseBuildmanageService.findListIdBylimit(build);

		List<String> idlist = Lists.newArrayList();
		list.forEach(item->{
			idlist.add(item.getId());
		});
		if(idlist.size()>0){
			build.setListLimite(idlist);
			Page<CcmHouseBuildmanage> pagelist = ccmHouseBuildmanageService.findList_V2(page, build);
			if(pagelist.getList().size()>0){
				for (int i = 0; i < pagelist.getList().size(); i++) {
					//楼栋已采集人数
					Integer gatherNum = pagelist.getList().get(i).getGatherNum();
					if (gatherNum==null){
						gatherNum=0;
					}
					//楼栋总人数
					Integer buildPeo = pagelist.getList().get(i).getBuildPeo();
					if (buildPeo==null){
						buildPeo=0;
					}
					//未采集人数
					Integer nogather=buildPeo-gatherNum;
					if (nogather<0){
						nogather=0;
					}
					pagelist.getList().get(i).setNogather(nogather);
					pagelist.getList().get(i).setImages(fileUrl + pagelist.getList().get(i).getImages());
				}
			}
			page.setList(pagelist.getList());
		}
		page.setPageNo(pageNo);
		result.setCode(CcmRestType.OK);
		result.setResult(page.getList());
		return result;
	}


	/**
	 * @see 生成楼栋地图信息-点位图（分页模式）
	 * @param ccmHouseBuildmanage
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/queryBuildMap",method = RequestMethod.GET)
	@ApiOperation(value = "生成楼栋地图信息-点位图")
	@ApiImplicitParam(name = "userId",value = "用户ID")
	public CcmRestResult queryBuildMap(String userId,CcmHouseBuildmanage ccmHouseBuildmanage,HttpServletRequest request,HttpServletResponse response) {

		logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
		logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
		logger.info("当前方法运行参数为》》》CcmHouseBuildmanage : " + String.valueOf(ccmHouseBuildmanage) + "  userId : " + userId);

		CcmRestResult result = new CcmRestResult();
		User sessionUser = (User) request.getSession().getAttribute("user");
		if (sessionUser== null) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		String sessionUserId = sessionUser.getId();
		if (userId== null || "".equals(userId) ||!userId.equals(sessionUserId)) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		ccmHouseBuildmanage.setCheckUser(sessionUser);

		// 查询地图楼栋信息
		List<CcmHouseBuildmanage> ccmHouseBuildmanageList = new ArrayList<CcmHouseBuildmanage>();
		//可以选择父节点查询
		if(ccmHouseBuildmanage.getArea()!=null&&ccmHouseBuildmanage.getArea().getId()!=null&&!ccmHouseBuildmanage.getArea().getId().equals("")){
			SysArea sysArea = sysAreaService.get(ccmHouseBuildmanage.getArea().getId());
			Area area = new Area();
			area.setId(sysArea.getId());
			area.setParentIds(sysArea.getParentIds());
			ccmHouseBuildmanage.setUserArea(area);
			ccmHouseBuildmanage.setArea(null);
		}
		Page<CcmHouseBuildmanage> page = ccmHouseBuildmanageService.findPageNew(new Page<CcmHouseBuildmanage>(request, response), ccmHouseBuildmanage);
		ccmHouseBuildmanageList = page.getList();

		// 返回对象
		GeoJSON geoJSON = new GeoJSON();
		geoJSON.setCount(page.getCount());
		geoJSON.setPageNo(page.getPageNo());
		geoJSON.setPageSize(page.getPageSize());

		List<Features> featureList = new ArrayList<Features>();
		// 数组
		for (CcmHouseBuildmanage Buildmanage : ccmHouseBuildmanageList) {
			String fileUrl = Global.getConfig("FILE_UPLOAD_URL");
			if(StringUtils.isNotEmpty(Buildmanage.getImages())){
				Buildmanage.setImages(fileUrl + Buildmanage.getImages());
			}
			Area area = Buildmanage.getArea();
			Area area1=new Area();
			if (area.getId()!=null){
				area1 = ccmRestAreaService.get(area.getId());
			}
			// 特征属性
			Features featureDto = new Features();
			Properties properties = new Properties();
			// 1 type 默认不填
			// 2 id 添加
			featureDto.setId(Buildmanage.getId());
			// 3 properties 展示属性信息
			properties.setName(Buildmanage.getName());
			properties.setIcon(Buildmanage.getImages());
			Map<String, Object> map = new HashMap<String, Object>();
			// 创建附属信息
			// map.put("id", Buildmanage.getId());
			map.put("楼栋名称", Buildmanage.getBuildname());
			map.put("所属小区", Buildmanage.getName());
			map.put("楼栋长", Buildmanage.getBuildPname());
			map.put("楼栋长电话", Buildmanage.getTel());
			map.put("层数", Buildmanage.getPilesNum() + "");
			map.put("单元数", Buildmanage.getElemNum() + "");
			map.put("Images", Buildmanage.getImages() + "");
			if (area1!=null&&area1.getName()!=null){
				map.put("gridComAddress", area1.getName() + "");
			}else {
				map.put("gridComAddress", "" + "");
			}
			properties.addInfo(map);
			featureList.add(featureDto);
			featureDto.setProperties(properties);
			// 4 geometry 配置参数
			Geometry geometry = new Geometry();
			featureDto.setGeometry(geometry);
			// 点位信息 测试为面
			geometry.setType("Point");
			// 为中心点赋值
			if (!StringUtils.isEmpty(Buildmanage.getAreaPoint())) {
				// 获取中心点的值
				String[] centpoint = Buildmanage.getAreaPoint().split(",");
				// 图层中心的
				geoJSON.setCentpoint(centpoint);
				// 图形中心点
				properties.setCoordinateCentre(centpoint);
			}

			List<String> Coordinateslist = new ArrayList<>();
			// 当前是否为空如果为空则进行添加空数组 ，否则进行拆分添加数据
			String[] a = (StringUtils.isEmpty(Buildmanage.getAreaPoint()) ? (",") : Buildmanage.getAreaPoint()).split(",");
			// 填充数据
			if (a.length < 2) {
				Coordinateslist.add("");
				Coordinateslist.add("");
			} else {
				Coordinateslist.add(a[0]);
				Coordinateslist.add(a[1]);
			}
			// 装配点位
			geometry.setCoordinates(Coordinateslist);

		}
		geoJSON.setFeatures(featureList);
		// 如果无数据
		if (featureList.size() == 0) {
			result.setResult("");
		}else {
			result.setResult(geoJSON);
		}
		result.setCode(CcmRestType.OK);
		return result;
	}
	
	
	/**
	 * @see  保存楼栋信息
	 * @param 
	 * @return 
	 * @author fuxinshuang
	 * @version 2018-02-03
	 */
	@ResponseBody
	@RequestMapping(value="/save", method = RequestMethod.POST)
	public CcmRestResult modify(String userId,CcmHouseBuildmanage build,HttpServletRequest req, HttpServletResponse resp) throws IOException {
		logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
		logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
		logger.info("当前方法运行参数为》》》CcmHouseBuildmanage : " + String.valueOf(build) + "  userId : " + userId);
		CcmRestResult result = new CcmRestResult();
		User sessionUser = (User) req.getSession().getAttribute("user");
		if (sessionUser== null) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		String sessionUserId = sessionUser.getId();
		if (userId== null || "".equals(userId) ||!userId.equals(sessionUserId)) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
//		if (build.getId()!= null && !"".equals(build.getId())) {
//			CcmHouseBuildmanage buildDB = ccmHouseBuildmanageService.get(build.getId());
//			if (buildDB == null ) {//从数据库中没有取到对应数据
//				result.setCode(CcmRestType.ERROR_DB_NOT_EXIST);
//				return result;
//			}
//			build.setAreaPoint(buildDB.getAreaPoint());
//			build.setAreaMap(buildDB.getAreaMap());
//			build.setImage(buildDB.getImage());
//		}/*else{
//			build.setAreaPoint("");
//			build.setAreaMap("");
//			build.setImage("");
//		}*/
		if (build.getCreateBy()== null) {
			build.setCreateBy(new User(userId));
		}
		build.setUpdateBy(new User(userId));


		// 判断是否为新增
        if (StringUtils.isEmpty(build.getId())) {   //  新增
            // 坐标经纬度的转换（GCJ坐标 -> WGS-84坐标）
            if (StringUtils.isNotEmpty(build.getAreaPoint())) {
                String piont = build.getAreaPoint();
                String areaPiont = "";
                String[] pionts = piont.split(",");

                TransGPS ins = new TransGPS();
                TransGPS.Location wcj = ins.new Location();
                wcj.setLat(Double.parseDouble(pionts[1]));
                wcj.setLng(Double.parseDouble(pionts[0]));

                TransGPS.Location wgs = ins.transformFromGCJToWGS(wcj);
                areaPiont = wgs.getLng() + ","  + wgs.getLat();
                build.setAreaPoint(areaPiont);
                build.setAreaMap(areaPiont);
            }
        }else {
        	CcmHouseBuildmanage ccmHouseBuild = ccmHouseBuildmanageService.get(build.getId());
        	if(StringUtils.isNotEmpty(build.getAreaPoint())) {
        		if(build.getAreaPoint().equals(ccmHouseBuild.getAreaPoint())) {
        			build.setAreaMap(build.getAreaPoint());
        		}else {
        			String piont = build.getAreaPoint();
                    String areaPiont = "";
                    String[] pionts = piont.split(",");

                    TransGPS ins = new TransGPS();
                    TransGPS.Location wcj = ins.new Location();
                    wcj.setLat(Double.parseDouble(pionts[1]));
                    wcj.setLng(Double.parseDouble(pionts[0]));

                    TransGPS.Location wgs = ins.transformFromGCJToWGS(wcj);
                    areaPiont = wgs.getLng() + ","  + wgs.getLat();
                    build.setAreaPoint(areaPiont);
                    build.setAreaMap(areaPiont);
        		}
        	}
        }

		String file = build.getImages();
		if(StringUtils.isNotEmpty(file)) {
			if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
				build.setImages(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
			}else {
				build.setImages(file);
			}
		}
		ccmHouseBuildmanageService.save(build);
		result.setCode(CcmRestType.OK);
		result.setResult("成功");
		return result;
		
	}


	/**
	 * @see  保存楼栋信息（支持新增和编辑,数据同步用）
	 * @param 
	 * @return 
	 * @author pengjianqiang
	 * @version 2018-05-12
	 */
	@ResponseBody
	@RequestMapping(value="/saveSyn", method = RequestMethod.POST)
	public CcmRestResult saveSyn(String userId,CcmHouseBuildmanage build,HttpServletRequest req, HttpServletResponse resp) throws IOException {
		logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
		logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
		logger.info("当前方法运行参数为》》》CcmHouseBuildmanage : " + String.valueOf(build) + "  userId : " + userId);
		CcmRestResult result = new CcmRestResult();
		if (userId == null || "".equals(userId)) {
			userId = "1";
		}
		User user = new User(userId);
		build.setCreateBy(user);
		build.setUpdateBy(user);

		ccmHouseBuildmanageService.save(build);
		result.setCode(CcmRestType.OK);
		result.setResult("成功");
		return result;
		
	}

	// 根据楼栋ID获取单元列表
	@ResponseBody
	@RequestMapping(value = "getBuildentrance", method = RequestMethod.GET)
	@ApiOperation(value = "单元信息查询（buildId 不为空，查询楼栋下单元列表，tranceId 不为空，查询单元详情）")
	@ApiImplicitParams({ @ApiImplicitParam(name = "buildId", value = "楼栋 id", paramType = "query"),
			@ApiImplicitParam(name = "tranceId", value = "单元ID id", paramType = "query")})
	public CcmRestResult getBuildentrance(String buildId,String tranceId) {
		logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
		logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
		logger.info("当前方法运行参数为》》》楼栋 id : " + buildId + "  单元ID : " + tranceId);
		CcmRestResult result = new CcmRestResult();
		List<CcmHouseBuildentranceVo> buildentranceList = ccmHouseBuildmanageService.selectBuildentranceById(buildId,tranceId);
        for(CcmHouseBuildentranceVo res : buildentranceList){
            // 赋值单元下房屋数量
            List<CcmPopTenant> popTenants = ccmPopTenantService.findByTranceId(res.getId());
            if (null != popTenants && 0 != popTenants.size()) {
                res.setHouseNum(popTenants.size());
                // 赋值单元下人员数量
                int total = 0;
                for (CcmPopTenant popTenant : popTenants) {
                    List<CcmPeople> peopleList = ccmPeopleService.findByRoomId(popTenant.getId());
                    total = total + peopleList.size();
                }
                res.setResidentNum(total);
            }
        }
		result.setCode(CcmRestType.OK);
		result.setResult(buildentranceList);
		return result;
	}

	// 查询单元下房屋列表
	@ResponseBody
	@RequestMapping(value = "getPopTenant", method = RequestMethod.GET)
	@ApiOperation(value = "查询单元下房屋列表")
	@ApiImplicitParams({ @ApiImplicitParam(name = "buildId", value = "楼栋id",  paramType = "query" ,required = true),
			@ApiImplicitParam(name = "tranceId", value = "单元ID ", paramType = "query"  ,required = true)})
	public CcmRestResult getPopTenant(String buildId, String tranceId) {
		Integer doorNum = null;
		List<CcmHouseBuildentrance> trancelist = ccmHouseBuildmanageService.findBuildentrance(buildId);
		for (int i = 0; i < trancelist.size(); i++) {
			if(tranceId.equals(trancelist.get(i).getId())){
				doorNum = trancelist.get(i).getEntranceNum();
			}
		}
		logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
		logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
		logger.info("当前方法运行参数为》》》楼栋id : " + buildId + "  单元ID : " + tranceId);
		CcmRestResult result = new CcmRestResult();
		List<CcmPopTenantVo> buildentranceList = ccmHouseBuildmanageService.selectPopTenantByBuildAndDoorNum(buildId,doorNum.toString());
		for(CcmPopTenantVo res : buildentranceList){
			CcmHouseBuildmanage ccmHouseBuildmanage = ccmHouseBuildmanageService.get(res.getBuildingId());
			res.setBuildingName(ccmHouseBuildmanage!=null ? ccmHouseBuildmanage.getBuildname() : "");
		}

		result.setCode(CcmRestType.OK);
		result.setResult(buildentranceList);
		return result;
	}
	/**
	 * @see  删除楼栋信息（数据同步用）
	 * @param 
	 * @return 
	 * @author pengjianqiang
	 * @version 2018-05-17
	 */
	@ResponseBody
	@RequestMapping(value="/deleteSyn", method = RequestMethod.POST)
	public CcmRestResult deleteSyn(String userId,CcmHouseBuildmanage build,HttpServletRequest req, HttpServletResponse resp) throws IOException {
		logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
		logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
		logger.info("当前方法运行参数为》》》CcmHouseBuildmanage : " + String.valueOf(build) + "  userId : " + userId);
		CcmRestResult result = new CcmRestResult();
		ccmHouseBuildmanageService.delete(build);
		result.setCode(CcmRestType.OK);
		result.setResult("成功");
		return result;
		
	}
	
	/**
	 * @see  删除楼栋信息
	 * @param 
	 * @return 
	 * @author pengjianqiang
	 * @version 2018-05-12
	 */
	@ResponseBody
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public CcmRestResult delete(String userId,CcmHouseBuildmanage build,HttpServletRequest req, HttpServletResponse resp) throws IOException {
		logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
		logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
		logger.info("当前方法运行参数为》》》CcmHouseBuildmanage : " + String.valueOf(build) + "  userId : " + userId);
		CcmRestResult result = new CcmRestResult();
		User sessionUser = (User) req.getSession().getAttribute("user");
		if (sessionUser== null) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		String sessionUserId = sessionUser.getId();
		if (userId== null || "".equals(userId) ||!userId.equals(sessionUserId)) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		}
		if (build.getId()!= null && !"".equals(build.getId())) {
			CcmHouseBuildmanage buildDB = ccmHouseBuildmanageService.get(build.getId());
			if (buildDB == null ) {//从数据库中没有取到对应数据
				result.setCode(CcmRestType.ERROR_DB_NOT_EXIST);
				return result;
			}
		}
		ccmHouseBuildmanageService.delete(build);
		result.setCode(CcmRestType.OK);
		result.setResult("成功");
		return result;
		
	}

}