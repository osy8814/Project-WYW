package com.project.WYW.controller;

import com.project.WYW.domain.UsersVo;
import com.project.WYW.dto.OrderDto;
import com.project.WYW.dto.OrderPageDto;
import com.project.WYW.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RequestMapping("/order")
@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;


    @GetMapping("/list")
    public String orderPageGET(OrderPageDto orderPageDto, Model model, HttpServletRequest request) {

        HttpSession session = request.getSession();
        UsersVo usersVo = (UsersVo) session.getAttribute("loggedInUser");
        model.addAttribute("orderList", orderService.getProductInfo(orderPageDto.getOrders()));
        model.addAttribute("memberInfo", usersVo);

        return "order";
    }


    @PostMapping("/order")
    public String orderPagePost(OrderDto orderDto, RedirectAttributes attributes) throws Exception {

        try {
            orderService.order(orderDto);
            attributes.addFlashAttribute("msg", "orderOk");

        } catch (RuntimeException e) {
            attributes.addFlashAttribute("msg", "noStock");
            return "redirect:/cart/cartlist";
        }


        return "redirect:/";
    }

}
