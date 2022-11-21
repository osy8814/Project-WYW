package com.project.WYW.dao;

import com.project.WYW.domain.CategoryVo;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.ProductsVo;
import com.project.WYW.model.AttachImageVO;
import com.project.WYW.model.Pagehandler;

import java.util.List;

public interface AdminDao {
    List<CategoryVo> category() throws Exception;

    int regProduct(ProductsVo productsVo) throws Exception;

    List<ProductsVo> productsList()throws Exception;

    List<ProductsViewVo> productsViewList(Pagehandler pagehandler)throws Exception;

    int productsGetTotal(Pagehandler pagehandler)throws Exception;

    ProductsViewVo readProduct(Integer id) throws Exception;

    int deleteProduct(Integer id) throws Exception;

    int modifiyProduct(ProductsVo productsVo) throws Exception;

    int deleteAllProducts()throws Exception;

    int imgReg(AttachImageVO attachImageVO)throws Exception;

    int deleteImageAll(Integer product_id)throws Exception;

    List<AttachImageVO> getAttachInfo(Integer product_id);
}
