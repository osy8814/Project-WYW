package com.project.WYW.service;

import com.project.WYW.dao.ReplyQnaDao;
import com.project.WYW.domain.AnswerVo;
import com.project.WYW.domain.ReplyQnaVo;
import com.project.WYW.dto.PageDto;
import com.project.WYW.dto.ReplyQnaDto;
import com.project.WYW.dto.ReplyQnaPageDto;
import com.project.WYW.model.Pagehandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReplyQnaServiceImpl implements ReplyQnaService {

    @Autowired
    ReplyQnaDao replyQnaDao;

    @Autowired
    ProductService productService;

    @Override
    public int regReplyQna(ReplyQnaVo replyQnaVo){

        int rowCnt = replyQnaDao.regReplyQna(replyQnaVo);

        return rowCnt;
    }

    @Override
    public int updateReplyQna(ReplyQnaDto replyQnaDto){
        return replyQnaDao.updateReplyQna(replyQnaDto);
    }

    @Override
    public ReplyQnaPageDto replyQnaList(Pagehandler pagehandler) {
        ReplyQnaPageDto replyQnaPageDto = new ReplyQnaPageDto();
        replyQnaPageDto.setList(replyQnaDao.getReplyQnaList(pagehandler));
        replyQnaPageDto.setPageInfo(new PageDto(pagehandler, replyQnaDao.getReplyQnaTotal(pagehandler.getProductId())));

        return replyQnaPageDto;
    }

    @Override
    public int getReplyQnaTotal(Integer productId){
        return replyQnaDao.getReplyQnaTotal(productId);
    }

    @Override
    public ReplyQnaDto getReplyQna(ReplyQnaDto replyQnaDto){
        return replyQnaDao.getUpdateReplyQna(replyQnaDto.getQnaId());
    }

    @Override
    public int deleteReplyQna(ReplyQnaVo replyQnaVo){
        return replyQnaDao.deleteReplyQna(replyQnaVo);
    }


    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public void regAnswer(AnswerVo answerVo){

        replyQnaDao.regAnswer(answerVo);
        replyQnaDao.updateState(answerVo);

    }

    @Override
    public AnswerVo getAnswer(AnswerVo answerVo){
        return replyQnaDao.getAnswer(answerVo);
    }

    @Override
    public int updateAnswer(AnswerVo answerVo){
        return replyQnaDao.updateAnswer(answerVo);
    }

}
