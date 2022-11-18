package com.project.WYW.dao;

import com.project.WYW.domain.CategoryVo;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.ProductsVo;

import java.util.List;

public interface AdminDao {
    List<CategoryVo> category() throws Exception;

    int regProduct(ProductsVo productsVo) throws Exception;

    List<ProductsVo> productsList()throws Exception;

    ProductsViewVo readProduct(Integer id) throws Exception;

    int deleteProduct(Integer id) throws Exception;

    int modifiyProduct(ProductsVo productsVo) throws Exception;

    int deleteAllProducts()throws Exception;
}
