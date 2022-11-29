package com.project.WYW.controller;

import com.fasterxml.jackson.databind.annotation.JsonAppend;
import com.project.WYW.domain.CategoryVo;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.UsersVo;
import com.project.WYW.model.AttachImageVO;
import com.project.WYW.model.PageVo;
import com.project.WYW.model.Pagehandler;
import com.project.WYW.model.WishVo;
import com.project.WYW.service.AdminService;
import com.project.WYW.service.AttachService;
import com.project.WYW.service.ProductService;
import com.project.WYW.service.WishService;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.UnsatisfiedServletRequestParameterException;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;
    @Autowired
    private AttachService attachService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private WishService wishService;

    @GetMapping("/display")
    public ResponseEntity<byte[]> getImage(String fileName) {

        File file = new File("c:\\upload\\" + fileName);

        ResponseEntity<byte[]> result = null;

        try {

            HttpHeaders header = new HttpHeaders();

            header.add("Content-type", Files.probeContentType(file.toPath()));

            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return result;

    }

    /* 이미지 정보 반환 */
    @GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<List<AttachImageVO>> getAttachList(int product_id) {

        return new ResponseEntity<List<AttachImageVO>>(attachService.getAttachList(product_id), HttpStatus.OK);

    }

    @GetMapping("/products")
    public String products(Pagehandler pagehandler, Model model, HttpServletRequest request) throws Exception {

        HttpSession session = request.getSession();
        UsersVo usersVo = (UsersVo) session.getAttribute("loggedInUser");

        receiveCategory(model);
        pagehandler.setAmount(12);
        toView(pagehandler, model, usersVo);

        return "products";
    }

    @GetMapping("/product.all")
    public String productAll(Pagehandler pagehandler, Model model, HttpServletRequest request) throws Exception {

        HttpSession session = request.getSession();
        UsersVo usersVo = (UsersVo) session.getAttribute("loggedInUser");

        receiveCategory(model);
        pagehandler.setAmount(12);
        toView(pagehandler, model, usersVo);

        return "productsAll";
    }

    @GetMapping("/product.new")
    public String productNew(Pagehandler pagehandler, Model model, HttpServletRequest request) throws Exception {

        HttpSession session = request.getSession();
        UsersVo usersVo = (UsersVo) session.getAttribute("loggedInUser");

        receiveCategory(model);
        pagehandler.setAmount(12);
        pagehandler.setOrder("N");

        toView(pagehandler, model, usersVo);

        return "productsNew";
    }

    @GetMapping("/product.best")
    public String productBest(Pagehandler pagehandler, Model model, HttpServletRequest request) throws Exception {

        HttpSession session = request.getSession();
        UsersVo usersVo = (UsersVo) session.getAttribute("loggedInUser");

        receiveCategory(model);
        pagehandler.setAmount(12);
        pagehandler.setOrder("S");

        toView(pagehandler, model, usersVo);

        return "productsBest";
    }

    @GetMapping("/productDetail")
    public String productDtail(Integer product_id, Model model) throws Exception {

        receiveCategory(model);
        ProductsViewVo productsViewVo = productService.readProductDetail(product_id);
        model.addAttribute(productsViewVo);

        return "productDetail";
    }

    private void toView(Pagehandler pagehandler, Model model, UsersVo usersVo) throws Exception {
        List<ProductsViewVo> list = productService.productsViewList(pagehandler);

        //로그인한 유저가 있을때
        //유저의 위시리스트 productViewVo에 넣기
        if (usersVo != null) {
            for (ProductsViewVo productsViewVo : list) {

                List<WishVo> wishVos = wishService.getWishList(usersVo.getUserId());
                productsViewVo.setWishList(wishVos);
            }
        }

        if (!list.isEmpty()) {
            model.addAttribute("list", list);
        } else {
            model.addAttribute("listCheck", "empty");
        }

        //        페이지정보생성
        int total = productService.productsGetTotal(pagehandler);

        PageVo pageMarker = new PageVo(pagehandler, total);

        model.addAttribute("totalResult", total);
        model.addAttribute("pageMarker", pageMarker);
    }

    public void receiveCategory(Model model) throws Exception {

        List<CategoryVo> list = adminService.category();
        model.addAttribute("categorys", list);
    }
}
