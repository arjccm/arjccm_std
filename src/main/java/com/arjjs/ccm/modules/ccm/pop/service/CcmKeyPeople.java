package com.arjjs.ccm.modules.ccm.pop.service;

import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.house.entity.CcmHouseKym;
import com.arjjs.ccm.modules.ccm.house.entity.CcmHouseRectification;
import com.arjjs.ccm.modules.ccm.house.entity.CcmHouseRelease;
import com.arjjs.ccm.modules.ccm.house.service.CcmHouseKymService;
import com.arjjs.ccm.modules.ccm.house.service.CcmHouseRectificationService;
import com.arjjs.ccm.modules.ccm.house.service.CcmHouseReleaseService;
import com.arjjs.ccm.modules.pbs.sys.utils.UserUtils;
import com.arjjs.ccm.modules.sys.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @Auther: szl
 * @Date: 2021-01-13
 */

@Service
public class CcmKeyPeople extends BaseController {

    @Autowired
    private CcmHouseRectificationService ccmHouseRectificationService;
    @Autowired
    private CcmHouseReleaseService ccmHouseReleaseService;
    @Autowired
    private CcmHouseKymService ccmHouseKymService;


    public void updateKeyPeopleStatus(){
        //社区矫正人员到期后转为刑满释放人员
        communityCorrectionPeople();
        //重点青少年年满25周岁取消关注
        keyAdolescent();
    }

    @Transactional(readOnly = false)
    public void communityCorrectionPeople(){
        List<CcmHouseRectification> rectificationList = ccmHouseRectificationService.getRectificationByDate(new Date());
        for (CcmHouseRectification ccmHouseRectification : rectificationList) {
            CcmHouseRelease houseRelease = ccmHouseReleaseService.getReleaseByPeopleId(ccmHouseRectification.getPeopleId());
            if (houseRelease == null){
                CcmHouseRelease ccmHouseRelease = new CcmHouseRelease();
                ccmHouseRelease = addCcmHouseRelease(ccmHouseRelease,ccmHouseRectification);
                ccmHouseReleaseService.save(ccmHouseRelease);
            }
            ccmHouseRectification.setAtteType("04");
            ccmHouseRectification.setUpdateDate(new Date());
            ccmHouseRectification.setIsNewRecord(false);
            User user = new User();
            user.setId("1");
            ccmHouseRectification.setCreateBy(user);
            ccmHouseRectification.setUpdateBy(user);
            ccmHouseRectificationService.save(ccmHouseRectification);
        }
    }

    @Transactional(readOnly = false)
    public void keyAdolescent(){
        List<CcmHouseKym> houseKymList = ccmHouseKymService.getListByAge(new Date());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        for (CcmHouseKym ccmHouseKym : houseKymList) {
            ccmHouseKym.setAtteType("04");
            ccmHouseKym.setUpdateDate(new Date());
            ccmHouseKym.setIsNewRecord(false);
            User user = new User();
            user.setId("1");
            ccmHouseKym.setCreateBy(user);
            ccmHouseKym.setUpdateBy(user);
            ccmHouseKym.setRemarks(simpleDateFormat.format(new Date())+"因年满25周岁自动取消关注");
            ccmHouseKymService.save(ccmHouseKym);
        }
    }

    public CcmHouseRelease addCcmHouseRelease(CcmHouseRelease houseRelease,CcmHouseRectification ccmHouseRectification){
        houseRelease.setId(UUID.randomUUID().toString());
        houseRelease.setPeopleId(ccmHouseRectification.getPeopleId());
        houseRelease.setRecidivism(ccmHouseRectification.getReoffend().toString());
        houseRelease.setOrigCha(ccmHouseRectification.getReofCharge());
        houseRelease.setAtteType(ccmHouseRectification.getAtteType());
        houseRelease.setSentence(ccmHouseRectification.getOrigCharge());
        houseRelease.setServinGplace(ccmHouseRectification.getRectPlace());
        houseRelease.setReleDate(ccmHouseRectification.getRectBegin());
        houseRelease.setRisk("");
        houseRelease.setJoinDate(new Date());
        houseRelease.setJoinCond("");
        houseRelease.setPlaceDate(new Date());
        houseRelease.setPlacement("");
        houseRelease.setNotPlace("");
        houseRelease.setHelpCase("");
        houseRelease.setReoffend(ccmHouseRectification.getReoffend());
        houseRelease.setReofCharge(ccmHouseRectification.getReofCharge());
        User user = new User();
        user.setId("1");
        houseRelease.setCreateBy(user);
        houseRelease.setCreateDate(new Date());
        houseRelease.setUpdateBy(user);
        houseRelease.setUpdateDate(new Date());
        houseRelease.setDelFlag("0");
        houseRelease.setIsNewRecord(true);
        return houseRelease;
    }
}
