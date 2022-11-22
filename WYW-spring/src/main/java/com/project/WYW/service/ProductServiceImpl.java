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

    @Autowired
    AttachService attachService;

    @Override
    public List<ProductsViewVo> productsViewList(Pagehandler pagehandler) throws Exception{
        List<ProductsViewVo> list = productDao.productsViewList(pagehandler);
        for (ProductsViewVo productsViewVo:list) {
            int productId = productsViewVo.getId();
            productsViewVo.setImageVOList(attachService.getAttachList(productId));
        }

        return list;
    }
    @Override
    public int productsGetTotal(Pagehandler pagehandler)throws Exception{
        return productDao.productsGetTotal(pagehandler);
    }

    @Override
    public ProductsViewVo readProductDetail(Integer product_id){
        ProductsViewVo productsViewVo = productDao.readProductDetail(product_id);
        productsViewVo.setImageVOList(attachService.getAttachList(product_id));

        return productsViewVo;
    }
}
