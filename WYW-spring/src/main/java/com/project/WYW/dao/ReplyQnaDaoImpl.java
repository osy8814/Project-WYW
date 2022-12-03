package com.project.WYW.dao;

import com.project.WYW.domain.ReplyQnaVo;
import com.project.WYW.model.Pagehandler;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReplyQnaDaoImpl implements ReplyQnaDao {

    @Autowired
    private SqlSession session;

    private static String namespace="com.project.WYW.mapper.replyQnaMapper.";

    @Override
    public int regReplyQna(ReplyQnaVo replyQnaVo){
        return session.insert(namespace+"regReplyQna",replyQnaVo);
    }

    @Override
    public List<ReplyQnaVo> getReplyQnaList(Pagehandler pagehandler){
        return session.selectList(namespace+"getReplyQnaList",pagehandler);
    }

    @Override
    public int getReplyQnaTotal(Integer productId){
        return session.selectOne(namespace+"getReplyQnaTotal",productId);
    }

    @Override
    public int updateReplyQna(ReplyQnaVo replyQnaVo){
        return session.update(namespace+"updateReplyQna", replyQnaVo);
    }

    @Override
    public ReplyQnaVo getUpdateReplyQna(Integer qnaId){
        return session.selectOne(namespace+"getUpdateReplyQna", qnaId);
    }

    /* 댓글 삭제 */
    @Override
    public int deleteReplyQna(ReplyQnaVo replyQnaVo){
        return session.delete(namespace+"deleteReplyQna",replyQnaVo);
    };
}
