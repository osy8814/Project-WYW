package com.project.WYW.controller;

import com.project.WYW.dao.UsersDao;
import com.project.WYW.domain.UsersDto;
import com.project.WYW.service.UsersSecvice;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import javax.validation.Valid;

@Controller
@RequestMapping("/Users")
public class UsersController {

    final UsersSecvice usersSecvice;
    final UsersDao dao;
    public UsersController(UsersSecvice usersSecvice, UsersDao dao) {
        this.usersSecvice = usersSecvice;
        this.dao = dao;
    }
    @GetMapping("/signup")
    public String getSignup() throws Exception{
        return "signUp";
    }

    @PostMapping("/signup")
    public String postSignup(@Valid UsersDto usersDto) throws Exception {

        usersSecvice.singUp(usersDto);
        return "redirect:/";
    }


    @GetMapping("/find_id")
    public String find_id() {
        return "find_id";
    }

    @GetMapping("/find_pwd")
    public String find_pwd() {
        return "find_pwd";
    }
}
