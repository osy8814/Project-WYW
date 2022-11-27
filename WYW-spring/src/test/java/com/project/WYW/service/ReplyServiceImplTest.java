package com.project.WYW.service;

import com.project.WYW.dao.ReplyDao;
import com.project.WYW.domain.ReplyVo;
import com.project.WYW.dto.PageDto;
import com.project.WYW.dto.ReplyPageDto;
import com.project.WYW.model.Pagehandler;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ReplyServiceImplTest {

    @Autowired
    ReplyService replyService;

    @Autowired
    ReplyDao replyDao;

    @Test
    public void replyList() {
        Pagehandler pagehandler = new Pagehandler();
        pagehandler.setProductId(312);
        ReplyPageDto replyPageDto = new ReplyPageDto();
        replyPageDto.setList(replyDao.getReplyList(pagehandler));
        replyPageDto.setPageInfo(new PageDto(pagehandler ,replyDao.getReplyTotal(pagehandler.getProductId())));

        System.out.println("replyPageDto = " + replyPageDto);
    }

    @Test
    public void getReplyTotal() {
    }

    @Test
    public void getUpdateReply(){
        ReplyVo replyVo = new ReplyVo();
        replyVo.setReplyId(24);

        replyVo = replyService.getUpdateReply(replyVo.getReplyId());
        System.out.println("replyVo = " + replyVo);
    }
}