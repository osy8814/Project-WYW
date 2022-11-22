package com.project.WYW.service;

import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.model.Pagehandler;

import java.util.List;

public interface ProductService {
    List<ProductsViewVo> productsViewList(Pagehandler pagehandler) throws Exception;

    int productsGetTotal(Pagehandler pagehandler)throws Exception;

    ProductsViewVo readProductDetail(Integer product_id);
}
