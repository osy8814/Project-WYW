package com.project.WYW.dao;

import com.project.WYW.model.CartVo;
import com.project.WYW.model.WishVo;
import com.project.WYW.service.AttachService;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class WishDaoTest extends TestCase {

    @Autowired
    WishDao wishDao;

    @Autowired
    AttachService attachService;

    @Test
    public void testAddWish() {

        WishVo wishVo = new WishVo();
        wishVo.setUser_id("admin");
        wishVo.setProduct_id(312);

        int rowCnt;
        rowCnt = wishDao.addWish(wishVo);

        assertTrue(rowCnt==1);

    }

    @Test
    public void testGetWish() {
        
        List<WishVo> list = wishDao.getWish("admin");

        for (WishVo wishVo:list) {
            int productId = wishVo.getProduct_id();
            wishVo.setImageVOList(attachService.getAttachList(productId));
        }

        System.out.println("list = " + list);

    }

    @Test
    public void testCheckWish() {

        WishVo wishVo =  new WishVo();
        wishVo.setUser_id("admin");
        wishVo.setProduct_id(312);
        
        WishVo wishVo1 = wishDao.checkWish(wishVo);
        System.out.println("wishVo1 = " + wishVo1);
    }

    @Test
    public void testDeleteWish(){

        int wishId = 1;
        wishDao.deleteWish(wishId);
    }
}