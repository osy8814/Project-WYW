package com.project.WYW.service;

import com.project.WYW.domain.ReplyQnaVo;
import com.project.WYW.model.Pagehandler;

import java.util.List;

public interface ReplyQnaService {
    int regReplyQna(ReplyQnaVo replyQnaVo);

    int updateReplyQna(ReplyQnaVo replyQnaVo);

    List<ReplyQnaVo> getReplyQnaList(Pagehandler pagehandler);

    int getReplyQnaTotal(Integer productId);

    ReplyQnaVo getReplyQna(ReplyQnaVo replyQnaVo);

    int deleteReplyQna(ReplyQnaVo replyQnaVo);
}
