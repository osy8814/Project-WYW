package com.project.WYW.controller;

import com.project.WYW.domain.UsersVo;
import com.project.WYW.service.MypageService;
import com.project.WYW.service.UsersSecvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RequestMapping("/mypage")
@Controller
public class MypageController {

    @Autowired
    MypageService mypageService;
    @Autowired
    UsersSecvice usersSecvice;


    @GetMapping("/")
    public String myPage() {
        return "myPage/mypage";
    }

    @GetMapping("/info")
    public String info(Model model, HttpServletRequest request) throws Exception {

        HttpSession session = request.getSession();
        UsersVo loggedInUser = (UsersVo) session.getAttribute("loggedInUser");
        UsersVo usersVo = usersSecvice.read(loggedInUser.getUserId());

        model.addAttribute("userinfo", usersVo);

        return "myPage/userInfo";
    }

    @PostMapping("/info")
    public String postSignup(UsersVo usersVo, Model m, RedirectAttributes redirectAttributes) throws Exception {
        int isSuccessful = mypageService.updateUserInfo(usersVo);

        if (0 < isSuccessful) {
            redirectAttributes.addFlashAttribute("msg","edit_ok");
            return "redirect:/mypage/";
        }
        redirectAttributes.addFlashAttribute("msg", "edit_err");

        return "redirect:/mypage/info";
    }

    @ResponseBody
    @PostMapping("/emailChk")
    public boolean emailChk(HttpServletRequest request) throws Exception {
        String email = request.getParameter("email");
        UsersVo vo = mypageService.emailChk(email);

        HttpSession session = request.getSession();
        UsersVo usersVo = (UsersVo) session.getAttribute("loggedInUser");
        String loggedInUserEmail = usersVo.getEmail();

        boolean chkEmail = loggedInUserEmail.equals(email);

        if (vo != null && !chkEmail) {
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

        UsersVo vo = mypageService.mobileChk(mobile);

        HttpSession session = request.getSession();
        UsersVo usersVo = (UsersVo) session.getAttribute("loggedInUser");
        String loggedInUserMobile = usersVo.getMobile();

        boolean chkMobile = loggedInUserMobile.equals(mobile);

        if (vo != null && !chkMobile) {
            return true;
        }
        return false;
    }
}
