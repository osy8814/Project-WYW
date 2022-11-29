package com.project.WYW.controller;

import com.project.WYW.domain.UsersVo;
import com.project.WYW.model.CartVo;
import com.project.WYW.model.WishVo;
import com.project.WYW.service.CartService;
import com.project.WYW.service.WishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("/wish")
@Controller
public class WishController {

    @Autowired
    private WishService wishService;

    @PostMapping("/add")
    @ResponseBody
    public String postAddWish(WishVo wishVo,HttpServletRequest request) {

        HttpSession session = request.getSession();
        UsersVo usersVo = (UsersVo) session.getAttribute("loggedInUser");
        if (usersVo == null) {
            return "5";
        }

        int result = wishService.addWish(wishVo);

        return result + "";
    }

    @GetMapping("/wishlist")
    public String getWishPage(Model model, HttpServletRequest request) {

        HttpSession session = request.getSession();
        UsersVo loggedInUser = (UsersVo) session.getAttribute("loggedInUser");
        String user_id = loggedInUser.getUserId();

        List<WishVo> list = wishService.getWishList(user_id);
        if(list.isEmpty()){
            model.addAttribute("wishInfo", "empty");

            return "wish";
        }
        model.addAttribute("wishInfo", list);

        return "wish";
    }

    @PostMapping("/delete")
    public String postDeleteWish(WishVo wishVo) {

        wishService.deleteWish(wishVo.getId());

        return "redirect:/wish/wishlist";
    }

}
