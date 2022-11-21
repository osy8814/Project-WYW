package com.project.WYW.dao;

import com.project.WYW.domain.CategoryVo;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.ProductsVo;
import com.project.WYW.model.AttachImageVO;
import com.project.WYW.model.Pagehandler;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class AdminDaoImpl implements AdminDao {

    @Autowired
    private SqlSession session;

    final int FAIL = 0;

    private static String namespace="com.project.WYW.mapper.adminMapper.";

    @Override
    public List<CategoryVo> category()throws Exception{

      return session.selectList(namespace+"category");
    }

    @Transactional
    @Override
    public int regProduct(ProductsVo productsVo) throws Exception{

        int rowCnt = session.insert(namespace+"regProduct", productsVo);

        if(productsVo.getImageVOList() == null || productsVo.getImageVOList().size() <= 0) {

            return FAIL;
        }


        regProductImage(productsVo);


        return rowCnt;


    }

    @Override
    public List<ProductsVo> productsList()throws Exception{
        return  session.selectList(namespace+"productsList");
    }

    @Override
    public List<ProductsViewVo> productsViewList(Pagehandler pagehandler)throws Exception{
        return  session.selectList(namespace+"productsViewList", pagehandler);
    }

    @Override
    public int productsGetTotal(Pagehandler pagehandler)throws Exception{
        return session.selectOne(namespace+"productsGetTotal", pagehandler);
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

    @Transactional
    @Override
    public int modifiyProduct(ProductsVo productsVo) throws Exception{


        int rowCnt = session.update(namespace+"modifiyProduct", productsVo);

        if(productsVo.getImageVOList() == null || productsVo.getImageVOList().size() <= 0) {

            return FAIL;
        }

        if(rowCnt==1 && productsVo.getImageVOList()!=null && productsVo.getImageVOList().size()>0){
            session.delete(namespace+"deleteImageAll", productsVo.getId());

            regProductImage(productsVo);
        }
        return rowCnt;
    }

    @Override
    public int deleteAllProducts()throws Exception{
        return session.delete(namespace+"deleteAllProduct");
    }

    @Override
    public int imgReg(AttachImageVO attachImageVO)throws Exception{
        System.out.println("attachImageVO = " + attachImageVO);
        int rowCnt;
        try {
            rowCnt = session.insert(namespace+"imageReg", attachImageVO);
            return rowCnt;
        } catch (Exception e) {
            e.printStackTrace();
            rowCnt = FAIL;
        }
        return rowCnt;
    }

    @Override
    public int deleteImageAll(Integer product_id)throws Exception{
        return session.delete(namespace+"deleteImageAll",product_id);
    }

    @Override
    public  List<AttachImageVO> getAttachInfo(Integer product_id){
       return session.selectList(namespace+"getAttachInfo", product_id);
    }

    public void regProductImage(ProductsVo productsVo){
        for(int i = 0; i < productsVo.getImageVOList().size(); i++) {

            AttachImageVO attachImageVO = productsVo.getImageVOList().get(i);
            attachImageVO.setProduct_id(productsVo.getId());

            System.out.println("attachImageVO = " + attachImageVO);
            session.insert(namespace+"imageReg", attachImageVO);
        }
    }
}
