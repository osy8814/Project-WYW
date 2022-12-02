package com.project.WYW.controller;


import com.project.WYW.domain.UsersVo;
import com.project.WYW.dto.FindPwdDto;
import com.project.WYW.service.UsersSecvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Random;

@Controller
@RequestMapping("/users")
public class UsersController {

    @Autowired
    UsersSecvice usersSecvice;
    @Autowired
    JavaMailSenderImpl mailSender;

    private String password;
    private String email;

    @GetMapping("/login")
    public String getLogin() throws Exception {
        return "login";
    }

    @PostMapping("/login.do")
    public String postLogin(UsersVo vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {


        UsersVo loginUser = null;
        String loginUserPwd = null;
        String inputPass = null;
        HttpSession session = req.getSession();
        try {
            loginUser = usersSecvice.login(vo.getUserId());
            if (loginUser.isActive() == false) {
                rttr.addFlashAttribute("msg", "inactive");
                return "redirect:/users/login.do";
            }
            loginUserPwd = loginUser.getPassword();
            inputPass = vo.getPassword();
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("loggedInUser", null);
            rttr.addFlashAttribute("inputId", vo.getUserId());
            rttr.addFlashAttribute("msg", "false");
            return "redirect:/users/login.do";
        }

        if (loginUserPwd.equals(inputPass)) {
            session.setAttribute("loggedInUser", loginUser);
        } else {
            session.setAttribute("loggedInUser", null);
            rttr.addFlashAttribute("inputId", vo.getUserId());
            rttr.addFlashAttribute("msg", "false");
            return "redirect:/users/login.do";
        }

        return "redirect:/";
    }

    @ResponseBody
    @PostMapping("/logout")
    public void logout(HttpSession session) throws Exception {
        session.invalidate();
    }

    @GetMapping("/signup")
    public String getSignup() throws Exception {
        return "signUp/signUp";
    }

    @PostMapping("/signup")
    public String postSignup(@Valid UsersVo vo, Model m) throws Exception {
        int isSuccessful = usersSecvice.singUp(vo);

        if (0 < isSuccessful) {
            m.addAttribute(vo);
            return "signUp/signUp_complete";
        }

        return "signUp/signUp";
    }

    @GetMapping("/findid")
    public String findIdGet() {
        return "find_id";
    }

    @ResponseBody
    @PostMapping("/findid")
    public String findIdPost(UsersVo usersVo) {
        String userId = usersSecvice.findId(usersVo);
        if (userId == null) {
            return "NOT_FOUND";
        }
        StringBuffer stringBuffer = new StringBuffer(userId);
        for (int i = 2; i < userId.length() - 2; i++) {
            stringBuffer.replace(i, i + 1, "*");
        }

        return stringBuffer.toString();
    }

    @GetMapping("/findpwd")
    public String findPwdGet() {
        return "find_pwd";
    }

    @ResponseBody
    @PostMapping("/sendMail")
    public FindPwdDto sendMail(UsersVo usersVo) {

        FindPwdDto findPwdDto = new FindPwdDto();

        password = usersSecvice.findPwd(usersVo);
        if (password == null) {
            findPwdDto.setResultMsg("NOT_FOUND");
            return findPwdDto;
        }

        Random random = new Random();

        int certification = random.nextInt(8888) + 1111;
        findPwdDto.setCertification(certification);
        String subject = "WYW Mall : [비밀번호 찾기]인증번호";
        String content =
                "안녕하십니까? WYW Mall 입니다." +
                "<br><br>" +
                "고객님의 인증번호는<strong> " + certification + " </strong>입니다." +
                "<br><br>" +
                "정보찾기 창에 인증번호를 입력해 주십시오.";
        String from = "wywsyhmall@gmail.com";
        email = usersVo.getEmail();
        String to = email;

        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");

            mailHelper.setFrom(from);
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);

            mailSender.send(mail);
            return findPwdDto;
        } catch (Exception e) {
            e.printStackTrace();
            findPwdDto.setResultMsg("SEND_FAIL");
            return findPwdDto;
        }
    }
    @ResponseBody
    @PostMapping("/sendpass")
    public int sendPass() {

        String subject = "WYW Mall : [비밀번호 찾기]비밀번호";
        String content =
                "안녕하십니까? WYW Mall 입니다." +
                "<br><br>" +
                "고객님의 비밀번호는<strong> " + password + " </strong>입니다.";

        String from = "wywsyhmall@gmail.com";
        String to = email;

        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");

            mailHelper.setFrom(from);
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);

            mailSender.send(mail);
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @ResponseBody
    @PostMapping("/idChk")
    public boolean idChk(HttpServletRequest request) throws Exception {
        String userId = request.getParameter("userId");

        UsersVo vo = usersSecvice.read(userId);

        if (vo != null) {
            return true;
        }
        return false;
    }

    @ResponseBody
    @PostMapping("/emailChk")
    public boolean emailChk(HttpServletRequest request) throws Exception {
        String email = request.getParameter("email");
        UsersVo vo = usersSecvice.emailChk(email);

        if (vo != null) {
            return true;
        }
        return false;
    }

    @ResponseBody
    @PostMapping("/mobileChk")
    public boolean mobileChk(HttpServletRequest request) throws Exception {
        String mobile1 = request.getParameter("mobile1");
        String mobile2 = request.getParameter("mobile2");
        String mobile3 = request.getParameter("mobile3");
        String mobile = mobile1 + "-" + mobile2 + "-" + mobile3;

        UsersVo vo = usersSecvice.mobileChk(mobile);

        if (vo != null) {
            return true;
        }
        return false;
    }

}
