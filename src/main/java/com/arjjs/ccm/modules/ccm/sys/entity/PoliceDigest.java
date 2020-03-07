package com.arjjs.ccm.modules.ccm.sys.entity;

public class PoliceDigest {

    Integer value;
    String name;

    public PoliceDigest(Integer value, String name) {
        this.value = value;
        this.name = name;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
