package com.project.WYW.controller;

import com.project.WYW.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmailController {

    @Autowired
    private MailService mailService;

    @RequestMapping("/noticeMail")
    public ModelAndView sendEmail() throws Exception {
        System.out.println("실행");
        ModelAndView mv = new ModelAndView();

        String addr = "wywsyhmall@gmail.com";

        String subject = "안효진 고객님이십니까?";

        String body = "<img src=\"https://t1.daumcdn.net/cfile/tistory/214DCD42594CC40625\">"+"맞습니까?";

        mailService.sendEmail("edcosy@naver.com", addr, subject, body);

        mv.setViewName("/");
        return mv;
    }
}