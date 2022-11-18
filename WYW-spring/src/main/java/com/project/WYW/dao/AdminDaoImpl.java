package com.project.WYW.dao;

import com.project.WYW.domain.CategoryVo;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.ProductsVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminDaoImpl implements AdminDao {

    @Autowired
    private SqlSession session;

    final int FAIL = 0;

    private static String namespace="com.project.WYW.domain.CategoryVo.";

    @Override
    public List<CategoryVo> category()throws Exception{

      return session.selectList(namespace+"category");
    }

    @Override
    public int regProduct(ProductsVo productsVo) throws Exception{

        int rowCnt;

        try {
            rowCnt = session.insert(namespace+"regProduct", productsVo);
            return rowCnt;
        } catch (Exception e) {
            e.printStackTrace();
            rowCnt = FAIL;
        }
        return rowCnt;
    }

    @Override
    public List<ProductsVo> productsList()throws Exception{
        return  session.selectList(namespace+"productsList");
    }

    @Override
    public List<ProductsViewVo> productsViewList()throws Exception{
        return  session.selectList(namespace+"productsViewList");
    }

    @Override
    public ProductsViewVo readProduct(Integer id) throws Exception{
        return session.selectOne(namespace+"productsView", id);
    }

    @Override
    public int deleteProduct(Integer id) throws Exception{

        int rowCnt;

        try {
            rowCnt = session.delete(namespace+"deleteProduct", id);
            return rowCnt;
        } catch (Exception e) {
            e.printStackTrace();
            rowCnt = FAIL;
        }
        return rowCnt;
    }

    @Override
    public int modifiyProduct(ProductsVo productsVo) throws Exception{

        System.out.println("productsViewVo = " + productsVo);
        int rowCnt;

        try {
            rowCnt = session.update(namespace+"modifiyProduct", productsVo);
            return rowCnt;
        } catch (Exception e) {
            e.printStackTrace();
            rowCnt = FAIL;
        }
        return rowCnt;
    }

    @Override
    public int deleteAllProducts()throws Exception{
        return session.delete(namespace+"deleteAllProduct");
    }
}
