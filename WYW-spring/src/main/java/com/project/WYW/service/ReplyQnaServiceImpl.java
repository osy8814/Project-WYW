package com.project.WYW.service;

import com.project.WYW.dao.ReplyQnaDao;
import com.project.WYW.domain.ReplyQnaVo;
import com.project.WYW.model.Pagehandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyQnaServiceImpl implements ReplyQnaService {

    @Autowired
    ReplyQnaDao replyQnaDao;

    @Override
    public int regReplyQna(ReplyQnaVo replyQnaVo){
        return replyQnaDao.regReplyQna(replyQnaVo);
    }

    @Override
    public int updateReplyQna(ReplyQnaVo replyQnaVo){
        return replyQnaDao.updateReplyQna(replyQnaVo);
    }

    @Override
    public List<ReplyQnaVo> getReplyQnaList(Pagehandler pagehandler){
        return replyQnaDao.getReplyQnaList(pagehandler);
    }

    @Override
    public int getReplyQnaTotal(Integer productId){
        return replyQnaDao.getReplyQnaTotal(productId);
    }

    @Override
    public ReplyQnaVo getReplyQna(ReplyQnaVo replyQnaVo){
        return replyQnaDao.getUpdateReplyQna(replyQnaVo.getQnaId());
    }

    @Override
    public int deleteReplyQna(ReplyQnaVo replyQnaVo){
        return replyQnaDao.deleteReplyQna(replyQnaVo);
    }
}
