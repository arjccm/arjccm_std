/*
 * DPSDK的java版demo
 * 运行时请先修改ip,端口，用户名，密码，修改通道ID，参考《组织树XML解析手册》和《常见问题解答》文档
 * 请修改lib的native library路径
 * */

package com.arjjs.ccm.modules.ccm.videoData.service;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import com.dh.DpsdkCore.*;

public class TestDPSDKMain 
{
	public static int m_nDLLHandle = -1;
	public String   m_strAlarmCamareID = "1000000";    //报警设备ID
	public String   m_strRealCamareID = "1000000$1$0$0";    //实时通道ID
	public String	m_strDownloadCamID = "1000000$1$0$12";	//下载通道ID
	public String	m_strPersonCountCamID = "1000000$1$0$0";//人数统计通道ID
	public String   m_strAlarmCtrlOutCameraID = "1000000$3$0&0"; //报警输出控制
	public String   m_strPtzCtrlCameraID = "1000000$1$0$0";		 //云台操作控制
	
	public String 	m_strIp 		= "10.35.164.6";   //登录平台ip
	public int    	m_nPort 		= 9000;            //端口
	public String 	m_strUser 		= "system";        //用户名
	public String 	m_strPassword 	= "dahua2006";    //密码
	
	Return_Value_Info_t nGroupLen = new Return_Value_Info_t();
	
	public String   m_strQueryAlarmCamareID = "1000000$1$0$0";    //报警设备ID
	public String	m_strNVRDeviceID = "1000000";
	public String	davPath = "D:\\downoladtest.dav";
	FileOutputStream writer = null;
	public static int nDownloadSeq = 0;
	public static boolean bDownloadFinish = false;
	
	public static String StrCarNum;
	

	
	/*
	 * 创建DPSDK
	 * */
	public void OnCreate()
	{
		int nRet = -1;
		Return_Value_Info_t res = new Return_Value_Info_t();
		nRet =IDpsdkCore.DPSDK_Create(dpsdk_sdk_type_e.DPSDK_CORE_SDK_SERVER,res);
		
		m_nDLLHandle = res.nReturnValue;
		
		if(m_nDLLHandle > 0)
		{
			
		}
		
		System.out.print("创建DPSDK, 返回 m_nDLLHandle = ");
		System.out.println(m_nDLLHandle);
	}
	
	/*
	 * 登录
	 * */
	public void OnLogin()
	{
		Login_Info_t loginInfo = new Login_Info_t();
		loginInfo.szIp = m_strIp.getBytes();
		loginInfo.nPort = m_nPort;
		loginInfo.szUsername = m_strUser.getBytes();
		loginInfo.szPassword = m_strPassword.getBytes();
		loginInfo.nProtocol = dpsdk_protocol_version_e.DPSDK_PROTOCOL_VERSION_II;
		loginInfo.iType = 1;

		int nRet = IDpsdkCore.DPSDK_Login(m_nDLLHandle,loginInfo,10000);
		if(nRet == dpsdk_retval_e.DPSDK_RET_SUCCESS)
		{
			System.out.printf("登录成功，nRet = %d", nRet);
		}else
		{
			System.out.printf("登录失败，nRet = %d", nRet);
		}
		System.out.println();
	}
	
	/*
	 * 加载所有组织树
	 * */
	public void LoadAllGroup()
	{
		int nRet = IDpsdkCore.DPSDK_LoadDGroupInfo(m_nDLLHandle, nGroupLen, 180000 );
		
		if(nRet == dpsdk_retval_e.DPSDK_RET_SUCCESS)
		{
			System.out.printf("加载所有组织树成功，nRet = %d， nDepCount = %d", nRet, nGroupLen.nReturnValue);
		}else
		{
			System.out.printf("加载所有组织树失败，nRet = %d", nRet);
		}
		System.out.println();
	}
	
	/*
	 * 获取所有组织树串
	 * */
	public void GetGroupStr()
	{
		byte[] szGroupBuf = new byte[nGroupLen.nReturnValue];
		int nRet = IDpsdkCore.DPSDK_GetDGroupStr(m_nDLLHandle, szGroupBuf, nGroupLen.nReturnValue, 10000);
		
		if(nRet == dpsdk_retval_e.DPSDK_RET_SUCCESS)
		{
			String GroupBuf = "";
			try {
				GroupBuf = new String(szGroupBuf, "UTF-8");
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
				
				FileOutputStream  out = new FileOutputStream(file);
				out.write(szGroupBuf);
				out.close();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}else
		{
			System.out.printf("获取所有组织树串失败，nRet = %d", nRet);
		}
		System.out.println();
	}
	
	
	
	public static void main(String[] args) 
	{
		TestDPSDKMain app=new TestDPSDKMain();
		app.OnCreate();//初始化
		app.OnLogin();//登陆
		
		
		app.LoadAllGroup();//加载组织结构
		
		app.GetGroupStr();//获取组织结构串
		
		try{
			Thread.sleep(5000);
		}catch(InterruptedException e){
			e.printStackTrace();
		}
		
	}
}
