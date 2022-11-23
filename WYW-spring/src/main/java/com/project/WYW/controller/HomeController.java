package com.project.WYW.controller;

import com.project.WYW.controller.ProductController;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.model.Pagehandler;
import com.project.WYW.service.AdminService;
import com.project.WYW.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private ProductController controller;
    @Autowired
    private AdminService adminService;
    @Autowired
    private ProductService productService;


    @GetMapping("/")
    public String home(Pagehandler pagehandler, Model model)throws Exception{
        controller.recevieCategory(model);
        pagehandler.setAmount(4);
        pagehandler.setOrder("S");

        List<ProductsViewVo> bestList = productService.productsViewList(pagehandler);
        model.addAttribute("bestList", bestList);

        pagehandler.setOrder("N");
        List<ProductsViewVo> newList = productService.productsViewList(pagehandler);
        model.addAttribute("newList", newList);

        return "index";
    }
    @GetMapping("/introduce")
    public String Intro(){
        return "Introduce";
    }
}
