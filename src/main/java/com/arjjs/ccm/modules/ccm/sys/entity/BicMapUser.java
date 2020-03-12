package com.arjjs.ccm.modules.ccm.sys.entity;

import java.util.List;
import java.util.Map;

public class BicMapUser {


    private  String uid;
    private  String name;
    private  int[] weekedPlan;

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

    public int[] getWeekedPlan() {
        return weekedPlan;
    }

    public void setWeekedPlan(int[] weekedPlan) {
        this.weekedPlan = weekedPlan;
    }

    public BicMapUser(String uid, String name,int[] weekedPlan) {
        this.uid = uid;
        this.name = name;
        this.weekedPlan = weekedPlan;
    }
}
