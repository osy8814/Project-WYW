package com.project.WYW.dao;

import com.project.WYW.domain.CategoryVo;
import com.project.WYW.domain.ProductsVo;

import java.util.List;

public interface AdminDao {
    List<CategoryVo> category() throws Exception;

    int regProduct(ProductsVo productsVo) throws Exception;

    List<ProductsVo> productsList()throws Exception;
}
