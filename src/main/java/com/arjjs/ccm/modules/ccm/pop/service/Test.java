package com.arjjs.ccm.modules.ccm.pop.service;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:spring-*.xml")
public class Test {
    @Autowired
    private CcmPeopleService ccmPeopleService;


    public void Test(){
        Integer integer = ccmPeopleService.statIndexForZj(4);
        System.out.println(integer);
    }


}
