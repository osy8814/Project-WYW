package com.project.WYW.service;

import com.project.WYW.model.CartVo;

import java.util.List;

public interface CartService {
    int addCart(CartVo cartVo);

    List<CartVo> getCartList(String user_id);
}
