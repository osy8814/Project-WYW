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

        for (int i = 0; i <250 ; i++) {

        ProductsVo productsVo = new ProductsVo("admin","침실의자"+i,"침실의자입니다.","102",2000,20);

        List<AttachImageVO> imageVOList = new ArrayList<>();

        AttachImageVO attachImageVO1 = new AttachImageVO();
        AttachImageVO attachImageVO2 = new AttachImageVO();

        attachImageVO1.setFile_name("test"+i);
        attachImageVO1.setUpload_path("test"+i);
        attachImageVO1.setUuid("test"+i);

        imageVOList.add(attachImageVO1);

        productsVo.setImageVOList(imageVOList);

        adminService.regProduct(productsVo);
        }


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