package com.project.WYW.dao;


import com.project.WYW.dto.OrderPageItemDto;
import com.project.WYW.service.OrderService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class OrderImplTest {

    @Autowired
    OrderDao orderDao;

    @Test
    public void getProductInfoTest()throws Exception{

        System.out.println("getProductInfo"+ orderDao.getProductInfo(312));
    }
}
