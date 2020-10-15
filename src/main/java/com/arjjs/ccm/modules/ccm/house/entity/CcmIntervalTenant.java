package com.arjjs.ccm.modules.ccm.house.entity;

/**
 * @author cby
 * @title: CcmIntervalTenant
 * @description: TODO
 * @date 2020/10/12 15:16
 */
public class CcmIntervalTenant {
    private String tenantId;
    private String xqName;
    private String buildName;
    private String tenantNum;
    private String gridId;
    private String timeInterval;
    private String typeName;
    private String tableName;

    public String getXqName() {
        return xqName;
    }

    public void setXqName(String xqName) {
        this.xqName = xqName;
    }

    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

    public String getBuildName() {
        return buildName;
    }

    public void setBuildName(String buildName) {
        this.buildName = buildName;
    }

    public String getTenantNum() {
        return tenantNum;
    }

    public void setTenantNum(String tenantNum) {
        this.tenantNum = tenantNum;
    }

    public String getGridId() {
        return gridId;
    }

    public void setGridId(String gridId) {
        this.gridId = gridId;
    }

    public String getTimeInterval() {
        return timeInterval;
    }

    public void setTimeInterval(String timeInterval) {
        this.timeInterval = timeInterval;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }
}
