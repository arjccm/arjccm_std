package com.arjjs.ccm.modules.ccm.videoData.entity;


import java.io.File;
import java.lang.annotation.Native;

public class IDpsdkCore
{
    static {
    	try
    	{
//    		System.loadLibrary("dslalien");
//    		System.loadLibrary("libdsl");
//    		System.loadLibrary("PicSDK");
//    		System.loadLibrary("Infra");
//    		System.loadLibrary("StreamParser");
//    		System.loadLibrary("StreamPackage");
//    		System.loadLibrary("StreamConvertor");
//    		System.loadLibrary("PlatformSDK");
//    		System.loadLibrary("DPSDK_Core");
//    		System.loadLibrary("DPSDK_Java");
//    		String path1 = System.getProperty("user.dir") + File.separator + "WEB-INF" + File.separator + "lib" + File.separator;
			String path = IDpsdkCore.class.getResource("/").toString()+ File.separator;

			System.load(path + "dslalien.dll");
			System.load(path + "libdsl.dll");
			System.load(path +  "PicSDK.dll");
			System.load(path +"Infra.dll");
			System.load(path +"StreamParser.dll");
			System.load(path +"StreamPackage.dll");
			System.load(path +"StreamConvertor.dll");
			System.load(path +"PlatformSDK.dll");
			System.load(path +"DPSDK_Core.dll");
			System.load(path +"DPSDK_Java.dll");

    	}
		catch(UnsatisfiedLinkError ulink)
		{    
	        ulink.printStackTrace();   
		}  
    }

   	
    /************************************************************************
     ** 接口定义
     ***********************************************************************/
	/** 创建SDK句柄.
	 @param   IN	nType			SDK类型
	 @param   OUT	nDllHandle		返回SDK句柄，后续操作需要以此作为参数
	 @return  函数返回错误类型，参考dpsdk_retval_e
	 @remark									
	*/
	static public native  int	DPSDK_Create(int nType, Return_Value_Info_t nDllHandle);
	
	/** 删除SDK句柄.
	 @param   IN	nPDLLHandle		SDK句柄
	 @return  函数返回错误类型，参考dpsdk_retval_e
	 @remark		
	 1、需要和DPSDK_Create成对使用
	*/
	static public native  int	DPSDK_Destroy( int nPDLLHandle );
	

	
	/** 根据设备ID获取设备信息
	@param   IN    nPDLLHandle     SDK句柄
	@param   IN    szDevId		   设备ID
	@param   OUT   pDeviceInfoEx   设备信息
	@return  函数返回错误类型，参考dpsdk_retval_e
	@remark 
	*/
	static public native int DPSDK_GetDeviceInfoExById(int nPDLLHanle,  byte[] szDevId, Device_Info_Ex_t deviceInfoEx);
	
	/** 查询NVR通道状态
	@param   IN    nPDLLHandle     SDK句柄
	@param   IN    deviceId	       设备的ID
	@return  函数返回错误类型，参考dpsdk_retval_e
	@remark 
	*/
	static public native int DPSDK_QueryNVRChnlStatus(int nPDLLHandle, byte[] deviceId, int nTimeout);

	/** 注册平台.
	 @param   IN	nPDLLHandle		SDK句柄
	 @param   IN	loginInfo		用户登录信息
	 @param   IN	nTimeout		超时时长，单位毫秒
	 @return  函数返回错误类型，参考dpsdk_retval_e
	 @remark		
	*/
	static public native  int  DPSDK_Login( int nPDLLHandle, Login_Info_t loginInfo, int nTimeout);
	
	/** 登出平台.
	 @param   IN	nPDLLHandle		SDK句柄
	 @param   IN	nTimeout		超时时长，单位毫秒
	 @return  函数返回错误类型，参考dpsdk_retval_e
	 @remark		
	*/
	static public native  int  DPSDK_Logout( int nPDLLHandle, int nTimeout);

	/** 认证登录预登录.
	 @param   IN	nPDLLHandle		SDK句柄
	 @param   IN	loginWithEncryptionInfo	认证登录信息
	 @param   IN	nTimeout		超时时长，单位毫秒
	 @return  函数返回错误类型，参考dpsdk_retval_e
	 @remark		
	*/
	//static public native  int  DPSDK_PreLoginWithEncryption( int nPDLLHandle, LoginWithEncryption_Info_t loginWithEncryptionInfo, int nTimeout);
	
	/** 认证登录.
	 @param   IN	nPDLLHandle		SDK句柄
	 @param   IN	loginWithEncryptionInfo	认证登录信息
	 @param   IN	nTimeout		超时时长，单位毫秒
	 @return  函数返回错误类型，参考dpsdk_retval_e
	 @remark		
	*/
	//static public native  int  DPSDK_LoginWithEncryption( int nPDLLHandle, LoginWithEncryption_Info_t loginWithEncryptionInfo, int nTimeout);
	
	/** 获取用户Id.
	 @param   IN	nPDLLHandle		SDK句柄
	 @param   IN	nUserId			用户Id
	 @return  函数返回错误类型，参考dpsdk_retval_e
	 @remark		
	*/
	static public native  int DPSDK_GetUserID( int nPDLLHandle,  Return_Value_Info_t nUserId);


	/** 获取组织结构时，设置是否采用压缩格式获取.
	 @param   IN	nPDLLHandle			SDK句柄
	 @param   IN	nCompressType		是否采用压缩格式,参考dpsdk_get_devinfo_compress_type_e
	 @return  函数返回错误类型，参考dpsdk_retval_e
	 @remark									
	*/
	static public native  int DPSDK_SetCompressType( int nPDLLHandle, int nCompressType);
	
	/** 加载组织设备信息.
	 @param   IN	nPDLLHandle		SDK句柄
	 @param   OUT	nGroupLen       组织结构信息长度
	 @param   IN	nTimeout		超时时长，单位毫秒
	 @return  函数返回错误类型，参考dpsdk_retval_e
	 @remark		
	*/
	static public native  int DPSDK_LoadDGroupInfo( int nPDLLHandle, Return_Value_Info_t nGroupLen, int nTimeout );


	/** 获取组织设备信息串.
	 @param   IN	nPDLLHandle		SDK句柄
	 @param   IN	szGroupBuf		组织结构缓存,需要外部创建缓存，大小为nGroupLen+1
	 @param   OUT	nGroupLen       组织结构信息长度
	 @param   IN	nTimeout		超时时长，单位毫秒
	 @return  函数返回错误类型，参考dpsdk_retval_e
	 @remark
	 1、szGroupBuf需要在外面创建好
	 2、szGroupBuf的大小与nGroupLen需要一致或者大于nGroupLen
	*/
	static public native  int DPSDK_GetDGroupStr( int nPDLLHandle, byte szGroupBuf[], int nGroupLen, int nTimeout );

}


