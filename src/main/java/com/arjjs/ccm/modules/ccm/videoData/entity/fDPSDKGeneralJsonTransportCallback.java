package com.arjjs.ccm.modules.ccm.videoData.entity;

/** Json传输协议回调
@param szJson	Json字符串
*/
public class fDPSDKGeneralJsonTransportCallback {
	public void invoke(int nPDLLHandle, byte[] szJson) {
		System.out.printf("General Json Return, ReturnJson = %s", new String(szJson));
		System.out.println();
	}
}
