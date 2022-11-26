package com.project.WYW.service;

import com.project.WYW.dao.AdminDao;
import com.project.WYW.domain.CategoryVo;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.ProductsVo;
import com.project.WYW.dto.OrderDto;
import com.project.WYW.model.AttachImageVO;
import com.project.WYW.model.Pagehandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    public List<ProductsViewVo> productsViewList(Pagehandler pagehandler) throws Exception{
        return adminDao.productsViewList(pagehandler);
    }

    @Override
    public int productsGetTotal(Pagehandler pagehandler)throws Exception{
        return adminDao.productsGetTotal(pagehandler);
    }

    @Override
    public List<OrderDto> getOrderList(Pagehandler pagehandler){
        return adminDao.getOrderList(pagehandler);
    }

    @Override
    public int getOrderTotal(Pagehandler pagehandler){
        return adminDao.getOrderTotal(pagehandler);
    }

    @Transactional
    @Override
    public int deleteProduct(Integer id) throws  Exception{

        adminDao.deleteImageAll(id);

        return adminDao.deleteProduct(id);
    }

    @Override
    public int modifiyProduct(ProductsVo productsVo)throws Exception{
        return adminDao.modifiyProduct(productsVo);
    }

    @Override
    public int imgReg(AttachImageVO attachImageVO)throws Exception{
        return adminDao.imgReg(attachImageVO);
    }

    @Override
    public int delateImageAll(Integer product_id)throws Exception{
        return adminDao.deleteImageAll(product_id);
    }

    @Override
    public List<AttachImageVO> getAttachInfo(Integer product_id)throws Exception{
        return adminDao.getAttachInfo(product_id);
    }

}
