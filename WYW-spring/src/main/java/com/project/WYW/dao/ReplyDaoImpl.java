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

    @Override
    public int updateReply(ReplyVo replyVo){
        return session.update(namespace+"updateReply", replyVo);
    }

    @Override
    public ReplyVo getUpdateReply(Integer replyId){
        return session.selectOne(namespace+"getUpdateReply", replyId);
    }

    /* 댓글 삭제 */
    @Override
    public int deleteReply(ReplyVo ReplyVo){
        return session.delete(namespace+"deleteReply",ReplyVo);
    };
}
