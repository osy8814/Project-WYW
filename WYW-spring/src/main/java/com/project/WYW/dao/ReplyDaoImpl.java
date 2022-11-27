package com.project.WYW.dao;

import com.project.WYW.domain.ReplyVo;
import com.project.WYW.model.Pagehandler;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReplyDaoImpl implements ReplyDao {

    @Autowired
    private SqlSession session;

    private static String namespace="com.project.WYW.mapper.replyMapper.";

    @Override
    public int regReply(ReplyVo replyVo){
        return session.insert(namespace+"regReply",replyVo);
    }

    @Override
    public List<ReplyVo> getReplyList(Pagehandler pagehandler){
        return session.selectList(namespace+"getReplyList",pagehandler);
    }

    @Override
    public int getReplyTotal(Integer productId){
        return session.selectOne(namespace+"getReplyTotal",productId);
    }
}
