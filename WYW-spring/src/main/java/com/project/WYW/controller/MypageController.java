package com.project.WYW.controller;

import com.project.WYW.dao.OrderDao;
import com.project.WYW.domain.UsersVo;
import com.project.WYW.dto.OrderDto;
import com.project.WYW.dto.OrderItemDto;
import com.project.WYW.dto.OrderManageDto;
import com.project.WYW.service.MypageService;
import com.project.WYW.service.OrderService;
import com.project.WYW.service.UsersSecvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/mypage")
@Controller
public class MypageController {

    @Autowired
    ProductController controller;
    @Autowired
    MypageService mypageService;
    @Autowired
    UsersSecvice usersSecvice;
    @Autowired
    OrderDao orderDao;
    @Autowired
    OrderService orderService;


    @GetMapping("/main")
    public String myPage(Model model)throws Exception {
        controller.receiveCategory(model);

        return "myPage/mypage";
    }

    @GetMapping("/info")
    public String infoGet(Model model, HttpServletRequest request) throws Exception {
        controller.receiveCategory(model);

        HttpSession session = request.getSession();
        UsersVo loggedInUser = (UsersVo) session.getAttribute("loggedInUser");
        UsersVo usersVo = usersSecvice.read(loggedInUser.getUserId());

        model.addAttribute("userinfo", usersVo);

        return "myPage/userInfo";
    }

    @PostMapping("/info")
    public String infoPost(UsersVo usersVo, Model m, RedirectAttributes redirectAttributes) throws Exception {
        int isSuccessful = mypageService.updateUserInfo(usersVo);

        if (0 < isSuccessful) {
            redirectAttributes.addFlashAttribute("msg", "edit_ok");
            return "redirect:/mypage/main";
        }
        redirectAttributes.addFlashAttribute("msg", "edit_err");

        return "redirect:/mypage/info";
    }

    @GetMapping("/orders")
    public String orderGet(Model model, HttpServletRequest request) throws Exception {
        controller.receiveCategory(model);

        HttpSession session = request.getSession();
        UsersVo loggedInUser = (UsersVo) session.getAttribute("loggedInUser");
        String userId = loggedInUser.getUserId();

        List<OrderDto> list =  orderService.getUserOrderList(userId);
        List<OrderDto> readyList = new ArrayList<>();
        List<OrderDto> completeList = new ArrayList<>();
        for (OrderDto orderDto:list) {
            if(orderDto.getOrderState().equals("배송준비")){
                readyList.add(orderDto);
            }
        }
        for (OrderDto orderDto:list) {
            if(!orderDto.getOrderState().equals("배송준비")){
                completeList.add(orderDto);
            }
        }

        if(!readyList.isEmpty()){
            model.addAttribute("readyList",readyList);
        }else if(readyList.isEmpty()){
            model.addAttribute("readyList","empty");
        }

        if(!completeList.isEmpty()){
            model.addAttribute("completeList",completeList);
        }else if(completeList.isEmpty()){
            model.addAttribute("completeList","empty");
        }
        return "myPage/userOrderList";
    }

    @GetMapping("/orderdetail")
    public String orderDetailGet(OrderDto orderDto,Model model) throws Exception {
        controller.receiveCategory(model);

        OrderDto orderInfo = orderDao.getOrder(orderDto.getOrderId());
        List<OrderItemDto> list = orderService.getOrder(orderDto);
        orderInfo.setOrders(list);
        orderInfo.getOrderPriceInfo();

        model.addAttribute("orderInfo", orderInfo);
        model.addAttribute("orderItems", list);


        return "myPage/userOrderDetail";
    }

    @PostMapping("/orderCancel")
    public String orderCancelPost(OrderManageDto orderManageDto) throws Exception {

        orderService.orderCancel(orderManageDto);

        return "redirect:/mypage/orders";
    }

    @ResponseBody
    @PostMapping("/emailChk")
    public boolean emailChk(HttpServletRequest request) throws Exception {
        String email = request.getParameter("email");
        UsersVo vo = mypageService.emailChk(email);

        HttpSession session = request.getSession();
        UsersVo usersVo = (UsersVo) session.getAttribute("loggedInUser");
        String loggedInUserEmail = usersVo.getEmail();

        boolean chkEmail = loggedInUserEmail.equals(email);

        if (vo != null && !chkEmail) {
            return true;
        }
        return false;
    }

    @ResponseBody
    @PostMapping("/mobileChk")
    public boolean mobileChk(HttpServletRequest request) throws Exception {
        String mobile1 = request.getParameter("mobile1");
        String mobile2 = request.getParameter("mobile2");
        String mobile3 = request.getParameter("mobile3");
        String mobile = mobile1 + "-" + mobile2 + "-" + mobile3;

        UsersVo vo = mypageService.mobileChk(mobile);

        HttpSession session = request.getSession();
        UsersVo usersVo = (UsersVo) session.getAttribute("loggedInUser");
        String loggedInUserMobile = usersVo.getMobile();

        boolean chkMobile = loggedInUserMobile.equals(mobile);

        if (vo != null && !chkMobile) {
            return true;
        }
        return false;
    }
}
