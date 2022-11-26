package com.project.WYW.dao;

import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.dto.OrderDto;
import com.project.WYW.dto.OrderItemDto;
import com.project.WYW.dto.OrderPageItemDto;
import com.project.WYW.model.CartVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDaoImpl implements OrderDao {

    @Autowired
    private SqlSession session;

    private static String namespace = "com.project.WYW.mapper.orderMapper.";

    @Override
    public OrderPageItemDto getProductInfo(Integer id) {
        return session.selectOne(namespace + "getProductInfo", id);
    }

    /* 주문 상품 정보(주문 처리) */
    @Override
    public OrderItemDto getOrderInfo(int productId) {
        return session.selectOne(namespace + "getOrderInfo", productId);
    }

    /* 주문 테이블 등록 */
    @Override
    public int regOrder(OrderDto orderDto) {
        return session.insert(namespace + "regOrder", orderDto);
    }

    /* 주문 아이템 테이블 등록 */
    @Override
    public int regOrderItem(OrderItemDto orderItemDto) {
        return session.insert(namespace + "regOrderItem", orderItemDto);
    }

    /* 주문 재고 차감 */
    @Override
    public int reduceStock(ProductsViewVo productsViewVo) {
        return session.update(namespace + "reduceStock", productsViewVo);
    }

    /* 카트 제거(주문) */
    @Override
    public int deleteOrderCart(CartVo cartVo) {
        return session.delete(namespace + "deleteOrderCart", cartVo);
    }

    /* 주문 취소 */
    @Override
    public int orderCancel(String orderId) {
        return session.update(namespace + "orderCancel", orderId);
    }

    /* 주문 상품 정보(주문취소) */
    @Override
    public List<OrderItemDto> getOrderItemInfo(String orderId) {
        return session.selectList(namespace + "getOrderItemInfo", orderId);
    }

    /* 주문 정보(주문취소) */
    @Override
    public OrderDto getOrder(String orderId) {
        return session.selectOne(namespace + "getOrder", orderId);
    }

}
