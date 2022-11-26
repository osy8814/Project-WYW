package com.project.WYW.service;

import com.project.WYW.dao.OrderDao;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.ProductsVo;
import com.project.WYW.domain.UsersVo;
import com.project.WYW.dto.OrderDto;
import com.project.WYW.dto.OrderItemDto;
import com.project.WYW.dto.OrderPageItemDto;
import com.project.WYW.model.CartVo;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;
    @Autowired
    private AttachService attachService;
    @Autowired
    private CartService cartService;
    @Autowired
    private ProductService productService;
    @Autowired
    private UsersSecvice usersSecvice;

    @Override
    public List<OrderPageItemDto> getProductInfo(List<OrderPageItemDto> list) {
        List<OrderPageItemDto> result = new ArrayList<>();

        for (OrderPageItemDto orderPageItemDto : list) {

            int productId = orderPageItemDto.getProductId();
            OrderPageItemDto productInfo = orderDao.getProductInfo(productId);

            productInfo.setProductCount(orderPageItemDto.getProductCount());
            productInfo.initSaleTotal();
            productInfo.setImageVOList(attachService.getAttachList(productId));

            result.add(productInfo);
        }
        return result;
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public void order(OrderDto orderDto) throws Exception {
        /* 사용할 데이터가져오기 */
        /* 회원 정보 */
        UsersVo usersVo = usersSecvice.read(orderDto.getUserId());
        /* 주문 정보 */
        List<OrderItemDto> orderItemDtoList = new ArrayList<>();
        for(OrderItemDto oit : orderDto.getOrders()) {
            OrderItemDto orderItemDto = orderDao.getOrderInfo(oit.getProductId());
            // 수량 셋팅
            orderItemDto.setProductCount(oit.getProductCount());
            // 기본정보 셋팅
            orderItemDto.initSaleTotal();
            //List객체 추가
            orderItemDtoList.add(orderItemDto);
        }
        /* OrderDTO 셋팅 */
        orderDto.setOrders(orderItemDtoList);
        orderDto.getOrderPriceInfo();

        /*DB 주문,주문상품(,배송정보) 넣기*/

        /* orderId만들기 및 OrderDTO객체 orderId에 저장 */
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
        String orderId = usersVo.getUserId() + format.format(date);
        orderDto.setOrderId(orderId);

        /* db넣기 */
        orderDao.regOrder(orderDto);		//order 등록
        for(OrderItemDto oit : orderDto.getOrders()) {		//orderItem 등록
            oit.setOrderId(orderId);
            orderDao.regOrderItem(oit);
        }

        /* 재고 변동 적용 */
        for(OrderItemDto oit : orderDto.getOrders()) {
            /* 변동 재고 값 구하기 */
            ProductsViewVo productsViewVo = productService.readProductDetail(oit.getProductId());
            productsViewVo.setStock(productsViewVo.getStock() - oit.getProductCount());
            /* 변동 값 DB 적용 */
            orderDao.reduceStock(productsViewVo);
        }

        /* 장바구니 제거 */
        for(OrderItemDto oit : orderDto.getOrders()) {
            CartVo cartVo = new CartVo();
            cartVo.setUser_id(orderDto.getUserId());
            cartVo.setProduct_id(oit.getProductId());

            orderDao.deleteOrderCart(cartVo);
        }
    }

    ;

}
