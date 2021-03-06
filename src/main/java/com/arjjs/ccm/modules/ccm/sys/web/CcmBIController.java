package com.arjjs.ccm.modules.ccm.sys.web;

import com.arjjs.ccm.modules.ccm.place.casino.service.CcmPlaceCasinoService;
import com.arjjs.ccm.modules.ccm.event.service.CcmEventAmbiService;
import com.arjjs.ccm.modules.ccm.place.hotel.service.CcmPlaceHotelService;
import com.arjjs.ccm.modules.ccm.index.service.IndexChartService;
import com.arjjs.ccm.modules.ccm.org.service.CcmOrgNpseService;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPeopleService;
import com.arjjs.ccm.modules.ccm.pop.service.CcmPopTenantService;
import com.arjjs.ccm.modules.ccm.report.service.CcmPeopleAmountService;
import com.arjjs.ccm.modules.ccm.sys.entity.BicMapUser;
import com.arjjs.ccm.modules.ccm.place.traffic.service.CcmPlaceTrafficService;
import com.arjjs.ccm.modules.flat.alarm.entity.BphAlarmInfo2;
import com.arjjs.ccm.modules.flat.alarm.service.BphAlarmInfoService;
import com.arjjs.ccm.tool.SearchTab;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import com.arjjs.ccm.modules.ccm.sys.service.CcmBIService;
import com.arjjs.ccm.tool.EchartType;
import com.arjjs.ccm.modules.ccm.sys.entity.PoliceDigest;
import com.google.common.collect.Maps;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

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
    @Autowired
    private CcmPlaceCasinoService ccmPlaceCasinoService;
    @Autowired
    private CcmPlaceHotelService ccmPlaceHotelService;
    @Autowired
    private CcmPlaceTrafficService ccmPlaceTrafficService;
    @Autowired
    private CcmBIService ccmBIService;

    @Autowired
    private CcmPeopleService ccmPeopleService;
    @Autowired
    private CcmPopTenantService ccmPopTenantService;
    @Autowired
    private CcmOrgNpseService ccmOrgNpseService;
    @Autowired
    private CcmEventAmbiService ccmEventAmbiService;



    @ResponseBody
    @RequestMapping(value = "getDisputeDefuse")
    //矛盾纠纷化解
    public Object getDisputeDefuse() {
        List<EchartType> echartTypes = indexChartService.oneYearSolveEvent();
        return echartTypes;
    }

    @ResponseBody
    @RequestMapping(value = "populationConfluence")
    //实有数据人口汇总
    public Map<String, Object> populationConfluence(){
        // 返回对象结果
        Map<String, Object> map = Maps.newHashMap();
        //实有、流动、常住、重点、人口个数
        SearchTab countPeople = ccmPeopleService.getCountPeople();


        map.put("常驻人口", countPeople.getValue3());
        map.put("流动人口", countPeople.getValue2());
        map.put("重点人口", countPeople.getValue4());
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
        //统计网吧、Ktv、足浴个数
        List<Integer> casinos = ccmPlaceCasinoService.countCasino();
        //统计酒店个数
        Integer hotel = ccmPlaceHotelService.countHotel();
        //统计加油站个数
        Integer petrolStation = ccmPlaceTrafficService.petrolStation();

        map.put("zdnb",200);
        map.put("ybnb",200);
        map.put("bacy",200);
        map.put("bafw",200);
        map.put("petrolStation",petrolStation);
        map.put("hgc",200);
        map.put("powerStation",200);
        map.put("hotel",hotel);
        map.put("internetBar",casinos.get(0));
        map.put("footBath",casinos.get(2));
        map.put("ktv",casinos.get(1));

        return map;
    }
    @ResponseBody
    @RequestMapping(value = "beonduty")
    //本周值班计划
    public List<BicMapUser> beonduty(){

        List<BicMapUser> bicMapUsers = new ArrayList<>();
        int[] weekPlan1={1,0,0,1,0,0,1};
        BicMapUser bicMapUser1 = new BicMapUser("11","李雷雷",weekPlan1);
        int[] weekPlan2={0,1,1,0,1,0,0};
        BicMapUser bicMapUser2 = new BicMapUser("12","张露",weekPlan2);
        int[] weekPlan3={0,0,1,1,0,0,0};
        BicMapUser bicMapUser3 = new BicMapUser("13","阳光",weekPlan3);
        int[] weekPlan4={0,0,1,0,0,1,0};
        BicMapUser bicMapUser4 = new BicMapUser("14","赵晓明",weekPlan4);
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
        Random ran = new Random();
        // 返回对象结果
        Map<String, Object> map = Maps.newHashMap();

        List<EchartType> police = ccmBIService.policeForceDistribution();

        //TODO 警室总数据 name
        String[] name = new String[police.size()];

        //TODO 民警人数数据 mjData
        int[] mjData = new int[police.size()];

        //TODO 辅警人数数据 fjData
        int[] fjData = new int[police.size()];

        for(int i=0;i<police.size();i++){
            name[i] = police.get(i).getTypeO();
            mjData[i] = Integer.parseInt(police.get(i).getValue());
            fjData[i] = mjData[i]-15;
        }

        //总数据 data
        Map<String, Object> data = Maps.newHashMap();
        data.put("民警", mjData);
        data.put("辅警", fjData);

        //首次展示数据 firstData
        Map<String, Object> firstData = Maps.newHashMap();
        int[] mjFirstData = new int[6];
        int[] fjFirstData = new int[6];
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
        Random ran = new Random();
        // 返回对象结果
        Map<String, Object> map = Maps.newHashMap();

        List<EchartType> device = ccmBIService.policeEquipmentMD();

        //TODO 警室总数据 name
        String[] name = new String[device.size()];

        //TODO 警力设备 jlData
        int[] jlData = new int[device.size()];

        //TODO 监控设备 jkData
        int[] jkData = new int[device.size()];

        for(int i=0;i<device.size();i++){
            name[i] = device.get(i).getTypeO();
            jkData[i] = Integer.parseInt(device.get(i).getValue());
            jlData[i] = Integer.parseInt(device.get(i).getValue());
        }

        //总数据 data
        Map<String, Object> data = Maps.newHashMap();
        data.put("警力设备", jlData);
        data.put("监控设备", jkData);

        //首次展示数据 firstData
        Map<String, Object> firstData = Maps.newHashMap();
        int[] jlFirstData = new int[12];
        int[] jkFirstData = new int[12];
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

    // 实有人口数据汇总（柱状图）
    @ResponseBody
    @RequestMapping(value = "ccmPeopleCount")
    public List<Object> ccmPeopleCount() {
        // 返回对象结果
        List<Object> result = ccmBIService.ccmPeopleCount();
        return result;
    }

    // 重点人员区域分布TOP5
    @ResponseBody
    @RequestMapping(value = "keyPeopleOfArea")
    public List<Object> keyPeopleOfArea() {
        // 返回对象结果
        List<Object> result = ccmBIService.keyPeopleOfArea();
        return result;
    }

    // 巡逻队伍落实排名
    @ResponseBody
    @RequestMapping(value = "vccmTeamMember")
    public List<Object> vccmTeamMember() {
        // 返回对象结果
        List<Object> result = ccmBIService.vccmTeamMember();
        return result;
    }

    // 本周人脸抓拍告警TOP5
    @ResponseBody
    @RequestMapping(value = "thisWeekFace")
    public List<Object> thisWeekFace() {
        // 返回对象结果
        List<Object> result = ccmBIService.thisWeekFace();
        return result;
    }

    // 出租房区域分布TOP5
    @ResponseBody
    @RequestMapping(value = "rentalHouseOfArea")
    public List<Object> rentalHouseOfArea() {
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
        int[] jlData = new int[]{2000, 1000, 1300, 800, 700};

        //重点单位问题总数 jlData
        int maxData=jlData[0];
        for (int jlDatum : jlData) {
            maxData=maxData<jlDatum?jlDatum:maxData;
        }


        map.put("name", name);
        map.put("jlData", jlData);
        map.put("sumData", maxData);

        return map;
    }

    @ResponseBody
    @RequestMapping(value = "modular_02")
    //流动人员来源地
    public HashMap<String,Object> modular_02(){
        StringBuilder name=new StringBuilder();
        StringBuilder num=new StringBuilder();

        HashMap<String, Object> map = new HashMap<>();
        List<EchartType> list = ccmBIService.listFlawService();

        /*//TODO 单位名数据 name
        String[] name = new String[]{};

        //TODO 重点单位问题数据 jlData
        int[] jlData = new int[]{};*/
        for (EchartType echartType : list) {
            String name1 = echartType.getName();
            Integer num1=echartType.getNum();
            name=name.append(name1+",");
            num=num.append(num1+",");
        }
        String[] names = name.toString().split(",");
        String[] nums = num.toString().split(",");
        // 返回对象结果
        map.put("name", names);
        map.put("num", nums);
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

    @ResponseBody
    @RequestMapping(value = "abnormalOfVideo")
    //视频监控异常趋势
    public Map<String, Object> abnormalOfVideo(){
        // 返回对象结果
        Map<String, Object> map = ccmBIService.abnormalOfVideo();

        return map;
    }

    @ResponseBody
    @RequestMapping(value = "sevenDayOfAlarm")
    //近7天110警情趋势图
    public Map<String, Object> sevenDayOfAlarm(){
        // 返回对象结果
        Map<String, Object> map = ccmBIService.sevenDayOfAlarm();
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "alarmOfArea")
    //警情区域分布TOP5
    public Map<String, Object> alarmOfArea(){
        // 返回对象结果
        Map<String, Object> map = ccmBIService.alarmOfArea();
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "countHZ")
    //实有数据人口汇总
    public Map<String, Object> countHZ(){
        // 返回对象结果
        Map<String, Object> map = Maps.newLinkedHashMap();

        //实有、流动、常住、重点、人口个数
        SearchTab countPeople = ccmPeopleService.getCountPeople();

        //实有房屋
        Integer houseCount = ccmPopTenantService.houseCount();

        //出租房
        Integer letCount = ccmPopTenantService.letCount();
        //实有单位
        Integer unitsCount = ccmOrgNpseService.unitsCount();
        map.put("实有人口", countPeople.getValue1());
        map.put("重点人员", countPeople.getValue4());
        map.put("实有房屋", houseCount);
        map.put("出租房", letCount);
        map.put("实有单位", unitsCount);

        return map;
    }
    @ResponseBody
    @RequestMapping(value = "countHZ2")
    //实有数据人口汇总
    public Map<String, Object> countHZ2(){
        Random ran = new Random();
        List<EchartType> device = ccmBIService.policeEquipmentMD();

        //TODO 警室总数据 name
        String[] name = new String[device.size()];

        //TODO 警力设备 jlData
        int[] jlData = new int[device.size()];

        //TODO 监控设备 jkData
        int[] jkData = new int[device.size()];

        for(int i=0;i<device.size();i++){
            name[i] = device.get(i).getTypeO();
            jkData[i] = Integer.parseInt(device.get(i).getValue());
            if(Integer.parseInt(device.get(i).getValue())>2){
                jlData[i] = ran.nextInt(Integer.parseInt(device.get(i).getValue())-2)+1;
            }else{
                jlData[i] = Integer.parseInt(device.get(i).getValue());
            }
        }

        //总数据 data
        Map<String, Object> data = Maps.newHashMap();
        data.put("警力设备", jlData);
        data.put("监控设备", jkData);

        //首次展示数据 firstData
        Map<String, Object> firstData = Maps.newHashMap();
        int[] jlFirstData = new int[12];
        int[] jkFirstData = new int[12];
        if (jlData.length != 0 && jkData.length != 0) {
            for (int i = 0; i < 12; i++) {
                jlFirstData[i] = jlData[i];
                jkFirstData[i] = jkData[i];
            }
            firstData.put("警力设备", jlFirstData);
            firstData.put("监控设备", jkFirstData);
        }


        int jlSum=0;
        for (int jlDatum : jlData) {
            jlSum+=jlDatum;
        }
        int jkSum=0;
        for (int jkDatum : jkData) {
            jkSum+=jkDatum;
        }

        // 返回对象结果
        Map<String, Object> map = Maps.newLinkedHashMap();

        //警力总数
        Integer policeCount = ccmBIService.policeCount();

        //本月警情个数
        Integer month2Count = bphAlarmInfoService.findMonth2PieData();

        //本月纠纷个数
        Integer monthCount = ccmEventAmbiService.monthCount();

        map.put("警力人员", policeCount);
        map.put("警力设备", jlSum);
        map.put("监控设备", jkSum);
        map.put("本月警情", month2Count);
        map.put("本月矛盾纠纷", monthCount);
        map.put("今日人脸抓拍",15);

        return map;
    }
}
