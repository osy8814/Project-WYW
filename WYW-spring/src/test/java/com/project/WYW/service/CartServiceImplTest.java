package com.project.WYW.service;

import com.project.WYW.model.CartVo;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CartServiceImplTest extends TestCase {

    @Autowired
    private CartService cartService;


    @Test
    public void addCartTest() {

//        CartVo cartVo = new CartVo("admin", 312, 5);
        CartVo cartVo = new CartVo("admin", 309, 5);

        int rowCnt = cartService.addCart(cartVo);

        System.out.println("** result : " + rowCnt);
        assertTrue(rowCnt==1);

    }
}