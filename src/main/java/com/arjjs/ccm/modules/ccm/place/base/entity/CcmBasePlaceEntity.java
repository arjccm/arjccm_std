package com.arjjs.ccm.modules.ccm.place.base.entity;

import com.arjjs.ccm.modules.sys.entity.Area;

public class CcmBasePlaceEntity {
    private String id;
    private String placeName;
    private String address; // 地址
    private String workerNumber; // 工作人员数量
    private String keyPoint; // 重点属性
    private String leaderName; // 负责人姓名
    private String leaderContact; // 负责人联系方式
    private String areaPoint;		// 中心点
    private String areaMap;		// 中心点
    private Area area;	//

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getWorkerNumber() {
        return workerNumber;
    }

    public void setWorkerNumber(String workerNumber) {
        this.workerNumber = workerNumber;
    }

    public String getKeyPoint() {
        return keyPoint;
    }

    public void setKeyPoint(String keyPoint) {
        this.keyPoint = keyPoint;
    }

    public String getLeaderName() {
        return leaderName;
    }

    public void setLeaderName(String leaderName) {
        this.leaderName = leaderName;
    }

    public String getLeaderContact() {
        return leaderContact;
    }

    public void setLeaderContact(String leaderContact) {
        this.leaderContact = leaderContact;
    }

    public String getAreaPoint() {
        return areaPoint;
    }

    public void setAreaPoint(String areaPoint) {
        this.areaPoint = areaPoint;
    }

    public String getAreaMap() {
        return areaMap;
    }

    public void setAreaMap(String areaMap) {
        this.areaMap = areaMap;
    }

    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }
}
