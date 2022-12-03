package com.project.WYW.service;

import com.project.WYW.dao.ReplyQnaDao;
import com.project.WYW.domain.ReplyQnaVo;
import com.project.WYW.dto.PageDto;
import com.project.WYW.dto.ReplyQnaPageDto;
import com.project.WYW.model.Pagehandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public int updateReplyQna(ReplyQnaVo replyQnaVo){
        return replyQnaDao.updateReplyQna(replyQnaVo);
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
    public ReplyQnaVo getReplyQna(ReplyQnaVo replyQnaVo){
        return replyQnaDao.getUpdateReplyQna(replyQnaVo.getQnaId());
    }

    @Override
    public int deleteReplyQna(ReplyQnaVo replyQnaVo){
        return replyQnaDao.deleteReplyQna(replyQnaVo);
    }
}
