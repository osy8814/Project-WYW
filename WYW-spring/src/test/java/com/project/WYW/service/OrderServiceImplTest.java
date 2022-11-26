package com.project.WYW.service;

import com.project.WYW.dao.OrderDao;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.UsersVo;
import com.project.WYW.dto.OrderCancelDto;
import com.project.WYW.dto.OrderDto;
import com.project.WYW.dto.OrderItemDto;
import com.project.WYW.dto.OrderPageItemDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class OrderServiceImplTest {

    @Autowired
    OrderService orderService;

    @Autowired
    UsersSecvice usersSecvice;
    @Autowired
    OrderDao orderDao;

    @Autowired
    PlatformTransactionManager transactionManager;

    @Autowired
    ProductService productService;

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

    @Test
    public void orderCancel(){

        OrderCancelDto orderCancelDto = new OrderCancelDto();
        orderCancelDto.setUserId("admin");
        orderCancelDto.setOrderId("admin_202211270130");
        orderCancelDto.setPageNum(1);
        orderCancelDto.setAmount(10);

        System.out.println("orderCancelDto = " + orderCancelDto);

        TransactionStatus status = transactionManager.getTransaction(new DefaultTransactionDefinition());

        try {

            /* 주문, 주문상품 객체 */
            /*회원*/
            UsersVo usersVo = usersSecvice.read(orderCancelDto.getUserId());
            System.out.println("usersVo = " + usersVo);
            /*주문상품*/
            List<OrderItemDto> ords = orderDao.getOrderItemInfo(orderCancelDto.getOrderId());
            System.out.println("ords = " + ords);
            for (OrderItemDto ord : ords) {
                ord.initSaleTotal();
            }
            /* 주문 */
            OrderDto orderDto = orderDao.getOrder(orderCancelDto.getOrderId());
            System.out.println("orderDto = " + orderDto);
            
            orderDto.setOrders(ords);

            orderDto.getOrderPriceInfo();


            /* 주문상품 취소 DB */
            orderDao.orderCancel(orderCancelDto.getOrderId());

            /* 재고 */
            for (OrderItemDto ord : orderDto.getOrders()) {
                System.out.println("ord = " + ord);
                ProductsViewVo productsViewVo = productService.readProductDetail(ord.getProductId());
                productsViewVo.setStock(productsViewVo.getStock() + ord.getProductCount());
                productsViewVo.setCumulative_sales(productsViewVo.getCumulative_sales() - ord.getProductCount());

                orderDao.reduceStock(productsViewVo);
            }
        } catch (Exception e) {
            transactionManager.rollback(status);
            throw new RuntimeException(e);
        } finally {
            if (status.isRollbackOnly()) {
                transactionManager.rollback(status);
            }
        }


    }
}