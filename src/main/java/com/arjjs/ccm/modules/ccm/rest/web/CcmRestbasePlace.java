/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.rest.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.place.live.dao.CcmPlaceLiveDao;
import com.arjjs.ccm.modules.ccm.place.live.entity.CcmPlaceLive;
import com.arjjs.ccm.modules.ccm.place.live.service.CcmPlaceLiveService;
import com.arjjs.ccm.modules.ccm.place.base.dao.CcmBasePlaceDao;
import com.arjjs.ccm.modules.ccm.place.base.entity.CcmBasePlace;
import com.arjjs.ccm.modules.ccm.place.base.service.CcmBasePlaceService;
import com.arjjs.ccm.modules.ccm.place.casino.dao.CcmPlaceCasinoDao;
import com.arjjs.ccm.modules.ccm.place.casino.entity.CcmPlaceCasino;
import com.arjjs.ccm.modules.ccm.place.casino.service.CcmPlaceCasinoService;
import com.arjjs.ccm.modules.ccm.place.catering.dao.CcmPlaceCateringDao;
import com.arjjs.ccm.modules.ccm.place.catering.entity.CcmPlaceCatering;
import com.arjjs.ccm.modules.ccm.place.catering.service.CcmPlaceCateringService;
import com.arjjs.ccm.modules.ccm.place.chemical.dao.CcmPlaceChemicalDao;
import com.arjjs.ccm.modules.ccm.place.chemical.entity.CcmPlaceChemical;
import com.arjjs.ccm.modules.ccm.place.chemical.service.CcmPlaceChemicalService;
import com.arjjs.ccm.modules.ccm.place.education.dao.CcmPlaceEducationDao;
import com.arjjs.ccm.modules.ccm.place.education.entity.CcmPlaceEducation;
import com.arjjs.ccm.modules.ccm.place.education.service.CcmPlaceEducationService;
import com.arjjs.ccm.modules.ccm.place.financial.dao.CcmPlaceFinancialDao;
import com.arjjs.ccm.modules.ccm.place.financial.entity.CcmPlaceFinancial;
import com.arjjs.ccm.modules.ccm.place.financial.service.CcmPlaceFinancialService;
import com.arjjs.ccm.modules.ccm.place.hospital.dao.CcmPlaceHospitalDao;
import com.arjjs.ccm.modules.ccm.place.hospital.entity.CcmPlaceHospital;
import com.arjjs.ccm.modules.ccm.place.hospital.service.CcmPlaceHospitalService;
import com.arjjs.ccm.modules.ccm.place.hotel.dao.CcmPlaceHotelDao;
import com.arjjs.ccm.modules.ccm.place.hotel.entity.CcmPlaceHotel;
import com.arjjs.ccm.modules.ccm.place.hotel.service.CcmPlaceHotelService;
import com.arjjs.ccm.modules.ccm.place.religion.dao.CcmPlaceReligionDao;
import com.arjjs.ccm.modules.ccm.place.religion.entity.CcmPlaceReligion;
import com.arjjs.ccm.modules.ccm.place.religion.service.CcmPlaceReligionService;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.ccm.place.scenic.dao.CcmPlaceScenicDao;
import com.arjjs.ccm.modules.ccm.place.scenic.entity.CcmPlaceScenic;
import com.arjjs.ccm.modules.ccm.place.scenic.service.CcmPlaceScenicService;
import com.arjjs.ccm.modules.ccm.place.traffic.dao.CcmPlaceTrafficDao;
import com.arjjs.ccm.modules.ccm.place.traffic.entity.CcmPlaceTraffic;
import com.arjjs.ccm.modules.ccm.place.traffic.service.CcmPlaceTrafficService;
import com.arjjs.ccm.modules.sys.entity.Area;
import com.arjjs.ccm.modules.sys.entity.User;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * 场所管理接口类
 *
 * @author lgh
 * @version 2019-04-23
 */
@Controller
@RequestMapping(value = "${appPath}/rest/basePlace")
public class CcmRestbasePlace extends BaseController {



	@Autowired
	private CcmBasePlaceService ccmBasePlaceService;
	@Autowired
	private CcmBasePlaceDao ccmBasePlaceDao;
	@Autowired
	private CcmPlaceLiveService ccmPlaceLiveService;
	@Autowired
	private CcmPlaceLiveDao ccmPlaceLiveDao;
	@Autowired
	private CcmPlaceCasinoService ccmPlaceCasinoService;
	@Autowired
	private CcmPlaceCasinoDao ccmPlaceCasinoDao;
	@Autowired
	private CcmPlaceEducationService ccmPlaceEducationService;
	@Autowired
	private CcmPlaceEducationDao ccmPlaceEducationDao;
	@Autowired
	private CcmPlaceHospitalService ccmPlaceHospitalService;
	@Autowired
	private CcmPlaceHospitalDao ccmPlaceHospitalDao;
	@Autowired
	private CcmPlaceCateringService ccmPlaceCateringService;
	@Autowired
	private CcmPlaceCateringDao ccmPlaceCateringDao;
	@Autowired
	private CcmPlaceTrafficService ccmPlaceTrafficService;
	@Autowired
	private CcmPlaceTrafficDao ccmPlaceTrafficDao;
	@Autowired
	private CcmPlaceHotelService ccmPlaceHotelService;
	@Autowired
	private CcmPlaceHotelDao ccmPlaceHotelDao;
	@Autowired
	private CcmPlaceScenicService ccmPlaceScenicService;
	@Autowired
	private CcmPlaceScenicDao ccmPlaceScenicDao;
	@Autowired
	private CcmPlaceFinancialService ccmPlaceFinancialService;
	@Autowired
	private CcmPlaceFinancialDao ccmPlaceFinancialDao;
	@Autowired
	private CcmPlaceReligionService ccmPlaceReligionService;
	@Autowired
	private CcmPlaceReligionDao  ccmPlaceReligionDao;
	@Autowired
	private CcmPlaceChemicalService ccmPlaceChemicalService;
	@Autowired
	private CcmPlaceChemicalDao ccmPlaceChemicalDao;


	@ResponseBody
	@RequestMapping(value="/get", method = RequestMethod.GET)
	public CcmRestResult get(String userId,String placeType,String type, CcmPlaceFinancial ccmPlaceFinancial,CcmPlaceChemical  ccmPlaceChemical ,CcmPlaceReligion ccmPlaceReligion,CcmPlaceScenic ccmPlaceScenic,CcmPlaceHotel ccmPlaceHotel,CcmPlaceTraffic ccmPlaceTraffic,CcmPlaceLive ccmPlaceLive, CcmPlaceCasino ccmPlaceCasino, CcmPlaceEducation ccmPlaceEducation, CcmPlaceHospital ccmPlaceHospital, CcmPlaceCatering ccmPlaceCatering,HttpServletRequest req, HttpServletResponse resp, String id,String basePlaceId) throws IOException {
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

		if (basePlaceId == null || "".equals(basePlaceId)) {//参数id不对
			result.setCode(CcmRestType.ERROR_PARAM);
			return result;
		}
		if (placeType!= null && placeType.equals("ccm_place_live")) {
			CcmBasePlace ccmBasePlace = new CcmBasePlace();
			ccmBasePlace.setId(ccmPlaceLive.getBasePlaceId());
			CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
			CcmPlaceLive ccmPlaceLive1 = ccmPlaceLiveService.get(ccmPlaceLive.getBasePlaceId());
			if(StringUtils.isNotBlank(ccmBasePlace2.getPlacePicture())) {
				ccmBasePlace2.setPlacePicture(Global.getConfig("FILE_UPLOAD_URL")+ccmBasePlace2.getPlacePicture());
			}
			ccmPlaceLive1.setCcmBasePlace(ccmBasePlace2);
			result.setCode(CcmRestType.OK);
			result.setResult(ccmPlaceLive1);
		} else if (placeType!= null && placeType.equals("ccm_place_casino")) {
			CcmBasePlace ccmBasePlace = new CcmBasePlace();
			ccmBasePlace.setId(ccmPlaceLive.getBasePlaceId());
			CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
			CcmPlaceCasino ccmPlaceCasino1 = ccmPlaceCasinoService.get(ccmPlaceCasino.getBasePlaceId());
			ccmPlaceCasino1.setCcmBasePlace(ccmBasePlace2);

			result.setCode(CcmRestType.OK);
			result.setResult(ccmPlaceCasino1);
		} else if (placeType!= null && placeType.equals("ccm_place_education")) {
			CcmBasePlace ccmBasePlace = new CcmBasePlace();
			ccmBasePlace.setId(ccmPlaceLive.getBasePlaceId());
			CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
			CcmPlaceEducation ccmPlaceEducation1 = ccmPlaceEducationService.get(ccmPlaceEducation.getBasePlaceId());
			if(StringUtils.isNotBlank(ccmBasePlace2.getPlacePicture())) {
				ccmBasePlace2.setPlacePicture(Global.getConfig("FILE_UPLOAD_URL")+ccmBasePlace2.getPlacePicture());
			}
			ccmPlaceEducation1.setCcmBasePlace(ccmBasePlace2);

			result.setCode(CcmRestType.OK);
			result.setResult(ccmPlaceEducation1);
		} else if (placeType!= null && placeType.equals("ccm_place_hospital")) {
			CcmBasePlace ccmBasePlace = new CcmBasePlace();
			ccmBasePlace.setId(ccmPlaceLive.getBasePlaceId());
			CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
			CcmPlaceHospital ccmPlaceHospital1 = ccmPlaceHospitalService.get(ccmPlaceHospital.getBasePlaceId());
			if(StringUtils.isNotBlank(ccmBasePlace2.getPlacePicture())) {
				ccmBasePlace2.setPlacePicture(Global.getConfig("FILE_UPLOAD_URL")+ccmBasePlace2.getPlacePicture());
			}
			ccmPlaceHospital1.setCcmBasePlace(ccmBasePlace2);

			result.setCode(CcmRestType.OK);
			result.setResult(ccmPlaceHospital1);
		} else if (placeType!= null && placeType.equals("ccm_place_catering")) {
			CcmBasePlace ccmBasePlace = new CcmBasePlace();
			ccmBasePlace.setId(ccmPlaceLive.getBasePlaceId());
			CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
			CcmPlaceCatering ccmPlaceCatering1 = ccmPlaceCateringService.get(ccmPlaceCatering.getBasePlaceId());
			if(StringUtils.isNotBlank(ccmBasePlace2.getPlacePicture())) {
				ccmBasePlace2.setPlacePicture(Global.getConfig("FILE_UPLOAD_URL")+ccmBasePlace2.getPlacePicture());
			}
			ccmPlaceCatering1.setCcmBasePlace(ccmBasePlace2);

			result.setCode(CcmRestType.OK);
			result.setResult(ccmPlaceCatering1);
		} else if (placeType!= null && placeType.equals("ccm_place_traffic")) {
			CcmBasePlace ccmBasePlace = new CcmBasePlace();
			ccmBasePlace.setId(ccmPlaceLive.getBasePlaceId());
			CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
			CcmPlaceTraffic ccmPlaceTraffic1 = ccmPlaceTrafficService.get(ccmPlaceTraffic.getBasePlaceId());
			if(StringUtils.isNotBlank(ccmBasePlace2.getPlacePicture())) {
				ccmBasePlace2.setPlacePicture(Global.getConfig("FILE_UPLOAD_URL")+ccmBasePlace2.getPlacePicture());
			}
			ccmPlaceTraffic1.setCcmBasePlace(ccmBasePlace2);

			result.setCode(CcmRestType.OK);
			result.setResult(ccmPlaceTraffic1);
		} else if (placeType!= null && placeType.equals("ccm_place_hotel")) {
			CcmBasePlace ccmBasePlace = new CcmBasePlace();
			ccmBasePlace.setId(ccmPlaceLive.getBasePlaceId());
			CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
			CcmPlaceHotel ccmPlaceHotel1 = ccmPlaceHotelService.get(ccmPlaceHotel.getBasePlaceId());
			if(StringUtils.isNotBlank(ccmBasePlace2.getPlacePicture())) {
				ccmBasePlace2.setPlacePicture(Global.getConfig("FILE_UPLOAD_URL")+ccmBasePlace2.getPlacePicture());
			}
			ccmPlaceHotel1.setCcmBasePlace(ccmBasePlace2);

			result.setCode(CcmRestType.OK);
			result.setResult(ccmPlaceHotel1);
		} else if (placeType!= null && placeType.equals("ccm_place_scenic")) {
			CcmBasePlace ccmBasePlace = new CcmBasePlace();
			ccmBasePlace.setId(ccmPlaceLive.getBasePlaceId());
			CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
			CcmPlaceScenic ccmPlaceScenic1 = ccmPlaceScenicService.get(ccmPlaceScenic.getBasePlaceId());
			if(StringUtils.isNotBlank(ccmBasePlace2.getPlacePicture())) {
				ccmBasePlace2.setPlacePicture(Global.getConfig("FILE_UPLOAD_URL")+ccmBasePlace2.getPlacePicture());
			}
			ccmPlaceScenic1.setCcmBasePlace(ccmBasePlace2);

			result.setCode(CcmRestType.OK);
			result.setResult(ccmPlaceScenic1);
		} else if (placeType!= null && placeType.equals("ccm_place_religion")) {
			CcmBasePlace ccmBasePlace = new CcmBasePlace();
			ccmBasePlace.setId(ccmPlaceLive.getBasePlaceId());
			CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
			CcmPlaceReligion ccmPlaceReligion1 = ccmPlaceReligionService.get(ccmPlaceReligion.getBasePlaceId());
			if(StringUtils.isNotBlank(ccmBasePlace2.getPlacePicture())) {
				ccmBasePlace2.setPlacePicture(Global.getConfig("FILE_UPLOAD_URL")+ccmBasePlace2.getPlacePicture());
			}
			ccmPlaceReligion1.setCcmBasePlace(ccmBasePlace2);

			result.setCode(CcmRestType.OK);
			result.setResult(ccmPlaceReligion1);
		} else if (placeType!= null && placeType.equals("ccm_place_chemical")) {
			CcmBasePlace ccmBasePlace = new CcmBasePlace();
			ccmBasePlace.setId(ccmPlaceLive.getBasePlaceId());
			CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
			CcmPlaceChemical ccmPlaceChemical1 = ccmPlaceChemicalService.get(ccmPlaceChemical.getBasePlaceId());
			if(StringUtils.isNotBlank(ccmBasePlace2.getPlacePicture())) {
				ccmBasePlace2.setPlacePicture(Global.getConfig("FILE_UPLOAD_URL")+ccmBasePlace2.getPlacePicture());
			}
			ccmPlaceChemical1.setCcmBasePlace(ccmBasePlace2);

			result.setCode(CcmRestType.OK);
			result.setResult(ccmPlaceChemical1);
		} else if (placeType!= null && placeType.equals("ccm_place_financial")) {
			CcmBasePlace ccmBasePlace = new CcmBasePlace();
			ccmBasePlace.setId(ccmPlaceLive.getBasePlaceId());
			CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
			CcmPlaceFinancial ccmPlaceFinancial1 = ccmPlaceFinancialService.get(ccmPlaceFinancial.getBasePlaceId());
			if(StringUtils.isNotBlank(ccmBasePlace2.getPlacePicture())) {
				ccmBasePlace2.setPlacePicture(Global.getConfig("FILE_UPLOAD_URL")+ccmBasePlace2.getPlacePicture());
			}
			ccmPlaceFinancial1.setCcmBasePlace(ccmBasePlace2);

			result.setCode(CcmRestType.OK);
			result.setResult(ccmPlaceFinancial1);
		}

		if(placeType ==null|| "".equals(placeType)) {
			result.setCode(CcmRestType.ERROR_PARAM);
			return result;
		}
		return result;
	}
	public String getFile(String url) {
		String file = url;
		if(StringUtils.isNotBlank(url)) {
			file = Global.getConfig("FILE_UPLOAD_URL") + url;
		}
		return file;
	}
	/**
	 * @see  查询基础场所信息
	 * @param ccmBasePlace
	 * @param pageNo 页码
	 * @param pageSize 分页大小
	 * @return
	 * @author pengjianqiang
	 * @version 2018-02-23
	 */
	@ResponseBody
	@RequestMapping(value="/query", method = RequestMethod.GET)
	public CcmRestResult query(Integer pageNo,String userId,String placeType,String createTime,String leaderName,String placeName,String type,CcmBasePlace ccmBasePlace, HttpServletRequest req, HttpServletResponse resp) throws IOException {
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
		ccmBasePlace.setCheckUser(sessionUser);
		if(placeType ==null|| "".equals(placeType)) {
			Page<CcmBasePlace> page99 = ccmBasePlaceService.findPage(new Page<CcmBasePlace>(req, resp), ccmBasePlace);
			page99.getList().forEach(item->item.setPlacePicture(getFile(item.getPlacePicture())));
			result.setCode(CcmRestType.OK);
			page99.setPageNo(pageNo);
			result.setResult(page99.getList());
		} else if (placeType!= null && placeType.equals("ccm_place_live")) {
			CcmPlaceLive ccmPlaceLive = new CcmPlaceLive();
			ccmPlaceLive.setCheckUser(sessionUser);
			ccmPlaceLive.setType(type);
			ccmPlaceLive.setPlaceName(placeName);
			ccmPlaceLive.setLeaderName(leaderName);
			ccmPlaceLive.setPlaceType(placeType);
			Page<CcmPlaceLive> page1 = ccmPlaceLiveService.findPage(new Page<CcmPlaceLive>(req, resp), ccmPlaceLive);
			page1.getList().forEach(item->item.setPlacePicture(getFile(item.getPlacePicture())));
			for (int i = 0; i < page1.getList().size(); i++) {
				ccmBasePlace.setId(page1.getList().get(i).getBasePlaceId());
				CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
				page1.getList().get(i).setCcmBasePlace(ccmBasePlace2);
			}
			result.setCode(CcmRestType.OK);
			page1.setPageNo(pageNo);
			result.setResult(page1.getList());
		} else if(placeType!= null &&placeType.equals("ccm_place_casino")) {
			CcmPlaceCasino ccmPlaceCasino = new CcmPlaceCasino();
			ccmPlaceCasino.setCheckUser(sessionUser);
			ccmPlaceCasino.setType(type);
			ccmPlaceCasino.setPlaceName(placeName);
			ccmPlaceCasino.setLeaderName(leaderName);
			ccmPlaceCasino.setPlaceType(placeType);
			Page<CcmPlaceCasino> page2 = ccmPlaceCasinoService.findPage(new Page<CcmPlaceCasino>(req, resp), ccmPlaceCasino);
			page2.getList().forEach(item->item.setPlacePicture(getFile(item.getPlacePicture())));
			for (int i = 0; i < page2.getList().size(); i++) {
				ccmBasePlace.setId(page2.getList().get(i).getBasePlaceId());
				CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
				page2.getList().get(i).setCcmBasePlace(ccmBasePlace2);
			}
			result.setCode(CcmRestType.OK);
			page2.setPageNo(pageNo);
			result.setResult(page2.getList());
		} else if(placeType!= null &&placeType.equals("ccm_place_education")) {
			CcmPlaceEducation ccmPlaceEducation = new CcmPlaceEducation();
			ccmPlaceEducation.setCheckUser(sessionUser);
			ccmPlaceEducation.setType(type);
			ccmPlaceEducation.setPlaceName(placeName);
			ccmPlaceEducation.setLeaderName(leaderName);
			ccmPlaceEducation.setPlaceType(placeType);
			Page<CcmPlaceEducation> page3 = ccmPlaceEducationService.findPage(new Page<CcmPlaceEducation>(req, resp), ccmPlaceEducation);
			page3.getList().forEach(item->item.setPlacePicture(getFile(item.getPlacePicture())));
			for (int i = 0; i < page3.getList().size(); i++) {
				ccmBasePlace.setId(page3.getList().get(i).getBasePlaceId());
				CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
				page3.getList().get(i).setCcmBasePlace(ccmBasePlace2);
			}
			result.setCode(CcmRestType.OK);
			page3.setPageNo(pageNo);
			result.setResult(page3.getList());
		} else if(placeType!= null &&placeType.equals("ccm_place_hospital")) {
			CcmPlaceHospital ccmPlaceHospital = new CcmPlaceHospital();
			ccmPlaceHospital.setCheckUser(sessionUser);
			ccmPlaceHospital.setType(type);
			ccmPlaceHospital.setPlaceName(placeName);
			ccmPlaceHospital.setLeaderName(leaderName);
			ccmPlaceHospital.setPlaceType(placeType);
			Page<CcmPlaceHospital> page4 = ccmPlaceHospitalService.findPage(new Page<CcmPlaceHospital>(req, resp), ccmPlaceHospital);
			page4.getList().forEach(item->item.setPlacePicture(getFile(item.getPlacePicture())));
			for (int i = 0; i < page4.getList().size(); i++) {
				ccmBasePlace.setId(page4.getList().get(i).getBasePlaceId());
				CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
				page4.getList().get(i).setCcmBasePlace(ccmBasePlace2);
			}
			result.setCode(CcmRestType.OK);
			page4.setPageNo(pageNo);
			result.setResult(page4.getList());
		} else if(placeType!= null &&placeType.equals("ccm_place_catering")) {
			CcmPlaceCatering ccmPlaceCatering = new CcmPlaceCatering();
			ccmPlaceCatering.setCheckUser(sessionUser);
			ccmPlaceCatering.setType(type);
			ccmPlaceCatering.setPlaceName(placeName);
			ccmPlaceCatering.setLeaderName(leaderName);
			ccmPlaceCatering.setPlaceType(placeType);
			Page<CcmPlaceCatering> page = ccmPlaceCateringService.findPage(new Page<CcmPlaceCatering>(req, resp), ccmPlaceCatering);
			page.getList().forEach(item->item.setPlacePicture(getFile(item.getPlacePicture())));
			for (int i = 0; i < page.getList().size(); i++) {
				ccmBasePlace.setId(page.getList().get(i).getBasePlaceId());
				CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
				page.getList().get(i).setCcmBasePlace(ccmBasePlace2);
			}
			result.setCode(CcmRestType.OK);
			page.setPageNo(pageNo);
			result.setResult(page.getList());
		} else if(placeType!= null &&placeType.equals("ccm_place_traffic")) {
			CcmPlaceTraffic ccmPlaceTraffic = new CcmPlaceTraffic();
			ccmPlaceTraffic.setCheckUser(sessionUser);
			ccmPlaceTraffic.setType(type);
			ccmPlaceTraffic.setPlaceName(placeName);
			ccmPlaceTraffic.setLeaderName(leaderName);
			ccmPlaceTraffic.setPlaceType(placeType);
			Page<CcmPlaceTraffic> page = ccmPlaceTrafficService.findPage(new Page<CcmPlaceTraffic>(req, resp), ccmPlaceTraffic);
			page.getList().forEach(item->item.setPlacePicture(getFile(item.getPlacePicture())));
			for (int i = 0; i < page.getList().size(); i++) {
				ccmBasePlace.setId(page.getList().get(i).getBasePlaceId());
				CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
				page.getList().get(i).setCcmBasePlace(ccmBasePlace2);
			}
			result.setCode(CcmRestType.OK);
			page.setPageNo(pageNo);
			result.setResult(page.getList());
		} else if(placeType!= null &&placeType.equals("ccm_place_hotel")) {
			CcmPlaceHotel ccmPlaceHotel = new CcmPlaceHotel();
			ccmPlaceHotel.setCheckUser(sessionUser);
			ccmPlaceHotel.setType(type);
			ccmPlaceHotel.setPlaceName(placeName);
			ccmPlaceHotel.setLeaderName(leaderName);
			ccmPlaceHotel.setPlaceType(placeType);
			Page<CcmPlaceHotel> page7 = ccmPlaceHotelService.findPage(new Page<CcmPlaceHotel>(req, resp), ccmPlaceHotel);
			page7.getList().forEach(item->item.setPlacePicture(getFile(item.getPlacePicture())));
			for (int i = 0; i < page7.getList().size(); i++) {
				ccmBasePlace.setId(page7.getList().get(i).getBasePlaceId());
				CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
				page7.getList().get(i).setCcmBasePlace(ccmBasePlace2);
			}
			result.setCode(CcmRestType.OK);
			page7.setPageNo(pageNo);
			result.setResult(page7.getList());
		} else if(placeType!= null &&placeType.equals("ccm_place_scenic")) {
			CcmPlaceScenic ccmPlaceScenic = new CcmPlaceScenic();
			ccmPlaceScenic.setCheckUser(sessionUser);
			ccmPlaceScenic.setType(type);
			ccmPlaceScenic.setPlaceName(placeName);
			ccmPlaceScenic.setLeaderName(leaderName);
			ccmPlaceScenic.setPlaceType(placeType);
			Page<CcmPlaceScenic> page8 = ccmPlaceScenicService.findPage(new Page<CcmPlaceScenic>(req, resp), ccmPlaceScenic);
			page8.getList().forEach(item->item.setPlacePicture(getFile(item.getPlacePicture())));
			for (int i = 0; i < page8.getList().size(); i++) {
				ccmBasePlace.setId(page8.getList().get(i).getBasePlaceId());
				CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
				page8.getList().get(i).setCcmBasePlace(ccmBasePlace2);
			}
			result.setCode(CcmRestType.OK);
			page8.setPageNo(pageNo);
			result.setResult(page8.getList());
		} else if(placeType!= null &&placeType.equals("ccm_place_religion")) {
			CcmPlaceReligion ccmPlaceReligion = new CcmPlaceReligion();
			ccmPlaceReligion.setCheckUser(sessionUser);
			ccmPlaceReligion.setType(type);
			ccmPlaceReligion.setPlaceName(placeName);
			ccmPlaceReligion.setLeaderName(leaderName);
			ccmPlaceReligion.setPlaceType(placeType);
			Page<CcmPlaceReligion> page10 = ccmPlaceReligionService.findPage(new Page<CcmPlaceReligion>(req, resp), ccmPlaceReligion);
			page10.getList().forEach(item->item.setPlacePicture(getFile(item.getPlacePicture())));
			for (int i = 0; i < page10.getList().size(); i++) {
				ccmBasePlace.setId(page10.getList().get(i).getBasePlaceId());
				CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
				page10.getList().get(i).setCcmBasePlace(ccmBasePlace2);
			}
			result.setCode(CcmRestType.OK);
			page10.setPageNo(pageNo);
			result.setResult(page10.getList());
		} else if(placeType!= null &&placeType.equals("ccm_place_chemical")) {
			CcmPlaceChemical ccmPlaceChemical = new CcmPlaceChemical();
			ccmPlaceChemical.setCheckUser(sessionUser);
			ccmPlaceChemical.setType(type);
			ccmPlaceChemical.setPlaceName(placeName);
			ccmPlaceChemical.setLeaderName(leaderName);
			ccmPlaceChemical.setPlaceType(placeType);
			Page<CcmPlaceChemical> page11 = ccmPlaceChemicalService.findPage(new Page<CcmPlaceChemical>(req, resp), ccmPlaceChemical);
			page11.getList().forEach(item->item.setPlacePicture(getFile(item.getPlacePicture())));
			for (int i = 0; i < page11.getList().size(); i++) {
				ccmBasePlace.setId(page11.getList().get(i).getBasePlaceId());
				CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
				page11.getList().get(i).setCcmBasePlace(ccmBasePlace2);
			}
			result.setCode(CcmRestType.OK);
			page11.setPageNo(pageNo);
			result.setResult(page11.getList());
		} else if(placeType!= null &&placeType.equals("ccm_place_financial")) {
			CcmPlaceFinancial ccmPlaceFinancial = new CcmPlaceFinancial();
			ccmPlaceFinancial.setCheckUser(sessionUser);
			ccmPlaceFinancial.setType(type);
			ccmPlaceFinancial.setPlaceName(placeName);
			ccmPlaceFinancial.setLeaderName(leaderName);
			ccmPlaceFinancial.setPlaceType(placeType);
			Page<CcmPlaceFinancial> page12 = ccmPlaceFinancialService.findPage(new Page<CcmPlaceFinancial>(req, resp), ccmPlaceFinancial);
			page12.getList().forEach(item->item.setPlacePicture(getFile(item.getPlacePicture())));
			for (int i = 0; i < page12.getList().size(); i++) {
				ccmBasePlace.setId(page12.getList().get(i).getBasePlaceId());
				CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
				page12.getList().get(i).setCcmBasePlace(ccmBasePlace2);
			}
			result.setCode(CcmRestType.OK);
			page12.setPageNo(pageNo);
			result.setResult(page12.getList());
		}
		return result;
	}

	/**
	 * @see  保存重点场所信息
	 * @param
	 * @return
	 * @author fuxinshuang
	 * @version 2018-03-06
	 */
	@ResponseBody
	@RequestMapping(value="/save", method = RequestMethod.POST)
	public CcmRestResult modify(String type,String userId,String placeType,String placePicture,String governingBodyName,String basePlaceId,String placeName,String placeArea, String relevanceOrg,String keyPoint,String workerNumber,String address,String leaderName,String leaderIdCard,String leaderContact, Area area,String placeUse,Date createTime,CcmPlaceFinancial ccmPlaceFinancial,CcmPlaceChemical ccmPlaceChemical,CcmPlaceReligion ccmPlaceReligion,CcmPlaceScenic ccmPlaceScenic,CcmPlaceHotel ccmPlaceHotel,CcmPlaceTraffic ccmPlaceTraffic,CcmPlaceLive ccmPlaceLive, CcmPlaceCasino ccmPlaceCasino, CcmPlaceEducation ccmPlaceEducation, CcmPlaceHospital ccmPlaceHospital, CcmPlaceCatering ccmPlaceCatering,HttpServletRequest req, HttpServletResponse resp) throws IOException {
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

		if (placeType==null&& "".equals(placeType)) {
			result.setCode(CcmRestType.ERROR_USER_NOT_EXIST);
			return result;
		} else if (placeType!= null && placeType.equals("ccm_place_live")) {
			if (null == ccmPlaceLive.getBasePlaceId() || "".equals(ccmPlaceLive.getBasePlaceId())) {
				CcmBasePlace ccmBasePlace = new CcmBasePlace();
				String id = UUID.randomUUID().toString();
				ccmBasePlace.setId(id);
				ccmBasePlace.setIsNewRecord(true);
				ccmBasePlace.setPlaceType("ccm_place_live");
				ccmBasePlace.setAddress(address);
				ccmBasePlace.setArea(area);
				ccmBasePlace.setAdministrativeDivision(ccmPlaceLive.getAdministrativeDivision());
				ccmBasePlace.setPlaceUse(placeUse);
				ccmBasePlace.setLeaderName(leaderName);
				ccmBasePlace.setLeaderIdCard(leaderIdCard);
				ccmBasePlace.setLeaderContact(leaderContact);
				ccmBasePlace.setCreateTime(createTime);
				ccmBasePlace.setKeyPoint(keyPoint);
				ccmBasePlace.setWorkerNumber(workerNumber);
				ccmBasePlace.setRelevanceOrg(relevanceOrg);
				ccmBasePlace.setPlaceArea(placeArea);
				ccmBasePlace.setPlaceName(placeName);
				ccmBasePlace.setGoverningBodyName(governingBodyName);

				ccmBasePlace.setCreateBy(new User(userId));
				ccmBasePlace.setUpdateBy(new User(userId));
				ccmBasePlace.setCreateDate(new Date());
				ccmBasePlace.setUpdateDate(new Date());

				if (null == ccmPlaceLive.getCreateBy()) {
					ccmPlaceLive.setCreateBy(new User(userId));
				}
				ccmPlaceLive.setUpdateBy(new User(userId));
				String file = ccmPlaceLive.getPlacePicture();
				if(StringUtils.isNotEmpty(file)) {
					if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
						ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
					}else {
						ccmBasePlace.setPlacePicture(file);
					}
				}
				ccmPlaceLive.setBasePlaceId(ccmBasePlace.getId());
				ccmBasePlaceDao.insert(ccmBasePlace);
				ccmPlaceLive.setCcmBasePlace(ccmBasePlace);
				ccmPlaceLive.setType(type);
				ccmPlaceLive.setUpdateDate(new Date());
				ccmPlaceLiveService.save(ccmPlaceLive);
				result.setCode(CcmRestType.OK);
				result.setResult("成功");
			} else {
				CcmBasePlace ccmBasePlace1 = ccmBasePlaceService.get(ccmPlaceLive.getBasePlaceId());
				if(ccmBasePlace1 != null) {
					CcmBasePlace ccmBasePlace = new CcmBasePlace();
					ccmBasePlace.setAddress(ccmPlaceLive.getAddress());
					ccmBasePlace.setArea(ccmPlaceLive.getArea());
					ccmBasePlace.setPlaceUse(ccmPlaceLive.getPlaceUse());
					ccmBasePlace.setLeaderName(ccmPlaceLive.getLeaderName());
					ccmBasePlace.setPlaceType("ccm_place_live");
					ccmBasePlace.setAdministrativeDivision(ccmPlaceLive.getAdministrativeDivision());
					ccmBasePlace.setLeaderIdCard(ccmPlaceLive.getLeaderIdCard());
					ccmBasePlace.setLeaderContact(ccmPlaceLive.getLeaderContact());
					ccmBasePlace.setCreateTime(ccmPlaceLive.getCreateTime());
					ccmBasePlace.setKeyPoint(ccmPlaceLive.getKeyPoint());
					ccmBasePlace.setWorkerNumber(ccmPlaceLive.getWorkerNumber());
					ccmBasePlace.setRelevanceOrg(ccmPlaceLive.getRelevanceOrg());
					ccmBasePlace.setPlaceArea(ccmPlaceLive.getPlaceArea());
					ccmBasePlace.setPlaceName(ccmPlaceLive.getPlaceName());
					ccmBasePlace.setGoverningBodyName(ccmPlaceLive.getGoverningBodyName());

					ccmBasePlace.setCreateBy(new User(userId));
					ccmBasePlace.setUpdateBy(new User(userId));
					ccmBasePlace.setCreateDate(new Date());
					ccmBasePlace.setUpdateDate(new Date());

					if (null == ccmPlaceLive.getCreateBy()) {
						ccmPlaceLive.setCreateBy(new User(userId));
					}
					ccmPlaceLive.setUpdateBy(new User(userId));
					String file = ccmPlaceLive.getPlacePicture();
					if(StringUtils.isNotEmpty(file)) {
						if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
							ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
						}else {
							ccmBasePlace.setPlacePicture(file);
						}
					}
					ccmBasePlace.setId(ccmPlaceLive.getBasePlaceId());
					ccmBasePlaceService.save(ccmBasePlace);
					ccmPlaceLive.setCcmBasePlace(ccmBasePlace);
					ccmPlaceLive.setType(type);
					ccmPlaceLive.setUpdateDate(new Date());
					ccmPlaceLiveDao.update(ccmPlaceLive);
					result.setCode(CcmRestType.OK);
					result.setResult("成功");
				}
			}
		} else if (placeType!= null && placeType.equals("ccm_place_casino")) {
			if (null == ccmPlaceCasino.getBasePlaceId() || "".equals(ccmPlaceCasino.getBasePlaceId())) {
				CcmBasePlace ccmBasePlace = new CcmBasePlace();
				String id = UUID.randomUUID().toString();
				ccmBasePlace.setId(id);
				ccmBasePlace.setIsNewRecord(true);
				ccmBasePlace.setPlaceType("ccm_place_casino");
				ccmBasePlace.setAddress(address);
				ccmBasePlace.setArea(area);
				ccmBasePlace.setAdministrativeDivision(ccmPlaceCasino.getAdministrativeDivision());
				ccmBasePlace.setPlaceUse(placeUse);
				ccmBasePlace.setLeaderName(leaderName);
				ccmBasePlace.setLeaderIdCard(leaderIdCard);
				ccmBasePlace.setLeaderContact(leaderContact);
				ccmBasePlace.setCreateTime(createTime);
				ccmBasePlace.setKeyPoint(keyPoint);
				ccmBasePlace.setWorkerNumber(workerNumber);
				ccmBasePlace.setRelevanceOrg(relevanceOrg);
				ccmBasePlace.setPlaceArea(placeArea);
				ccmBasePlace.setPlaceName(placeName);
				ccmBasePlace.setGoverningBodyName(governingBodyName);

				ccmBasePlace.setCreateBy(new User(userId));
				ccmBasePlace.setUpdateBy(new User(userId));
				ccmBasePlace.setCreateDate(new Date());
				ccmBasePlace.setUpdateDate(new Date());

				if (null == ccmPlaceCasino.getCreateBy()) {
					ccmPlaceCasino.setCreateBy(new User(userId));
				}
				ccmPlaceCasino.setUpdateBy(new User(userId));
				String file = ccmPlaceCasino.getPlacePicture();
				if(StringUtils.isNotEmpty(file)) {
					if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
						ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
					}else {
						ccmBasePlace.setPlacePicture(file);
					}
				}
				ccmPlaceCasino.setBasePlaceId(ccmBasePlace.getId());
				ccmBasePlaceDao.insert(ccmBasePlace);
				ccmPlaceCasino.setCcmBasePlace(ccmBasePlace);
				ccmPlaceCasino.setType(type);
				ccmPlaceCasino.setUpdateDate(new Date());
				ccmPlaceCasinoService.save(ccmPlaceCasino);
				result.setCode(CcmRestType.OK);
				result.setResult("成功");
			} else {
				CcmBasePlace ccmBasePlace1 = ccmBasePlaceService.get(ccmPlaceCasino.getBasePlaceId());
				if(ccmBasePlace1 != null) {
					CcmBasePlace ccmBasePlace = new CcmBasePlace();
					ccmBasePlace.setAddress(ccmPlaceCasino.getAddress());
					ccmBasePlace.setPlaceType("ccm_place_casino");
					ccmBasePlace.setArea(ccmPlaceCasino.getArea());
					ccmBasePlace.setPlaceUse(ccmPlaceCasino.getPlaceUse());
					ccmBasePlace.setLeaderName(ccmPlaceCasino.getLeaderName());
					ccmBasePlace.setAdministrativeDivision(ccmPlaceCasino.getAdministrativeDivision());
					ccmBasePlace.setLeaderIdCard(ccmPlaceCasino.getLeaderIdCard());
					ccmBasePlace.setLeaderContact(ccmPlaceCasino.getLeaderContact());
					ccmBasePlace.setCreateTime(ccmPlaceCasino.getCreateTime());
					ccmBasePlace.setKeyPoint(ccmPlaceCasino.getKeyPoint());
					ccmBasePlace.setWorkerNumber(ccmPlaceCasino.getWorkerNumber());
					ccmBasePlace.setRelevanceOrg(ccmPlaceCasino.getRelevanceOrg());
					ccmBasePlace.setPlaceArea(ccmPlaceCasino.getPlaceArea());
					ccmBasePlace.setPlaceName(ccmPlaceCasino.getPlaceName());
					ccmBasePlace.setGoverningBodyName(ccmPlaceCasino.getGoverningBodyName());

					ccmBasePlace.setCreateBy(new User(userId));
					ccmBasePlace.setUpdateBy(new User(userId));
					ccmBasePlace.setCreateDate(new Date());
					ccmBasePlace.setUpdateDate(new Date());

					if (null == ccmPlaceCasino.getCreateBy()) {
						ccmPlaceCasino.setCreateBy(new User(userId));
					}
					ccmPlaceCasino.setUpdateBy(new User(userId));
					String file = ccmPlaceCasino.getPlacePicture();
					if(StringUtils.isNotEmpty(file)) {
						if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
							ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
						}else {
							ccmBasePlace.setPlacePicture(file);
						}
					}
					ccmBasePlace.setId(ccmPlaceCasino.getBasePlaceId());
					ccmBasePlaceService.save(ccmBasePlace);
					ccmPlaceCasino.setCcmBasePlace(ccmBasePlace);
					ccmPlaceCasino.setType(type);
					ccmPlaceCasino.setUpdateDate(new Date());
					ccmPlaceCasinoDao.update(ccmPlaceCasino);
					result.setCode(CcmRestType.OK);
					result.setResult("成功");
				}
			}
		} else if (placeType!= null && placeType.equals("ccm_place_education")) {
			if (null == ccmPlaceEducation.getBasePlaceId() || "".equals(ccmPlaceEducation.getBasePlaceId())) {
				CcmBasePlace ccmBasePlace = new CcmBasePlace();
				String id = UUID.randomUUID().toString();
				ccmBasePlace.setId(id);
				ccmBasePlace.setIsNewRecord(true);
				ccmBasePlace.setPlaceType("ccm_place_education");
				ccmBasePlace.setAddress(address);
				ccmBasePlace.setArea(area);
				ccmBasePlace.setAdministrativeDivision(ccmPlaceEducation.getAdministrativeDivision());
				ccmBasePlace.setPlaceUse(placeUse);
				ccmBasePlace.setLeaderName(leaderName);
				ccmBasePlace.setLeaderIdCard(leaderIdCard);
				ccmBasePlace.setLeaderContact(leaderContact);
				ccmBasePlace.setCreateTime(createTime);
				ccmBasePlace.setKeyPoint(keyPoint);
				ccmBasePlace.setWorkerNumber(workerNumber);
				ccmBasePlace.setRelevanceOrg(relevanceOrg);
				ccmBasePlace.setPlaceArea(placeArea);
				ccmBasePlace.setPlaceName(placeName);

				ccmBasePlace.setCreateBy(new User(userId));
				ccmBasePlace.setUpdateBy(new User(userId));
				ccmBasePlace.setCreateDate(new Date());
				ccmBasePlace.setUpdateDate(new Date());

				ccmBasePlace.setGoverningBodyName(governingBodyName);
				if (null == ccmPlaceEducation.getCreateBy()) {
					ccmPlaceEducation.setCreateBy(new User(userId));
				}
				ccmPlaceEducation.setUpdateBy(new User(userId));
				String file = ccmPlaceEducation.getPlacePicture();
				if(StringUtils.isNotEmpty(file)) {
					if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
						ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
					}else {
						ccmBasePlace.setPlacePicture(file);
					}
				}
				ccmPlaceEducation.setBasePlaceId(ccmBasePlace.getId());
				ccmBasePlaceDao.insert(ccmBasePlace);
				ccmPlaceEducation.setCcmBasePlace(ccmBasePlace);
				ccmPlaceEducation.setType(type);
				ccmPlaceEducation.setUpdateDate(new Date());
				ccmPlaceEducationService.save(ccmPlaceEducation);
				result.setCode(CcmRestType.OK);
				result.setResult("成功");
			} else {
				CcmBasePlace ccmBasePlace1 = ccmBasePlaceService.get(ccmPlaceEducation.getBasePlaceId());
				if(ccmBasePlace1 != null) {
					CcmBasePlace ccmBasePlace = new CcmBasePlace();
					ccmBasePlace.setAddress(ccmPlaceEducation.getAddress());
					ccmBasePlace.setArea(ccmPlaceEducation.getArea());
					ccmBasePlace.setPlaceUse(ccmPlaceEducation.getPlaceUse());
					ccmBasePlace.setPlaceType("ccm_place_education");
					ccmBasePlace.setLeaderName(ccmPlaceEducation.getLeaderName());
					ccmBasePlace.setAdministrativeDivision(ccmPlaceEducation.getAdministrativeDivision());
					ccmBasePlace.setLeaderIdCard(ccmPlaceEducation.getLeaderIdCard());
					ccmBasePlace.setLeaderContact(ccmPlaceEducation.getLeaderContact());
					ccmBasePlace.setCreateTime(ccmPlaceEducation.getCreateTime());
					ccmBasePlace.setKeyPoint(ccmPlaceEducation.getKeyPoint());
					ccmBasePlace.setWorkerNumber(ccmPlaceEducation.getWorkerNumber());
					ccmBasePlace.setRelevanceOrg(ccmPlaceEducation.getRelevanceOrg());
					ccmBasePlace.setPlaceArea(ccmPlaceEducation.getPlaceArea());
					ccmBasePlace.setPlaceName(ccmPlaceEducation.getPlaceName());
					ccmBasePlace.setGoverningBodyName(ccmPlaceEducation.getGoverningBodyName());

					ccmBasePlace.setCreateBy(new User(userId));
					ccmBasePlace.setUpdateBy(new User(userId));
					ccmBasePlace.setCreateDate(new Date());
					ccmBasePlace.setUpdateDate(new Date());

					if (null == ccmPlaceEducation.getCreateBy()) {
						ccmPlaceEducation.setCreateBy(new User(userId));
					}
					ccmPlaceEducation.setUpdateBy(new User(userId));
					String file = ccmPlaceEducation.getPlacePicture();
					if(StringUtils.isNotEmpty(file)) {
						if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
							ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
						}else {
							ccmBasePlace.setPlacePicture(file);
						}
					}
					ccmBasePlace.setId(ccmPlaceEducation.getBasePlaceId());
					ccmBasePlaceService.save(ccmBasePlace);
					ccmPlaceEducation.setCcmBasePlace(ccmBasePlace);
					ccmPlaceEducation.setType(type);
					ccmPlaceEducation.setUpdateDate(new Date());
					ccmPlaceEducationDao.update(ccmPlaceEducation);
					result.setCode(CcmRestType.OK);
					result.setResult("成功");
				}
			}
		} else if (placeType!= null && placeType.equals("ccm_place_hospital")) {
			if (null == ccmPlaceHospital.getBasePlaceId() || "".equals(ccmPlaceHospital.getBasePlaceId())) {
				CcmBasePlace ccmBasePlace = new CcmBasePlace();
				String id = UUID.randomUUID().toString();
				ccmBasePlace.setId(id);
				ccmBasePlace.setIsNewRecord(true);
				ccmBasePlace.setPlaceType("ccm_place_hospital");
				ccmBasePlace.setAddress(address);
				ccmBasePlace.setArea(area);
				ccmBasePlace.setAdministrativeDivision(ccmPlaceHospital.getAdministrativeDivision());
				ccmBasePlace.setPlaceUse(placeUse);
				ccmBasePlace.setLeaderName(leaderName);
				ccmBasePlace.setLeaderIdCard(leaderIdCard);
				ccmBasePlace.setLeaderContact(leaderContact);
				ccmBasePlace.setCreateTime(createTime);
				ccmBasePlace.setKeyPoint(keyPoint);
				ccmBasePlace.setWorkerNumber(workerNumber);
				ccmBasePlace.setRelevanceOrg(relevanceOrg);
				ccmBasePlace.setPlaceArea(placeArea);
				ccmBasePlace.setPlaceName(placeName);
				ccmBasePlace.setGoverningBodyName(governingBodyName);

				ccmBasePlace.setCreateBy(new User(userId));
				ccmBasePlace.setUpdateBy(new User(userId));
				ccmBasePlace.setCreateDate(new Date());
				ccmBasePlace.setUpdateDate(new Date());

				if (null == ccmPlaceHospital.getCreateBy()) {
					ccmPlaceHospital.setCreateBy(new User(userId));
				}
				ccmPlaceHospital.setUpdateBy(new User(userId));
				String file = ccmPlaceHospital.getPlacePicture();
				if(StringUtils.isNotEmpty(file)) {
					if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
						ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
					}else {
						ccmBasePlace.setPlacePicture(file);
					}
				}
				ccmPlaceHospital.setBasePlaceId(ccmBasePlace.getId());
				ccmBasePlaceDao.insert(ccmBasePlace);
				ccmPlaceHospital.setCcmBasePlace(ccmBasePlace);
				ccmPlaceHospital.setType(type);
				ccmPlaceHospital.setUpdateDate(new Date());
				ccmPlaceHospitalService.save(ccmPlaceHospital);
				result.setCode(CcmRestType.OK);
				result.setResult("成功");
			} else {
				CcmBasePlace ccmBasePlace1 = ccmBasePlaceService.get(ccmPlaceHospital.getBasePlaceId());
				if(ccmBasePlace1 != null) {
					CcmBasePlace ccmBasePlace = new CcmBasePlace();
					ccmBasePlace.setAddress(ccmPlaceHospital.getAddress());
					ccmBasePlace.setArea(ccmPlaceHospital.getArea());
					ccmBasePlace.setPlaceUse(ccmPlaceHospital.getPlaceUse());
					ccmBasePlace.setPlaceType("ccm_place_hospital");
					ccmBasePlace.setLeaderName(ccmPlaceHospital.getLeaderName());
					ccmBasePlace.setAdministrativeDivision(ccmPlaceHospital.getAdministrativeDivision());
					ccmBasePlace.setLeaderIdCard(ccmPlaceHospital.getLeaderIdCard());
					ccmBasePlace.setLeaderContact(ccmPlaceHospital.getLeaderContact());
					ccmBasePlace.setCreateTime(ccmPlaceHospital.getCreateTime());
					ccmBasePlace.setKeyPoint(ccmPlaceHospital.getKeyPoint());
					ccmBasePlace.setWorkerNumber(ccmPlaceHospital.getWorkerNumber());
					ccmBasePlace.setRelevanceOrg(ccmPlaceHospital.getRelevanceOrg());
					ccmBasePlace.setPlaceArea(ccmPlaceHospital.getPlaceArea());
					ccmBasePlace.setPlaceName(ccmPlaceHospital.getPlaceName());
					ccmBasePlace.setGoverningBodyName(ccmPlaceHospital.getGoverningBodyName());

					ccmBasePlace.setCreateBy(new User(userId));
					ccmBasePlace.setUpdateBy(new User(userId));
					ccmBasePlace.setCreateDate(new Date());
					ccmBasePlace.setUpdateDate(new Date());

					if (null == ccmPlaceHospital.getCreateBy()) {
						ccmPlaceHospital.setCreateBy(new User(userId));
					}
					ccmPlaceHospital.setUpdateBy(new User(userId));
					String file = ccmPlaceHospital.getPlacePicture();
					if(StringUtils.isNotEmpty(file)) {
						if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
							ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
						}else {
							ccmBasePlace.setPlacePicture(file);
						}
					}
					ccmBasePlace.setId(ccmPlaceHospital.getBasePlaceId());
					ccmBasePlaceService.save(ccmBasePlace);
					ccmPlaceHospital.setCcmBasePlace(ccmBasePlace);
					ccmPlaceHospital.setType(type);
					ccmPlaceHospital.setUpdateDate(new Date());
					ccmPlaceHospitalDao.update(ccmPlaceHospital);
					result.setCode(CcmRestType.OK);
					result.setResult("成功");
				}
			}
		} else if (placeType!= null && placeType.equals("ccm_place_catering")) {
			if (null == ccmPlaceCatering.getBasePlaceId() || "".equals(ccmPlaceCatering.getBasePlaceId())) {
				CcmBasePlace ccmBasePlace = new CcmBasePlace();
				String id = UUID.randomUUID().toString();
				ccmBasePlace.setId(id);
				ccmBasePlace.setIsNewRecord(true);
				ccmBasePlace.setPlaceType("ccm_place_catering");
				ccmBasePlace.setAddress(address);
				ccmBasePlace.setArea(area);
				ccmBasePlace.setAdministrativeDivision(ccmPlaceCatering.getAdministrativeDivision());
				ccmBasePlace.setPlaceUse(placeUse);
				ccmBasePlace.setLeaderName(leaderName);
				ccmBasePlace.setLeaderIdCard(leaderIdCard);
				ccmBasePlace.setLeaderContact(leaderContact);
				ccmBasePlace.setCreateTime(createTime);
				ccmBasePlace.setKeyPoint(keyPoint);
				ccmBasePlace.setWorkerNumber(workerNumber);
				ccmBasePlace.setRelevanceOrg(relevanceOrg);
				ccmBasePlace.setPlaceArea(placeArea);
				ccmBasePlace.setPlaceName(placeName);
				ccmBasePlace.setGoverningBodyName(governingBodyName);


				ccmBasePlace.setCreateBy(new User(userId));
				ccmBasePlace.setUpdateBy(new User(userId));
				ccmBasePlace.setCreateDate(new Date());
				ccmBasePlace.setUpdateDate(new Date());

				if (null == ccmPlaceCatering.getCreateBy()) {
					ccmPlaceCatering.setCreateBy(new User(userId));
				}
				ccmPlaceCatering.setUpdateBy(new User(userId));
				String file = ccmPlaceCatering.getPlacePicture();
				if(StringUtils.isNotEmpty(file)) {
					if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
						ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
					}else {
						ccmBasePlace.setPlacePicture(file);
					}
				}
				ccmPlaceCatering.setBasePlaceId(ccmBasePlace.getId());
				ccmBasePlaceDao.insert(ccmBasePlace);
				ccmPlaceCatering.setCcmBasePlace(ccmBasePlace);
				ccmPlaceCatering.setType(type);
				ccmPlaceCatering.setUpdateDate(new Date());
				ccmPlaceCateringService.save(ccmPlaceCatering);
				result.setCode(CcmRestType.OK);
				result.setResult("成功");
			} else {
				CcmBasePlace ccmBasePlace1 = ccmBasePlaceService.get(ccmPlaceCatering.getBasePlaceId());
				if(ccmBasePlace1 != null) {
					CcmBasePlace ccmBasePlace = new CcmBasePlace();
					ccmBasePlace.setAddress(ccmPlaceCatering.getAddress());
					ccmBasePlace.setArea(ccmPlaceCatering.getArea());
					ccmBasePlace.setPlaceType("ccm_place_catering");
					ccmBasePlace.setPlaceUse(ccmPlaceCatering.getPlaceUse());
					ccmBasePlace.setLeaderName(ccmPlaceCatering.getLeaderName());
					ccmBasePlace.setAdministrativeDivision(ccmPlaceCatering.getAdministrativeDivision());
					ccmBasePlace.setLeaderIdCard(ccmPlaceCatering.getLeaderIdCard());
					ccmBasePlace.setLeaderContact(ccmPlaceCatering.getLeaderContact());
					ccmBasePlace.setCreateTime(ccmPlaceCatering.getCreateTime());
					ccmBasePlace.setKeyPoint(ccmPlaceCatering.getKeyPoint());
					ccmBasePlace.setWorkerNumber(ccmPlaceCatering.getWorkerNumber());
					ccmBasePlace.setRelevanceOrg(ccmPlaceCatering.getRelevanceOrg());
					ccmBasePlace.setPlaceArea(ccmPlaceCatering.getPlaceArea());
					ccmBasePlace.setPlaceName(ccmPlaceCatering.getPlaceName());
					ccmBasePlace.setGoverningBodyName(ccmPlaceCatering.getGoverningBodyName());

					ccmBasePlace.setCreateBy(new User(userId));
					ccmBasePlace.setUpdateBy(new User(userId));
					ccmBasePlace.setCreateDate(new Date());
					ccmBasePlace.setUpdateDate(new Date());

					if (null == ccmPlaceCatering.getCreateBy()) {
						ccmPlaceCatering.setCreateBy(new User(userId));
					}
					ccmPlaceCatering.setUpdateBy(new User(userId));
					String file = ccmPlaceCatering.getPlacePicture();
					if(StringUtils.isNotEmpty(file)) {
						if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
							ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
						}else {
							ccmBasePlace.setPlacePicture(file);
						}
					}
					ccmBasePlace.setId(ccmPlaceCatering.getBasePlaceId());
					ccmBasePlaceService.save(ccmBasePlace);
					ccmPlaceCatering.setCcmBasePlace(ccmBasePlace);
					ccmPlaceCatering.setType(type);
					ccmPlaceCatering.setUpdateDate(new Date());
					ccmPlaceCateringDao.update(ccmPlaceCatering);
					result.setCode(CcmRestType.OK);
					result.setResult("成功");
				}
			}
		} else if (placeType!= null && placeType.equals("ccm_place_traffic")) {
			if (null == ccmPlaceTraffic.getBasePlaceId() || "".equals(ccmPlaceTraffic.getBasePlaceId())) {
				CcmBasePlace ccmBasePlace = new CcmBasePlace();
				String id = UUID.randomUUID().toString();
				ccmBasePlace.setId(id);
				ccmBasePlace.setIsNewRecord(true);
				ccmBasePlace.setPlaceType("ccm_place_traffic");
				ccmBasePlace.setAddress(address);
				ccmBasePlace.setArea(area);
				ccmBasePlace.setAdministrativeDivision(ccmPlaceTraffic.getAdministrativeDivision());
				ccmBasePlace.setPlaceUse(placeUse);
				ccmBasePlace.setLeaderName(leaderName);
				ccmBasePlace.setLeaderIdCard(leaderIdCard);
				ccmBasePlace.setLeaderContact(leaderContact);
				ccmBasePlace.setCreateTime(createTime);
				ccmBasePlace.setKeyPoint(keyPoint);
				ccmBasePlace.setWorkerNumber(workerNumber);
				ccmBasePlace.setRelevanceOrg(relevanceOrg);
				ccmBasePlace.setPlaceArea(placeArea);
				ccmBasePlace.setPlaceName(placeName);
				ccmBasePlace.setGoverningBodyName(governingBodyName);

				ccmBasePlace.setCreateBy(new User(userId));
				ccmBasePlace.setUpdateBy(new User(userId));
				ccmBasePlace.setCreateDate(new Date());
				ccmBasePlace.setUpdateDate(new Date());

				if (null == ccmPlaceTraffic.getCreateBy()) {
					ccmPlaceTraffic.setCreateBy(new User(userId));
				}
				ccmPlaceTraffic.setUpdateBy(new User(userId));
				String file = ccmPlaceTraffic.getPlacePicture();
				if(StringUtils.isNotEmpty(file)) {
					if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
						ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
					}else {
						ccmBasePlace.setPlacePicture(file);
					}
				}
				ccmPlaceTraffic.setBasePlaceId(ccmBasePlace.getId());
				ccmBasePlaceDao.insert(ccmBasePlace);
				ccmPlaceTraffic.setCcmBasePlace(ccmBasePlace);
				ccmPlaceTraffic.setType(type);
				ccmPlaceTraffic.setUpdateDate(new Date());
				ccmPlaceTrafficService.save(ccmPlaceTraffic);
				result.setCode(CcmRestType.OK);
				result.setResult("成功");
			} else {
				CcmBasePlace ccmBasePlace1 = ccmBasePlaceService.get(ccmPlaceTraffic.getBasePlaceId());
				if(ccmBasePlace1 != null) {
					CcmBasePlace ccmBasePlace = new CcmBasePlace();
					ccmBasePlace.setAddress(ccmPlaceTraffic.getAddress());
					ccmBasePlace.setArea(ccmPlaceTraffic.getArea());
					ccmBasePlace.setPlaceUse(ccmPlaceTraffic.getPlaceUse());
					ccmBasePlace.setLeaderName(ccmPlaceTraffic.getLeaderName());
					ccmBasePlace.setPlaceType("ccm_place_traffic");
					ccmBasePlace.setAdministrativeDivision(ccmPlaceTraffic.getAdministrativeDivision());
					ccmBasePlace.setLeaderIdCard(ccmPlaceTraffic.getLeaderIdCard());
					ccmBasePlace.setLeaderContact(ccmPlaceTraffic.getLeaderContact());
					ccmBasePlace.setCreateTime(ccmPlaceTraffic.getCreateTime());
					ccmBasePlace.setKeyPoint(ccmPlaceTraffic.getKeyPoint());
					ccmBasePlace.setWorkerNumber(ccmPlaceTraffic.getWorkerNumber());
					ccmBasePlace.setRelevanceOrg(ccmPlaceTraffic.getRelevanceOrg());
					ccmBasePlace.setPlaceArea(ccmPlaceTraffic.getPlaceArea());
					ccmBasePlace.setPlaceName(ccmPlaceTraffic.getPlaceName());
					ccmBasePlace.setGoverningBodyName(ccmPlaceTraffic.getGoverningBodyName());

					ccmBasePlace.setCreateBy(new User(userId));
					ccmBasePlace.setUpdateBy(new User(userId));
					ccmBasePlace.setCreateDate(new Date());
					ccmBasePlace.setUpdateDate(new Date());

					if (null == ccmPlaceTraffic.getCreateBy()) {
						ccmPlaceTraffic.setCreateBy(new User(userId));
					}
					ccmPlaceTraffic.setUpdateBy(new User(userId));
					String file = ccmPlaceTraffic.getPlacePicture();
					if(StringUtils.isNotEmpty(file)) {
						if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
							ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
						}else {
							ccmBasePlace.setPlacePicture(file);
						}
					}
					ccmBasePlace.setId(ccmPlaceTraffic.getBasePlaceId());
					ccmBasePlaceService.save(ccmBasePlace);
					ccmPlaceTraffic.setCcmBasePlace(ccmBasePlace);
					ccmPlaceTraffic.setType(type);
					ccmPlaceTraffic.setUpdateDate(new Date());
					ccmPlaceTrafficDao.update(ccmPlaceTraffic);
					result.setCode(CcmRestType.OK);
					result.setResult("成功");
				}
			}
		} else if (placeType!= null && placeType.equals("ccm_place_hotel")) {
			if (null == ccmPlaceHotel.getBasePlaceId() || "".equals(ccmPlaceHotel.getBasePlaceId())) {
				CcmBasePlace ccmBasePlace = new CcmBasePlace();
				String id = UUID.randomUUID().toString();
				ccmBasePlace.setId(id);
				ccmBasePlace.setIsNewRecord(true);
				ccmBasePlace.setPlaceType("ccm_place_hotel");
				ccmBasePlace.setAddress(address);
				ccmBasePlace.setArea(area);
				ccmBasePlace.setAdministrativeDivision(ccmPlaceHotel.getAdministrativeDivision());
				ccmBasePlace.setPlaceUse(placeUse);
				ccmBasePlace.setLeaderName(leaderName);
				ccmBasePlace.setLeaderIdCard(leaderIdCard);
				ccmBasePlace.setLeaderContact(leaderContact);
				ccmBasePlace.setCreateTime(createTime);
				ccmBasePlace.setKeyPoint(keyPoint);
				ccmBasePlace.setWorkerNumber(workerNumber);
				ccmBasePlace.setRelevanceOrg(relevanceOrg);
				ccmBasePlace.setPlaceArea(placeArea);
				ccmBasePlace.setPlaceName(placeName);
				ccmBasePlace.setGoverningBodyName(governingBodyName);

				ccmBasePlace.setCreateBy(new User(userId));
				ccmBasePlace.setUpdateBy(new User(userId));
				ccmBasePlace.setCreateDate(new Date());
				ccmBasePlace.setUpdateDate(new Date());

				if (null == ccmPlaceHotel.getCreateBy()) {
					ccmPlaceHotel.setCreateBy(new User(userId));
				}
				ccmPlaceHotel.setUpdateBy(new User(userId));
				String file = ccmPlaceHotel.getPlacePicture();
				if(StringUtils.isNotEmpty(file)) {
					if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
						ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
					}else {
						ccmBasePlace.setPlacePicture(file);
					}
				}
				ccmPlaceHotel.setBasePlaceId(ccmBasePlace.getId());
				ccmBasePlaceDao.insert(ccmBasePlace);
				ccmPlaceHotel.setCcmBasePlace(ccmBasePlace);
				ccmPlaceHotel.setType(type);
				ccmPlaceHotel.setUpdateDate(new Date());
				ccmPlaceHotelService.save(ccmPlaceHotel);
				result.setCode(CcmRestType.OK);
				result.setResult("成功");
			} else {
				CcmBasePlace ccmBasePlace1 = ccmBasePlaceService.get(ccmPlaceHotel.getBasePlaceId());
				if(ccmBasePlace1 != null) {
					CcmBasePlace ccmBasePlace = new CcmBasePlace();
					ccmBasePlace.setAddress(ccmPlaceHotel.getAddress());
					ccmBasePlace.setArea(ccmPlaceHotel.getArea());
					ccmBasePlace.setPlaceUse(ccmPlaceHotel.getPlaceUse());
					ccmBasePlace.setPlaceType("ccm_place_hotel");
					ccmBasePlace.setLeaderName(ccmPlaceHotel.getLeaderName());
					ccmBasePlace.setAdministrativeDivision(ccmPlaceHotel.getAdministrativeDivision());
					ccmBasePlace.setLeaderIdCard(ccmPlaceHotel.getLeaderIdCard());
					ccmBasePlace.setLeaderContact(ccmPlaceHotel.getLeaderContact());
					ccmBasePlace.setCreateTime(ccmPlaceHotel.getCreateTime());
					ccmBasePlace.setKeyPoint(ccmPlaceHotel.getKeyPoint());
					ccmBasePlace.setWorkerNumber(ccmPlaceHotel.getWorkerNumber());
					ccmBasePlace.setRelevanceOrg(ccmPlaceHotel.getRelevanceOrg());
					ccmBasePlace.setPlaceArea(ccmPlaceHotel.getPlaceArea());
					ccmBasePlace.setPlaceName(ccmPlaceHotel.getPlaceName());
					ccmBasePlace.setGoverningBodyName(ccmPlaceHotel.getGoverningBodyName());

					ccmBasePlace.setCreateBy(new User(userId));
					ccmBasePlace.setUpdateBy(new User(userId));
					ccmBasePlace.setCreateDate(new Date());
					ccmBasePlace.setUpdateDate(new Date());

					if (null == ccmPlaceHotel.getCreateBy()) {
						ccmPlaceHotel.setCreateBy(new User(userId));
					}
					ccmPlaceHotel.setUpdateBy(new User(userId));
					String file = ccmPlaceHotel.getPlacePicture();
					if(StringUtils.isNotEmpty(file)) {
						if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
							ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
						}else {
							ccmBasePlace.setPlacePicture(file);
						}
					}
					ccmBasePlace.setId(ccmPlaceHotel.getBasePlaceId());
					ccmBasePlaceService.save(ccmBasePlace);
					ccmPlaceHotel.setCcmBasePlace(ccmBasePlace);
					ccmPlaceHotel.setType(type);
					ccmPlaceHotel.setUpdateDate(new Date());
					ccmPlaceHotelDao.update(ccmPlaceHotel);
					result.setCode(CcmRestType.OK);
					result.setResult("成功");
				}
			}
		} else if (placeType!= null && placeType.equals("ccm_place_scenic")) {
			if (null == ccmPlaceScenic.getBasePlaceId() || "".equals(ccmPlaceScenic.getBasePlaceId())) {
				CcmBasePlace ccmBasePlace = new CcmBasePlace();
				String id = UUID.randomUUID().toString();
				ccmBasePlace.setId(id);
				ccmBasePlace.setIsNewRecord(true);
				ccmBasePlace.setPlaceType("ccm_place_scenic");
				ccmBasePlace.setAddress(address);
				ccmBasePlace.setArea(area);
				ccmBasePlace.setAdministrativeDivision(ccmPlaceScenic.getAdministrativeDivision());
				ccmBasePlace.setPlaceUse(placeUse);
				ccmBasePlace.setLeaderName(leaderName);
				ccmBasePlace.setLeaderIdCard(leaderIdCard);
				ccmBasePlace.setLeaderContact(leaderContact);
				ccmBasePlace.setCreateTime(createTime);
				ccmBasePlace.setKeyPoint(keyPoint);
				ccmBasePlace.setWorkerNumber(workerNumber);
				ccmBasePlace.setRelevanceOrg(relevanceOrg);
				ccmBasePlace.setPlaceArea(placeArea);
				ccmBasePlace.setPlaceName(placeName);
				ccmBasePlace.setGoverningBodyName(governingBodyName);

				ccmBasePlace.setCreateBy(new User(userId));
				ccmBasePlace.setUpdateBy(new User(userId));
				ccmBasePlace.setCreateDate(new Date());
				ccmBasePlace.setUpdateDate(new Date());

				if (null == ccmPlaceScenic.getCreateBy()) {
					ccmPlaceScenic.setCreateBy(new User(userId));
				}
				ccmPlaceScenic.setUpdateBy(new User(userId));
				String file = ccmPlaceScenic.getPlacePicture();
				if(StringUtils.isNotEmpty(file)) {
					if (file.split(Global.getConfig("FILE_UPLOAD_URL")).length > 0) {
						ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
					} else {
						ccmBasePlace.setPlacePicture(file);
					}
				}
				ccmPlaceScenic.setBasePlaceId(ccmBasePlace.getId());
				ccmBasePlaceDao.insert(ccmBasePlace);
				ccmPlaceScenic.setCcmBasePlace(ccmBasePlace);
				ccmPlaceScenic.setType(type);
				ccmPlaceScenic.setUpdateDate(new Date());
				ccmPlaceScenicService.save(ccmPlaceScenic);
				result.setCode(CcmRestType.OK);
				result.setResult("成功");
			} else {
				CcmBasePlace ccmBasePlace1 = ccmBasePlaceService.get(ccmPlaceScenic.getBasePlaceId());
				if(ccmBasePlace1 != null) {
					CcmBasePlace ccmBasePlace = new CcmBasePlace();
					ccmBasePlace.setAddress(ccmPlaceScenic.getAddress());
					ccmBasePlace.setArea(ccmPlaceScenic.getArea());
					ccmBasePlace.setPlaceType("ccm_place_scenic");
					ccmBasePlace.setPlaceUse(ccmPlaceScenic.getPlaceUse());
					ccmBasePlace.setLeaderName(ccmPlaceScenic.getLeaderName());
					ccmBasePlace.setAdministrativeDivision(ccmPlaceScenic.getAdministrativeDivision());
					ccmBasePlace.setLeaderIdCard(ccmPlaceScenic.getLeaderIdCard());
					ccmBasePlace.setLeaderContact(ccmPlaceScenic.getLeaderContact());
					ccmBasePlace.setCreateTime(ccmPlaceScenic.getCreateTime());
					ccmBasePlace.setKeyPoint(ccmPlaceScenic.getKeyPoint());
					ccmBasePlace.setWorkerNumber(ccmPlaceScenic.getWorkerNumber());
					ccmBasePlace.setRelevanceOrg(ccmPlaceScenic.getRelevanceOrg());
					ccmBasePlace.setPlaceArea(ccmPlaceScenic.getPlaceArea());
					ccmBasePlace.setPlaceName(ccmPlaceScenic.getPlaceName());
					ccmBasePlace.setGoverningBodyName(ccmPlaceScenic.getGoverningBodyName());

					ccmBasePlace.setCreateBy(new User(userId));
					ccmBasePlace.setUpdateBy(new User(userId));
					ccmBasePlace.setCreateDate(new Date());
					ccmBasePlace.setUpdateDate(new Date());

					if (null == ccmPlaceScenic.getCreateBy()) {
						ccmPlaceScenic.setCreateBy(new User(userId));
					}
					ccmPlaceScenic.setUpdateBy(new User(userId));
					String file = ccmPlaceScenic.getPlacePicture();
					if(StringUtils.isNotEmpty(file)) {
						if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
							ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
						}else {
							ccmBasePlace.setPlacePicture(file);
						}
					}
					ccmBasePlace.setId(ccmPlaceScenic.getBasePlaceId());
					ccmBasePlaceService.save(ccmBasePlace);
					ccmPlaceScenic.setCcmBasePlace(ccmBasePlace);
					ccmPlaceScenic.setType(type);
					ccmPlaceScenic.setUpdateDate(new Date());
					ccmPlaceScenicDao.update(ccmPlaceScenic);
					result.setCode(CcmRestType.OK);
					result.setResult("成功");
				}
			}
		} else if (placeType!= null && placeType.equals("ccm_place_religion")) {
			if (null == ccmPlaceReligion.getBasePlaceId() || "".equals(ccmPlaceReligion.getBasePlaceId())) {
				CcmBasePlace ccmBasePlace = new CcmBasePlace();
				String id = UUID.randomUUID().toString();
				ccmBasePlace.setId(id);
				ccmBasePlace.setIsNewRecord(true);
				ccmBasePlace.setPlaceType("ccm_place_religion");
				ccmBasePlace.setAddress(address);
				ccmBasePlace.setArea(area);
				ccmBasePlace.setAdministrativeDivision(ccmPlaceReligion.getAdministrativeDivision());
				ccmBasePlace.setPlaceUse(placeUse);
				ccmBasePlace.setLeaderName(leaderName);
				ccmBasePlace.setLeaderIdCard(leaderIdCard);
				ccmBasePlace.setLeaderContact(leaderContact);
				ccmBasePlace.setCreateTime(createTime);
				ccmBasePlace.setKeyPoint(keyPoint);
				ccmBasePlace.setWorkerNumber(workerNumber);
				ccmBasePlace.setRelevanceOrg(relevanceOrg);
				ccmBasePlace.setPlaceArea(placeArea);
				ccmBasePlace.setPlaceName(placeName);
				ccmBasePlace.setGoverningBodyName(governingBodyName);

				ccmBasePlace.setCreateBy(new User(userId));
				ccmBasePlace.setUpdateBy(new User(userId));
				ccmBasePlace.setCreateDate(new Date());
				ccmBasePlace.setUpdateDate(new Date());

				if (null == ccmPlaceReligion.getCreateBy()) {
					ccmPlaceReligion.setCreateBy(new User(userId));
				}
				ccmPlaceReligion.setUpdateBy(new User(userId));
				String file = ccmPlaceReligion.getPlacePicture();
				if(StringUtils.isNotEmpty(file)) {
					if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
						ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
					}else {
						ccmBasePlace.setPlacePicture(file);
					}
				}
				ccmPlaceReligion.setBasePlaceId(ccmBasePlace.getId());
				ccmBasePlaceDao.insert(ccmBasePlace);
				ccmPlaceReligion.setCcmBasePlace(ccmBasePlace);
				ccmPlaceReligion.setType(type);
				ccmPlaceReligion.setUpdateDate(new Date());
				ccmPlaceReligionService.save(ccmPlaceReligion);
				result.setCode(CcmRestType.OK);
				result.setResult("成功");
			} else {
				CcmBasePlace ccmBasePlace1 = ccmBasePlaceService.get(ccmPlaceReligion.getBasePlaceId());
				if(ccmBasePlace1 != null) {
					CcmBasePlace ccmBasePlace = new CcmBasePlace();
					ccmBasePlace.setAddress(ccmPlaceReligion.getAddress());
					ccmBasePlace.setArea(ccmPlaceReligion.getArea());
					ccmBasePlace.setPlaceType("ccm_place_religion");
					ccmBasePlace.setPlaceUse(ccmPlaceReligion.getPlaceUse());
					ccmBasePlace.setLeaderName(ccmPlaceReligion.getLeaderName());
					ccmBasePlace.setAdministrativeDivision(ccmPlaceReligion.getAdministrativeDivision());
					ccmBasePlace.setLeaderIdCard(ccmPlaceReligion.getLeaderIdCard());
					ccmBasePlace.setLeaderContact(ccmPlaceReligion.getLeaderContact());
					ccmBasePlace.setCreateTime(ccmPlaceReligion.getCreateTime());
					ccmBasePlace.setKeyPoint(ccmPlaceReligion.getKeyPoint());
					ccmBasePlace.setWorkerNumber(ccmPlaceReligion.getWorkerNumber());
					ccmBasePlace.setRelevanceOrg(ccmPlaceReligion.getRelevanceOrg());
					ccmBasePlace.setPlaceArea(ccmPlaceReligion.getPlaceArea());
					ccmBasePlace.setPlaceName(ccmPlaceReligion.getPlaceName());
					ccmBasePlace.setGoverningBodyName(ccmPlaceReligion.getGoverningBodyName());

					ccmBasePlace.setCreateBy(new User(userId));
					ccmBasePlace.setUpdateBy(new User(userId));
					ccmBasePlace.setCreateDate(new Date());
					ccmBasePlace.setUpdateDate(new Date());

					if (null == ccmPlaceReligion.getCreateBy()) {
						ccmPlaceReligion.setCreateBy(new User(userId));
					}
					ccmPlaceReligion.setUpdateBy(new User(userId));
					String file = ccmPlaceReligion.getPlacePicture();
					if(StringUtils.isNotEmpty(file)) {
						if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
							ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
						}else {
							ccmBasePlace.setPlacePicture(file);
						}
					}
					ccmBasePlace.setId(ccmPlaceReligion.getBasePlaceId());
					ccmBasePlaceService.save(ccmBasePlace);
					ccmPlaceReligion.setCcmBasePlace(ccmBasePlace);
					ccmPlaceReligion.setType(type);
					ccmPlaceReligion.setUpdateDate(new Date());
					ccmPlaceReligionDao.update(ccmPlaceReligion);
					result.setCode(CcmRestType.OK);
					result.setResult("成功");
				}
			}
		} else if (placeType!= null && placeType.equals("ccm_place_chemical")) {
			if (null == ccmPlaceChemical.getBasePlaceId() || "".equals(ccmPlaceChemical.getBasePlaceId())) {
				CcmBasePlace ccmBasePlace = new CcmBasePlace();
				String id = UUID.randomUUID().toString();
				ccmBasePlace.setId(id);
				ccmBasePlace.setIsNewRecord(true);
				ccmBasePlace.setPlaceType("ccm_place_chemical");
				ccmBasePlace.setAddress(address);
				ccmBasePlace.setArea(area);
				ccmBasePlace.setAdministrativeDivision(ccmPlaceChemical.getAdministrativeDivision());
				ccmBasePlace.setPlaceUse(placeUse);
				ccmBasePlace.setLeaderName(leaderName);
				ccmBasePlace.setLeaderIdCard(leaderIdCard);
				ccmBasePlace.setLeaderContact(leaderContact);
				ccmBasePlace.setCreateTime(createTime);
				ccmBasePlace.setKeyPoint(keyPoint);
				ccmBasePlace.setWorkerNumber(workerNumber);
				ccmBasePlace.setRelevanceOrg(relevanceOrg);
				ccmBasePlace.setPlaceArea(placeArea);
				ccmBasePlace.setPlaceName(placeName);
				ccmBasePlace.setGoverningBodyName(governingBodyName);

				ccmBasePlace.setCreateBy(new User(userId));
				ccmBasePlace.setUpdateBy(new User(userId));
				ccmBasePlace.setCreateDate(new Date());
				ccmBasePlace.setUpdateDate(new Date());

				if (null == ccmPlaceChemical.getCreateBy()) {
					ccmPlaceChemical.setCreateBy(new User(userId));
				}
				ccmPlaceChemical.setUpdateBy(new User(userId));
				String file = ccmPlaceChemical.getPlacePicture();
				if(StringUtils.isNotEmpty(file)) {
					if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
						ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
					}else {
						ccmBasePlace.setPlacePicture(file);
					}
				}
				ccmPlaceChemical.setBasePlaceId(ccmBasePlace.getId());
				ccmBasePlaceDao.insert(ccmBasePlace);
				ccmPlaceChemical.setCcmBasePlace(ccmBasePlace);
				ccmPlaceChemical.setType(type);
				ccmPlaceChemical.setUpdateDate(new Date());
				ccmPlaceChemicalService.save(ccmPlaceChemical);
				result.setCode(CcmRestType.OK);
				result.setResult("成功");
			} else {
				CcmBasePlace ccmBasePlace1 = ccmBasePlaceService.get(ccmPlaceChemical.getBasePlaceId());
				if(ccmBasePlace1 != null) {
					CcmBasePlace ccmBasePlace = new CcmBasePlace();
					ccmBasePlace.setAddress(ccmPlaceChemical.getAddress());
					ccmBasePlace.setArea(ccmPlaceChemical.getArea());
					ccmBasePlace.setPlaceType("ccm_place_chemical");
					ccmBasePlace.setPlaceUse(ccmPlaceChemical.getPlaceUse());
					ccmBasePlace.setLeaderName(ccmPlaceChemical.getLeaderName());
					ccmBasePlace.setAdministrativeDivision(ccmPlaceChemical.getAdministrativeDivision());
					ccmBasePlace.setLeaderIdCard(ccmPlaceChemical.getLeaderIdCard());
					ccmBasePlace.setLeaderContact(ccmPlaceChemical.getLeaderContact());
					ccmBasePlace.setCreateTime(ccmPlaceChemical.getCreateTime());
					ccmBasePlace.setKeyPoint(ccmPlaceChemical.getKeyPoint());
					ccmBasePlace.setWorkerNumber(ccmPlaceChemical.getWorkerNumber());
					ccmBasePlace.setRelevanceOrg(ccmPlaceChemical.getRelevanceOrg());
					ccmBasePlace.setPlaceArea(ccmPlaceChemical.getPlaceArea());
					ccmBasePlace.setPlaceName(ccmPlaceChemical.getPlaceName());
					ccmBasePlace.setGoverningBodyName(ccmPlaceChemical.getGoverningBodyName());

					ccmBasePlace.setCreateBy(new User(userId));
					ccmBasePlace.setUpdateBy(new User(userId));
					ccmBasePlace.setCreateDate(new Date());
					ccmBasePlace.setUpdateDate(new Date());

					if (null == ccmPlaceChemical.getCreateBy()) {
						ccmPlaceChemical.setCreateBy(new User(userId));
					}
					ccmPlaceChemical.setUpdateBy(new User(userId));
					String file = ccmPlaceChemical.getPlacePicture();
					if(StringUtils.isNotEmpty(file)) {
						if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
							ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
						}else {
							ccmBasePlace.setPlacePicture(file);
						}
					}
					ccmBasePlace.setId(ccmPlaceChemical.getBasePlaceId());
					ccmBasePlaceService.save(ccmBasePlace);
					ccmPlaceChemical.setCcmBasePlace(ccmBasePlace);
					ccmPlaceChemical.setType(type);
					ccmPlaceChemical.setUpdateDate(new Date());
					ccmPlaceChemicalDao.update(ccmPlaceChemical);
					result.setCode(CcmRestType.OK);
					result.setResult("成功");
				}
			}
		} else if (placeType!= null && placeType.equals("ccm_place_financial")) {
			if (null == ccmPlaceFinancial.getBasePlaceId() || "".equals(ccmPlaceFinancial.getBasePlaceId())) {
				CcmBasePlace ccmBasePlace = new CcmBasePlace();
				String id = UUID.randomUUID().toString();
				ccmBasePlace.setId(id);
				ccmBasePlace.setIsNewRecord(true);
				ccmBasePlace.setPlaceType("ccm_place_financial");
				ccmBasePlace.setAddress(address);
				ccmBasePlace.setArea(area);
				ccmBasePlace.setAdministrativeDivision(ccmPlaceFinancial.getAdministrativeDivision());
				ccmBasePlace.setPlaceUse(placeUse);
				ccmBasePlace.setLeaderName(leaderName);
				ccmBasePlace.setLeaderIdCard(leaderIdCard);
				ccmBasePlace.setLeaderContact(leaderContact);
				ccmBasePlace.setCreateTime(createTime);
				ccmBasePlace.setKeyPoint(keyPoint);
				ccmBasePlace.setWorkerNumber(workerNumber);
				ccmBasePlace.setRelevanceOrg(relevanceOrg);
				ccmBasePlace.setPlaceArea(placeArea);
				ccmBasePlace.setPlaceName(placeName);
				ccmBasePlace.setGoverningBodyName(governingBodyName);

				ccmBasePlace.setCreateBy(new User(userId));
				ccmBasePlace.setUpdateBy(new User(userId));
				ccmBasePlace.setCreateDate(new Date());
				ccmBasePlace.setUpdateDate(new Date());

				if (null == ccmPlaceFinancial.getCreateBy()) {
					ccmPlaceFinancial.setCreateBy(new User(userId));
				}
				ccmPlaceFinancial.setUpdateBy(new User(userId));
				String file = ccmPlaceFinancial.getPlacePicture();
				if(StringUtils.isNotEmpty(file)) {
					if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
						ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
					}else {
						ccmBasePlace.setPlacePicture(file);
					}
				}
				ccmPlaceFinancial.setBasePlaceId(ccmBasePlace.getId());
				ccmBasePlaceDao.insert(ccmBasePlace);
				ccmPlaceFinancial.setCcmBasePlace(ccmBasePlace);
				ccmPlaceFinancial.setType(type);
				ccmPlaceFinancial.setUpdateDate(new Date());
				ccmPlaceFinancialService.save(ccmPlaceFinancial);
				result.setCode(CcmRestType.OK);
				result.setResult("成功");
			} else {
				CcmBasePlace ccmBasePlace1 = ccmBasePlaceService.get(ccmPlaceFinancial.getBasePlaceId());
				if(ccmBasePlace1 != null) {
					CcmBasePlace ccmBasePlace = new CcmBasePlace();
					ccmBasePlace.setPlaceType("ccm_place_financial");
					ccmBasePlace.setAddress(ccmPlaceFinancial.getAddress());
					ccmBasePlace.setArea(ccmPlaceFinancial.getArea());
					ccmBasePlace.setPlaceUse(ccmPlaceFinancial.getPlaceUse());
					ccmBasePlace.setLeaderName(ccmPlaceFinancial.getLeaderName());
					ccmBasePlace.setAdministrativeDivision(ccmPlaceFinancial.getAdministrativeDivision());
					ccmBasePlace.setLeaderIdCard(ccmPlaceFinancial.getLeaderIdCard());
					ccmBasePlace.setLeaderContact(ccmPlaceFinancial.getLeaderContact());
					ccmBasePlace.setCreateTime(ccmPlaceFinancial.getCreateTime());
					ccmBasePlace.setKeyPoint(ccmPlaceFinancial.getKeyPoint());
					ccmBasePlace.setWorkerNumber(ccmPlaceFinancial.getWorkerNumber());
					ccmBasePlace.setRelevanceOrg(ccmPlaceFinancial.getRelevanceOrg());
					ccmBasePlace.setPlaceArea(ccmPlaceFinancial.getPlaceArea());
					ccmBasePlace.setPlaceName(ccmPlaceFinancial.getPlaceName());

					ccmBasePlace.setCreateBy(new User(userId));
					ccmBasePlace.setUpdateBy(new User(userId));
					ccmBasePlace.setCreateDate(new Date());
					ccmBasePlace.setUpdateDate(new Date());

					if (null == ccmPlaceFinancial.getCreateBy()) {
						ccmPlaceFinancial.setCreateBy(new User(userId));
					}
					ccmPlaceFinancial.setUpdateBy(new User(userId));
					ccmBasePlace.setGoverningBodyName(ccmPlaceFinancial.getGoverningBodyName());
					String file = ccmPlaceFinancial.getPlacePicture();
					if(StringUtils.isNotEmpty(file)) {
						if(file.contains(Global.getConfig("FILE_UPLOAD_URL"))) {
							ccmBasePlace.setPlacePicture(file.split(Global.getConfig("FILE_UPLOAD_URL"))[1]);
						}else {
							ccmBasePlace.setPlacePicture(file);
						}
					}
					ccmBasePlace.setId(ccmPlaceFinancial.getBasePlaceId());
					ccmBasePlaceService.save(ccmBasePlace);
					ccmPlaceFinancial.setCcmBasePlace(ccmBasePlace);
					ccmPlaceFinancial.setType(type);
					ccmPlaceFinancial.setUpdateDate(new Date());
					ccmPlaceFinancialDao.update(ccmPlaceFinancial);
					result.setCode(CcmRestType.OK);
					result.setResult("成功");
				}
			}
		}
		return result;
	}
}


