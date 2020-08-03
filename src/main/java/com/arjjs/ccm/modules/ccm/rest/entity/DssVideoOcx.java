package com.arjjs.ccm.modules.ccm.rest.entity;

import com.arjjs.ccm.common.persistence.DataEntity;

/**
 * * 大华视频播放OCX Entity
 * @Auther: szl
 * @Date: 2020-07-17
 */
public class DssVideoOcx extends DataEntity<DssVideoOcx> {

    private String dssIP;
    private String dssPort;
    private String dssUserName;
    private String dssPassword;

    public String getDssIP() {
        return dssIP;
    }

    public void setDssIP(String dssIP) {
        this.dssIP = dssIP;
    }

    public String getDssPort() {
        return dssPort;
    }

    public void setDssPort(String dssPort) {
        this.dssPort = dssPort;
    }

    public String getDssUserName() {
        return dssUserName;
    }

    public void setDssUserName(String dssUserName) {
        this.dssUserName = dssUserName;
    }

    public String getDssPassword() {
        return dssPassword;
    }

    public void setDssPassword(String dssPassword) {
        this.dssPassword = dssPassword;
    }
}
