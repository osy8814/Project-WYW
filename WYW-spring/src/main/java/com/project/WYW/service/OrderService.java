package com.project.WYW.service;

import com.project.WYW.dto.OrderDto;
import com.project.WYW.dto.OrderPageItemDto;

import java.util.List;

public interface OrderService {

    List<OrderPageItemDto> getProductInfo(List<OrderPageItemDto> list);

    void  order(OrderDto orderDto)throws Exception;
}
