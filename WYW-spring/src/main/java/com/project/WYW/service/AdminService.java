package com.project.WYW.service;

import com.project.WYW.domain.CategoryVo;
import com.project.WYW.domain.ProductsVo;

import java.util.List;

public interface AdminService {
    List<CategoryVo> category()throws Exception;

    int regProduct(ProductsVo productsVo)throws Exception;

    List<ProductsVo> productList() throws Exception;
}
