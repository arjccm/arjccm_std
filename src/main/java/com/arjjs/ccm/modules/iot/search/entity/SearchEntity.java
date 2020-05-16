package com.arjjs.ccm.modules.iot.search.entity;

import com.arjjs.ccm.common.persistence.DataEntity;

import java.util.Date;

/**
 * 检索Entity
 * @author cby
 * @version 2019-07-24
 */
public class SearchEntity extends DataEntity<SearchEntity> {
    private String listId;
    private Double minThreshold;
    private Double maxThreshold;
    private Date startTime;
    private Date endTime;
    private String imagesUrl;

    public String getListId() {
        return listId;
    }

    public void setListId(String listId) {
        this.listId = listId;
    }

    public Double getMinThreshold() {
        return minThreshold;
    }

    public void setMinThreshold(Double minThreshold) {
        this.minThreshold = minThreshold;
    }

    public Double getMaxThreshold() {
        return maxThreshold;
    }

    public void setMaxThreshold(Double maxThreshold) {
        this.maxThreshold = maxThreshold;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getImagesUrl() {
        return imagesUrl;
    }

    public void setImagesUrl(String imagesUrl) {
        this.imagesUrl = imagesUrl;
    }
}
