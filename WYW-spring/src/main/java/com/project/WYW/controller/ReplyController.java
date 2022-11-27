package com.project.WYW.controller;

import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.ReplyVo;
import com.project.WYW.dto.ReplyPageDto;
import com.project.WYW.model.Pagehandler;
import com.project.WYW.service.ProductService;
import com.project.WYW.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/reply")
public class ReplyController {

    @Autowired
    ReplyService replyService;

    @Autowired
    ProductService productService;

    @ResponseBody
    @PostMapping("/reg")
    public void regReplyPost(ReplyVo replyVo) {

        replyService.regReply(replyVo);

    }

    /* 리뷰 쓰기 */
    @GetMapping("/replyReg/{userId}")
    public String replyEnrollWindowGet(@PathVariable("userId") String userId, int productId, Model model) {

        ProductsViewVo productsViewVo = productService.readProductDetail(productId);

        model.addAttribute("productInfo", productsViewVo);
        model.addAttribute("userId", userId);

        return "replyPage";
    }

    /* 댓글 페이징 */
    @ResponseBody
    @GetMapping(value = "/list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ReplyPageDto replyListPost(Pagehandler pagehandler) {

        return replyService.replyList(pagehandler);
    }

    /* 댓글 수정 */
    @ResponseBody
    @PostMapping("/update")
    public void replyModifyPost(ReplyVo replyVo) {

        replyService.updateReply(replyVo);
    }

    /* 리뷰 수정 팝업창 */
    @GetMapping("/replyUpdate")
    public String replyUpdateWindowGet(ReplyVo replyVo, Model model) {
        System.out.println("replyVo = " + replyVo);
        ProductsViewVo productsViewVo = productService.readProductDetail(replyVo.getProductId());
        model.addAttribute("productInfo", productsViewVo);
        model.addAttribute("replyInfo", replyService.getUpdateReply(replyVo.getReplyId()));
        model.addAttribute("userId", replyVo.getUserId());

        return "replyUpdate";
    }

    @ResponseBody
    @PostMapping("/delete")
    public void replyDeletePost(ReplyVo replyVo){

        replyService.deleteReply(replyVo);
    }
}
