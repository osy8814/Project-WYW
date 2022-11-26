package com.project.WYW.controller;

import com.project.WYW.domain.UsersVo;
import com.project.WYW.dto.OrderPageDto;
import com.project.WYW.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
        model.addAttribute("orderList",orderService.getProductInfo(orderPageDto.getOrders()));
        model.addAttribute("memberInfo",usersVo);

        return "order";
    }

}
