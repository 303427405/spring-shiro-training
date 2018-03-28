package com.king.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.king.service.SlaveService;

/**
 * @Description：DataSourceRoutingAspectTest
 * @author：king
 * @date：2015年8月19日 下午5:23:24
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class DataSourceRoutingAspectTest {

    @Autowired
    private SlaveService slaveService;

    @Test
    public void testFindAllShop() {
        Integer count = slaveService.count();
        System.out.println(count);
    }
}

