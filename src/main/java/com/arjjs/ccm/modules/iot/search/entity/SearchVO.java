package com.arjjs.ccm.modules.iot.search.entity;

/**
 * 检索展示
 * @author cby
 * @version 2019-07-24
 */
public class SearchVO {
    private String age;
    private String birthday;
    private String credentialsType;
    private String credentialsNum;
    private String humanName;
    private String facePicUrl;
    private String listLibId;
    private String humanId;
    private String sex;
    private String similarity;

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getCredentialsType() {
        return credentialsType;
    }

    public void setCredentialsType(String credentialsType) {
        this.credentialsType = credentialsType;
    }

    public String getCredentialsNum() {
        return credentialsNum;
    }

    public void setCredentialsNum(String credentialsNum) {
        this.credentialsNum = credentialsNum;
    }

    public String getHumanName() {
        return humanName;
    }

    public void setHumanName(String humanName) {
        this.humanName = humanName;
    }

    public String getFacePicUrl() {
        return facePicUrl;
    }

    public void setFacePicUrl(String facePicUrl) {
        this.facePicUrl = facePicUrl;
    }

    public String getListLibId() {
        return listLibId;
    }

    public void setListLibId(String listLibId) {
        this.listLibId = listLibId;
    }

    public String getHumanId() {
        return humanId;
    }

    public void setHumanId(String humanId) {
        this.humanId = humanId;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getSimilarity() {
        return similarity;
    }

    public void setSimilarity(String similarity) {
        this.similarity = similarity;
    }
}
