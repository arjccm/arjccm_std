package com.arjjs.ccm.modules.ccm.rest.web;

import com.alibaba.fastjson.JSONObject;
import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.house.entity.CcmExpireUser;
import com.arjjs.ccm.modules.ccm.house.entity.CcmIntervalPeople;
import com.arjjs.ccm.modules.ccm.house.service.CcmHouseEmphasisService;
import com.arjjs.ccm.modules.ccm.message.entity.CcmMessage;
import com.arjjs.ccm.modules.ccm.message.service.CcmMessageService;
import com.arjjs.ccm.modules.ccm.org.entity.CcmOrgNpse;
import com.arjjs.ccm.modules.ccm.org.service.CcmOrgAreaService;
import com.arjjs.ccm.modules.ccm.org.service.CcmOrgNpseService;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeople;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPeopleService;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPopTenantService;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.ccm.sys.entity.SysConfig;
import com.arjjs.ccm.modules.ccm.sys.service.SysConfigService;
import com.arjjs.ccm.modules.pbs.sys.utils.UserUtils;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.tool.SearchTab;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * app首页数据展示
 */
@Controller
@RequestMapping(value = "${appPath}/rest/Data")
@Api(description = "首页数据展示")
public class CcmRestData extends BaseController {

    @Autowired
    private CcmMessageService ccmMessageService;
    @Autowired
    private CcmHouseEmphasisService ccmHouseEmphasisService;
    @Autowired
    private SysConfigService sysConfigService;
    @Autowired
    private CcmPeopleService ccmPeopleService;
    @Autowired
    private CcmOrgAreaService ccmOrgAreaService;
    @Autowired
    private CcmPopTenantService ccmPopTenantService;
    @Autowired
    private CcmOrgNpseService ccmOrgNpseService;

    @ResponseBody
    @RequestMapping(value="/getData", method = RequestMethod.GET)
    public CcmRestResult get(String userId, HttpServletRequest req, HttpServletResponse resp) throws IOException {

        logger.info("当前正在执行的类名为》》》"+Thread.currentThread().getStackTrace()[1].getClassName());
        logger.info("当前正在执行的方法名为》》》"+Thread.currentThread().getStackTrace()[1].getMethodName());
        logger.info("当前方法运行参数为》》》id : " + userId + "  userId : " + userId);
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
        CcmOrgNpse ccmOrgNpse = new CcmOrgNpse();
        ccmOrgNpse.setCheckUser(sessionUser);
        Map<String, Object> map = new HashMap<>();
        String areaId = ccmOrgAreaService.getAreaId(userId);
        SearchTab peopleData = ccmPeopleService.getData(areaId);
        Integer peoNum = ccmOrgAreaService.getPeoNum(userId);

        //户籍，流动，外籍，未落户人口数量
        Integer value1 = Integer.valueOf(peopleData.getValue1());
        Integer value2 = Integer.valueOf(peopleData.getValue2());
        Integer value3 = Integer.valueOf(peopleData.getValue3());
        Integer value4 = Integer.valueOf(peopleData.getValue4());
        //已采集人数
        Integer gatherNum=value1+value2+value3+value4;
        //待采集人数
        Integer noGatherNum;
        if (peoNum<gatherNum){
            noGatherNum=0;
        }else {
            noGatherNum=peoNum-gatherNum;
        }
        //特殊人群
        SearchTab specialNum = ccmPeopleService.getSpecialNum(areaId);
        Integer s1 = Integer.valueOf(specialNum.getValue1());
        Integer s2 = Integer.valueOf(specialNum.getValue2());
        Integer s3 = Integer.valueOf(specialNum.getValue3());
        Integer s4 = Integer.valueOf(specialNum.getValue4());
        Integer s5 = Integer.valueOf(specialNum.getValue5());
        Integer s6 = Integer.valueOf(specialNum.getValue6());
        Integer s7 = Integer.valueOf(specialNum.getValue7());
        Integer s8 = Integer.valueOf(specialNum.getValue8());
        Integer s9 = Integer.valueOf(specialNum.getValue9());
        Integer s10 = Integer.valueOf(specialNum.getValue10());
        Integer specialPeople=s1+s2+s3+s4+s5+s6+s7+s8+s9+s10;
        Map<String, Integer> map1 = listSetting(areaId);
        //走访记录
        Integer interview=map1.get("interview");
        //已走访
        Integer alreadyInterview=map1.get("alreadyInterview");
        SearchTab popTenantNum = ccmPopTenantService.getPopTenantNum(areaId);
        //房屋
        Integer houseNum=Integer.valueOf(popTenantNum.getValue1());
        //出租房
        Integer rentalHousing=Integer.valueOf(popTenantNum.getValue2());;
        //单位
        List<CcmOrgNpse> list = ccmOrgNpseService.findList(ccmOrgNpse);
        Integer organization=list.size();
        //问题处理
        Integer issueNum=40;
        //已处理问题
        Integer alreadyIssue=12;
        map.put("gatherNum",gatherNum);
        map.put("noGatherNum",noGatherNum);
        map.put("specialPeople",specialPeople);
        map.put("interview",interview);
        map.put("alreadyInterview",alreadyInterview);
        map.put("houseNum",houseNum);
        map.put("rentalHousing",rentalHousing);
        map.put("organization",organization);
        map.put("issueNum",issueNum);
        map.put("alreadyIssue",alreadyIssue);
        result.setCode(CcmRestType.OK);
        result.setResult(map);
        return result;
    }


    public Map<String, Integer> listSetting(String areaId) {
        SysConfig sysConfig = sysConfigService.get("key_personnel_notice_info_setting");
        Integer interview=0;
        Integer alreadyInterview=0;
        Map<String, Integer> map = new HashMap<>();
        if(sysConfig != null) {
            JSONObject paramObject = JSONObject.parseObject(sysConfig.getParamStr());
            Iterator<String> it = paramObject.keySet().iterator();
            Map<String,List<CcmIntervalPeople>> mapList = Maps.newHashMap();
            while (it.hasNext()) {
                String type = it.next();
                JSONObject jsonObject = paramObject.getJSONObject(type);
                if(jsonObject.containsKey("sendInfo")) {
                    String sendInfo = jsonObject.getString("sendInfo");
                    if(StringUtils.isNotBlank(sendInfo) && sendInfo.equals("1")) {
                        if(jsonObject.containsKey("timeInterval")) {
                            String timeInterval = jsonObject.getString("timeInterval");
                            if(StringUtils.isNotBlank(timeInterval)) {
                                CcmPeople ccmPeople = new CcmPeople();
                                int interval = Integer.parseInt(timeInterval);
                                ccmPeople.setTimeInterval(interval);
                                List<CcmIntervalPeople> list = Lists.newArrayList();
                                String typeNmae = null;
                                String tableName = null;
                                if(type.equals("ccmHouseAids")) {
                                    typeNmae = "艾滋病患者";
                                    tableName = "ccm_house_aids";
                                }else if(type.equals("ccmHouseRelease")) {
                                    typeNmae = "安置帮教";
                                    tableName = "ccm_house_release";
                                }else if(type.equals("ccmHouseDangerous")) {
                                    typeNmae = "危险品从业者";
                                    tableName = "ccm_house_dangerous";
                                }else if(type.equals("ccmSeriousCriminalOffense")) {
                                    typeNmae = "严重刑事犯罪活动嫌疑";
                                    tableName = "ccm_serious_criminal_offense";
                                }else if(type.equals("ccmHarmNationalSecurity")) {
                                    typeNmae = "危害国家安全活动嫌疑";
                                    tableName = "ccm_harm_national_security";
                                }else if(type.equals("ccmHouseKym")) {
                                    typeNmae = "重点青少年";
                                    tableName = "ccm_house_kym";
                                }else if(type.equals("ccmHouseDeliberatelyIllegal")) {
                                    typeNmae = "故意违法刑释不足5年";
                                    tableName = "ccm_house_deliberately_illegal";
                                }else if(type.equals("ccmHouseDispute")) {
                                    typeNmae = "闹事行凶报复嫌疑";
                                    tableName = "ccm_house_dispute";
                                }else if(type.equals("ccmHouseDrugs")) {
                                    typeNmae = "吸毒人员";
                                    tableName = "ccm_house_drugs";
                                }else if(type.equals("ccmHousePetition")) {
                                    typeNmae = "重点上访";
                                    tableName = "ccm_house_petition";
                                }else if(type.equals("ccmHousePsychogeny")) {
                                    typeNmae = "肇事肇祸等严重精神障碍患者";
                                    tableName = "ccm_house_psychogeny";
                                }else if(type.equals("ccmHouseRectification")) {
                                    typeNmae = "社区矫正";
                                    tableName = "ccm_house_rectification";
                                }else if(type.equals("ccmHouseHeresy")) {
                                    typeNmae = "涉教人员";
                                    tableName = "ccm_house_heresy";
                                }else {
                                    continue;
                                }
                                ccmPeople.setTableName(tableName);
                                /*list = ccmHouseEmphasisService.findExpirePeople(ccmPeople);*/
                                //本周走访
                                Integer findinterview = ccmHouseEmphasisService.findExpirePeopleByUser(interval,tableName,areaId);
                                interview=interview+findinterview;
                                //已走访
                                Integer findalreadyInterview = ccmHouseEmphasisService.findalreadyInterview(tableName,areaId);
                                alreadyInterview=alreadyInterview+findalreadyInterview;
                            }
                        }
                    }
                }
            }
        }
        map.put("interview",interview);
        map.put("alreadyInterview",alreadyInterview);
        return map;
    }
}
