package com.project.WYW.service;

import com.project.WYW.dao.AdminDao;
import com.project.WYW.dao.OrderDao;
import com.project.WYW.dao.ReplyQnaDao;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.ProductsVo;
import com.project.WYW.domain.ReplyQnaVo;
import com.project.WYW.domain.UsersVo;
import com.project.WYW.dto.OrderDto;
import com.project.WYW.dto.OrderItemDto;
import com.project.WYW.dto.ReplyQnaDto;
import com.project.WYW.dto.ReplyQnaPageDto;
import com.project.WYW.model.AttachImageVO;
import com.project.WYW.model.Pagehandler;
import org.aspectj.weaver.ast.Or;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.print.DocFlavor;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class AdminServiceImplTest {


    @Autowired
    private AdminService adminService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private AdminDao adminDao;
    @Autowired
    private ProductService productService;
    @Autowired
    private ReplyQnaService replyQnaService;

    @Test
    public void category() {
    }

    @Test
    public void regProduct() throws Exception {

        for (int i = 0; i < 250; i++) {

            ProductsVo productsVo = new ProductsVo("admin", "침실의자" + i, "침실의자입니다.", "102", 2000, 20);

            List<AttachImageVO> imageVOList = new ArrayList<>();

            AttachImageVO attachImageVO1 = new AttachImageVO();
            AttachImageVO attachImageVO2 = new AttachImageVO();

            attachImageVO1.setFile_name("test" + i);
            attachImageVO1.setUpload_path("test" + i);
            attachImageVO1.setUuid("test" + i);

            imageVOList.add(attachImageVO1);

            productsVo.setImageVOList(imageVOList);

            adminService.regProduct(productsVo);
        }


    }

    @Test
    public void getOderListTest() {
        Pagehandler pagehandler = new Pagehandler();
        pagehandler.setAmount(1);
        List<OrderDto> list = adminService.getOrderList(pagehandler);
        for (OrderDto orderDto : list) {
            String orderId = orderDto.getOrderId();
            List<OrderItemDto> orderItemDtoList = orderDao.getOrderItemInfo(orderId);
            for (OrderItemDto oid : orderItemDtoList) {
                int productId = oid.getProductId();
                ProductsViewVo productsViewVo = productService.readProductDetail(productId);
                oid.setImageVOList(productsViewVo.getImageVOList());
                oid.setProductName(productsViewVo.getName());
                oid.initSaleTotal();
            }
            orderDto.setOrders(orderItemDtoList);
        }
        System.out.println("list = " + list);
    }

    @Test
    public void getOderTest() {

        List<OrderItemDto> list = orderDao.getOrderItemInfo("admin_202211291147");
        for (OrderItemDto orderItemDto : list) {
            int productId = orderItemDto.getProductId();
            ProductsViewVo productsViewVo = productService.readProductDetail(productId);
            orderItemDto.setImageVOList(productsViewVo.getImageVOList());
            orderItemDto.setProductName(productsViewVo.getName());
            orderItemDto.initSaleTotal();
        }

        System.out.println("list = " + list);
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
    
    @Test
    public void getSelectAllTest()throws Exception{
        Pagehandler pagehandler = new Pagehandler();
        List<UsersVo>list = adminService.getUserList(pagehandler);
        System.out.println("list = " + list);
    }
    
    @Test
    public void getUserTotalTest()throws Exception{
        Pagehandler pagehandler = new Pagehandler();
        int users = adminService.getUserTotal(pagehandler);
        System.out.println("users = " + users);
    }

    @Autowired
    ReplyQnaDao replyQnaDao;
    @Test
    public void getQnalistGet(){
        Pagehandler pagehandler = new Pagehandler();
        List<ReplyQnaDto>list = replyQnaDao.getReplyQnaList(pagehandler);
        System.out.println("list = " + list);
        
        ReplyQnaPageDto replyQnaPageDto = replyQnaService.replyQnaList(pagehandler);
        System.out.println("replyQnaPageDto = " + replyQnaPageDto);



    }

}