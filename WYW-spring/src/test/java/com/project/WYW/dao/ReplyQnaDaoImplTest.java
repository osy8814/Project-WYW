package com.project.WYW.dao;

import com.project.WYW.domain.ReplyQnaVo;
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
        List<ReplyQnaVo>list = replyQnaDao.getReplyQnaList(pagehandler);
        System.out.println("list = " + list);
        
        int totalQna = replyQnaDao.getReplyQnaTotal(116);
        System.out.println("totalQna = " + totalQna);
    }
        
    @Test
    public void updateQna(){
        ReplyQnaVo replyQnaVo = replyQnaDao.getUpdateReplyQna(1);
        replyQnaVo.setContent("수정됨");
        replyQnaDao.updateReplyQna(replyQnaVo);
        replyQnaVo = replyQnaDao.getUpdateReplyQna(1);
        System.out.println("replyQnaVo = " + replyQnaVo);
    }

    @Test
    public void deleteQna(){
        ReplyQnaVo replyQnaVo = new ReplyQnaVo();
        replyQnaVo.setQnaId(2);

        replyQnaDao.deleteReplyQna(replyQnaVo);

        replyQnaVo = replyQnaDao.getUpdateReplyQna(2);
        assertTrue(replyQnaVo==null);


    }
}