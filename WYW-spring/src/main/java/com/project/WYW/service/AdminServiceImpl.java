package com.project.WYW.service;

import com.project.WYW.dao.AdminDao;
import com.project.WYW.dao.OrderDao;
import com.project.WYW.dao.UsersDao;
import com.project.WYW.domain.CategoryVo;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.ProductsVo;
import com.project.WYW.domain.UsersVo;
import com.project.WYW.dto.OrderDto;
import com.project.WYW.dto.OrderItemDto;
import com.project.WYW.model.AttachImageVO;
import com.project.WYW.model.Pagehandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;
    @Autowired
    OrderDao orderDao;
    @Autowired
    ProductService productService;
    @Autowired
    private AttachService attachService;
    @Autowired
    private UsersDao usersDao;

    @Override
    public List<CategoryVo> category() throws Exception {
        return adminDao.category();
    }

    @Override
    public List<UsersVo> getUserList() throws Exception {
        return usersDao.selectAll();
    }

    @Override
    public int getUserTotal() throws Exception {
        return usersDao.count();
    }


    @Override
    public int regProduct(ProductsVo productsVo) throws Exception {
        return adminDao.regProduct(productsVo);
    }

    @Override
    public List<ProductsVo> productList() throws Exception {
        return adminDao.productsList();
    }

    @Override
    public ProductsViewVo readProduct(Integer id) throws Exception {
        return adminDao.readProduct(id);
    }

    @Override
    public List<ProductsViewVo> productsViewList(Pagehandler pagehandler) throws Exception {

        List<ProductsViewVo> list = adminDao.productsViewList(pagehandler);

        if (!list.isEmpty()) {
            for (ProductsViewVo productsViewVo : list) {
                int productId = productsViewVo.getId();
                productsViewVo.setImageVOList(attachService.getAttachList(productId));
            }
        }
        return list;
    }

    @Override
    public int productsGetTotal(Pagehandler pagehandler) throws Exception {
        return adminDao.productsGetTotal(pagehandler);
    }

    @Override
    public List<OrderItemDto> getOrder(OrderDto orderDto) {
        List<OrderItemDto> list = orderDao.getOrderItemInfo(orderDto.getOrderId());
        for (OrderItemDto orderItemDto : list) {
            int productId = orderItemDto.getProductId();
            ProductsViewVo productsViewVo = productService.readProductDetail(productId);
            orderItemDto.setImageVOList(productsViewVo.getImageVOList());
            orderItemDto.setProductName(productsViewVo.getName());
            orderItemDto.initSaleTotal();
        }
        return list;
    }

    @Override
    public List<OrderDto> getOrderList(Pagehandler pagehandler) {
        List<OrderDto> list = adminDao.getOrderList(pagehandler);
        for (OrderDto orderDto : list) {
            String orderId = orderDto.getOrderId();
            List<OrderItemDto> orderItemDtoList = orderDao.getOrderItemInfo(orderId);
            for (OrderItemDto oid : orderItemDtoList) {
                int productId = oid.getProductId();
                ProductsViewVo productsViewVo = productService.readProductDetail(productId);
                oid.setProductName(productsViewVo.getName());
            }
            orderDto.setOrders(orderItemDtoList);
        }
        return list;
    }

    @Override
    public int getOrderTotal(Pagehandler pagehandler) {
        return adminDao.getOrderTotal(pagehandler);
    }

    @Transactional
    @Override
    public int deleteProduct(Integer id) throws Exception {

        adminDao.deleteImageAll(id);

        return adminDao.deleteProduct(id);
    }

    @Override
    public int modifiyProduct(ProductsVo productsVo) throws Exception {
        return adminDao.modifiyProduct(productsVo);
    }

    @Override
    public int imgReg(AttachImageVO attachImageVO) throws Exception {
        return adminDao.imgReg(attachImageVO);
    }

    @Override
    public int delateImageAll(Integer product_id) throws Exception {
        return adminDao.deleteImageAll(product_id);
    }

    @Override
    public List<AttachImageVO> getAttachInfo(Integer product_id) throws Exception {
        return adminDao.getAttachInfo(product_id);
    }

    @Override
    public int modifyUserInfo(UsersVo usersVo) {
        return usersDao.modifyUserInfo(usersVo);
    }
}
