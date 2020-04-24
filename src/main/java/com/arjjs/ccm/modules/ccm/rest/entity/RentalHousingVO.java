package com.arjjs.ccm.modules.ccm.rest.entity;

import java.util.Date;
import java.util.List;


public class RentalHousingVO {

    /**
     * id
     */
    private String id;
    /**
     * 出租状态
     */
    private Integer bizStatus;
    private Long userId;
    private Date gmtCreate;
    /**
     * 部门信息json
     */
    private String depInfo;
    /**
     * 出租类型
     * 0：个人  1：单位
     */
    private Integer type;
    /**
     * 出租屋详细地址
     */
    private String addressDetail;
    /**
     * 租客
     */
    private List<TenantVO> tenants;
    /**
     * 房东信息
     */
    private UserVO userVO;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getBizStatus() {
        return bizStatus;
    }

    public void setBizStatus(Integer bizStatus) {
        this.bizStatus = bizStatus;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public String getDepInfo() {
        return depInfo;
    }

    public void setDepInfo(String depInfo) {
        this.depInfo = depInfo;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail;
    }

    public List<TenantVO> getTenants() {
        return tenants;
    }

    public void setTenants(List<TenantVO> tenants) {
        this.tenants = tenants;
    }

    public UserVO getUserVO() {
        return userVO;
    }

    public void setUserVO(UserVO userVO) {
        this.userVO = userVO;
    }
}
