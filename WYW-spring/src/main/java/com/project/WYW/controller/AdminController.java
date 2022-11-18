package com.project.WYW.controller;

import com.project.WYW.domain.CategoryVo;
import com.project.WYW.domain.ProductsViewVo;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String getProductsReg(HttpSession session, Model model) throws Exception {
        List<CategoryVo> category = adminService.category();
        UsersVo loginUser = (UsersVo)session.getAttribute("loggedInUser");

        model.addAttribute("category", JSONArray.fromObject(category));
        model.addAttribute("loggedInUser", loginUser);

        return "productsReg";
    }

    @PostMapping("/productsReg")
    public String postProductsReg(ProductsVo productsVo, RedirectAttributes rattr) throws Exception {


        int rowCnt = adminService.regProduct(productsVo);
        if(rowCnt==1){
            rattr.addFlashAttribute("msg", "reg_ok");
            return "redirect:/admin/productsReg";
        }
        rattr.addFlashAttribute(productsVo);
        rattr.addFlashAttribute("msg", "reg_err");
        return "redirect:/admin/productsReg";
    }

    /* 상품 목록 페이지 접속 */
    @GetMapping("/productslist")
    public String getProductslist(Model model) throws Exception {

        List<CategoryVo> category = adminService.category();
        model.addAttribute("category", JSONArray.fromObject(category));

        List<ProductsViewVo> list = adminService.productsViewList();
        model.addAttribute("list", list);

        return "productslist";
    }

    @GetMapping("/productsManage")
    public String getProductsManage(Integer id, Model model) throws Exception {
        List<CategoryVo> category = adminService.category();
        ProductsViewVo productsViewVo = adminService.readProduct(id);
        System.out.println("category = " + JSONArray.fromObject(category));
        System.out.println("productsViewVo = " + productsViewVo);
        model.addAttribute(productsViewVo);
        model.addAttribute("category", JSONArray.fromObject(category));
        return "productsManage";
    }

    @PostMapping("/modifyProduct")
    public String modifyProduct(ProductsVo productsVo,Model model,RedirectAttributes rattr)throws Exception{
        int rowCnt = adminService.modifiyProduct(productsVo);
        System.out.println("rowCnt = " + rowCnt);
        if(rowCnt==1){
            rattr.addFlashAttribute("msg","modify_ok");
            return "redirect:/admin/productsManage"+"?id=" + productsVo.getId();
        }

        rattr.addFlashAttribute("msg","modify_err");
        return "redirect:/admin/productsManage"+"?id=" + productsVo.getId();
    }
    @PostMapping("/deleteProduct")
    public String deleteProduct(Integer id,Model model,RedirectAttributes rattr)throws Exception{
        int rowCnt = adminService.deleteProduct(id);
        if(rowCnt==1){
            rattr.addFlashAttribute("msg","del_ok");
            return "redirect:/admin/productslist";
        }

        rattr.addFlashAttribute("msg","del_err");
        return "redirect:/admin/productslist";
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