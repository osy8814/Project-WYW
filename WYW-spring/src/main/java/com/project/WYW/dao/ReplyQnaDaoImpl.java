package com.project.WYW.dao;

import com.project.WYW.domain.AnswerVo;
import com.project.WYW.domain.ReplyQnaVo;
import com.project.WYW.dto.ReplyQnaDto;
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
    public List<ReplyQnaDto> getReplyQnaList(Pagehandler pagehandler){
        return session.selectList(namespace+"getReplyQnaList",pagehandler);
    }

    @Override
    public int getReplyQnaTotal(Pagehandler pagehandler){
        return session.selectOne(namespace+"getReplyQnaTotal",pagehandler);
    }

    @Override
    public int updateReplyQna(ReplyQnaDto replyQnaDto){
        return session.update(namespace+"updateReplyQna", replyQnaDto);
    }

    @Override
    public ReplyQnaDto getUpdateReplyQna(Integer qnaId){
        return session.selectOne(namespace+"getUpdateReplyQna", qnaId);
    }

    /* 댓글 삭제 */
    @Override
    public int deleteReplyQna(ReplyQnaVo replyQnaVo){
        return session.update(namespace+"deleteReplyQna",replyQnaVo);
    };

    @Override
    public int regAnswer(AnswerVo answerVo){
        return session.insert(namespace+"regAnswer",answerVo);
    }

    @Override
    public int updateState(AnswerVo answerVo) {
        return session.update(namespace+"updateState",answerVo);
    }

    @Override
    public AnswerVo getAnswer(AnswerVo answerVo){
        return session.selectOne(namespace+"getAnswer",answerVo);
    }

    @Override
    public int updateAnswer(AnswerVo answerVo){
        return session.update(namespace+"updateAnswer",answerVo);
    }
}
