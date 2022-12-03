package com.project.WYW.dao;

import com.project.WYW.domain.ReplyQnaVo;
import com.project.WYW.domain.ReplyVo;
import com.project.WYW.model.Pagehandler;

import java.util.List;

public interface ReplyQnaDao {
    int regReplyQna(ReplyQnaVo replyQnaVo);

    List<ReplyQnaVo> getReplyQnaList(Pagehandler pagehandler);

    int getReplyQnaTotal(Integer productId);

    int updateReplyQna(ReplyQnaVo replyQnaVo);

    ReplyQnaVo getUpdateReplyQna(Integer qnaId);

    /* 댓글 삭제 */
    int deleteReply(ReplyQnaVo replyQnaVo);
}
