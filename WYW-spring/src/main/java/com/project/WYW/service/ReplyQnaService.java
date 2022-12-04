package com.project.WYW.service;

import com.project.WYW.domain.AnswerVo;
import com.project.WYW.domain.ReplyQnaVo;
import com.project.WYW.dto.ReplyQnaDto;
import com.project.WYW.dto.ReplyQnaPageDto;
import com.project.WYW.model.Pagehandler;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ReplyQnaService {
    int regReplyQna(ReplyQnaVo replyQnaVo);

    int updateReplyQna(ReplyQnaDto replyQnaDto);

    ReplyQnaPageDto replyQnaList(Pagehandler pagehandler);

    int getReplyQnaTotal(Integer productId);

    ReplyQnaDto getReplyQna(ReplyQnaDto replyQnaDto);

    int deleteReplyQna(ReplyQnaVo replyQnaVo);

    @Transactional(rollbackFor = RuntimeException.class)
    void regAnswer(AnswerVo answerVo);

    AnswerVo getAnswer(AnswerVo answerVo);

    int updateAnswer(AnswerVo answerVo);
}
