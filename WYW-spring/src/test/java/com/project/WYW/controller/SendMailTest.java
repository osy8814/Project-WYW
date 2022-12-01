package com.project.WYW.controller;

import org.checkerframework.checker.units.qual.A;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.mail.internet.MimeMessage;

import java.io.File;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class SendMailTest {

    @Autowired
    JavaMailSenderImpl mailSender;

    @Test
    public void mailSendTest() throws Exception {

        MimeMessage mail = mailSender.createMimeMessage();
        MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");

        String subject = "test 메일";
        String content = "메일 테스트 내용" + "<img src=\"https://t1.daumcdn.net/cfile/tistory/214DCD42594CC40625\">";
        String from = "wywsyhmall@gmail.com";
        String to = "edcosy@naver.com";

        mailHelper.setFrom(from);
        mailHelper.setTo(to);
        mailHelper.setSubject(subject);
        mailHelper.setText(content,true);

        FileSystemResource file = new FileSystemResource(new File("C:\\upload\\test.txt"));
        mailHelper.addAttachment("test.txt", file);

        mailSender.send(mail);


    }

}