package com.project.WYW.service;

import com.project.WYW.dao.AdminDao;
import com.project.WYW.domain.CategoryVo;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.ProductsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public List<CategoryVo> category()throws Exception{
        return adminDao.category();
    }

    @Override
    public int regProduct(ProductsVo productsVo)throws Exception{
        return adminDao.regProduct(productsVo);
    }

    @Override
    public List<ProductsVo> productList() throws Exception{
        return adminDao.productsList();
    }

    @Override
    public ProductsViewVo readProduct(Integer id) throws Exception{
        return adminDao.readProduct(id);
    }

    @Override
    public int deleteProduct(Integer id) throws  Exception{
        return adminDao.deleteProduct(id);
    }

    @Override
    public int modifiyProduct(ProductsVo productsVo)throws Exception{
        return adminDao.modifiyProduct(productsVo);
    }

}
