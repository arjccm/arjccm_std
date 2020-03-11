package com.arjjs.ccm.modules.ccm.sys.entity;

import java.util.Map;

public class BicMapUser {


    private  String uid;
    private  String name;
    private Map<String,String> weekedPlan;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Map<String, String> getWeekedPlan() {
        return weekedPlan;
    }

    public void setWeekedPlan(Map<String, String> weekedPlan) {
        this.weekedPlan = weekedPlan;
    }

    public BicMapUser(String uid, String name, Map<String, String> weekedPlan) {
        this.uid = uid;
        this.name = name;
        this.weekedPlan = weekedPlan;
    }
}
