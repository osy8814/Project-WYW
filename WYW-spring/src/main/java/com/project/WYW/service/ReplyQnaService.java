package com.project.WYW.service;

import com.project.WYW.domain.AnswerVo;
import com.project.WYW.domain.ReplyQnaVo;
import com.project.WYW.dto.ReplyQnaPageDto;
import com.project.WYW.model.Pagehandler;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ReplyQnaService {
    int regReplyQna(ReplyQnaVo replyQnaVo);

    int updateReplyQna(ReplyQnaVo replyQnaVo);

    ReplyQnaPageDto replyQnaList(Pagehandler pagehandler);

    int getReplyQnaTotal(Integer productId);

    ReplyQnaVo getReplyQna(ReplyQnaVo replyQnaVo);

    int deleteReplyQna(ReplyQnaVo replyQnaVo);

    @Transactional(rollbackFor = RuntimeException.class)
    void regAnswer(AnswerVo answerVo);
}
