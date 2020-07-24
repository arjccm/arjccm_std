package com.arjjs.ccm.modules.ccm.videoData.service;

import com.alibaba.fastjson.JSONObject;
import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.modules.ccm.ccmsys.dao.CcmDeviceDao;
import com.arjjs.ccm.modules.ccm.ccmsys.entity.CcmDevice;
import com.arjjs.ccm.modules.ccm.ccmsys.entity.CcmDeviceArea;
import com.arjjs.ccm.modules.ccm.org.entity.CcmOrgArea;
import com.arjjs.ccm.modules.ccm.org.service.CcmOrgAreaService;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestResult;
import com.arjjs.ccm.modules.ccm.rest.entity.CcmRestType;
import com.arjjs.ccm.modules.ccm.sys.entity.SysConfig;
import com.arjjs.ccm.modules.ccm.sys.service.SysConfigService;
import com.arjjs.ccm.modules.sys.entity.Area;
import com.arjjs.ccm.modules.sys.entity.User;
import com.arjjs.ccm.tool.Tool;
import com.dh.DpsdkCore.IDpsdkCore;
import com.dh.DpsdkCore.Login_Info_t;
import com.dh.DpsdkCore.Return_Value_Info_t;
import com.dh.DpsdkCore.dpsdk_protocol_version_e;
import com.dh.DpsdkCore.dpsdk_retval_e;
import com.dh.DpsdkCore.dpsdk_sdk_type_e;
import com.google.common.collect.Lists;

import groovy.util.logging.Slf4j;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

/**
 * @Auther: szl
 * @Date: 2020-07-06
 */
@Service
@Transactional
@Slf4j
public class CcmDssVideoService extends BaseController {

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
            logger.info("----------获取监控点开始----");
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
        int nRet = -1;
        Return_Value_Info_t res = new Return_Value_Info_t();
        nRet =IDpsdkCore.DPSDK_Create(dpsdk_sdk_type_e.DPSDK_CORE_SDK_SERVER,res);
        m_nDLLHandle = res.nReturnValue;
        logger.info("创建DPSDK, 返回 m_nDLLHandle = "+m_nDLLHandle);
        if(m_nDLLHandle > 0){
            this.OnLogin();
        }
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
        logger.info("登录参数，loginInfo = "+loginInfo);
        int nRet = IDpsdkCore.DPSDK_Login(m_nDLLHandle,loginInfo,10000);
        logger.info("登录返回值，nRet = "+nRet);
        if(nRet == dpsdk_retval_e.DPSDK_RET_SUCCESS){
            logger.info("登录成功------->>，nRet ="+nRet);
            LoadAllGroup();

        }else{
            logger.info("登录失败，nRet = "+nRet);
        }
        
    }

    /*
     * 加载所有组织树
     * */
    public void LoadAllGroup(){

        int nRet = IDpsdkCore.DPSDK_LoadDGroupInfo(m_nDLLHandle, nGroupLen, 180000 );
        logger.info("LoadAllGroup:  "+nRet);
        if(nRet == dpsdk_retval_e.DPSDK_RET_SUCCESS){
            logger.info("加载所有组织树成功，nRet = {}， nDepCount = {}", nRet, nGroupLen.nReturnValue);
            GetGroupStr();
        }else{
            logger.info("加载所有组织树失败，nRet = {}", nRet);
        }
    }

        /*
     * 获取所有组织树串
     * */
    public void GetGroupStr(){
        byte[] szGroupBuf = new byte[nGroupLen.nReturnValue];
        int nRet = IDpsdkCore.DPSDK_GetDGroupStr(m_nDLLHandle, szGroupBuf, nGroupLen.nReturnValue, 10000);
        logger.info("获取所有组织树串1....nRet"+nRet);
        if(nRet == dpsdk_retval_e.DPSDK_RET_SUCCESS){
            String GroupBuf = "";
            try {
                GroupBuf = new String(szGroupBuf, "UTF-8");
            } catch (IOException e) {
                logger.info("获取所有组织树串失败，nRet = {}，", nRet );
                logger.info(e.getMessage());
            }
            logger.info("获取所有组织树串成功，nRet = {}，", nRet );
            try {
                File file = new File(Global.getConfig("FILE_XML_PATH"));
                if(!file.exists())
                {
                    file.createNewFile();
                }

                FileOutputStream out = new FileOutputStream(file);
                out.write(szGroupBuf);
                out.close();
            } catch (IOException e1) {
                e1.printStackTrace();
            }

            if(StringUtils.isNotBlank(GroupBuf)) {
                areaList.clear();
                List<CcmOrgArea> orgAreaList = ccmOrgAreaService.getAreaMap(new CcmOrgArea());
                this.sortList(areaList, orgAreaList, "0", true);
                List<CcmDevice> list = handleDeviceXML();
                if(list != null && list.size()>0) {
                    for (CcmDevice ccm : list) {
                        if(StringUtils.isNotBlank(ccm.getCode())) {
                            CcmDevice ccmDevice = ccmDeviceDao.getByCode(ccm.getCode());
                            if(ccmDevice == null || "".equals(ccmDevice.getId())) {//通过code没有取到对应设备，再通过名称去取设备（现场网关对接会经常改code，故增加名称的更新）
                                CcmDevice ccmDeviceFrom = new CcmDevice();
                                ccmDeviceFrom.setName(ccm.getName());
                                List<CcmDevice> ccmDeviceList = ccmDeviceDao.findList(ccmDeviceFrom);
                                if (ccmDeviceList != null && ccmDeviceList.size() == 1) {//通过名称取到一条设备数据，则进行数据更新操作
                                    try {
                                        if(ccmDeviceList.get(0).getIp() != null && ccm.getIp() != null && 
                                                !ccmDeviceList.get(0).getIp().equals(ccm.getIp())) {//如果ip不一样，进行插入操作
                                            User userTmp = new User();
                                            userTmp.setId("1");
                                            ccm.setCreateBy(userTmp);
                                            ccm.setCreateDate(new Date());
                                            ccm.setUpdateBy(userTmp);
                                            ccm.setUpdateDate(new Date());
                                            ccm.setDelFlag("0");
                                            ccm.setName(ccm.getName()+"_"+ccm.getIp());
                                            ccmDeviceDao.insert(ccm);
                                            continue;
                                        }
                                    } catch (Exception e) {
                                        ccmDeviceDao.insert(ccm);
                                        continue;
                                    }
                                    ccmDeviceDao.update(ccm);
                                } else {//code没有取到，名称没有取到，则新增数据
                                    User userTmp = new User();
                                    userTmp.setId("1");
                                    ccm.setCreateBy(userTmp);
                                    ccm.setCreateDate(new Date());
                                    ccm.setUpdateBy(userTmp);
                                    ccm.setUpdateDate(new Date());
                                    ccm.setDelFlag("0");
                                    ccmDeviceDao.insert(ccm);
                                }
                            } else {//通过code取得数据，则更新数据
                                ccmDeviceDao.update(ccm);
                            }
                        }
                    }
                }
            }
        }else{
            logger.info("获取所有组织树串失败，nRet = {}", nRet);
        }
        }
    
    private List<CcmDevice> handleDeviceXML() {
         logger.info("start--------解析xml数据");
        List<CcmDevice> ccmList = new ArrayList<CcmDevice>();
        // 创建一个DocumentBuilderFactory的对象
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        try {
            // 创建DocumentBuilder对象
            DocumentBuilder db = dbf.newDocumentBuilder();
            // 通过DocumentBuilder对象的parser方法加载books.xml文件到当前项目下
            Document document = db.parse(Global.getConfig("FILE_XML_PATH"));
            
            Element element = document.getDocumentElement();
            NodeList childNodes = element.getChildNodes();
            
            for (int i = 0; i < childNodes.getLength(); i++) {
                Node node = childNodes.item(i);//获取到是Department和Devices节点
                if(node == null || "#text".equals(node.getNodeName())) {
                    continue;
                }
                //解析Devices节点
                if ("Devices".equals(node.getNodeName())) {
                    NodeList device = node.getChildNodes();//获取所有的Device节点
                    for (int j = 0; j < device.getLength(); j++) {
                        Node deviceNode = device.item(j);
                        if(deviceNode == null || "#text".equals(deviceNode.getNodeName())) {
                            continue;
                        }
                        NodeList unitNodes = deviceNode.getChildNodes();
                        for (int m = 0; m < unitNodes.getLength(); m++) {
                            Node unitNode = unitNodes.item(m);
                            if(unitNode == null || "#text".equals(unitNode.getNodeName())) {
                                continue;
                            }
                            //解析UnitNodes节点
                            if("UnitNodes".equals(unitNode.getNodeName())) {//获取所有UnitNodes节点
                                NamedNodeMap attrUnitNode = unitNode.getAttributes();
                                if(attrUnitNode ==null || attrUnitNode.equals("#text")) {
                                    continue;
                                }
                                for (int n = 0; n < attrUnitNode.getLength(); n++) {
                                    Node unitAttr = attrUnitNode.item(n);
                                    if("type".equals(unitAttr.getNodeName())
                                            && "1".equals(unitAttr.getNodeValue())) {//编码单元（type=”1”）
                                        //解析Channel节点
                                        NodeList channelNodes = unitNode.getChildNodes();
                                        for (int t = 0; t < channelNodes.getLength(); t++) {
                                            Node channelAttr = channelNodes.item(t);
                                            if("#text".equals(channelAttr.getNodeName())) {
                                                continue;
                                            }
                                            NamedNodeMap attrsChannel = channelAttr.getAttributes();
                                            if(attrsChannel ==null || attrsChannel.equals("#text")) {
                                                continue;
                                            }
                                            CcmDevice ccm = new CcmDevice();
                                            String longitude = "";
                                            String latitude = "";
                                            for (int g = 0; g < attrsChannel.getLength(); g++) {
                                                Node attr = attrsChannel.item(g);
                                                //通道Id
                                                if("id".equals(attr.getNodeName())) {
                                                    ccm.setParam(attr.getNodeValue());
                                                }
                                                //通道名称
                                                if("name".equals(attr.getNodeName())) {
                                                    ccm.setName(attr.getNodeValue());
                                                }
                                                //通道code
                                                if("channelSN".equals(attr.getNodeName())) {
                                                    ccm.setCode(attr.getNodeValue());
                                                }
                                                
                                                //数据库0:'枪机'；1:'球机';2:'半球'
                                                if("cameraType".equals(attr.getNodeName())) {
                                                    //大华：1 枪机，2 球机，3 半球，4 证据通道。
                                                    try {                                                        
                                                        ccm.setType((Integer.parseInt(attr.getNodeValue())-1)+"");
                                                    } catch (Exception e) {
                                                        ccm.setType("3");
                                                    }
                                                }
                                                
                                                //经度
                                                if("longitude".equals(attr.getNodeName())) {
                                                    longitude = attr.getNodeValue();
                                                }
                                                //纬度
                                                if("latitude".equals(attr.getNodeName())) {
                                                    latitude = attr.getNodeValue();
                                                }
                                                
                                            }
                                           //区域id
                                            String areaId = "";
                                            if(StringUtils.isNotBlank(longitude) && StringUtils.isNotBlank(latitude)) {                         
                                                String coordinate = longitude + "," + latitude;
                                                ccm.setCoordinate(coordinate);
                                                List<String> pointList = Lists.newArrayList();
                                                areaId = this.getDeviceAreaId(areaList, pointList, Double.parseDouble(longitude), Double.parseDouble(latitude));
                                            }
                                            if(StringUtils.isBlank(areaId)) {
                                                areaId = Global.getConfig("DOCKING_MONITORING_POINT");
                                                if(StringUtils.isBlank(areaId)) {
                                                    areaId = "0ac94bc554e241e9abeedcb982000003";
                                                }
                                            }
                                            if(StringUtils.isNotBlank(areaId)) {
                                                Area areaTmp = new Area();
                                                areaTmp.setId(areaId);
                                                ccm.setArea(areaTmp);
                                            }
                                            ccm.setTypeVidicon("3");
                                            //获取Device节点的所有属性集合
                                            NamedNodeMap attrsDev = deviceNode.getAttributes();
                                            if(attrsDev ==null || attrsDev.equals("#text")) {
                                                continue;
                                            }
                                            //遍历device的属性
                                            for (int k = 0; k < attrsDev.getLength(); k++) {
                                                Node attrDev = attrsDev.item(k);
                                                //设备id
                                                if("id".equals(attrDev.getNodeName())) {
                                                    ccm.setId(UUID.randomUUID().toString().replace("-", ""));
                                                }
                                                //ip
                                                if("ip".equals(attrDev.getNodeName())) {
                                                    ccm.setIp(attrDev.getNodeValue());
                                                }
                                                //端口
                                                if("port".equals(attrDev.getNodeName())) {
                                                    ccm.setPort(attrDev.getNodeValue());
                                                }
                                                //用户名
                                                if("user".equals(attrDev.getNodeName())) {
                                                    ccm.setAccount(attrDev.getNodeValue());
                                                }
                                                //密码
                                                if("password".equals(attrDev.getNodeName())) {
                                                    ccm.setPassword(attrDev.getNodeValue());
                                                }
                                                //设备类型
                                                if("type".equals(attrDev.getNodeName())) {
                                                    ccm.setTypeId(attrDev.getNodeValue());
                                                }
                                                //厂商
                                                if("manufacturer".equals(attrDev.getNodeName())) {
                                                    if("1".equals(attrDev.getNodeValue())) {
                                                        ccm.setCompanyId("dahua");
                                                    }else if("2".equals(attrDev.getNodeValue())) {
                                                        ccm.setCompanyId("hikvision");
                                                    }else {
                                                        ccm.setCompanyId("dahua");
                                                    }                                              }
                                                //设备状态
                                                if("status".equals(attrDev.getNodeName())) {
                                                    ccm.setStatus(attrDev.getNodeValue());
                                                }
                                               
                                            } 
                                            ccmList.add(ccm);
                                            
                                        }
                                    }
                                }
                            }
                        }
                    }
                } 
            }
            
        } catch (ParserConfigurationException e) {
            logger.info(e.getMessage());
        } catch (SAXException e) {
            logger.info(e.getMessage());
        } catch (IOException e) {
            logger.info(e.getMessage());
        }
        logger.info("end----------解析xml数据");
        return ccmList;
        
    }
    
    private List<CcmDeviceArea> areaList = Lists.newArrayList();
    
    public void sortList(List<CcmDeviceArea> list, List<CcmOrgArea> sourcelist, String parentId, boolean cascade) {
        for(int i = 0; i < sourcelist.size(); ++i) {
            CcmOrgArea e = (CcmOrgArea)sourcelist.get(i);
            if (e.getAreaParentId() != null && e.getAreaParentId().equals(parentId)) {
                CcmDeviceArea ccmDeviceArea = new CcmDeviceArea();
                ccmDeviceArea.setId(e.getAreaId());
                ccmDeviceArea.setAreaMap(e.getAreaMap());
                List<CcmDeviceArea> childrenList = Lists.newArrayList();
                ccmDeviceArea.setChildrenList(childrenList);
                list.add(ccmDeviceArea);
                if (cascade) {
                    for(int j = 0; j < sourcelist.size(); ++j) {
                        CcmOrgArea child = (CcmOrgArea)sourcelist.get(j);
                        if (child.getAreaParentId() != null && child.getAreaParentId().equals(e.getAreaId())) {
                            sortList(childrenList, sourcelist, e.getAreaId(), true);
                            break;
                        }
                    }
                }
            }
        }
    }
    
    public String getDeviceAreaId(List<CcmDeviceArea> resultList, List<String> pointList, double lat, double lon) {
        String areaId = null;
        for (int i = 0; i < resultList.size(); i++) {
            CcmDeviceArea ccmDeviceArea = resultList.get(i);
            if(ccmDeviceArea != null) {
                List<CcmDeviceArea> childrenList = ccmDeviceArea.getChildrenList();
                if(childrenList.size() > 0) {
                    areaId = getDeviceAreaId(childrenList,pointList,lat,lon);
                    if(StringUtils.isBlank(areaId)) {
                        areaId = isInPolygon(pointList, ccmDeviceArea, lat, lon);
                    }
                }else {
                    areaId = isInPolygon(pointList, ccmDeviceArea, lat, lon);
                }
                if(StringUtils.isNotBlank(areaId)) {
                    break;
                }
            }
        }
        return areaId;
    }
    
    public String isInPolygon(List<String> pointList,CcmDeviceArea ccmDeviceArea, double lat, double lon) {
        boolean flag = false;
        String areaId = null;
        String areaMap = ccmDeviceArea.getAreaMap();
        if(StringUtils.isNotBlank(areaMap) && areaMap.contains(";")) {//增加判断，pengjianqiang
            String[] point = areaMap.split(";");
            pointList.addAll(Arrays.asList(point));
            double[] latList = new double[pointList.size()];
            double[] lonList = new double[pointList.size()];
            for(int i = 0; i < pointList.size(); i++) {
                if (pointList.get(i).contains(",")) {//增加判断，pengjianqiang
                    String[] pointInfo = pointList.get(i).split(",");
                    latList[i] = Double.valueOf(pointInfo[0]);
                    lonList[i] = Double.valueOf(pointInfo[1]);
                }
            }
            flag = Tool.isInPolygon(lon, lat, lonList, latList);
            if(flag) {
                areaId = ccmDeviceArea.getId();
            }
        }
        return areaId;
    }
}
