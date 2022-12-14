package com.project.WYW.dao;

import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.dto.UpdateRatingDto;
import com.project.WYW.model.Pagehandler;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDaoImpl implements ProductDao {

    @Autowired
    private SqlSession session;

    private static String namespace="com.project.WYW.mapper.productMapper.";

    @Override
    public List<ProductsViewVo> productsViewList(Pagehandler pagehandler)throws Exception{
        return  session.selectList(namespace+"productsViewList", pagehandler);
    }

    @Override
    public int productsGetTotal(Pagehandler pagehandler)throws Exception{
        return session.selectOne(namespace+"productsGetTotal", pagehandler);
    }

    @Override
    public ProductsViewVo readProductDetail(Integer product_id){
        return session.selectOne(namespace+"productsView",product_id);
    }

    @Override
    public Double getRatingAverage(Integer productId){
        return session.selectOne(namespace+"getRatingAverage",productId);
    }

    @Override
    public int updateRating(UpdateRatingDto updateRatingDto){
        return session.update(namespace+"updateRating",updateRatingDto);
    }
}
