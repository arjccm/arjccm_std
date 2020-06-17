/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.log.service;

import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.service.CrudService;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.log.dao.CcmLogImpPopSignDao;
import com.arjjs.ccm.modules.ccm.log.entity.CcmLogImpPopSign;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 重点人员签到记录Service
 * @author pengjianqiang
 * @version 2019-03-05
 */
@Service
@Transactional(readOnly = true)
public class CcmLogImpPopSignService extends CrudService<CcmLogImpPopSignDao, CcmLogImpPopSign> {

	public CcmLogImpPopSign get(String id) {
		return super.get(id);
	}

	public List<CcmLogImpPopSign> findList(CcmLogImpPopSign ccmLogImpPopSign) {
		return super.findList(ccmLogImpPopSign);
	}

	public Page<CcmLogImpPopSign> findPage(Page<CcmLogImpPopSign> page, CcmLogImpPopSign ccmLogImpPopSign) {
		return super.findPage(page, ccmLogImpPopSign);
	}

	@Transactional(readOnly = false)
	public void save(CcmLogImpPopSign ccmLogImpPopSign) {
		if(StringUtils.isNotEmpty(ccmLogImpPopSign.getPic())){
			if(ccmLogImpPopSign.getPic().contains("http")){
				String urlAndPort = ccmLogImpPopSign.getPic().split(":")[1];
				String[] str = urlAndPort.split("/");
				String url = "";
				for(int i=0 ; i<str.length ; i++){
					if(i>0){
						if(StringUtils.isNotEmpty(str[i])){
							url = "/" + str[i];
						}
					}
				}
				ccmLogImpPopSign.setPic(url);
			}
		}
		super.save(ccmLogImpPopSign);
	}

	@Transactional(readOnly = false)
	public void delete(CcmLogImpPopSign ccmLogImpPopSign) {
		super.delete(ccmLogImpPopSign);
	}
	
}