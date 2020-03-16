package com.arjjs.ccm.modules.ccm.sys.service;

import com.arjjs.ccm.modules.ccm.ccmsys.entity.CcmDevice;
import com.arjjs.ccm.modules.ccm.ccmsys.service.CcmDeviceService;
import com.arjjs.ccm.modules.ccm.org.dao.SysAreaDao;
import com.arjjs.ccm.modules.flat.alarm.entity.BphAlarmInfo;
import com.arjjs.ccm.modules.flat.alarm.service.BphAlarmInfoService;
import com.arjjs.ccm.tool.EchartType;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
@Transactional(readOnly = true)
public class CcmBIService {

    @Autowired
    private SysAreaDao areaDao;
    @Autowired
    private CcmDeviceService ccmDeviceService;
    @Autowired
    private BphAlarmInfoService bphAlarmInfoService;

    //实有人口数据汇总
    public List<Object> ccmPeopleCount(){
        List<Object> list = new ArrayList<>();
        List<EchartType> listHj = areaDao.ccmPeopleCountHj();
        List<EchartType> listLd = areaDao.ccmPeopleCountLd();
        String[] areaName = new String[listHj.size()];
        int[] peopleValue1 = new int[listHj.size()];
        int[] peopleValue2 = new int[listHj.size()];
        String[] areaNameFirst = new String[15];
        int[] peopleValueFirst1 = new int[15];
        int[] peopleValueFirst2 = new int[15];
        for(int i = 0; i<listHj.size(); i++){
            for(int j = 0; j<listLd.size(); j++){
                if(listHj.get(i).getType().equals(listLd.get(j).getType())){
                    listHj.get(i).setValue1(listLd.get(j).getValue());
                }
            }
            if(i<15){
                areaNameFirst[i] = listHj.get(i).getTypeO();
                peopleValueFirst1[i] = Integer.parseInt(listHj.get(i).getValue());
                peopleValueFirst2[i] = Integer.parseInt(listHj.get(i).getValue1());
            }
            areaName[i] = listHj.get(i).getTypeO();
            peopleValue1[i] = Integer.parseInt(listHj.get(i).getValue());
            peopleValue2[i] = Integer.parseInt(listHj.get(i).getValue1());
        }
        int firstMax = peopleValue1[0];
        //取到集合中的最大值
        for(int i = 0; i < peopleValue1.length ; i++){
            if(firstMax<peopleValue1[i]){
                firstMax = peopleValue1[i];
            }
        }
        while(firstMax%200!=0){
            if(firstMax%10!=0){
                firstMax++;
            }else{
                firstMax = firstMax+10;
            }
        }
        int secondMax = firstMax;
        list.add(firstMax);
        list.add(secondMax);
        list.add(areaNameFirst);
        list.add(peopleValueFirst1);
        list.add(peopleValueFirst2);
        list.add(areaName);
        list.add(peopleValue1);
        list.add(peopleValue2);
        return list;
    }

    //重点人员区域分布TOP5
    public List<Object> keyPeopleOfArea(){
        List<Object> list = new ArrayList<>();
        List<EchartType> listkey = areaDao.keyPeopleOfArea();
        String[] areaName = new String[5];
        int[] value = new int[5];
        for(int i = 0; i<listkey.size(); i++){
            areaName[i] = listkey.get(i).getTypeO();
            value[i] = Integer.parseInt(listkey.get(i).getValue());
        }
        int firstMax = value[0];
        for(int i = 0; i < value.length ; i++){
            if(firstMax<value[i]){
                firstMax = value[i];
            }
        }
        while(firstMax%100!=0){
            if(firstMax%10!=0){
                firstMax++;
            }else{
                firstMax = firstMax+10;
            }
        }
        list.add(firstMax);
        list.add(areaName);
        list.add(value);
        return list;
    }

    //巡逻队伍落实排名
    public List<Object> vccmTeamMember(){
        List<Object> list = new ArrayList<>();
        String[] name = {"5警务室", "4警务室", "3警务室", "2警务室", "1警务室"};
        int[] value = {80,90,100,110,120};
        list.add(name);
        list.add(value);
        return list;
    }

    //本周人脸抓拍告警TOP5
    public List<Object> thisWeekFace(){
        List<Object> list = new ArrayList<>();
        String[] name = {"1警务室", "2警务室", "3警务室", "4警务室", "5警务室"};
        int[] value = {120,110,100,90,80};
        list.add(name);
        list.add(value);
        return list;
    }

    //出租房区域分布TOP5
    public List<Object> rentalHouseOfArea(){
        List<Object> list = new ArrayList<>();
        List<EchartType> listrental = areaDao.rentalHouseOfArea();
        String[] areaName = new String[5];
        int[] value = new int[5];
        for(int i = 0; i<listrental.size(); i++){
            areaName[i] = listrental.get(i).getTypeO();
            value[i] = Integer.parseInt(listrental.get(i).getValue());
        }
        int firstMax = value[0];
        for(int i = 0; i < value.length ; i++){
            if(firstMax<value[i]){
                firstMax = value[i];
            }
        }
        while(firstMax%100!=0){
            if(firstMax%10!=0){
                firstMax++;
            }else{
                firstMax = firstMax+10;
            }
        }
        list.add(firstMax);
        list.add(areaName);
        list.add(value);
        return list;
    }

    //警力人员分布
    public List<EchartType> policeForceDistribution(){
        List<EchartType> police = areaDao.policeForceDistribution();
        return police;
    }

    //警力设备监控设备分布
    public List<EchartType> policeEquipmentMD(){
        List<EchartType> device = areaDao.policeEquipmentMD();
        return device;
    }

    //视频监控异常趋势
    public Map<String, Object> abnormalOfVideo(){
        Map<String, Object> map = Maps.newHashMap();
        DateFormat dateFormat=new SimpleDateFormat("MM-dd");

        List<CcmDevice> list = ccmDeviceService.findList(new CcmDevice());

        String[] lable = new String[10];
        for(int i=0;i<10;i++){
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.DAY_OF_MONTH,-(10-i));
            lable[i] = dateFormat.format(calendar.getTime());
        }

        map.put("sum",list.size());
        map.put("lable",lable);
        return map;
    }

    //近7天110警情趋势图
    public Map<String, Object> sevenDayOfAlarm(){
        Map<String, Object> map = Maps.newHashMap();

        String[] lable = new String[7];
        int[] sum = new int[7];
        int[] line = new int[7];

        for(int i=0;i<7;i++){
            Map<String, Object> value = getAlarmNum(i);
            lable[i] = value.get("lable").toString();
            sum[i] = Integer.parseInt(value.get("sum").toString());
            line[i] = Integer.parseInt(value.get("line").toString());
        }
        map.put("lable", lable);
        map.put("sum", sum);
        map.put("line", line);
        return map;
    }

    //警情区域分布TOP5
    public Map<String, Object> alarmOfArea(){
        Map<String, Object> map = Maps.newHashMap();
        List<EchartType> list = areaDao.alarmOfArea();
        String[] areaName = new String[5];
        int[] value = new int[5];
        for(int i = 0; i<list.size(); i++){
            areaName[i] = list.get(i).getTypeO();
            value[i] = Integer.parseInt(list.get(i).getValue());
        }
        map.put("areaName", areaName);
        map.put("value", value);
        return map;
    }

    private Map<String, Object> getAlarmNum(int i){
        Map<String, Object> map = Maps.newHashMap();
        DateFormat dateFormat=new SimpleDateFormat("MM-dd");
        BphAlarmInfo bphAlarmInfo = new BphAlarmInfo();
        Calendar begin = Calendar.getInstance();
        Calendar end = Calendar.getInstance();
        begin.add(Calendar.DAY_OF_MONTH,-(7-i));
        begin.set(Calendar.HOUR_OF_DAY,0);
        begin.set(Calendar.MINUTE,0);
        begin.set(Calendar.SECOND,0);
        end.add(Calendar.DAY_OF_MONTH,-(6-i));
        end.set(Calendar.HOUR_OF_DAY,0);
        end.set(Calendar.MINUTE,0);
        end.set(Calendar.SECOND,0);
        bphAlarmInfo.setBeginAlarmTime(begin.getTime());
        bphAlarmInfo.setEndAlarmTime(end.getTime());
        List<BphAlarmInfo> list = bphAlarmInfoService.getCountList(bphAlarmInfo);
        bphAlarmInfo.setState("3");
        List<BphAlarmInfo> list2 = bphAlarmInfoService.getCountList(bphAlarmInfo);
        map.put("lable", dateFormat.format(begin.getTime()));
        map.put("sum", list.size());
        if(list2.size()==0){
            map.put("line", 0);
        }else{
            Integer chapterCount = list.size();//总警情数
            Integer learnCount = list2.size();//已处理警情数
            // 创建一个数值格式化对象
            NumberFormat numberFormat = NumberFormat.getInstance();
            // 设置精确到小数点后2位
            numberFormat.setMaximumFractionDigits(0);
            String result = numberFormat.format((float) learnCount / (float) chapterCount * 100);//所占百分比
            map.put("line", result);
        }
        return map;
    }


    //警力总数
    public Integer policeCount(){
        return areaDao.policeCount();
    }
}
