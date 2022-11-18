package com.project.WYW.service;

import com.project.WYW.domain.CategoryVo;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.ProductsVo;

import java.util.List;

public interface AdminService {
    List<CategoryVo> category()throws Exception;

    int regProduct(ProductsVo productsVo)throws Exception;

    List<ProductsVo> productList() throws Exception;

    ProductsViewVo readProduct(Integer id) throws Exception;

    List<ProductsViewVo> productsViewList() throws Exception;

    int deleteProduct(Integer id) throws  Exception;

    int modifiyProduct(ProductsVo productsVo)throws Exception;
}
