package com.project.WYW.dao;

import com.project.WYW.model.WishVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class WishDaoImpl implements WishDao {

    @Autowired
    private SqlSession session;

    private static String namespace="com.project.WYW.mapper.wishMapper.";

    @Override
    public int addWish(WishVo wishVo){
        return session.insert(namespace+"addWish",wishVo);
    }

    @Override
    public List<WishVo> getWish(String userId){
        return session.selectList(namespace+"getWish",userId);
    }

    @Override
    public WishVo checkWish(WishVo wishVo){
        return session.selectOne(namespace+"checkWish",wishVo);
    }
    @Override
    public int deleteWish(Integer wishId){
        return session.delete(namespace+"deleteWish",wishId);
    }

}
