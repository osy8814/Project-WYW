package com.project.WYW.service;

import com.project.WYW.dto.OrderItemDto;
import com.project.WYW.dto.OrderManageDto;
import com.project.WYW.dto.OrderDto;
import com.project.WYW.dto.OrderPageItemDto;

import java.util.List;

public interface OrderService {

    List<OrderPageItemDto> getProductInfo(List<OrderPageItemDto> list);

    List<OrderDto> getUserOrderList(String userId);

    void  order(OrderDto orderDto)throws Exception;

    void orderCancel(OrderManageDto orderManageDto)throws Exception;

    void shipping(OrderManageDto orderManageDto);

    List<OrderItemDto> getOrder(OrderDto orderDto);
}
