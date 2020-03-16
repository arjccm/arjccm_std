/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.arjjs.ccm.modules.ccm.place.casino.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.arjjs.ccm.modules.ccm.place.casino.entity.CcmPlaceCasino;
import com.arjjs.ccm.modules.ccm.place.casino.service.CcmPlaceCasinoService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.arjjs.ccm.common.config.Global;
import com.arjjs.ccm.common.persistence.Page;
import com.arjjs.ccm.common.web.BaseController;
import com.arjjs.ccm.common.utils.StringUtils;
import com.arjjs.ccm.modules.ccm.place.base.entity.CcmBasePlace;
import com.arjjs.ccm.modules.ccm.place.base.service.CcmBasePlaceService;
import com.arjjs.ccm.tool.CommUtil;

/**
 * 娱乐场所Controller
 * 
 * @author ljd
 * @version 2019-04-25
 */
@Controller
@RequestMapping(value = "${adminPath}/casino/ccmPlaceCasino")
public class CcmPlaceCasinoController extends BaseController {

	@Autowired
	private CcmPlaceCasinoService ccmPlaceCasinoService;

	@Autowired
	private CcmBasePlaceService ccmBasePlaceService;

	@ModelAttribute
	public CcmPlaceCasino get(@RequestParam(required = false) String id) {
		CcmPlaceCasino entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = ccmPlaceCasinoService.get(id);
		}
		if (entity == null) {
			entity = new CcmPlaceCasino();
		}
		return entity;
	}

	@RequiresPermissions("casino:ccmPlaceCasino:view")
	@RequestMapping(value = { "list", "", "{type}" })
	public String list(CcmPlaceCasino ccmPlaceCasino, HttpServletRequest request, HttpServletResponse response,
			Model model, @PathVariable("type") String type) {
		ccmPlaceCasino.setType(type);
		Page<CcmPlaceCasino> page = ccmPlaceCasinoService.findPage(new Page<CcmPlaceCasino>(request, response),
				ccmPlaceCasino);
		List<CcmPlaceCasino> findList = ccmPlaceCasinoService.findList(ccmPlaceCasino);
		for (CcmPlaceCasino casino : findList) {
			casino.setCcmBasePlace(ccmBasePlaceService.get(casino.getBasePlaceId()));
		}
		page.setList(findList);
		model.addAttribute("page", page);

		if ("01".equals(type)) {
			return "ccm/place/casino/ccmPlaceCasinoList";
		}
		if ("02".equals(type)) {
			return "ccm/place/casino/ccmPlaceCasinoBarList";
		}
		if ("03".equals(type)) {
			return "ccm/place/casino/ccmPlaceCasinoGeWuList";
		}
		if ("04".equals(type)) {
			return "ccm/place/casino/ccmPlaceCasinoDianYingList";
		}
		if ("05".equals(type)) {
			return "ccm/place/casino/ccmPlaceCasinoJuYuanList";
		}
		if ("06".equals(type)) {
			return "ccm/place/casino/ccmPlaceCasinoLiTangList";
		}
		if ("07".equals(type)) {
			return "ccm/place/casino/ccmPlaceCasinoSangNaList";
		}
		if ("08".equals(type)) {
			return "ccm/place/casino/ccmPlaceCasinoMuZuList";
		}

		return "ccm/place/casino/ccmPlaceCasinoList";
	}

	@RequiresPermissions("casino:ccmPlaceCasino:view")
	@RequestMapping(value = "form")
	public String form(CcmPlaceCasino ccmPlaceCasino, Model model) {
		CcmBasePlace ccmBasePlace = new CcmBasePlace();
		ccmBasePlace.setId(ccmPlaceCasino.getBasePlaceId());

		CcmBasePlace ccmBasePlace2 = ccmBasePlaceService.get(ccmBasePlace);
		ccmPlaceCasino.setCcmBasePlace(ccmBasePlace2);
		if(ccmBasePlace2 != null) {
			ccmPlaceCasino.setAreaMap(ccmBasePlace2.getAreaMap());
			ccmPlaceCasino.setAreaPoint(ccmBasePlace2.getAreaPoint());
		}
		model.addAttribute("ccmPlaceCasino", ccmPlaceCasino);
		if ("01".equals(ccmPlaceCasino.getType())) {
			return "ccm/place/casino/ccmPlaceCasinoForm";
		}
        if ("02".equals(ccmPlaceCasino.getType())) {
            return "ccm/place/casino/ccmPlaceCasinoBarForm";
        }
        if ("03".equals(ccmPlaceCasino.getType())) {
            return "ccm/place/casino/ccmPlaceCasinoGeWuForm";
        }
        if ("04".equals(ccmPlaceCasino.getType())) {
            return "ccm/place/casino/ccmPlaceCasinoDianYingForm";
        }
        if ("05".equals(ccmPlaceCasino.getType())) {
            return "ccm/place/casino/ccmPlaceCasinoJuYuanForm";
        }
        if ("06".equals(ccmPlaceCasino.getType())) {
            return "ccm/place/casino/ccmPlaceCasinoLiTangForm";
        }
        if ("07".equals(ccmPlaceCasino.getType())) {
            return "ccm/place/casino/ccmPlaceCasinoSangNaForm";
        }
        if ("08".equals(ccmPlaceCasino.getType())) {
            return "ccm/place/casino/ccmPlaceCasinoMuZuForm";
        }

		return "ccm/place/casino/ccmPlaceCasinoForm";
	}

	@RequiresPermissions("casino:ccmPlaceCasino:edit")
	@RequestMapping(value = "save/{type}")
	public void save(CcmPlaceCasino ccmPlaceCasino, Model model, RedirectAttributes redirectAttributes,
			HttpServletResponse response, @PathVariable("type") String type) {
		if (!beanValidator(model, ccmPlaceCasino)) {
		}
		// 处理场所基本信息
		if (null == ccmPlaceCasino.getBasePlaceId() || "".equals(ccmPlaceCasino.getBasePlaceId())) {
			CcmBasePlace ccmBasePlace = ccmPlaceCasino.getCcmBasePlace();
			String id = UUID.randomUUID().toString();
			ccmBasePlace.setId(id);
			ccmBasePlace.setIsNewRecord(true);
			ccmBasePlace.setAreaMap(ccmPlaceCasino.getAreaMap());
			ccmBasePlace.setAreaPoint(ccmPlaceCasino.getAreaPoint());
			ccmBasePlace.setPlaceType("ccm_place_casino");
			ccmBasePlaceService.save(ccmBasePlace);
			ccmPlaceCasino.setCcmBasePlace(ccmBasePlace);
			ccmPlaceCasino.setBasePlaceId(id);
		} else {
			CcmBasePlace ccmBasePlace = ccmPlaceCasino.getCcmBasePlace();
			ccmBasePlace.setId(ccmPlaceCasino.getBasePlaceId());
			ccmBasePlace.setPlaceType("ccm_place_casino");
			ccmBasePlace.setAreaMap(ccmPlaceCasino.getAreaMap());
			ccmBasePlace.setAreaPoint(ccmPlaceCasino.getAreaPoint());
			ccmBasePlaceService.save(ccmBasePlace);
			ccmPlaceCasino.setCcmBasePlace(ccmBasePlace);
		}

		// 公园和体育场新增
		ccmPlaceCasino.setType(type);
		ccmPlaceCasinoService.save(ccmPlaceCasino);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if ("01".equals(type)) {
			CommUtil.openWinExpDiv(out, "保存公园和体育场场所成功");
		}
        if ("02".equals(type)) {
            CommUtil.openWinExpDiv(out, "保存网吧场所成功");
        }
        if ("03".equals(type)) {
            CommUtil.openWinExpDiv(out, "保存歌舞厅场所成功");
        }
        if ("04".equals(type)) {
            CommUtil.openWinExpDiv(out, "保存电影院场所成功");
        }
        if ("05".equals(type)) {
            CommUtil.openWinExpDiv(out, "保存剧院场所成功");
        }
        if ("06".equals(type)) {
            CommUtil.openWinExpDiv(out, "保存礼堂场所成功");
        }
        if ("07".equals(type)) {
            CommUtil.openWinExpDiv(out, "保存桑拿场所成功");
        }
        if ("08".equals(type)) {
            CommUtil.openWinExpDiv(out, "保存沐足场所成功");
        }
	}

	@RequiresPermissions("casino:ccmPlaceCasino:edit")
	@RequestMapping(value = "delete")
	public String delete(CcmPlaceCasino ccmPlaceCasino, RedirectAttributes redirectAttributes) {
		if (null != ccmPlaceCasino.getBasePlaceId() && !("".equals(ccmPlaceCasino.getBasePlaceId()))) {
			CcmBasePlace ccmBasePlace = ccmBasePlaceService.get(ccmPlaceCasino.getBasePlaceId());
			ccmBasePlaceService.delete(ccmBasePlace);
		}
		ccmPlaceCasinoService.delete(ccmPlaceCasino);
		addMessage(redirectAttributes, "删除娱乐场所成功");
		return "redirect:" + Global.getAdminPath() + "/casino/ccmPlaceCasino/" + ccmPlaceCasino.getType() + "?repage";
	}

}