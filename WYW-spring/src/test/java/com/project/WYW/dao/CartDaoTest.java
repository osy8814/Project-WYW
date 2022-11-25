package com.project.WYW.dao;

import com.project.WYW.model.CartVo;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CartDaoTest extends TestCase {

    @Autowired
    CartDao cartDao;

    @Test
    public void testAddCart() {

        CartVo cartVo = new CartVo("admin", 39, 2);

        int rowCnt;
        rowCnt = cartDao.addCart(cartVo);

        assertTrue(rowCnt==1);

    }

    @Test
    public void testDeleteCart() {

        int rowCnt = cartDao.deleteCart(2);
        assertTrue(rowCnt!=1);
        rowCnt = cartDao.deleteCart(1);
        assertTrue(rowCnt==1);

    }

    @Test
    public void testModifyCount() {
        int rowCnt;
        CartVo cartVo = new CartVo();
        cartVo.setId(3);
        cartVo.setProduct_count(5);

        rowCnt=cartDao.modifyCount(cartVo);
        assertTrue(rowCnt!=1);

        cartVo.setId(1);
        assertTrue(rowCnt!=1);


    }

    @Test
    public void testGetCart() {
        List<CartVo> list = cartDao.getCart("admin");
        for (CartVo cart: list) {
            cart.initSaleTotal();
        }
        System.out.println("list = " + list);

    }

    @Test
    public void testCheckCart() {

        CartVo cartVo = new CartVo("admin", 312, 2);
        CartVo result = cartDao.checkCart(cartVo);

        System.out.println("result = " + result);
    }
}