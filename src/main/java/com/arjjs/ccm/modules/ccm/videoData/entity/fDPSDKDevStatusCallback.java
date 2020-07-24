package com.arjjs.ccm.modules.ccm.videoData.entity;

import com.dh.DpsdkCore.Device_Info_Ex_t;
import com.dh.DpsdkCore.IDpsdkCore;
import com.dh.DpsdkCore.Return_Value_Info_t;
import com.dh.DpsdkCore.dpsdk_dev_type_e;
import com.dh.DpsdkCore.dpsdk_retval_e;

/** 设备状态回调.
 @param   IN									nPDLLHandle		        SDK句柄
 @param   IN									szDeviceId              设备ID（DVR+通道）
 @param   IN									nStatus		            参考dpsdk_device_status_type_e
 @remark									
*/
public class fDPSDKDevStatusCallback {
	public void invoke(int nPDLLHandle, byte[] szDeviceId, int nStatus) {
		Return_Value_Info_t res = new Return_Value_Info_t();
		int m_nDLLHandle = res.nReturnValue;
		String status = "离线";
		if(nStatus == 1)
		{
			status = "在线";
			Device_Info_Ex_t deviceInfo = new Device_Info_Ex_t();
			int nRet = IDpsdkCore.DPSDK_GetDeviceInfoExById(m_nDLLHandle, szDeviceId, deviceInfo);
			if(deviceInfo.nDevType == dpsdk_dev_type_e.DEV_TYPE_NVR || deviceInfo.nDevType == dpsdk_dev_type_e.DEV_TYPE_EVS || deviceInfo.nDevType == dpsdk_dev_type_e.DEV_TYPE_SMART_NVR || deviceInfo.nDevType == dpsdk_dev_type_e.DEV_MATRIX_NVR6000)
			{
				nRet = IDpsdkCore.DPSDK_QueryNVRChnlStatus(m_nDLLHandle, szDeviceId, 10*1000);

				if(nRet == dpsdk_retval_e.DPSDK_RET_SUCCESS)
				{
					//System.out.printf("查询NVR通道状态成功，deviceID = %s", new String(szDeviceId));
				}else
				{
					System.out.printf("查询NVR通道状态失败，deviceID = %s, nRet = %d", new String(szDeviceId), nRet);
				}
				//System.out.println();
			}
		}
		//System.out.printf("Device Status Report!, szDeviceId = %s, nStatus = %s", new String(szDeviceId),status);
		//System.out.println();
	}
}