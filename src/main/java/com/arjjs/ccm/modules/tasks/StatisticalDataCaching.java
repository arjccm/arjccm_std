package com.arjjs.ccm.modules.tasks;

import com.arjjs.ccm.common.utils.JedisUtils;
import com.arjjs.ccm.modules.flat.analyst.web.KpiCountController;
import com.arjjs.ccm.modules.flat.analyst.web.PersonalAnalystController;
import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;


/**
 * 统计数据缓存 定时执行类
 *
 * @author: li jiupeng
 * @create: 2019-08-09 10:59
 */
@Component
@Lazy()
public class StatisticalDataCaching implements ApplicationContextAware  {

    /**
     * 当前IOC
     */
    private  ApplicationContext applicationContext;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
            this.applicationContext=applicationContext;
    }


    /**
     * 一维数组为执行组数组
     * 二维数组 index 0 是 执行类名 index 1.. 是三维数组{"redisKey","方法名"}
     *  示例 {{"类名"},{"redisKey","方法名"},{"redisKey","方法名"}...}
     * ！！！！注意 请务必保证名字为正确,并且都是唯一的
     */
    private final Object[][][] nameArr={
            {{PersonalAnalystController.class},{"getDataByDept","getDataByDept"},{"getDateForPersonal","getDateForPersonal"}},
            {{IntervalsDeleteData.class},{"","deleteLog"},{"","deleteTracingpoint"}},
            {{KpiCountController.class},{"","kpiCount"}}
    };


    private Logger log = Logger.getLogger(this.getClass());

    /**
     * 定时类执行方法
     */

    public void execute()  {

        //先把执行的过的数据删掉 以防万一 有缓存
        for (int i = 0; i < nameArr.length; i++) {
            //1循环删除组里的redis缓存
            for (int i1 = 1; i1 < nameArr[i].length; i1++) {
                if(String.valueOf(nameArr[i][i1][0]).length()!=0){
                    JedisUtils.del(String.valueOf(nameArr[i][i1][0]));
                }
            }
        }
        //通过反射获取bean 执行方法 并添加到 redis
        for (int i = 0; i < nameArr.length; i++) {
            //获取当前类
            Class classes= (Class) nameArr[i][0][0];
            //注入bean
            Object bean = applicationContext.getBean(classes);
            applicationContext.getAutowireCapableBeanFactory().autowireBean(bean);

            //执行方法
            for (int i1 = 1; i1 < nameArr[i].length; i1++) {
                try {
                    //获得方法
                    Method method = classes.getMethod(String.valueOf(nameArr[i][i1][1]));
                    //调用方法
                    method.invoke(bean);

                } catch (NoSuchMethodException e) {
                    e.printStackTrace();
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                }finally {
                    log.error("定时缓存图表数据失败");
                }
            }
        }

        log.info("定时缓存图表数据成功");
    }


}
