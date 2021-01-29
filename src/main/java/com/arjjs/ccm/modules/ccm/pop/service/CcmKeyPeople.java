package com.arjjs.ccm.modules.ccm.pop.service;

import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.house.entity.CcmExpireUser;
import com.arjjs.ccm.modules.ccm.house.entity.CcmHouseKym;
import com.arjjs.ccm.modules.ccm.house.entity.CcmHouseRectification;
import com.arjjs.ccm.modules.ccm.house.entity.CcmHouseRelease;
import com.arjjs.ccm.modules.ccm.house.service.CcmHouseEmphasisService;
import com.arjjs.ccm.modules.ccm.house.service.CcmHouseKymService;
import com.arjjs.ccm.modules.ccm.house.service.CcmHouseRectificationService;
import com.arjjs.ccm.modules.ccm.house.service.CcmHouseReleaseService;
import com.arjjs.ccm.modules.ccm.message.entity.CcmMessage;
import com.arjjs.ccm.modules.ccm.message.service.CcmMessageService;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPeople;
import com.arjjs.ccm.modules.ccm.rest.web.CcmRestEvent;
import com.arjjs.ccm.modules.pbs.sys.utils.UserUtils;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.tool.RabbitMQTools;
import com.google.common.collect.Maps;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Auther: szl
 * @Date: 2021-01-13
 * 定时任务类，定时监听社区矫正人员、重点青少年 到期后取消关注
 */

@Service
public class CcmKeyPeople extends BaseController {

    @Autowired
    private CcmHouseRectificationService ccmHouseRectificationService;
    @Autowired
    private CcmHouseReleaseService ccmHouseReleaseService;
    @Autowired
    private CcmHouseKymService ccmHouseKymService;
    @Autowired
    private CcmPeopleService ccmPeopleService;
    @Autowired
    private CcmHouseEmphasisService ccmHouseEmphasisService;
    @Autowired
    private CcmMessageService ccmMessageService;

    public void updateKeyPeopleStatus(){
        //社区矫正人员到期后转为刑满释放人员
        communityCorrectionPeople();
        //重点青少年年满25周岁取消关注
        keyAdolescent();
    }

    @Transactional(readOnly = false)
    public void communityCorrectionPeople(){
        List<CcmHouseRectification> rectificationList = ccmHouseRectificationService.getRectificationByDate(new Date());
        List<CcmMessage> list = new ArrayList<CcmMessage>();
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
            User user = new User("1");
            ccmHouseRectification.setCreateBy(user);
            ccmHouseRectification.setUpdateBy(user);
            ccmHouseRectificationService.save(ccmHouseRectification);
            //获取网格长
            CcmPeople ccmPeople = new CcmPeople();
            ccmPeople.setId(houseRelease.getPeopleId());
            List<CcmExpireUser> CcmExpireUserList = ccmHouseEmphasisService.findUserByPeople(ccmPeople);
            for (CcmExpireUser ccmExpireUser : CcmExpireUserList) {
                User user1 = UserUtils.get(houseRelease.getPeopleId());
                CcmMessage ccmMessage = new CcmMessage();
                ccmMessage.setTitle("社区矫正人员到期");
                ccmMessage.setCreateBy(user);
                ccmMessage.setUpdateBy(user);
                ccmMessage.setType("23");//通知消息
                ccmMessage.setContent(user1.getName()+"由社区矫正人员到期转为刑满释放人员，请知晓");
                ccmMessage.setReadFlag("0");//未读
                ccmMessage.setObjId(ccmHouseRectification.getId());
                ccmMessage.preInsert();
                ccmMessage.setUserId(ccmExpireUser.getUserId());
                list.add(ccmMessage);
            }
      /*      // 给对应网格长发送消息提醒
            User user1 = UserUtils.get(houseRelease.getPeopleId());
            CcmMessage ccmMessage = new CcmMessage();
            ccmMessage.setId(UUID.randomUUID().toString());
            ccmMessage.setType("03");//通知消息
            ccmMessage.setTitle("社区矫正人员到期");
            ccmMessage.setContent(user1.getName()+"由社区矫正人员到期转为刑满释放人员，请知晓");
            ccmMessage.setReadFlag("0");//未读
            ccmMessage.setUserId(userId);
            ccmMessage.setCreateBy(UserUtils.getUser());
            ccmMessage.setCreateDate(new Date());
            ccmMessage.setUpdateBy(UserUtils.getUser());
            ccmMessage.setUpdateDate(new Date());
            ccmMessage.setDelFlag("0");

            Map resmap = Maps.newHashMap();
            resmap.put("type","oaNotifyType");
            resmap.put("id",ccmMessage.getId());
            resmap.put("name","通知："+ccmMessage.getTitle());
            RabbitMQTools.sendMessage("userId", JSONObject.fromObject(resmap).toString());*/
        }
        if(list.size() > 0) {
            //批量添加
            ccmMessageService.insertEventAll(list);
            //发送mq
            CcmRestEvent.sendMessageToMq(list);
        }
    }

    @Transactional(readOnly = false)
    public void keyAdolescent(){
        List<CcmHouseKym> houseKymList = ccmHouseKymService.getListByAge(new Date());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        List<CcmMessage> list = new ArrayList<CcmMessage>();
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

            CcmPeople ccmPeople = new CcmPeople();
            ccmPeople.setId(ccmHouseKym.getPeopleId());
            List<CcmExpireUser> CcmExpireUserList = ccmHouseEmphasisService.findUserByPeople(ccmPeople);
            for (CcmExpireUser ccmExpireUser : CcmExpireUserList) {
                User user1 = UserUtils.get(ccmHouseKym.getPeopleId());
                CcmMessage ccmMessage = new CcmMessage();
                ccmMessage.setTitle("重点青少年取消关注");
                ccmMessage.setCreateBy(user);
                ccmMessage.setUpdateBy(user);
                ccmMessage.setType("23");//通知消息
                ccmMessage.setContent(user1.getName()+"因年满25周岁自动取消关注，请知晓");
                ccmMessage.setReadFlag("0");//未读
                ccmMessage.setObjId(ccmHouseKym.getId());
                ccmMessage.preInsert();
                ccmMessage.setUserId(ccmExpireUser.getUserId());
                list.add(ccmMessage);
            }
            // 给对应网格长发送消息提醒
            /*User user1 = UserUtils.get(ccmHouseKym.getPeopleId());
            CcmMessage ccmMessage = new CcmMessage();
            ccmMessage.setId(UUID.randomUUID().toString());
            ccmMessage.setType("03");//通知消息
            ccmMessage.setTitle("重点青少年取消关注");
            ccmMessage.setContent(user1.getName()+"因年满25周岁自动取消关注，请知晓");
            ccmMessage.setReadFlag("0");//未读
            ccmMessage.setUserId("");
            ccmMessage.setCreateBy(UserUtils.getUser());
            ccmMessage.setCreateDate(new Date());
            ccmMessage.setUpdateBy(UserUtils.getUser());
            ccmMessage.setUpdateDate(new Date());
            ccmMessage.setDelFlag("0");

            Map resmap = Maps.newHashMap();
            resmap.put("type","oaNotifyType");
            resmap.put("id",ccmMessage.getId());
            resmap.put("name","通知："+ccmMessage.getTitle());
            RabbitMQTools.sendMessage("userId", JSONObject.fromObject(resmap).toString());*/
        }
        if(list.size() > 0) {
            //批量添加
            ccmMessageService.insertEventAll(list);
            //发送mq
            CcmRestEvent.sendMessageToMq(list);
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
        User user = new User("1");
        houseRelease.setCreateBy(user);
        houseRelease.setCreateDate(new Date());
        houseRelease.setUpdateBy(user);
        houseRelease.setUpdateDate(new Date());
        houseRelease.setDelFlag("0");
        houseRelease.setIsNewRecord(true);
        return houseRelease;
    }
}
