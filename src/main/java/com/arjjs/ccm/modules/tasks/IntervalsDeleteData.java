package com.arjjs.ccm.modules.tasks;

import com.arjjs.ccm.modules.ccm.patrol.service.CcmTracingpointService;
import com.arjjs.ccm.modules.ccm.sys.entity.SysConfig;
import com.arjjs.ccm.modules.ccm.sys.service.SysConfigService;
import com.arjjs.ccm.modules.sys.dao.LogDelDao;
import com.arjjs.ccm.tool.DateTools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 定时删除数据
 *
 * @author: li jiupeng
 * @create: 2019-08-13 15:24
 */
@Component
@Lazy
public class IntervalsDeleteData {

    @Autowired
    private SysConfigService sysConfigService;

    @Autowired
    private LogDelDao logDelDao;
    @Autowired
    private CcmTracingpointService ccmTracingpointService;

    private int ONE_DAY=1000*60*60*24;

    /**
     * 定时删除 log 真删
     */
    public void deleteLog()  {
        SysConfig sysConfig = sysConfigService.get("log_save_config");

        int paramInt = sysConfig.getParamInt();
        long nowTime = System.currentTimeMillis();
        Date date = new Date(nowTime - (paramInt * ONE_DAY));
        logDelDao.deleteTrue(date);
    }
    /**
     * 定时删除 地图轨迹 真删
     */
    public void deleteTracingpoint(){
        SysConfig sysConfig = sysConfigService.get("map_save_config");
        int paramInt = sysConfig.getParamInt();
        long nowTime = System.currentTimeMillis();
        Date date = new Date(nowTime - (paramInt * ONE_DAY));
        ccmTracingpointService.deleteTrue(date);
    }


}
