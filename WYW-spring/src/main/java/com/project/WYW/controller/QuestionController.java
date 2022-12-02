package com.project.WYW.controller;

import com.project.WYW.domain.UsersVo;
import com.project.WYW.dto.QuestionDto;
import com.project.WYW.model.BoardPageHandler;
import com.project.WYW.model.SearchCondition;
import com.project.WYW.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

@Controller
@RequestMapping("/board4")
public class QuestionController {
    @Autowired
    QuestionService questionService;


    @PostMapping("/modify4")
    public String modify(QuestionDto questionDto, SearchCondition sc, RedirectAttributes rattr, Model m, HttpSession session) {
        UsersVo writer = (UsersVo) session.getAttribute("loggedInUser");
        questionDto.setWriter(writer.getUserId());

        try {
            if (questionService.modify(questionDto)!= 1)
                throw new Exception("Modify failed.");

            rattr.addFlashAttribute("msg", "MOD_OK");
            return "redirect:/board4/list4"+sc.getQueryString();
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(questionDto);
            m.addAttribute("msg", "MOD_ERR");
            return "board/board4";
        }
    }

    @GetMapping("/write4")
    public String write(Model m) {
        m.addAttribute("mode", "new");

        return "board/board4";
    }

    @PostMapping("/write4")
    public String write(QuestionDto questionDto, RedirectAttributes rattr, Model m, HttpSession session) {
        UsersVo writer = (UsersVo) session.getAttribute("loggedInUser");
        questionDto.setWriter(writer.getUserId());

        try {
            if (questionService.write(questionDto) != 1)
                throw new Exception("Write failed.");

            rattr.addFlashAttribute("msg", "WRT_OK");
            return "redirect:/board4/list4";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(questionDto);
            m.addAttribute("mode", "new");
            m.addAttribute("msg", "WRT_ERR");
            return "board/board4";
        }
    }

@GetMapping("/read4")
public String read(Integer bno, SearchCondition sc, RedirectAttributes rattr, Model m) {

    try {
        QuestionDto questionDto = questionService.read(bno);
        m.addAttribute(questionDto);
    } catch (Exception e) {
        e.printStackTrace();
        rattr.addFlashAttribute("msg", "READ_ERR");
        return "redirect:/board4/list4"+sc.getQueryString();
    }

    return "/board/board4";
}


    @PostMapping("/remove4")
    public String remove(Integer bno, SearchCondition sc, RedirectAttributes rattr, HttpSession session) {
        UsersVo writer = (UsersVo) session.getAttribute("loggedInUser");

        String msg = "DEL_OK";

        try {
            if(questionService.remove(bno, writer.getUserId())!=1)

                    throw new Exception("Delete failed.");
        } catch (Exception e) {
            e.printStackTrace();
            msg = "DEL_ERR";
        }

        rattr.addFlashAttribute("msg", msg);
        return "redirect:/board4/list4"+sc.getQueryString();
    }
    @PostMapping("/remove5")
    public String removeAdmin(Integer bno, SearchCondition sc, RedirectAttributes rattr) {
        String msg = "DEL_OK";
        try {

            if(questionService.removeAdmin(bno)!=1);

            throw new Exception("Delete failed.");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/board4/list4"+sc.getQueryString();
    }


    @GetMapping("/list4")
    public String list(Model m, SearchCondition sc, HttpServletRequest request) {
        if(!loginCheck(request))
            return "redirect:/users/login.do";  // 로그인을 안했으면 로그인 화면으로 이동

        try {
            int totalCnt = questionService.getSearchResultCnt(sc);
            m.addAttribute("totalCnt", totalCnt);

            BoardPageHandler pageHandler = new BoardPageHandler(totalCnt, sc);

            List<QuestionDto> list2 = questionService.getSearchResultPage(sc);
            m.addAttribute("list2", list2);
            m.addAttribute("ph", pageHandler);


            Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
            m.addAttribute("startOfToday", startOfToday.toEpochMilli());
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "LIST_ERR");
            m.addAttribute("totalCnt", 0);
        }

        return "board/boardList4"; // 로그인을 한 상태이면, 게시판 화면으로 이동
    }


    private boolean loginCheck(HttpServletRequest req) {
        // 1. 세션을 얻어서(false는 session이 없어도 새로 생성하지 않는다. 반환값 null)
        HttpSession session = req.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session!=null && session.getAttribute("loggedInUser")!=null;
    }



}