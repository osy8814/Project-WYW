package com.project.WYW.controller;

import com.fasterxml.jackson.databind.annotation.JsonAppend;
import com.project.WYW.domain.CategoryVo;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.model.AttachImageVO;
import com.project.WYW.model.PageVo;
import com.project.WYW.model.Pagehandler;
import com.project.WYW.service.AdminService;
import com.project.WYW.service.AttachService;
import com.project.WYW.service.ProductService;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;

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
    public String products(Pagehandler pagehandler, Model model) throws Exception {

        recevieCategory(model);
        pagehandler.setAmount(12);
        toView(pagehandler,model);

        return "products";
    }

    @GetMapping("/product.all")
    public String productAll(Pagehandler pagehandler, Model model) throws Exception {

        recevieCategory(model);
        pagehandler.setAmount(12);
        toView(pagehandler,model);

        return "productsAll";
    }

    @GetMapping("/product.new")
    public String productNew(Pagehandler pagehandler,Model model) throws Exception {

        recevieCategory(model);
        pagehandler.setAmount(12);
        pagehandler.setOrder("N");

        toView(pagehandler,model);

        return "productsNew";
    }
    @GetMapping("/product.best")
    public String productBest(Pagehandler pagehandler,Model model) throws Exception {

        recevieCategory(model);
        pagehandler.setAmount(12);
        pagehandler.setOrder("S");

        toView(pagehandler,model);

        return "productsBest";
    }

    @GetMapping("/productbest")
    public String product(Pagehandler pagehandler,Model model) throws Exception {

        recevieCategory(model);
        pagehandler.setAmount(12);
        pagehandler.setOrder("S");

        toView(pagehandler,model);

        return "productsBest";
    }

    @GetMapping("/productDetail")
    public String productDtail(Integer product_id, Model model)throws Exception {

        recevieCategory(model);
        ProductsViewVo productsViewVo = productService.readProductDetail(product_id);
        model.addAttribute(productsViewVo);

        return "productDetail";
    }

    private void toView(Pagehandler pagehandler,Model model)throws Exception{
        List<ProductsViewVo> list = productService.productsViewList(pagehandler);

        if (!list.isEmpty()) {
            model.addAttribute("list", list);
        } else {
            model.addAttribute("listCheck", "empty");
        }

        int total = productService.productsGetTotal(pagehandler);

        PageVo pageMarker = new PageVo(pagehandler, total);

        model.addAttribute("totalResult", total);
        model.addAttribute("pageMarker", pageMarker);
    }

    private  void recevieCategory(Model model)throws Exception{
        List<CategoryVo>list = adminService.category();
        model.addAttribute("categorys", list);
    }
}
