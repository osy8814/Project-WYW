package com.project.WYW.service;

import com.project.WYW.dao.OrderDao;
import com.project.WYW.dto.OrderPageItemDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class OrderServiceImplTest {

    @Autowired
    OrderService orderService;

    @Autowired
    OrderDao orderDao;

    @Test
    public void getProductInfo() {

        OrderPageItemDto orderPageItemDto1 = new OrderPageItemDto(312,1);
        OrderPageItemDto orderPageItemDto2 = new OrderPageItemDto(310,1);

        List<OrderPageItemDto> list = new ArrayList<>();
        list.add(orderPageItemDto1);
        list.add(orderPageItemDto2);

        List<OrderPageItemDto> result = new ArrayList<>();

        for (OrderPageItemDto orderPageItemDto : list) {

            System.out.println(orderPageItemDto.getProductId());
            OrderPageItemDto productInfo = orderDao.getProductInfo(orderPageItemDto.getProductId());

            productInfo.setProductCount(orderPageItemDto.getProductCount());
            productInfo.initSaleTotal();

            result.add(productInfo);
        }
        System.out.println("result = " + result);

    }
}