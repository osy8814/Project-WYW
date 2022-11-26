package com.project.WYW.controller;


import com.project.WYW.domain.UsersVo;
import com.project.WYW.service.UsersSecvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/users")
public class UsersController {

    @Autowired
    UsersSecvice usersSecvice;

    @GetMapping("/login")
    public String getLogin() throws Exception{
        return "login";
    }

    @PostMapping ("/login.do")
    public String postLogin(UsersVo vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{

        UsersVo loginUser = null;
        String loginUserPwd = null;
        String inputPass = null;
        HttpSession session = req.getSession();
        try {
            loginUser = usersSecvice.login(vo.getUserId());
            loginUserPwd = loginUser.getPassword();
            inputPass = vo.getPassword();
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("loggedInUser", null);
            rttr.addFlashAttribute("inputId",vo.getUserId());
            rttr.addFlashAttribute("msg", false);
            return "redirect:/users/login.do";
        }

        if(loginUserPwd.equals(inputPass)){
            session.setAttribute("loggedInUser", loginUser);
        }else{
            session.setAttribute("loggedInUser", null);
            rttr.addFlashAttribute("inputId",vo.getUserId());
            rttr.addFlashAttribute("msg", false);
            return "redirect:/users/login.do";
        }


        return "redirect:/";
    }

    @ResponseBody
    @PostMapping("/logout")
    public void logout(HttpSession session) throws Exception{
        session.invalidate();
    }

    @GetMapping("/signup")
    public String getSignup() throws Exception{
        return "signUp/signUp";
    }

    @PostMapping("/signup")
    public String postSignup(@Valid UsersVo vo, Model m) throws Exception {
        int isSuccessful = usersSecvice.singUp(vo);

        if(0 < isSuccessful){
            m.addAttribute(vo);
            return "signUp/signUp_complete";
        }

        return "signUp/signUp";
    }

    @GetMapping("/mypage")
    public String getMypage(){
        return "mypage";
    }

    @GetMapping("/find_id")
    public String find_id() {
        return "find_id";
    }

    @GetMapping("/find_pwd")
    public String find_pwd() {
        return "find_pwd";
    }

    @ResponseBody
    @PostMapping("/idChk")
    public boolean idChk(HttpServletRequest request) throws Exception{
        String userId = request.getParameter("userId");

        UsersVo vo = usersSecvice.read(userId);

        if(vo!=null){
            return true;
        }
        return false;
    }

    @ResponseBody
    @PostMapping("/emailChk")
    public boolean emailChk(HttpServletRequest request) throws Exception{
        String email = request.getParameter("email");
        UsersVo vo = usersSecvice.emailChk(email);

        if(vo!=null){
            return true ;
        }
        return false;
    }

    @ResponseBody
    @PostMapping("/mobileChk")
    public boolean mobileChk(HttpServletRequest request) throws Exception{
        String mobile1 = request.getParameter("mobile1");
        String mobile2 = request.getParameter("mobile2");
        String mobile3 = request.getParameter("mobile3");
        String mobile = mobile1+"-"+mobile2+"-"+mobile3;

        UsersVo vo = usersSecvice.mobileChk(mobile);

        if(vo!=null){
            return true;
        }
        return false;
    }
}
