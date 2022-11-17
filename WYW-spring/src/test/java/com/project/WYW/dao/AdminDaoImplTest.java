package com.project.WYW.dao;

import com.project.WYW.domain.ProductsVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class AdminDaoImplTest {

    @Autowired
    AdminDao adminDao;

    @Test
    public void category() {
    }

    @Test
    public void regProduct() {
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
}