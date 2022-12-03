package com.project.WYW.controller;

import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.ReplyQnaVo;
import com.project.WYW.domain.ReplyVo;
import com.project.WYW.dto.ReplyQnaPageDto;
import com.project.WYW.model.Pagehandler;
import com.project.WYW.service.ProductService;
import com.project.WYW.service.ReplyQnaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/replyqna")
public class ReplyQnaController {

    @Autowired
    ReplyQnaService replyQnaService;

    @Autowired
    ProductService productService;

    /* 문의 등록 */
    @ResponseBody
    @PostMapping("/reg")
    public void regReplyQnaPost(ReplyQnaVo replyQnaVo) {

        replyQnaService.regReplyQna(replyQnaVo);
    }

    /* 문의 쓰기페이지 팝업 */
    @GetMapping("/replyqnaReg/{userId}")
    public String replyQnaEnrollWindowGet(@PathVariable("userId") String userId, int productId, Model model) {

        ProductsViewVo productsViewVo = productService.readProductDetail(productId);

        model.addAttribute("productInfo", productsViewVo);
        model.addAttribute("userId", userId);

        return "replyQna/replyQnaPage";
    }

    /* 문의 페이징 */
    @ResponseBody
    @GetMapping(value = "/list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ReplyQnaPageDto replyQnaListPost(Pagehandler pagehandler) {

        return replyQnaService.replyQnaList(pagehandler);
    }

    /* 문의 수정 */
    @ResponseBody
    @PostMapping("/update")
    public void replyQnaModifyPost(ReplyQnaVo replyQnaVo) {

        replyQnaService.updateReplyQna(replyQnaVo);
    }

    /* 문의 수정 팝업창 */
    @GetMapping("/replyQnaUpdate")
    public String replyQnaUpdateWindowGet(ReplyQnaVo replyQnaVo, Model model) {
        ProductsViewVo productsViewVo = productService.readProductDetail(replyQnaVo.getProductId());
        model.addAttribute("productInfo", productsViewVo);
        model.addAttribute("replyQnaInfo", replyQnaService.getReplyQna(replyQnaVo));
        model.addAttribute("userId", replyQnaVo.getUserId());

        return "replyQna/replyQnaUpdate";
    }

    @ResponseBody
    @PostMapping("/delete")
    public void replyQnaDeletePost(ReplyQnaVo replyQnaVo) {

        replyQnaService.deleteReplyQna(replyQnaVo);
    }
}
