package com.project.WYW.service;

import com.project.WYW.dao.ProductDao;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.dto.UpdateRatingDto;
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
    public List<ProductsViewVo> productsViewList(Pagehandler pagehandler) throws Exception {
        List<ProductsViewVo> list = productDao.productsViewList(pagehandler);
        for (ProductsViewVo productsViewVo : list) {
            int productId = productsViewVo.getId();
            productsViewVo.setImageVOList(attachService.getAttachList(productId));
        }

        return list;
    }

    @Override
    public int productsGetTotal(Pagehandler pagehandler) throws Exception {
        return productDao.productsGetTotal(pagehandler);
    }

    @Override
    public ProductsViewVo readProductDetail(Integer product_id) {
        ProductsViewVo productsViewVo = productDao.readProductDetail(product_id);
        productsViewVo.setImageVOList(attachService.getAttachList(product_id));

        return productsViewVo;
    }

    @Override
    public void setRating(Integer productId) {

        Double ratingAvg = productDao.getRatingAverage(productId);

        if (ratingAvg == null) {
            ratingAvg = 0.0;
        } else {
            ratingAvg = (double) (Math.round(ratingAvg * 10)) / 10;
        }
        UpdateRatingDto updateRatingDto = new UpdateRatingDto();

        updateRatingDto.setProductId(productId);
        updateRatingDto.setRatingAvg(ratingAvg);

        productDao.updateRating(updateRatingDto);

    }
}
