package com.project.WYW.dao;

import com.project.WYW.model.CartVo;

import java.util.List;

public interface CartDao {
    /* 카트 추가 */
    int addCart(CartVo cartVo);

    /* 카트 삭제 */
    int deleteCart(int id);

    /* 카트 수량 수정 */
    int modifyCount(CartVo cartVo);

    /* 카트 목록 */
    List<CartVo> getCart(String user_id);

    /* 카트 확인 */
    CartVo checkCart(CartVo cartVo);
}
