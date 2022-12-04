package com.project.WYW.service;

import com.project.WYW.domain.AnswerVo;
import com.project.WYW.domain.ReplyQnaVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ReplyQnaServiceImplTest {

    @Autowired
    ReplyQnaService replyQnaService;
    
    @Test
    public void regAnswerTest(){

        AnswerVo answerVo = new AnswerVo();
        answerVo.setQnaId(3);
        answerVo.setUserId("admin");
        answerVo.setContent("답변테스트");

        ReplyQnaVo replyQnaVo = new ReplyQnaVo();
        replyQnaVo.setQnaId(answerVo.getQnaId());
        
        replyQnaService.regAnswer(answerVo);
        replyQnaVo = replyQnaService.getReplyQna(replyQnaVo);
        System.out.println("replyQnaVo = " + replyQnaVo);
        
    }
    
    
}