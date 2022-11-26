package com.project.WYW.dao;

import com.project.WYW.domain.ProductsVo;
import com.project.WYW.dto.OrderPageItemDto;

public interface OrderDao {
    OrderPageItemDto getProductInfo(Integer id);
}
