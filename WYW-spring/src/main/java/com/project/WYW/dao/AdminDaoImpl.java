package com.project.WYW.dao;

import com.project.WYW.domain.CategoryVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminDaoImpl implements AdminDao {

    @Autowired
    private SqlSession session;

    private static String namespace="com.project.WYW.domain.CategoryVo.";

    @Override
    public List<CategoryVo> category()throws Exception{

      return session.selectList(namespace+"category");
    }
}
