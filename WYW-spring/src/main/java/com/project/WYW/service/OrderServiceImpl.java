package com.project.WYW.service;

import com.project.WYW.dao.OrderDao;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.UsersVo;
import com.project.WYW.dto.OrderManageDto;
import com.project.WYW.dto.OrderDto;
import com.project.WYW.dto.OrderItemDto;
import com.project.WYW.dto.OrderPageItemDto;
import com.project.WYW.model.CartVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderDao orderDao;
    @Autowired
    private AttachService attachService;
    @Autowired
    private ProductService productService;
    @Autowired
    private UsersSecvice usersSecvice;

    @Autowired
    PlatformTransactionManager transactionManager;

    @Override
    public List<OrderPageItemDto> getProductInfo(List<OrderPageItemDto> list) {
        List<OrderPageItemDto> result = new ArrayList<>();

        for (OrderPageItemDto orderPageItemDto : list) {

            int productId = orderPageItemDto.getProductId();
            OrderPageItemDto productInfo = orderDao.getProductInfo(productId);

            productInfo.setProductCount(orderPageItemDto.getProductCount());
            productInfo.initSaleTotal();
            productInfo.setImageVOList(attachService.getAttachList(productId));

            result.add(productInfo);
        }
        return result;
    }

    @Override
    public List<OrderDto> getUserOrderList(String userId){
        List<OrderDto>list = orderDao.getUserOrderList(userId);
        for (OrderDto orderDto:list) {
            String orderId = orderDto.getOrderId();
            List<OrderItemDto> orderItemDtoList = orderDao.getOrderItemInfo(orderId);
            for (OrderItemDto orderItemDto : orderItemDtoList){
                int productId = orderItemDto.getProductId();
                ProductsViewVo productsViewVo = productService.readProductDetail(productId);
                orderItemDto.setProductName(productsViewVo.getName());
                orderItemDto.setImageVOList(productsViewVo.getImageVOList());
                orderItemDto.initSaleTotal();
            }
            orderDto.setOrders(orderItemDtoList);
            orderDto.getOrderPriceInfo();

        }
        return list;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public void order(OrderDto orderDto) {

        TransactionStatus status = null;
        try {
            /* ????????? ????????????????????? */
            /* ?????? ?????? */
            UsersVo usersVo = usersSecvice.read(orderDto.getUserId());
            /* ?????? ?????? */
            List<OrderItemDto> orderItemDtoList = new ArrayList<>();
            for (OrderItemDto oit : orderDto.getOrders()) {
                OrderItemDto orderItemDto = orderDao.getOrderInfo(oit.getProductId());
                // ?????? ??????
                orderItemDto.setProductCount(oit.getProductCount());
                // ???????????? ??????
                orderItemDto.initSaleTotal();
                //List?????? ??????
                orderItemDtoList.add(orderItemDto);
            }
            /* OrderDTO ?????? */
            orderDto.setOrders(orderItemDtoList);
            orderDto.getOrderPriceInfo();

            /*DB ??????,????????????(,????????????) ??????*/

            /* orderId????????? ??? OrderDTO?????? orderId??? ?????? */
            Date date = new Date();
            SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmmss");
            String orderId = usersVo.getUserId() + format.format(date);
            orderDto.setOrderId(orderId);

            status = transactionManager.getTransaction(new DefaultTransactionDefinition());
            /* db?????? */
            orderDao.regOrder(orderDto);        //order ??????
            for (OrderItemDto oit : orderDto.getOrders()) {        //orderItem ??????
                oit.setOrderId(orderId);
                orderDao.regOrderItem(oit);
            }

            /* ?????? ?????? ?????? */

            for (OrderItemDto oit : orderDto.getOrders()) {
                /* ?????? ?????? ??? ????????? */

                ProductsViewVo productsViewVo = productService.readProductDetail(oit.getProductId());
                if (productsViewVo.getStock() - oit.getProductCount() < 0) {
                    throw new RuntimeException(productsViewVo.getName() + "??? ????????? ???????????????.");
                }
                productsViewVo.setStock(productsViewVo.getStock() - oit.getProductCount());
                productsViewVo.setCumulative_sales(productsViewVo.getCumulative_sales() + oit.getProductCount());
                /* ?????? ??? DB ?????? */
                orderDao.reduceStock(productsViewVo);

            }

            /* ???????????? ?????? */
            for (OrderItemDto oit : orderDto.getOrders()) {
                CartVo cartVo = new CartVo();
                cartVo.setUser_id(orderDto.getUserId());
                cartVo.setProduct_id(oit.getProductId());

                orderDao.deleteOrderCart(cartVo);
            }
        } catch (Exception e) {
            transactionManager.rollback(status);
            throw new RuntimeException(e);
        } finally {
            if (status.isRollbackOnly()) {
                transactionManager.rollback(status);
            } else {
                transactionManager.commit(status);
            }
        }
    }

    @Override
    public void orderCancel(OrderManageDto orderManageDto) {

        TransactionStatus status = null;

        try {
            /*????????????*/
            List<OrderItemDto> ords = orderDao.getOrderItemInfo(orderManageDto.getOrderId());
            for (OrderItemDto ord : ords) {
                ord.initSaleTotal();
            }
            /* ?????? */
            OrderDto orderDto = orderDao.getOrder(orderManageDto.getOrderId());
            orderDto.setOrders(ords);

            orderDto.getOrderPriceInfo();

            status = transactionManager.getTransaction(new DefaultTransactionDefinition());
            /* ???????????? ?????? DB */
            orderDao.orderCancel(orderManageDto.getOrderId());

            /* ?????? */
            for (OrderItemDto ord : orderDto.getOrders()) {
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
            } else {
                transactionManager.commit(status);
            }
        }
    }

    @Override
    public void shipping(OrderManageDto orderManageDto) {

        /* ?????? DB update */
        orderDao.shipping(orderManageDto.getOrderId());
    }
    @Override
    public List<OrderItemDto> getOrder(OrderDto orderDto) {
        List<OrderItemDto> list = orderDao.getOrderItemInfo(orderDto.getOrderId());
        for (OrderItemDto orderItemDto : list) {
            int productId = orderItemDto.getProductId();
            ProductsViewVo productsViewVo = productService.readProductDetail(productId);
            orderItemDto.setImageVOList(productsViewVo.getImageVOList());
            orderItemDto.setProductName(productsViewVo.getName());
            orderItemDto.initSaleTotal();
        }
        return list;
    }

}
