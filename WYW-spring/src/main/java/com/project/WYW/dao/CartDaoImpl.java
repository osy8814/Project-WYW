package com.project.WYW.dao;

import com.project.WYW.model.CartVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CartDaoImpl implements CartDao {

    @Autowired
    private SqlSession session;

    private static String namespace = "com.project.WYW.mapper.cartMapper.";


    /* 카트 추가 */
    @Override
    public int addCart(CartVo cartVo) {
        return session.insert(namespace + "addCart", cartVo);
    }

    ;

    /* 카트 삭제 */
    @Override
    public int deleteCart(int id) {
        return session.delete(namespace + "deleteCart", id);
    }

    ;

    /* 카트 수량 수정 */
    @Override
    public int modifyCount(CartVo cartVo) {
        return session.update(namespace + "modifyCount", cartVo);
    }

    ;

    /* 카트 목록 */
    @Override
    public List<CartVo> getCart(String user_id) {
        return session.selectList(namespace + "getCart", user_id);
    }

    ;

    /* 카트 확인 */
    @Override
    public CartVo checkCart(CartVo cartVo) {
        return session.selectOne(namespace + "checkCart", cartVo);
    }

    ;
}
