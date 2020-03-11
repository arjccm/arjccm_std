/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.flat.alarm.entity;

import com.arjjs.ccm.common.persistence.DataEntity;

/**
 * 警情概要
 * 
 * @author wangyikai
 * @version 2018-11-14
 */
public class BphAlarmInfo3 extends DataEntity<BphAlarmInfo3> {


	private String label; // 警情类型
	private Integer num; // 警情数量




    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }
}