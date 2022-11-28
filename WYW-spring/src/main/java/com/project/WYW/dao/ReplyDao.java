package com.project.WYW.dao;

import com.project.WYW.domain.ReplyVo;
import com.project.WYW.model.Pagehandler;

import java.util.List;

public interface ReplyDao {
    int regReply(ReplyVo replyVo);

    /* 댓글 페이징 */
    List<ReplyVo> getReplyList(Pagehandler pagehandler);

    /* 댓글 총 갯수(페이징) */
    int getReplyTotal(Integer productId);

    int updateReply(ReplyVo replyVo);

    ReplyVo getUpdateReply(Integer replyID);

    /* 댓글 삭제 */
    int deleteReply(ReplyVo ReplyVo);
}
