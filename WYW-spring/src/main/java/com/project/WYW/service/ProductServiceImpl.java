package com.project.WYW.service;

import com.project.WYW.dao.ProductDao;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.model.Pagehandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductDao productDao;

    @Override
    public List<ProductsViewVo> productsViewList(Pagehandler pagehandler) throws Exception{
        return productDao.productsViewList(pagehandler);
    }

    @Override
    public int productsGetTotal(Pagehandler pagehandler)throws Exception{
        return productDao.productsGetTotal(pagehandler);
    }
}
