package com.project.WYW.dao;

import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.ProductsVo;
import com.project.WYW.model.AttachImageVO;
import com.project.WYW.model.Pagehandler;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.validation.constraints.AssertTrue;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class AdminDaoImplTest {

    @Autowired
    AdminDao adminDao;

    @Autowired


    @Test
    public void category() {
    }

    @Test
    public void regProduct() throws Exception{
//        adminDao.deleteAllProducts();
        ProductsVo productsVo = new ProductsVo("admin","침실의자","침실의자입니다.","102",2000,20);

        System.out.println("Before productsVo :" + productsVo);

        adminDao.regProduct(productsVo);

        System.out.println("After productsVo :" + productsVo);

    }

    @Test
    public void productsList() {
    }

    @Test
    public void readProduct() {
    }

    @Test
    public void deleteProduct() {
    }

    @Test
    public void modifiyProduct() {
        try {
            adminDao.deleteAllProducts();
            ProductsVo productsVo = new ProductsVo("admin","침실의자","침실의자입니다.","102",2000,20);
            assertTrue(adminDao.regProduct(productsVo)==1);
            List<ProductsVo> list = adminDao.productsList();
            System.out.println("list = " + list);
            productsVo.setName("거실의자");
            
            adminDao.modifiyProduct(productsVo);
        } catch (Exception e) {
            e.printStackTrace();
            
        }

    }

    @Test
    public void imgRegTest()throws Exception{
        AttachImageVO attachImageVO =  new AttachImageVO(16,"test","test","test");
        assertTrue(adminDao.imgReg(attachImageVO)==1);
    }

    @Test
    public void deleteImageAll()throws Exception{
        assertTrue(adminDao.deleteImageAll(58)>=1);
    }

    @Test
    public void TestGatAttachInof()throws Exception{
        assertTrue( adminDao.getAttachInfo(61).size()==2); ;
    }

    @Test
    public void TestProductsViewList()throws Exception{
        Pagehandler pagehandler = new Pagehandler(1,10);    // 3페이지 & 10개 행 표시
        pagehandler.setKeyword("200");
        System.out.println("pagehandler = " + pagehandler);
        List<ProductsViewVo> list = adminDao.productsViewList(pagehandler);

        for(int i = 0; i < list.size(); i++) {
            System.out.println("list" + i + ".........." + list.get(i));
        }
    }

    @Test
    public void TestProductsGetTotal()throws Exception{
        Pagehandler pagehandler = new Pagehandler();
        pagehandler.setKeyword("20");
        int result = adminDao.productsGetTotal(pagehandler);
        System.out.println("result = " + result);
        
    }
}