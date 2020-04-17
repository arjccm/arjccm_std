package com.arjjs.ccm.test;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class ComparList {
    public static void main(String args[]){
        //集合一
        List po=new ArrayList();
        po.add("jim");
        po.add("tom");
        po.add("jack");
        //集合二
        List vo=new ArrayList();
        vo.add("jack1");
        vo.add("happy");
        vo.add("sun");
        vo.add("good");

        //集合一
        List _three=new ArrayList();
        _three.add("jim");
        _three.add("tom");
        _three.add("jack");

        Collection exists=new ArrayList(vo);
        Collection notexists=new ArrayList(vo);

        exists.removeAll(po);
        System.out.println("vo中不存在于po中的："+exists);
        notexists.removeAll(exists);
        System.out.println("vo中存在于po中的："+notexists);
        System.out.println("_three 比较 po 的结果："+ _three.equals(po));
    }

}
