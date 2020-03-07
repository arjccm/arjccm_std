package com.arjjs.ccm.modules.ccm.sys.web;

import com.arjjs.ccm.modules.ccm.sys.service.CcmBIService;
import org.springframework.beans.factory.annotation.Autowired;
import com.arjjs.ccm.modules.ccm.sys.entity.PoliceDigest;
import com.google.common.collect.Maps;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/*
* 数据可视化Controller
* */
@Controller
@RequestMapping(value = "${adminPath}/sys/BicMap")
public class CcmBIController {

    @ResponseBody
    @RequestMapping(value = "policeForceDistribution")
    //警力人员分布
    public Map<String, Object> policeForceDistribution(){
        // 返回对象结果
        Map<String, Object> map = Maps.newHashMap();

        //TODO 警室总数据 name
        String[] name = new String[20];
        for (int i = 1; i < 13; i++) {
            name[i-1] = i + "警室";
        }

        //TODO 民警人数数据 mjData
        int[] mjData = new int[]{310, 150, 450, 890, 345, 310, 150, 450, 890, 345, 310, 150};

        //TODO 辅警人数数据 fjData
        int[] fjData = new int[]{400, 500, 500, 500, 500, 400, 500, 500, 500, 500, 400, 500};

        //总数据 data
        Map<String, Object> data = Maps.newHashMap();
        data.put("民警", mjData);
        data.put("辅警", fjData);

        //首次展示数据 firstData
        Map<String, Object> firstData = Maps.newHashMap();
        int[] mjFirstData = new int[]{310, 150, 450, 890, 345, 310};
        int[] fjFirstData = new int[]{400, 500, 500, 500, 500, 400};
        if (mjData.length != 0 && fjData.length != 0) {
            for (int i = 0; i < 6; i++) {
                mjFirstData[i] = mjData[i];
                fjFirstData[i] = fjData[i];
            }
            firstData.put("民警", mjFirstData);
            firstData.put("辅警", fjFirstData);
        }

        map.put("name", name);
        map.put("firstData", firstData);
        map.put("data", data);

        return map;
    }

    @ResponseBody
    @RequestMapping(value = "policeEquipmentMD")
    //警力设备监控设备分布
    public Map<String, Object> policeEquipmentMD(){
        // 返回对象结果
        Map<String, Object> map = Maps.newHashMap();

        //TODO 警室总数据 name
        String[] name = new String[20];
        for (int i = 1; i < 19; i++) {
            name[i-1] = i + "警室";
        }

        //TODO 警力设备 jlData
        int[] jlData = new int[]{310, 150, 450, 890, 345, 310, 150, 450, 890, 345, 310, 150, 150, 450, 890, 345, 310, 150};

        //TODO 监控设备 jkData
        int[] jkData = new int[]{400, 500, 500, 500, 500, 400, 500, 500, 500, 500, 400, 500, 310, 150, 450, 890, 345, 180};

        //总数据 data
        Map<String, Object> data = Maps.newHashMap();
        data.put("警力设备", jlData);
        data.put("监控设备", jkData);

        //首次展示数据 firstData
        Map<String, Object> firstData = Maps.newHashMap();
        int[] jlFirstData = new int[]{310, 150, 450, 890, 345, 310, 150, 450, 890, 345, 310, 150};
        int[] jkFirstData = new int[]{400, 500, 500, 500, 500, 400, 500, 500, 500, 500, 400, 500};
        if (jlData.length != 0 && jkData.length != 0) {
            for (int i = 0; i < 12; i++) {
                jlFirstData[i] = jlData[i];
                jkFirstData[i] = jkData[i];
            }
            firstData.put("警力设备", jlFirstData);
            firstData.put("监控设备", jkFirstData);
        }

        map.put("name", name);
        map.put("data", data);
        map.put("firstData", firstData);

        return map;
    }

    @ResponseBody
    @RequestMapping(value = "policeDigest")
    //30警情摘要
    public String policeDigest(){
        // 返回对象结果

        PoliceDigest policeDigest1 = new PoliceDigest(13,"aaa");
        PoliceDigest policeDigest2 = new PoliceDigest(15,"bbb");
        PoliceDigest policeDigest3 = new PoliceDigest(20,"ccc");
        PoliceDigest policeDigest4 = new PoliceDigest(23,"ddd");
        PoliceDigest policeDigest5 = new PoliceDigest(31,"eee");

        List<PoliceDigest> policeDigestList = new ArrayList<PoliceDigest>();
        policeDigestList.add(policeDigest1);
        policeDigestList.add(policeDigest2);
        policeDigestList.add(policeDigest3);
        policeDigestList.add(policeDigest4);
        policeDigestList.add(policeDigest5);

        JsonConfig config = new JsonConfig();
        String policeJson = JSONArray.fromObject(policeDigestList, config).toString();

        return policeJson;
    }

    @Autowired
    private CcmBIService ccmBIService;

    // 实有人口数据汇总（柱状图）
    @ResponseBody
    @RequestMapping(value = "ccmPeopleCount")
    public List<Object> ccmPeopleCount(Model model) {
        // 返回对象结果
        List<Object> result = ccmBIService.ccmPeopleCount();
        return result;
    }

    // 重点人员区域分布TOP5
    @ResponseBody
    @RequestMapping(value = "keyPeopleOfArea")
    public List<Object> keyPeopleOfArea(Model model) {
        // 返回对象结果
        List<Object> result = ccmBIService.keyPeopleOfArea();
        return result;
    }

    // 巡逻队伍落实排名
    @ResponseBody
    @RequestMapping(value = "vccmTeamMember")
    public List<Object> vccmTeamMember(Model model) {
        // 返回对象结果
        List<Object> result = ccmBIService.vccmTeamMember();
        return result;
    }

    // 本周人脸抓拍告警TOP5
    @ResponseBody
    @RequestMapping(value = "thisWeekFace")
    public List<Object> thisWeekFace(Model model) {
        // 返回对象结果
        List<Object> result = ccmBIService.thisWeekFace();
        return result;
    }

    // 出租房区域分布TOP5
    @ResponseBody
    @RequestMapping(value = "rentalHouseOfArea")
    public List<Object> rentalHouseOfArea(Model model) {
        // 返回对象结果
        List<Object> result = ccmBIService.rentalHouseOfArea();
        return result;
    }
}
