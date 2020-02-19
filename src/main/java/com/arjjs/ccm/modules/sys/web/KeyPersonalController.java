package com.arjjs.ccm.modules.sys.web;


import com.arjjs.ccm.modules.sys.entity.KeyPersonal;
import com.arjjs.ccm.modules.sys.service.KeyPersonalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "${adminPath}/sys/map/KeyPersonal")
public class KeyPersonalController {

    @Autowired
    private KeyPersonalService keyPersonalService;

    //查询最近时间段
    @RequestMapping(value = "/recently",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> findPersonal(Date time){
        Map<String,Object> map = new HashMap();
        List<KeyPersonal> Plist = keyPersonalService.findPersonal(time);

        map.put("code","200");
        map.put("data",Plist);
        return map;
    }

    //开始时间结束时间
    @RequestMapping(value = "/KJ",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> findPersonalAday(String time1,String time2){
        Map<String,Object> map = new HashMap();
        List<KeyPersonal> Plist = keyPersonalService.findPersonalKJ(time1,time2);

        map.put("code","200");
        map.put("data",Plist);
        return map;
    }
}
