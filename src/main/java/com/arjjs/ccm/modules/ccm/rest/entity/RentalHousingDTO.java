package com.arjjs.ccm.modules.ccm.rest.entity;

import java.util.List;


public class RentalHousingDTO {

    /**
     * 主键id
     */
    private String id;
    /**
     * 出租屋状态
     */
    private Integer bizStatus;
    /**
     * 部门id
     */
    private Long depId;
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
     * 租客信息
     */
    private List<TenantDTO> tenantDTOList;

    private UserVO userVO;

    public UserVO getUserVO() {
        return userVO;
    }

    public void setUserVO(UserVO userVO) {
        this.userVO = userVO;
    }

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

    public Long getDepId() {
        return depId;
    }

    public void setDepId(Long depId) {
        this.depId = depId;
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

    public List<TenantDTO> getTenantDTOList() {
        return tenantDTOList;
    }

    public void setTenantDTOList(List<TenantDTO> tenantDTOList) {
        this.tenantDTOList = tenantDTOList;
    }
}
