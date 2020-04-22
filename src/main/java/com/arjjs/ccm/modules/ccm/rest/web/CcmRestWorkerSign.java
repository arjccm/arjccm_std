package com.arjjs.ccm.modules.ccm.rest.web;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.ccm.worker.entity.CcmWorkerSign;
import com.arjjs.ccm.modules.ccm.worker.service.CcmWorkerSignService;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.modules.sys.utils.UserUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author
 * @title: CcmRestWorkerSign
 * @description: TODO
 * @date 2019/10/28 17:50
 */
@Controller
@RequestMapping(value = "${appPath}/rest/service/ccmWorkerSign")
@Api(description = "app考勤接口类")
public class CcmRestWorkerSign {

    @Autowired
    private CcmWorkerSignService ccmWorkerSignService;


    //获取详情
    @ResponseBody
    @ApiOperation(value ="获取详情" )
    @RequestMapping(value = "/getinfo", method = RequestMethod.GET)
    public CcmRestResult getinfo(String userId,Date date) {
        CcmRestResult result = new CcmRestResult();
        CcmWorkerSign entity = null;
        if (StringUtils.isNotBlank(userId)){
             entity = ccmWorkerSignService.getInfo(userId, date);
        }
        if (entity == null){
            entity = new CcmWorkerSign();
        }
        result.setCode(CcmRestType.OK);
        result.setResult(entity);
        return result;
    }


    //获取列表
    @ResponseBody
    @RequestMapping(value = "/getList", method = RequestMethod.GET)
    public CcmRestResult getList(String userId,CcmWorkerSign ccmWorkerSign, HttpServletRequest request, HttpServletResponse response) {
        CcmRestResult result = new CcmRestResult();
        User user = UserUtils.get(userId);
        if(!user.isAdmin()){
            ccmWorkerSign.setUser(user);
        }
        Page<CcmWorkerSign> page = ccmWorkerSignService.findPage(new Page<CcmWorkerSign>(request, response), ccmWorkerSign);
        result.setCode(CcmRestType.OK);
        result.setResult(page.getList());
        return result;
    }


    //签到
    @ApiOperation(value = "签到")
    @ResponseBody
    @RequestMapping(value = "/getform", method = RequestMethod.GET)
    public CcmRestResult getform(String userId,CcmWorkerSign ccmWorkerSign) {
        CcmRestResult result = new CcmRestResult();
        User user = UserUtils.get(userId);
        ccmWorkerSign.setUser(user);

        //app签到，设置签到类型
        ccmWorkerSign.setClockinType("1");
        //设置创建者id
        ccmWorkerSign.setCreateBy(user);
        //设置删除标记
        ccmWorkerSign.setDelFlag("0");
        //赋值签到时间
        ccmWorkerSign.setClockinTime(new Date());
        ccmWorkerSign.setId(UUID.randomUUID().toString());
        //查询是否有之前签到
        int sum =ccmWorkerSignService.findByClockinInfo(ccmWorkerSign);
        if(sum!=0){
        result.setCode(-11);
        result.setMsg("签到失败");
        return result;
        }
        if(StringUtils.isNotEmpty(ccmWorkerSign.getAreaPoint()) && ccmWorkerSign.getAreaPoint().contains(",")){
            String x = ccmWorkerSign.getAreaPoint().split(",")[0];
            String y = ccmWorkerSign.getAreaPoint().split(",")[1];
            //获取app的经纬度信息
            ccmWorkerSign.setClockinAreaName(y+","+x);
        }
        ccmWorkerSignService.save(ccmWorkerSign);
        result.setCode(CcmRestType.OK);
        result.setMsg("OK");
        result.setResult("OK");
        return result;
    }


    //签退
    @ResponseBody
    @ApiOperation(value = "签退")
    @RequestMapping(value = "/resform", method = RequestMethod.GET)
    public CcmRestResult resform(String userId,CcmWorkerSign ccmWorkerSign) {
        CcmRestResult result = new CcmRestResult();
        User user = UserUtils.get(userId);
        ccmWorkerSign.setUser(user);
        //赋值平台签退时间
        ccmWorkerSign.setClockoutTime(new Date());
        int sum = ccmWorkerSignService.findClockoutTime(ccmWorkerSign);
        if (sum !=1){
            result.setCode(-11);
            result.setMsg("签退失败");
            return result;
        }
        //赋值平台签退设备标识
        ccmWorkerSign.setClockoutType("1");
        //赋值更新者id
        ccmWorkerSign.setUpdateBy(user);
        //赋值更新时间
        ccmWorkerSign.setUpdateDate(new Date());
        if(StringUtils.isNotEmpty(ccmWorkerSign.getAreaPoint()) && ccmWorkerSign.getAreaPoint().contains(",")){
            String x = ccmWorkerSign.getAreaPoint().split(",")[0];
            String y = ccmWorkerSign.getAreaPoint().split(",")[1];
            //赋值签退时app经纬度
            ccmWorkerSign.setClockoutAreaName(y+","+x);
        }
        ccmWorkerSignService.save(ccmWorkerSign);
        result.setCode(CcmRestType.OK);
        result.setMsg("OK");
        result.setResult("OK");
        return result;
    }


    //考勤日历信息
    @ResponseBody
    @ApiOperation(value = "考勤日历信息")
    @RequestMapping(value = "/rescount", method = RequestMethod.GET)
    public CcmRestResult rescount (String userId,Date date){
        CcmWorkerSign ccmWorkerSign = new CcmWorkerSign();
        CcmRestResult result = new CcmRestResult();
        User user = UserUtils.get(userId);
        ccmWorkerSign.setUser(user);
        Map<String, Object> map = ccmWorkerSignService.findByCountMonth(userId,date, ccmWorkerSign);
        result.setCode(CcmRestType.OK);
        result.setResult(map);
        return result;
    }

    //考勤统计
    @ResponseBody
    @ApiOperation(value = "考勤统计")
    @RequestMapping(value = "/statistics", method = RequestMethod.GET)
    public CcmRestResult statistics (String userId,Date date){
        CcmWorkerSign ccmWorkerSign = new CcmWorkerSign();
        CcmRestResult result = new CcmRestResult();
        User user = UserUtils.get(userId);
        ccmWorkerSign.setUser(user);
        Map<String, Object> map = ccmWorkerSignService.findByStatistics(userId,date, ccmWorkerSign);
        result.setCode(CcmRestType.OK);
        result.setResult(map);
        return result;
    }
}

    
    
    
