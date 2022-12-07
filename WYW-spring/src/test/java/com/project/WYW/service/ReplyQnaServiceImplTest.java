package com.project.WYW.service;

import com.project.WYW.domain.AnswerVo;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.ReplyQnaVo;
import com.project.WYW.dto.ReplyQnaDto;
import com.project.WYW.dto.ReplyQnaPageDto;
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
public class ReplyQnaServiceImplTest {

    @Autowired
    ReplyQnaService replyQnaService;

    @Autowired
    ProductService productService;

    
    @Test
    public void regAnswerTest(){

        AnswerVo answerVo = new AnswerVo();
        answerVo.setQnaId(3);
        answerVo.setUserId("admin");
        answerVo.setContent("답변테스트");

        ReplyQnaDto replyQnaDto = new ReplyQnaDto();
        replyQnaDto.setQnaId(answerVo.getQnaId());
        
        replyQnaService.regAnswer(answerVo);
        replyQnaDto = replyQnaService.getReplyQna(replyQnaDto);
        System.out.println("replyQnaVo = " + replyQnaDto);
        
    }

    @Test
    public void getAnswerTest(){

        ReplyQnaDto replyQnaDto = new ReplyQnaDto();
        replyQnaDto.setQnaId(3);
        
        replyQnaDto = replyQnaService.getReplyQna(replyQnaDto);

        System.out.println("replyQnaDto = " + replyQnaDto);
        ProductsViewVo productsViewVo = productService.readProductDetail(replyQnaDto.getProductId());

        System.out.println("productsViewVo = " + productsViewVo);
        
        AnswerVo answerVo = new AnswerVo();
        answerVo.setQnaId(replyQnaDto.getQnaId());

        System.out.println("answerVo = " + answerVo);
        answerVo = replyQnaService.getAnswer(answerVo);
        System.out.println("answerVo = " + answerVo);


    }
    
    @Test
    public void getQnaListTest(){
        Pagehandler pagehandler = new Pagehandler();
        pagehandler.setType("wait");
        ReplyQnaPageDto list = replyQnaService.replyQnaList(pagehandler);
        System.out.println("list = " + list);

        pagehandler.setType("complete");
        list = replyQnaService.replyQnaList(pagehandler);
        System.out.println("list = " + list);
    }
    
}