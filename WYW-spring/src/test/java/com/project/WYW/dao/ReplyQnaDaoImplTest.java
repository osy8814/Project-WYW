package com.project.WYW.dao;

import com.project.WYW.domain.AnswerVo;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.ReplyQnaVo;
import com.project.WYW.dto.ReplyQnaDto;
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
public class ReplyQnaDaoImplTest {

    @Autowired
    ReplyQnaDao replyQnaDao;

    @Test
    public void regReplyQna() {

        ReplyQnaVo replyQnaVo = new ReplyQnaVo();
        replyQnaVo.setProductId(116);
        replyQnaVo.setUserId("edcosy");

        replyQnaDao.regReplyQna(replyQnaVo);


    }
    
    @Test
    public void getReplyQna(){

        Pagehandler pagehandler = new Pagehandler();
        pagehandler.setProductId(116);
        List<ReplyQnaDto>list = replyQnaDao.getReplyQnaList(pagehandler);
        System.out.println("list = " + list);
        
        int totalQna = replyQnaDao.getReplyQnaTotal(pagehandler);
        System.out.println("totalQna = " + totalQna);
    }
        
    @Test
    public void updateQna(){
        ReplyQnaDto replyQnaVo = replyQnaDao.getUpdateReplyQna(1);
        replyQnaVo.setContent("수정됨");
        replyQnaDao.updateReplyQna(replyQnaVo);
        replyQnaVo = replyQnaDao.getUpdateReplyQna(1);
        System.out.println("replyQnaVo = " + replyQnaVo);
    }

    @Test
    public void deleteQna(){
        ReplyQnaVo replyQnaVo = new ReplyQnaVo();
        replyQnaVo.setQnaId(3);

        replyQnaDao.deleteReplyQna(replyQnaVo);

        ReplyQnaDto replyQnaDto = new ReplyQnaDto();
        replyQnaDto = replyQnaDao.getUpdateReplyQna(3);
        assertTrue(replyQnaDto.isDeleted()==true);
    }

    @Test
    public void regAnswerTest(){
        AnswerVo answerVo = new AnswerVo();
        answerVo.setQnaId(3);
        answerVo.setUserId("admin");
        answerVo.setContent("답변테스트");

//        replyQnaDao.regAnswer(answerVo);
        answerVo.setaId(1);

        answerVo = replyQnaDao.getAnswer(answerVo);
        System.out.println("answerVo = " + answerVo);
    }

}