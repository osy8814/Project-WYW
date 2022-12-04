package com.project.WYW.dao;

import com.project.WYW.domain.AnswerVo;
import com.project.WYW.domain.ReplyQnaVo;
import com.project.WYW.domain.ReplyVo;
import com.project.WYW.dto.ReplyQnaDto;
import com.project.WYW.model.Pagehandler;

import java.util.List;

public interface ReplyQnaDao {
    int regReplyQna(ReplyQnaVo replyQnaVo);

//    List<ReplyQnaVo> getReplyQnaList(Pagehandler pagehandler);

    List<ReplyQnaDto> getReplyQnaList(Pagehandler pagehandler);

    int getReplyQnaTotal(Integer productId);

    int updateReplyQna(ReplyQnaDto replyQnaDto);

    ReplyQnaDto getUpdateReplyQna(Integer qnaId);

    /* 댓글 삭제 */
    int deleteReplyQna(ReplyQnaVo replyQnaVo);

    int regAnswer(AnswerVo answerVo);

    int updateState(AnswerVo answerVo);

    AnswerVo getAnswer(AnswerVo answerVo);

    int updateAnswer(AnswerVo answerVo);
}
