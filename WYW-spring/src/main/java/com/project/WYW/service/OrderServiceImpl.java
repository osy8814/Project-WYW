package com.project.WYW.service;

import com.project.WYW.dao.OrderDao;
import com.project.WYW.dto.OrderPageItemDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    @Autowired
    private AttachService attachService;

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

}
