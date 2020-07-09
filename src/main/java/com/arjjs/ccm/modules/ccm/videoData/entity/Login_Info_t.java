package com.arjjs.ccm.modules.ccm.videoData.entity;

/**
 * @Auther: szl
 * @Date: 2020-07-06
 */
public class Login_Info_t {

    public byte[] szIp = new byte[dpsdk_constant_value.DPSDK_CORE_IP_LEN];                              // 服务IP

    public int nPort;      // 服务端口

    public byte[]  szUsername  = new byte[dpsdk_constant_value.DPSDK_CORE_USER_NAME_LEN];     // 显示通道;

    public byte[]  szPassword  = new byte[dpsdk_constant_value.DPSDK_CORE_PASSWORD_LEN];     // 输入通道组号;

    public int  nProtocol;  // 协议类型,参考类dpsdk_protocol_version_e定义

    public int  iType;      // 登陆类型，1为PC客户端, 2为手机客户端


}
