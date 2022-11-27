package com.project.WYW.service;

import com.project.WYW.dao.ReplyDao;
import com.project.WYW.domain.ReplyVo;
import com.project.WYW.dto.PageDto;
import com.project.WYW.dto.ReplyPageDto;
import com.project.WYW.model.Pagehandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {

    @Autowired
    ReplyDao replyDao;

    @Override
    public int regReply(ReplyVo replyVo) {

        int rowCnt = replyDao.regReply(replyVo);

        return rowCnt;
    }

    @Override
    public ReplyPageDto replyList(Pagehandler pagehandler) {
        ReplyPageDto replyPageDto = new ReplyPageDto();
        replyPageDto.setList(replyDao.getReplyList(pagehandler));
        replyPageDto.setPageInfo(new PageDto(pagehandler, replyDao.getReplyTotal(pagehandler.getProductId())));

        return replyPageDto;
    }

    @Override
    public int getReplyTotal(Integer productId) {
        return replyDao.getReplyTotal(productId);
    }

    @Override
    public int updateReply(ReplyVo replyVo) {

        int rowCnt = replyDao.updateReply(replyVo);

        return rowCnt;
    }

    @Override
    public ReplyVo getUpdateReply(int replyId){
        return replyDao.getUpdateReply(replyId);
    };

    @Override
    public int deleteReply(ReplyVo replyVo){

        int rowCnt = replyDao.deleteReply(replyVo.getReplyId());

        return rowCnt;
    }
}
