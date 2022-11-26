package com.project.WYW.dao;

import com.project.WYW.domain.ProductsVo;
import com.project.WYW.dto.OrderPageItemDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDaoImpl implements OrderDao {

    @Autowired
    private SqlSession session;

    private static String namespace="com.project.WYW.mapper.orderMapper.";

    @Override
    public OrderPageItemDto getProductInfo(Integer id){
        return session.selectOne(namespace+"getProductInfo",id);
    };
}
