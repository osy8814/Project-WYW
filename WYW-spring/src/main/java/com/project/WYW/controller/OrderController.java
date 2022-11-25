package com.project.WYW.controller;

import com.project.WYW.domain.UsersVo;
import com.project.WYW.dto.OrderPageDto;
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

    @GetMapping("/list")
    public void orderPageGET(OrderPageDto orderPageDto, Model model, HttpServletRequest request) {

        HttpSession session = request.getSession();
        UsersVo usersVo = (UsersVo) session.getAttribute("loggedInUser");
        System.out.println("user = " + usersVo.getUserId());

        System.out.println("orders : " + orderPageDto.getOrders());

    }

}
