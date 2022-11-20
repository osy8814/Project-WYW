package com.project.WYW.Interceptor;

import com.project.WYW.domain.UsersVo;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminINTCP implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        System.out.println("관리자 인터셉터 작동");

        HttpSession session = request.getSession();

        UsersVo adminVo = (UsersVo)session.getAttribute("loggedInUser");

        if(adminVo==null || adminVo.getIsAdmin()==false){

            response.sendRedirect("/WYW");

            return false;
        }
        return true;
    }
}
