package com.project.WYW.service;

import com.project.WYW.dao.AdminDao;
import com.project.WYW.domain.ProductsVo;
import com.project.WYW.model.AttachImageVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class AdminServiceImplTest {


    @Autowired
    private AdminService adminService;

    @Autowired
    private AdminDao adminDao;

    @Test
    public void category() {
    }

    @Test
    public void regProduct()throws Exception {

//        adminDao.deleteAllProducts();
        ProductsVo productsVo = new ProductsVo("admin","침실의자","침실의자입니다.","102",2000,20);

        List<AttachImageVO> imageVOList = new ArrayList<>();

        AttachImageVO attachImageVO1 = new AttachImageVO();
        AttachImageVO attachImageVO2 = new AttachImageVO();

        attachImageVO1.setFile_name("test3");
        attachImageVO1.setUpload_path("test3");
        attachImageVO1.setUuid("test3");

        imageVOList.add(attachImageVO1);

        attachImageVO2.setFile_name("test4");
        attachImageVO2.setUpload_path("test4");
        attachImageVO2.setUuid("test4");

        imageVOList.add(attachImageVO2);


        System.out.println("imageVOList = " + imageVOList);

        productsVo.setImageVOList(imageVOList);

        assertTrue(adminService.regProduct(productsVo)==1);


    }

    @Test
    public void productList() {
    }

    @Test
    public void readProduct() {
    }

    @Test
    public void productsViewList() {
    }

    @Test
    public void deleteProduct() {
    }

    @Test
    public void modifiyProduct() {
    }

    @Test
    public void imgReg() {
    }
}