package com.project.WYW.controller;

import com.project.WYW.domain.CategoryVo;
import com.project.WYW.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/")
    public String home(Model model)throws Exception{
        List<CategoryVo>list = adminService.category();
        model.addAttribute("categorys", list);
        return "index";
    }
    @GetMapping("/introduce")
    public String Intro(){
        return "Introduce";
    }
}
