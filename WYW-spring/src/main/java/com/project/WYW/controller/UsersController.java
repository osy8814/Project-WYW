package com.project.WYW.controller;

import com.project.WYW.dao.UsersDao;
import com.project.WYW.domain.UsersVo;
import com.project.WYW.service.UsersSecvice;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/users")
@RequiredArgsConstructor
public class UsersController {

    final UsersSecvice usersSecvice;
    final UsersDao dao;

    @GetMapping("/login")
    public String getLogin() throws Exception{
        return "login";
    }

    @PostMapping ("/login")
    public String postLogin(UsersVo vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{


        UsersVo loginUser = null;
        String loginUserPwd = null;
        String inputPass = null;
        HttpSession session = req.getSession();
        try {
            loginUser = usersSecvice.login(vo.getUser_id());
            loginUserPwd = loginUser.getPassword();
            inputPass = vo.getPassword();
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("loggedInUser", null);
            rttr.addFlashAttribute("inputId",vo.getUser_id());
            rttr.addFlashAttribute("msg", false);
            return "redirect:/users/login";
        }

        if(loginUserPwd.equals(inputPass)){
            session.setAttribute("loggedInUser", loginUser);
        }else{
            session.setAttribute("loggedInUser", null);
            rttr.addFlashAttribute("msg", false);
            return "redirect:/users/login";
        }


        return "redirect:/";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) throws Exception{
        session.invalidate();

        return "redirect:/";
    }

    @GetMapping("/signup")
    public String getSignup() throws Exception{
        return "signUp";
    }

    @PostMapping("/signup")
    public String postSignup(@Valid UsersVo vo, Model m) throws Exception {
        int isSuccessful = usersSecvice.singUp(vo);

        if(0 < isSuccessful){
            m.addAttribute(vo);
            return "signUp_complete";
        }

        return "signUp";
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
    @PostMapping("idChk")
    public int idChk(HttpServletRequest request) throws Exception{
        String user_id = request.getParameter("user_id");
        UsersVo vo = usersSecvice.read(user_id);

        if(vo!=null){
            return 1;
        }
        return 0;
    }

    @ResponseBody
    @PostMapping("/emailChk")
    public int emailChk(HttpServletRequest request) throws Exception{
        String email = request.getParameter("email");
        UsersVo vo = usersSecvice.emailChk(email);

        if(vo!=null){
            return 1;
        }
        return 0;
    }

    @ResponseBody
    @PostMapping("/mobileChk")
    public int mobileChk(HttpServletRequest request) throws Exception{
        String mobile1 = request.getParameter("mobile1");
        String mobile2 = request.getParameter("mobile2");
        String mobile3 = request.getParameter("mobile3");
        String mobile = mobile1+"-"+mobile2+"-"+mobile3;

        UsersVo vo = usersSecvice.mobileChk(mobile);

        if(vo!=null){
            return 1;
        }
        return 0;
    }
}
