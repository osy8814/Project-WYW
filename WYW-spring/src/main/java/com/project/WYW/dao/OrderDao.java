package com.project.WYW.dao;

import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.ProductsVo;
import com.project.WYW.dto.OrderDto;
import com.project.WYW.dto.OrderItemDto;
import com.project.WYW.dto.OrderPageItemDto;
import com.project.WYW.model.CartVo;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface OrderDao {
    OrderPageItemDto getProductInfo(Integer id);

    /* 주문 상품 정보(주문 처리) */
    OrderItemDto getOrderInfo(int productId);

    /* 주문 테이블 등록 */
    int regOrder(OrderDto orderDto);

    /* 주문 아이템 테이블 등록 */
    int regOrderItem(OrderItemDto orderItemDto);

    /* 주문 재고 차감 */

    int reduceStock(ProductsViewVo productsViewVo);

    /* 카트 제거(주문) */
    int deleteOrderCart(CartVo cartVo);


    int shipping(String orderId);

    /* 주문 취소 */
    int orderCancel(String orderId);

    /* 주문 상품 정보(주문취소) */
    List<OrderItemDto> getOrderItemInfo(String orderId);

    /* 주문 정보(주문취소) */
    OrderDto getOrder(String orderId);
}
