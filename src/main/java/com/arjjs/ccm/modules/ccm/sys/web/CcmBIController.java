package com.arjjs.ccm.modules.ccm.sys.web;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.modules.ccm.index.service.IndexChartService;
import com.arjjs.ccm.modules.ccm.pop.entity.CcmPopTenant;
import com.arjjs.ccm.modules.ccm.report.service.CcmPeopleAmountService;
import com.arjjs.ccm.modules.ccm.sys.entity.BicMapUser;
import com.arjjs.ccm.modules.ccm.sys.entity.PoliceTrend;
import com.arjjs.ccm.modules.flat.alarm.entity.BphAlarmInfo;
import com.arjjs.ccm.modules.flat.alarm.entity.BphAlarmInfo2;
import com.arjjs.ccm.modules.flat.alarm.service.BphAlarmInfoService;
import com.arjjs.ccm.tool.SearchTab;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
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

import java.util.*;

import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/*
* 数据可视化Controller
* */
@Controller
@RequestMapping(value = "${adminPath}/sys/BicMap")
public class CcmBIController {
    @Autowired
    private CcmPeopleAmountService ccmPeopleAmountService;
    @Autowired
    private IndexChartService indexChartService;
    @Autowired
    private BphAlarmInfoService bphAlarmInfoService;

    @ResponseBody
    @RequestMapping(value = "getDisputeDefuse")
    //矛盾纠纷化解
    public Object getDisputeDefuse() {
        return indexChartService.oneYearSolveEvent();
    }

    @ResponseBody
    @RequestMapping(value = "populationConfluence")
    //实有数据人口汇总
    public Map<String, Object> populationConfluence(){
        // 返回对象结果
        Map<String, Object> map = Maps.newHashMap();

        map.put("常驻人口", 23901);
        map.put("流动人口", 873);
        map.put("重点人口", 548);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "policeSentiment")
    //实有数据人口汇总
    public Map<String, Object> policeSentiment(){
        // 返回对象结果
        Map<String, Object> map = Maps.newHashMap();

        //TODO 110警情数量
        int[] jqData = new int[]{11, 59, 25, 18, 72, 12, 5};

        //TODO 警情处理率 clvData
        int[] clvData = new int[]{38, 33, 55, 41, 26, 34, 32};

        //TODO  日期  rqData
        String[] rqData = new String[]{"01-01", "01-02", "01-03", "01-04", "01-05", "01-06", "01-07"};

        map.put("alert",jqData);
        map.put("rate",clvData);
        map.put("date",rqData);

        return map;
    }
    @ResponseBody
    @RequestMapping(value = "videoSurveillance")
    //视频监控异常趋势
    public Map<String, Object> videoSurveillance(){
        // 返回对象结果
        Map<String, Object> map = Maps.newHashMap();

        //TODO 警情处理率 clvData
        int[] sjData = new int[]{20, 82, 91, 50, 33, 65, 29, 88, 39, 15};

        //TODO  日期  rqData
        String[] rqData = new String[]{"01-01", "01-02", "01-03", "01-04", "01-05", "01-06", "01-07","01-08", "01-09", "01-10"};

        map.put("sj",sjData);
        map.put("date",rqData);

        return map;
    }
    // 重点人员数据总汇
    @ResponseBody
    @RequestMapping(value = "getnumPopFollowPopQL")
    public Map<String, Object> getnumPopFollowPopQL(Model model) {
        Map<String, Object> result = ccmPeopleAmountService.getnumPopFollowPopQL();
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "concernCompany")
    //重点关注单位
    public Map<String, Object> concernCompany(){
        // 返回对象结果
        Map<String, Object> map = Maps.newHashMap();

        map.put("zdnb",200);
        map.put("ybnb",200);
        map.put("bacy",200);
        map.put("bafw",200);
        map.put("jyz",200);
        map.put("hgc",200);
        map.put("dc",200);
        map.put("bg",200);
        map.put("wb",200);
        map.put("zy",200);
        map.put("ktv",100);

        return map;
    }
    @ResponseBody
    @RequestMapping(value = "beonduty")
    //本周值班计划
    public List<BicMapUser> beonduty(){

        List<BicMapUser> bicMapUsers = new ArrayList<>();

        Map<String, String> weekPlan1 = new HashMap<>();
        weekPlan1.put("day1","1");
        weekPlan1.put("day2","0");
        weekPlan1.put("day3","0");
        weekPlan1.put("day4","0");
        weekPlan1.put("day5","0");
        weekPlan1.put("day6","0");
        weekPlan1.put("day7","1");
        BicMapUser bicMapUser1 = new BicMapUser("11","李雷雷",weekPlan1);
        Map<String, String> weekPlan2 = new HashMap<>();
        weekPlan1.put("day1","0");
        weekPlan1.put("day2","1");
        weekPlan1.put("day3","1");
        weekPlan1.put("day4","0");
        weekPlan1.put("day5","1");
        weekPlan1.put("day6","0");
        weekPlan1.put("day7","0");
        BicMapUser bicMapUser2 = new BicMapUser("12","张露",weekPlan2);
        Map<String, String> weekPlan3= new HashMap<>();
        weekPlan1.put("day1","0");
        weekPlan1.put("day2","0");
        weekPlan1.put("day3","1");
        weekPlan1.put("day4","1");
        weekPlan1.put("day5","0");
        weekPlan1.put("day6","0");
        weekPlan1.put("day7","0");
        BicMapUser bicMapUser3 = new BicMapUser("13","阳光",weekPlan3);
        BicMapUser bicMapUser4 = new BicMapUser("14","赵晓明",weekPlan1);
        BicMapUser bicMapUser5 = new BicMapUser("15","宋勇",weekPlan2);
        BicMapUser bicMapUser6 = new BicMapUser("16","李雷雷1",weekPlan1);
        BicMapUser bicMapUser7 = new BicMapUser("17","李雷雷2",weekPlan2);
        bicMapUsers.add(bicMapUser1);
        bicMapUsers.add(bicMapUser2);
        bicMapUsers.add(bicMapUser3);
        bicMapUsers.add(bicMapUser4);
        bicMapUsers.add(bicMapUser5);
        bicMapUsers.add(bicMapUser6);
        bicMapUsers.add(bicMapUser7);
        return bicMapUsers;
    }

//今日110警情处理
    @ResponseBody
    @RequestMapping(value = "alarmData" )
   public List<BphAlarmInfo2> list() {

        List<BphAlarmInfo2> list = bphAlarmInfoService.findTodayAlarmInfo();

        List<BphAlarmInfo2> list2 = Lists.newArrayList();
        for (BphAlarmInfo2 bphAlarmInfo2 : list) {
            BphAlarmInfo2 bphAlarmInfo21 = new BphAlarmInfo2();
            bphAlarmInfo21.setId(bphAlarmInfo2.getId());
            if(bphAlarmInfo2.getContent()==null){
                bphAlarmInfo21.setContent("");
            }else {
                bphAlarmInfo21.setContent(bphAlarmInfo2.getContent());
            }
            if(bphAlarmInfo2.getIsImportant()==null){
                bphAlarmInfo21.setIsImportant("");
            }else {
                bphAlarmInfo21.setIsImportant(bphAlarmInfo2.getIsImportant());
            }

            if(bphAlarmInfo2.getState().equals("0")){
                bphAlarmInfo21.setState("未处理");
            }
            if(bphAlarmInfo2.getState().equals("1")){
                bphAlarmInfo21.setState("已处理");
            }
            if(bphAlarmInfo2.getState().equals("2")){
                bphAlarmInfo21.setState("已到达");
            }
            if(bphAlarmInfo2.getState().equals("3")){
                bphAlarmInfo21.setState("已反馈");
            }
            if(bphAlarmInfo2.getHandleName()==null){
                bphAlarmInfo21.setHandleName("");
            }else {
                bphAlarmInfo21.setHandleName(bphAlarmInfo2.getHandleName());
            }
            list2.add(bphAlarmInfo21);
        }

        /*PoliceTrend policeTrend1 = new PoliceTrend("NO.1", "案件测试1", "张晓明", "已处理","否");
        PoliceTrend policeTrend2 = new PoliceTrend("NO.2", "案件测试1", "张晓明", "已处理","是");
        PoliceTrend policeTrend3 = new PoliceTrend("NO.3", "案件测试1", "张晓明", "已处理","否");
        PoliceTrend policeTrend4 = new PoliceTrend("NO.4", "案件测试1", "张晓明", "已处理","否");
        PoliceTrend policeTrend5 = new PoliceTrend("NO.5", "案件测试1", "张晓明", "已处理","否");
        PoliceTrend policeTrend6 = new PoliceTrend("NO.6", "案件测试1", "张晓明", "已处理","否");
        PoliceTrend policeTrend7 = new PoliceTrend("NO.7", "案件测试1", "张晓明", "已处理","否");

        List<PoliceTrend> policeTrendList = new ArrayList<PoliceTrend>();
        policeTrendList.add(policeTrend1);
        policeTrendList.add(policeTrend2);
        policeTrendList.add(policeTrend3);
        policeTrendList.add(policeTrend4);
        policeTrendList.add(policeTrend5);
        policeTrendList.add(policeTrend6);
        policeTrendList.add(policeTrend7);

        model.addAttribute("page", policeTrendList);*/

        return  list2;
//        return policeTrendList;
    }


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

        Map<String, Object> map = bphAlarmInfoService.findMonthPieData();
        List<PoliceDigest> policeDigestList = new ArrayList<PoliceDigest>();
        for(Map.Entry<String, Object> entry : map.entrySet()){

            String mapKey = entry.getKey();
            Object mapValue = entry.getValue();
            PoliceDigest policeDigest = new PoliceDigest(Integer.parseInt(mapValue.toString()),mapKey);
            policeDigestList.add(policeDigest);
        }

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
    @ResponseBody
    @RequestMapping(value = "search")
    //重点单位检查问题
    public Map<String, Object> search(){
        // 返回对象结果
        Map<String, Object> map = Maps.newHashMap();

        //TODO 单位名数据 name
        String[] name = new String[]{"单位1", "单位2", "单位3", "单位4", "单位5"};

        // 重点单位问题数据 jlData
        int[] jlData = new int[]{2000, 1000, 900, 800, 700};

        //重点单位问题总数 jlData
        int sumData=10000;

        map.put("name", name);
        map.put("jlData", jlData);
        map.put("sumData", sumData);

        return map;
    }

    @ResponseBody
    @RequestMapping(value = "modular_02")
    //流动人员来源地
    public Map<String, Object> modular_02(){
        // 返回对象结果
        Map<String, Object> map = Maps.newHashMap();

        //TODO 单位名数据 name
        String[] name = new String[]{"住宿", "餐饮", "学生", "司机", "教师", "医生", "物流", "房地产", "加工制造", "无固定职业"};

        //TODO 重点单位问题数据 jlData
        int[] jlData = new int[]{89, 90, 100, 200, 300, 400, 500, 600, 700, 800};

        map.put("name", name);
        map.put("jlData", jlData);

        return map;
    }


    @ResponseBody
    @RequestMapping(value = "Practitioners")
    //流动人员来源地
    public Map<String, Object> Practitioners(){
        // 返回对象结果
        Map<String, Object> map = Maps.newHashMap();

        //TODO 单位名数据 name
        String[] name = new String[]{"快递", "娱乐场所", "网约车", "出租车", "其他"};

        //TODO 重点单位问题数据 jlData
        int[] jlData = new int[]{301, 239, 350, 432, 309,};

        map.put("name", name);
        map.put("jlData", jlData);

        return map;
    }
}
