package com.arjjs.ccm.modules.ccm.rest.entity;



public class TenantVO {
    private String id;
    private String rentalHouseId;
    private String tenantName;
    private String tenantIdCard;
    private String tenantPhone;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRentalHouseId() {
        return rentalHouseId;
    }

    public void setRentalHouseId(String rentalHouseId) {
        this.rentalHouseId = rentalHouseId;
    }

    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }

    public String getTenantIdCard() {
        return tenantIdCard;
    }

    public void setTenantIdCard(String tenantIdCard) {
        this.tenantIdCard = tenantIdCard;
    }

    public String getTenantPhone() {
        return tenantPhone;
    }

    public void setTenantPhone(String tenantPhone) {
        this.tenantPhone = tenantPhone;
    }
}
