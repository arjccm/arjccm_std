package com.arjjs.ccm.modules.ccm.sys.service;

import com.arjjs.ccm.modules.ccm.org.dao.SysAreaDao;
import com.arjjs.ccm.tool.EchartType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service
@Transactional(readOnly = true)
public class CcmBIService {

    @Autowired
    private SysAreaDao areaDao;

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
        Random random = new Random();
        List<Object> list = new ArrayList<>();
        List<EchartType> listrental = areaDao.rentalHouseOfArea();
        String[] areaName = new String[5];
        int[] value = new int[5];
        int maxNum = 80;
        for(int i = 0; i<listrental.size(); i++){
            areaName[i] = listrental.get(i).getTypeO();
            //数据展示效果假数据
            if(Integer.parseInt(listrental.get(i).getValue())<100){
                if(maxNum!=80){
                    if(maxNum>100){
                        value[i] = random.nextInt(maxNum-100)+101;
                        maxNum = value[i];
                    }else{
                        value[i] = random.nextInt(maxNum);
                        maxNum = value[i];
                    }
                }else{
                    value[i] = random.nextInt(maxNum)+101;
                    maxNum = value[i];
                }
            }else{
                value[i] = Integer.parseInt(listrental.get(i).getValue());
                maxNum = value[i];
            }
        }
        int firstMax = value[0];
        for(int i = 0; i < value.length ; i++){
            if(firstMax<value[i]){
                firstMax = value[i];
            }
        }
        while(firstMax%200!=0){
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
}
