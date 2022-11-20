package com.project.WYW.dao;

import com.project.WYW.model.AttachImageVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AttachDaoImpl implements AttachDao {

    @Autowired
    private SqlSession session;

    private static String namespace="com.project.WYW.mapper.attachMapper.";

    @Override
    public List<AttachImageVO> gatAttachList(int product_id){

        return session.selectList(namespace+"getAttachList", product_id);
    }
}
