package com.arjjs.ccm.modules.ccm.videoData.service;

import com.alibaba.fastjson.JSONObject;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.act.rest.editor.model.ModelEditorJsonRestResource;
import com.arjjs.ccm.modules.ccm.ccmsys.dao.CcmDeviceDao;
import com.arjjs.ccm.modules.ccm.org.service.CcmOrgAreaService;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.ccm.sys.entity.SysConfig;
import com.arjjs.ccm.modules.ccm.sys.service.SysConfigService;
import com.arjjs.ccm.modules.ccm.videoData.entity.*;
import groovy.util.logging.Slf4j;
import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

/**
 * @Auther: szl
 * @Date: 2020-07-06
 */
@Service
@Transactional(readOnly = true)
@Slf4j
public class CcmDssVideoService {



    @Autowired
    private SysConfigService sysConfigService;

    @Autowired
    private CcmOrgAreaService ccmOrgAreaService;

    @Autowired
    private CcmDeviceDao ccmDeviceDao;
    protected static final org.slf4j.Logger logger = LoggerFactory.getLogger(CcmDssVideoService.class);
    Return_Value_Info_t nGroupLen = new Return_Value_Info_t();
    private static boolean isStopThread ;
    public int m_nDLLHandle = -1;
    public native  int	DPSDK_Create(int nType, Return_Value_Info_t nDllHandle);
    public String 	m_strIp; //登录平台ip
    public int    	m_nPort ;//端口
    public String 	m_strUser;   //用户名
    public String 	m_strPassword ;  //密码

    public CcmRestResult getDssCameras() {
        isStopThread = true;
        CcmRestResult result = new CcmRestResult();
        SysConfig sysConfig = sysConfigService.get("dss_video_ocx_play");
        //解JSONR
        JSONObject jsonObject = JSONObject.parseObject(sysConfig.getParamStr());
        String dssIP = null;
        if(jsonObject.containsKey("dssIP")) {
            dssIP = jsonObject.getString("dssIP");
        }
        String dssPort = null;
        if(jsonObject.containsKey("dssPort")) {
            dssPort = jsonObject.getString("dssPort");
        }
        logger.info("dssIP ：-----------------------》》》"+dssIP);
        if(StringUtils.isNotEmpty(dssIP) && StringUtils.isNotEmpty(dssPort)) {
            logger.info("dssPort ：-----------------------》》》"+dssPort);
            if(isStopThread) {
                logger.info("dssHttp ：-----------------------》》》"+dssIP +"/"+ dssPort);
               /* DssCamerasInsertThread dssCamerasInsertThread = new DssCamerasInsertThread();
                dssCamerasInsertThread.start();*/
               this.runDss();
            }
            result.setCode(CcmRestType.OK);
            result.setResult(null);
        }else {
            result.setCode(CcmRestType.ERROR_PARAM);
            result.setResult(null);
        }
        return result;
    }
    /*class DssCamerasInsertThread extends Thread {*/
        public void runDss() {
            logger.info("11111111111111获取监控点开始");
            logger.error("11111111111111获取监控点开始");
            logger.debug("11111111111111获取监控点开始");
            System.out.println("获取监控点开始");
            isStopThread = false;
            SysConfig sysConfig = sysConfigService.get("dss_video_ocx_play");
            //解JSON
            JSONObject jsonObject = JSONObject.parseObject(sysConfig.getParamStr());
             m_strIp = jsonObject.getString("dssIP");
             m_nPort =  Integer.parseInt(jsonObject.getString("dssPort"));
            if(jsonObject.containsKey("dssUserName")) {
                m_strUser = jsonObject.getString("dssUserName");
            }
            if(jsonObject.containsKey("dssPassword")) {
                m_strPassword = jsonObject.getString("dssPassword");
            }
            this.OnCreate();
        }

    /*
     * 创建DPSDK
     * */
    public void OnCreate(){
        //fDPSDKDevStatusCallback fDeviceStatus = new fDPSDKDevStatusCallback();
        //fDPSDKNVRChnlStatusCallback fNVRChnlStatus = new fDPSDKNVRChnlStatusCallback();
        //fDPSDKGeneralJsonTransportCallback fGeneralJson = new fDPSDKGeneralJsonTransportCallback();
        //fDPSDKGetBayCarInfoCallbackEx fBayCarInfo = new fDPSDKGetBayCarInfoCallbackEx();
        //fDPSDKTrafficAlarmCallback fTrafficAlarmCallback = new fDPSDKTrafficAlarmCallback();
        //fDPSDKGetAreaSpeedDetectCallback fGetAreaSpeedDetectCallback = new fDPSDKGetAreaSpeedDetectCallback();
        int nRet = -1;
        Return_Value_Info_t res = new Return_Value_Info_t();
        IDpsdkCore A = new IDpsdkCore();
        nRet =A.DPSDK_Create(1,res);

        m_nDLLHandle = res.nReturnValue;
       /* String dpsdklog = "D:\\dpsdkjavalog";
        nRet = IDpsdkCore.DPSDK_SetLog(m_nDLLHandle, dpsdklog.getBytes());
        String dumpfile = "D:\\dpsdkjavadump";
        nRet = IDpsdkCore.DPSDK_StartMonitor(m_nDLLHandle, dumpfile.getBytes());*/
        if(m_nDLLHandle > 0){
            this.OnLogin();
            /*//设置设备状态上报监听函数
            nRet = IDpsdkCore.DPSDK_SetDPSDKDeviceStatusCallback(m_nDLLHandle, fDeviceStatus);
            //设置NVR通道状态上报监听函数
            nRet =IDpsdkCore.DPSDK_SetDPSDKNVRChnlStatusCallback(m_nDLLHandle, fNVRChnlStatus);
            //设置通用JSON回调
            nRet = IDpsdkCore.DPSDK_SetGeneralJsonTransportCallback(m_nDLLHandle, fGeneralJson);

            nRet = IDpsdkCore.DPSDK_SetDPSDKGetBayCarInfoCallbackEx(m_nDLLHandle, fBayCarInfo);

            nRet = IDpsdkCore.DPSDK_SetDPSDKTrafficAlarmCallback(m_nDLLHandle, fTrafficAlarmCallback);

            nRet = IDpsdkCore.DPSDK_SetDPSDKGetAreaSpeedDetectCallback(m_nDLLHandle, fGetAreaSpeedDetectCallback);*/
        }

        System.out.print("创建DPSDK, 返回 m_nDLLHandle = ");
        System.out.println(m_nDLLHandle);
    }

    /*
     * 登录
     * */
    public void OnLogin(){
        Login_Info_t loginInfo = new Login_Info_t();
        loginInfo.szIp = m_strIp.getBytes();
        loginInfo.nPort = m_nPort;
        loginInfo.szUsername = m_strUser.getBytes();
        loginInfo.szPassword = m_strPassword.getBytes();
        loginInfo.nProtocol = dpsdk_protocol_version_e.DPSDK_PROTOCOL_VERSION_II;
        loginInfo.iType = 1;
        logger.info("登录111111111，nRet = %d", loginInfo);
        logger.error("登录111111111，nRet = %d", loginInfo);
        logger.debug("登录111111111，nRet = %d", loginInfo);

        int nRet = IDpsdkCore.DPSDK_Login(m_nDLLHandle,loginInfo,10000);
        System.out.printf("登录22222222222，nRet = %d", nRet);
        if(nRet == dpsdk_retval_e.DPSDK_RET_SUCCESS){
            System.out.printf("登录成功--------------------->>，nRet = %d", nRet);
            LoadAllGroup();

        }else{
            System.out.printf("登录失败，nRet = %d", nRet);
        }
        System.out.println();
    }

    /*
     * 加载所有组织树
     * */
    public void LoadAllGroup(){

        int nRet = IDpsdkCore.DPSDK_LoadDGroupInfo(m_nDLLHandle, nGroupLen, 180000 );
        System.out.println("LoadAllGroup:  "+nRet);
        if(nRet == dpsdk_retval_e.DPSDK_RET_SUCCESS){
            System.out.printf("加载所有组织树成功，nRet = %d， nDepCount = %d", nRet, nGroupLen.nReturnValue);
            GetGroupStr();
        }else{
            System.out.printf("加载所有组织树失败，nRet = %d", nRet);
        }
        System.out.println();
    }

        /*
     * 获取所有组织树串
     * */
    public void GetGroupStr(){
        byte[] szGroupBuf = new byte[nGroupLen.nReturnValue];
        int nRet = IDpsdkCore.DPSDK_GetDGroupStr(m_nDLLHandle, szGroupBuf, nGroupLen.nReturnValue, 10000);

        if(nRet == dpsdk_retval_e.DPSDK_RET_SUCCESS){
            String GroupBuf = "";
            System.out.println("获取所有组织树串....nRet"+nRet);
            try {
                GroupBuf = new String(szGroupBuf, "UTF-8");
                System.out.println("获取所有组织树串....GroupBuf"+GroupBuf);
            } catch (IOException e) {
                e.printStackTrace();
            }
            System.out.printf("获取所有组织树串成功，nRet = %d， szGroupBuf = [%s]", nRet, GroupBuf);
            try {
                File file = new File("D:\\text.xml");
                if(!file.exists())
                {
                    file.createNewFile();
                }

                FileOutputStream out = new FileOutputStream(file);
                out.write(szGroupBuf);
                out.close();
            } catch (IOException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }

            //TODO
            //解析XML
            handleDeviceXML(nGroupLen.nReturnValue);
        }else{
            System.out.printf("获取所有组织树串失败，nRet = %d", nRet);
        }
        System.out.println();
        }

    private void handleDeviceXML(int nReturnValue) {

    }
}
