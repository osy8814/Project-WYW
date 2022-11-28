package com.project.WYW.service;

import com.project.WYW.model.CartVo;
import com.project.WYW.model.WishVo;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class WishServiceImplTest extends TestCase {

    @Autowired
    private WishService wishService;


    @Test
    public void addCartTest() {

        WishVo wishVo = new WishVo();
        wishVo.setUser_id("admin");
        wishVo.setProduct_id(312);

        int rowCnt = wishService.addWish(wishVo);

        System.out.println("** result : " + rowCnt);

        wishVo.setUser_id("admin");
        wishVo.setProduct_id(313);

        rowCnt = wishService.addWish(wishVo);

        System.out.println("** result : " + rowCnt);

    }
}