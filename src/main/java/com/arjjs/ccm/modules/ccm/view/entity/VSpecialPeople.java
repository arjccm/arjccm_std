package com.arjjs.ccm.modules.ccm.view.entity;

import com.arjjs.ccm.common.persistence.TreeEntity;
import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.validation.constraints.NotNull;

public class VSpecialPeople extends TreeEntity<VSpecialPeople> {
    private static final long serialVersionUID = 1L;
    private String name;		// 姓名
    private String id;

    @Override
    public VSpecialPeople getParent() {
        return null;
    }

    @Override
    public void setParent(VSpecialPeople vSpecialPeople) {

    }

    @Override
    public String getName() {
        return name;
    }

    @Override
    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }
}
