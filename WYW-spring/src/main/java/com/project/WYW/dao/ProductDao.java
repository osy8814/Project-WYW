package com.project.WYW.dao;

import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.model.Pagehandler;

import java.util.List;

public interface ProductDao {
    List<ProductsViewVo> productsViewList(Pagehandler pagehandler) throws Exception;

    int productsGetTotal(Pagehandler pagehandler) throws Exception;

    ProductsViewVo readProductDetail(Integer product_id);
}
