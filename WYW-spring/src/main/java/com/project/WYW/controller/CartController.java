package com.project.WYW.controller;

import com.project.WYW.domain.UsersVo;
import com.project.WYW.model.CartVo;
import com.project.WYW.service.AttachService;
import com.project.WYW.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("/cart")
@Controller
public class CartController {

    @Autowired
    private CartService cartService;

    @Autowired
    ProductController controller;

    @PostMapping("/add")
    @ResponseBody
    public String postAddCart(CartVo cartVo, HttpServletRequest request) {
        HttpSession session = request.getSession();
        UsersVo usersVo = (UsersVo) session.getAttribute("loggedInUser");
        if (usersVo == null) {
            return "5";
        }
        int result = cartService.addCart(cartVo);

        return result + "";
    }

    @GetMapping("/cartlist")
    public String cartPageGET(Model model, HttpServletRequest request)throws Exception {
        controller.receiveCategory(model);

        HttpSession session = request.getSession();
        UsersVo loggedInUser = (UsersVo) session.getAttribute("loggedInUser");
        String user_id = loggedInUser.getUserId();

        List<CartVo> list = cartService.getCartList(user_id);
        if(list.isEmpty()){
            model.addAttribute("cartInfo", "empty");
            return "cart";
        }

        model.addAttribute("cartInfo", list);

        return "cart";
    }

    @PostMapping("/modify")
    public String postUpdateCart(CartVo cartVo) {
        cartService.modifyCount(cartVo);

        return "redirect:/cart/cartlist";
    }

    @PostMapping("/delete")
    public String postDeleteCart(CartVo cartVo) {
        cartService.deleteCart(cartVo.getId());

        return "redirect:/cart/cartlist";
    }

}
