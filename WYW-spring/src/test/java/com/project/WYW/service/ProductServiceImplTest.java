package com.project.WYW.service;

import com.project.WYW.dao.ProductDao;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.model.Pagehandler;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ProductServiceImplTest {

    @Autowired
    ProductService productService;

    @Autowired
    ProductDao productDao;

    @Test
    public void productsViewList() {
    }

    @Test
    public void productsGetTotal() {
    }

    @Test
    public void readProductDetail() {
    }

    @Test
    public void newPageResult()throws Exception{
        Pagehandler pagehandler = new Pagehandler();
        pagehandler.setAmount(12);
        pagehandler.setOrder("N");
        List<ProductsViewVo> list = productService.productsViewList(pagehandler);
        int total = productService.productsGetTotal(pagehandler);

        System.out.println("list = " + list);
        System.out.println("listSize = " + list.size());
    }

    @Test
    public void ratingTest()throws Exception{
        Double ratingAvg = productDao.getRatingAverage(116);
        System.out.println("ratingAvg = " + ratingAvg);
        
        productService.setRating(116);
        ProductsViewVo productsViewVo = productService.readProductDetail(116);
        System.out.println("productsViewVo = " + productsViewVo);
    }
}