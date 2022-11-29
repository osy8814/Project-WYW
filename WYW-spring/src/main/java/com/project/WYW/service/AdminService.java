package com.project.WYW.service;

import com.project.WYW.domain.CategoryVo;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.ProductsVo;
import com.project.WYW.dto.OrderDto;
import com.project.WYW.dto.OrderItemDto;
import com.project.WYW.model.AttachImageVO;
import com.project.WYW.model.Pagehandler;

import java.util.List;

public interface AdminService {
    List<CategoryVo> category()throws Exception;

    int regProduct(ProductsVo productsVo)throws Exception;

    List<ProductsVo> productList() throws Exception;

    ProductsViewVo readProduct(Integer id) throws Exception;

    List<ProductsViewVo> productsViewList(Pagehandler pagehandler) throws Exception;

    int productsGetTotal(Pagehandler pagehandler)throws Exception;

    List<OrderItemDto> getOrder(OrderDto orderDto);

    List<OrderDto> getOrderList(Pagehandler pagehandler);

    int getOrderTotal(Pagehandler pagehandler);

    int deleteProduct(Integer id) throws  Exception;

    int modifiyProduct(ProductsVo productsVo)throws Exception;

    int imgReg(AttachImageVO attachImageVO)throws Exception;

    int delateImageAll(Integer product_id)throws Exception;

    List<AttachImageVO> getAttachInfo(Integer product_id)throws Exception;
}
