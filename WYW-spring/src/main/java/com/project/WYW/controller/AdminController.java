package com.project.WYW.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @GetMapping("/main")
    public String toMain(){
        return "admin";
    }

    /* 상품 등록 페이지 접속 */
    @GetMapping("/productsmanage")
    public String getProductsManage() throws Exception{

        return "productsmanage";
    }
    /* 상품 목록 페이지 접속 */
    @GetMapping("/productslist")
    public String getProductList() throws Exception{

        return "productslist";
    }

    /* 카테고리 등록 페이지 접속 */
    @GetMapping("/category")
    public String getCategory() throws Exception{

        return "category";
    }

    /* 카테고리 관리 페이지 접속 */
    @GetMapping("/categoryManage")
    public String getCategoryManage() throws Exception{

        return "categoryManage";
    }
}
