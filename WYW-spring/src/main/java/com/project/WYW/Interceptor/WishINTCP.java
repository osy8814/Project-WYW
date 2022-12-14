package com.project.WYW.Interceptor;

import com.project.WYW.domain.UsersVo;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class WishINTCP implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        UsersVo usersVo = (UsersVo) session.getAttribute("loggedInUser");

        if (usersVo == null) {

            response.sendRedirect("/WYW/users/login.do");

            return false;
        }
        return true;
    }
}
