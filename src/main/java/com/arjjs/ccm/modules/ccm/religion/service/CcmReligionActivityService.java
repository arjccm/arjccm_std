/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.religion.service;

import java.util.List;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.modules.ccm.religion.dao.CcmReligionActivityDao;
import com.arjjs.ccm.modules.ccm.religion.entity.CcmReligionActivity;
import com.arjjs.ccm.tool.EchartType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



/**
 * 宗教活动表Service
 *
 * @author lgh
 * @version 2020-02-11
 */
@Service
@Transactional(readOnly = true)
public class CcmReligionActivityService extends CrudService<CcmReligionActivityDao, CcmReligionActivity> {

	@Autowired
	private CcmReligionActivityDao ccmReligionActivityDao;

    public List<EchartType>  findByScale() {
        return ccmReligionActivityDao.findByScale();
    }

    public List<EchartType>  findByType() {
        return ccmReligionActivityDao.findByType();
    }

    public CcmReligionActivity get(String id) {
        return super.get(id);
    }

    public List<CcmReligionActivity> findList(CcmReligionActivity ccmReligionActivity) {
        return super.findList(ccmReligionActivity);
    }

    public Page<CcmReligionActivity> findPage(Page<CcmReligionActivity> page, CcmReligionActivity ccmReligionActivity) {
        return super.findPage(page, ccmReligionActivity);
    }

    @Transactional(readOnly = false)
    public void save(CcmReligionActivity ccmReligionActivity) {
        super.save(ccmReligionActivity);
    }

    @Transactional(readOnly = false)
    public void delete(CcmReligionActivity ccmReligionActivity) {
        super.delete(ccmReligionActivity);
    }

}