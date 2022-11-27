package com.project.WYW.service;

import com.project.WYW.dao.OrderDao;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.UsersVo;
import com.project.WYW.dto.OrderCancelDto;
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
    private CartService cartService;
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
    @Transactional(rollbackFor = Exception.class)
    public void order(OrderDto orderDto) {

        TransactionStatus status = null;
        try {
            /* 사용할 데이터가져오기 */
            /* 회원 정보 */
            UsersVo usersVo = usersSecvice.read(orderDto.getUserId());
            /* 주문 정보 */
            List<OrderItemDto> orderItemDtoList = new ArrayList<>();
            for (OrderItemDto oit : orderDto.getOrders()) {
                OrderItemDto orderItemDto = orderDao.getOrderInfo(oit.getProductId());
                // 수량 셋팅
                orderItemDto.setProductCount(oit.getProductCount());
                // 기본정보 셋팅
                orderItemDto.initSaleTotal();
                //List객체 추가
                orderItemDtoList.add(orderItemDto);
            }
            /* OrderDTO 셋팅 */
            orderDto.setOrders(orderItemDtoList);
            orderDto.getOrderPriceInfo();

            /*DB 주문,주문상품(,배송정보) 넣기*/

            /* orderId만들기 및 OrderDTO객체 orderId에 저장 */
            Date date = new Date();
            SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmmss");
            String orderId = usersVo.getUserId() + format.format(date);
            orderDto.setOrderId(orderId);

            status = transactionManager.getTransaction(new DefaultTransactionDefinition());
            /* db넣기 */
            orderDao.regOrder(orderDto);        //order 등록
            for (OrderItemDto oit : orderDto.getOrders()) {        //orderItem 등록
                oit.setOrderId(orderId);
                orderDao.regOrderItem(oit);
            }

            /* 재고 변동 적용 */

            for (OrderItemDto oit : orderDto.getOrders()) {
                /* 변동 재고 값 구하기 */

                ProductsViewVo productsViewVo = productService.readProductDetail(oit.getProductId());
                if (productsViewVo.getStock() - oit.getProductCount() < 0) {
                    throw new RuntimeException(productsViewVo.getName() + "의 재고가 부족합니다.");
                }
                productsViewVo.setStock(productsViewVo.getStock() - oit.getProductCount());
                productsViewVo.setCumulative_sales(productsViewVo.getCumulative_sales() + oit.getProductCount());
                /* 변동 값 DB 적용 */
                orderDao.reduceStock(productsViewVo);

            }

            /* 장바구니 제거 */
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
    public void orderCancel(OrderCancelDto orderCancelDto){

        TransactionStatus status = null;

        try {
            /* 주문, 주문상품 객체 */
            /*회원*/
            UsersVo usersVo = usersSecvice.read(orderCancelDto.getUserId());
            /*주문상품*/
            List<OrderItemDto> ords = orderDao.getOrderItemInfo(orderCancelDto.getOrderId());
            for (OrderItemDto ord : ords) {
                ord.initSaleTotal();
            }
            /* 주문 */
            OrderDto orderDto = orderDao.getOrder(orderCancelDto.getOrderId());
            orderDto.setOrders(ords);

            orderDto.getOrderPriceInfo();

            status = transactionManager.getTransaction(new DefaultTransactionDefinition());
            /* 주문상품 취소 DB */
            orderDao.orderCancel(orderCancelDto.getOrderId());

            /* 재고 */
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
}
