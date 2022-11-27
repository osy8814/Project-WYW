package com.project.WYW.service;

import com.project.WYW.domain.ReplyVo;
import com.project.WYW.dto.ReplyPageDto;
import com.project.WYW.model.Pagehandler;

import java.util.List;

public interface ReplyService {
    int regReply(ReplyVo replyVo);

    ReplyPageDto replyList(Pagehandler pagehandler);

    int getReplyTotal(Integer productId);
}
