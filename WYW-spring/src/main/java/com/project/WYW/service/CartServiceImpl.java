package com.project.WYW.service;

import com.project.WYW.dao.AttachDao;
import com.project.WYW.dao.CartDao;
import com.project.WYW.model.AttachImageVO;
import com.project.WYW.model.CartVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartDao cartDao;

    @Autowired
    private AttachDao attachDao;

    @Transactional(rollbackFor = RuntimeException.class)
    @Override
    public int addCart(CartVo cartVo) {
        CartVo checkCart = cartDao.checkCart(cartVo);
        //장바구니에 있으면 해당상품이 있으면 2리턴
        if (checkCart != null) {
            return 2;
        }
        // 장바구니 등록 & 에러 시 0반환
        try {
            return cartDao.addCart(cartVo);
        } catch (Exception e) {
            return 0;
        }
    }

    @Override
    public List<CartVo> getCartList(String user_id) {
        List<CartVo> cart = cartDao.getCart(user_id);

        for (CartVo cartVo : cart) {
            cartVo.initSaleTotal();

            int product_id = cartVo.getProduct_id();

            List<AttachImageVO> imageVOList = attachDao.gatAttachList(product_id);

            cartVo.setImageVOList(imageVOList);
        }
        return cart;
    }

    @Override
    public int modifyCount(CartVo cartVo) {
        return cartDao.modifyCount(cartVo);
    }

    @Override
    public int deleteCart(Integer id){
        return  cartDao.deleteCart(id);
    }

}
