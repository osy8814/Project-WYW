package com.project.WYW.dao;


import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.ProductsVo;
import com.project.WYW.dto.OrderDto;
import com.project.WYW.dto.OrderItemDto;
import com.project.WYW.dto.OrderPageItemDto;
import com.project.WYW.model.CartVo;
import com.project.WYW.service.OrderService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class OrderImplTest {

    @Autowired
    OrderDao orderDao;

    @Test
    public void getProductInfoTest()throws Exception{

        System.out.println("getProductInfo"+ orderDao.getProductInfo(312));
    }

    @Test
    public void getOrderInfoTest() {

        OrderItemDto orderItemDto = orderDao.getOrderInfo(312);

        System.out.println("result : " + orderItemDto);
    }

    @Test
    public void regOrderTest() {

        OrderDto orderDto = new OrderDto();
        List<OrderItemDto> orders = new ArrayList();

        OrderItemDto order1 = new OrderItemDto();

        order1.setProductId(61);
        order1.setProductCount(5);
        order1.setPrice(70000);
        order1.initSaleTotal();

        orders.add(order1);

        orderDto.setOrders(orders);

        orderDto.setOrderId("2022_test1");
        orderDto.setReceiver("test");
        orderDto.setUserId("admin");
        orderDto.setAddress1("test");
        orderDto.setAddress2("test");
        orderDto.setAddress3("test");
        orderDto.setMobile("010-1234-1234");
        orderDto.setOrderState("배송중비");
        orderDto.getOrderPriceInfo();
        orderDto.setUsePoint(1000);


        orderDao.regOrder(orderDto);

    }
    @Test
    public void regOrderItemTest() {

        OrderItemDto orderItemDto = new OrderItemDto();

        orderItemDto.setOrderId("2022_test1");
        orderItemDto.setProductId(61);
        orderItemDto.setProductCount(2);
        orderItemDto.setPrice(70000);
        orderItemDto.initSaleTotal();

        System.out.println("orderItemDto = " + orderItemDto);
        orderDao.regOrderItem(orderItemDto);

    }

    /* 상품 재고 변경 */
    @Test
    public void reduceStockTest() {
        ProductsViewVo productsViewVo = new ProductsViewVo();

        productsViewVo.setId(61);
        productsViewVo.setStock(5);

        orderDao.reduceStock(productsViewVo);
    }

    @Test
    public void deleteOrderCart() {
        String userId = "admin";
        int productId = 310;

        CartVo cartVo = new CartVo();
        cartVo.setUser_id(userId);
        cartVo.setProduct_id(productId);

        orderDao.deleteOrderCart(cartVo);

    }

}
