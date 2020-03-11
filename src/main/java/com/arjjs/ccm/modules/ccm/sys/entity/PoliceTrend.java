package com.arjjs.ccm.modules.ccm.sys.entity;

public class PoliceTrend {

    String alarmId;
    String alarmName;
    String alarmUser;
    String alarmState;
    String emphasis;

    public String getAlarmId() {
        return alarmId;
    }

    public void setAlarmId(String alarmId) {
        this.alarmId = alarmId;
    }

    public String getAlarmName() {
        return alarmName;
    }

    public void setAlarmName(String alarmName) {
        this.alarmName = alarmName;
    }

    public String getAlarmUser() {
        return alarmUser;
    }

    public void setAlarmUser(String alarmUser) {
        this.alarmUser = alarmUser;
    }

    public String getAlarmState() {
        return alarmState;
    }

    public void setAlarmState(String alarmState) {
        this.alarmState = alarmState;
    }

    public String getEmphasis() {
        return emphasis;
    }

    public void setEmphasis(String emphasis) {
        this.emphasis = emphasis;
    }

    public PoliceTrend(String alarmId, String alarmName, String alarmUser, String alarmState, String emphasis) {
        this.alarmId = alarmId;
        this.alarmName = alarmName;
        this.alarmUser = alarmUser;
        this.alarmState = alarmState;
        this.emphasis = emphasis;
    }
}
