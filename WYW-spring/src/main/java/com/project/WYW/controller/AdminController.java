package com.project.WYW.controller;

import com.project.WYW.domain.CategoryVo;
import com.project.WYW.domain.ProductsVo;
import com.project.WYW.domain.UsersVo;
import com.project.WYW.service.AdminService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService adminService;
    @GetMapping("/main")
    public String toMain() {
        return "admin";
    }


    /* 상품 등록 페이지 접속 */
    @GetMapping("/productsReg")
    public String getProductsManage(HttpSession session, Model model) throws Exception {
        List<CategoryVo> category = adminService.category();
        UsersVo loginUser = (UsersVo)session.getAttribute("loggedInUser");

        model.addAttribute("category", JSONArray.fromObject(category));
        model.addAttribute("loggedInUser", loginUser);

        return "productsReg";
    }

    @PostMapping("/productsReg")
    public String postProductsManage(ProductsVo productsVo, Model model) throws Exception {

        int rowCnt = adminService.regProduct(productsVo);
        if(rowCnt==1){
            model.addAttribute("msg", true);
            return "productsReg";
        }

        return "productsReg";
    }

    /* 상품 목록 페이지 접속 */
    @GetMapping("/productslist")
    public String getProductList() throws Exception {

        return "productslist";
    }

    /* 카테고리 등록 페이지 접속 */
    @GetMapping("/category")
    public String getCategory() throws Exception {

        return "category";
    }

    /* 카테고리 관리 페이지 접속 */
    @GetMapping("/categoryManage")
    public String getCategoryManage() throws Exception {

        return "categoryManage";
    }
}