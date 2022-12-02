package com.project.WYW.controller;


import com.project.WYW.domain.UsersVo;
import com.project.WYW.dto.NoticeDto;
import com.project.WYW.model.BoardPageHandler;
import com.project.WYW.model.SearchCondition;
import com.project.WYW.service.NoticeService;
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
@RequestMapping("/board3")
public class NoticeController {
    @Autowired
    NoticeService noticeService;

    @PostMapping("/modify3")
    public String modify(NoticeDto noticeDto, SearchCondition sc, RedirectAttributes rattr, Model m, HttpSession session) {
        UsersVo writer = (UsersVo) session.getAttribute("loggedInUser");
        noticeDto.setWriter(writer.getUserId());

        try {
            if (noticeService.modify(noticeDto)!= 1)
                throw new Exception("Modify failed.");

            rattr.addFlashAttribute("msg", "MOD_OK");
            return "redirect:/board3/list3"+sc.getQueryString();
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(noticeDto);
            m.addAttribute("msg", "MOD_ERR");
            return "/board/board3";
        }
    }

    @GetMapping("/write3")
    public String write(Model m) {
        m.addAttribute("mode", "new");

        return "board/board3";
    }

    @PostMapping("/write3")
    public String write(NoticeDto noticeDto, RedirectAttributes rattr, Model m, HttpSession session) {
        UsersVo writer = (UsersVo) session.getAttribute("loggedInUser");
        noticeDto.setWriter(writer.getUserId());

        try {
            if (noticeService.write(noticeDto) != 1)
                throw new Exception("Write failed.");

            rattr.addFlashAttribute("msg", "WRT_OK");
            return "redirect:/board3/list3";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(noticeDto);
            m.addAttribute("mode", "new");
            m.addAttribute("msg", "WRT_ERR");
            return "board/board3";
        }
    }

    @GetMapping("/read3")
    public String read(Integer bno, SearchCondition sc, RedirectAttributes rattr, Model m) {

        try {
            NoticeDto noticeDto = noticeService.read(bno);
            m.addAttribute(noticeDto);
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "READ_ERR");
            return "redirect:/board3/list3"+sc.getQueryString();
        }

        return "/board/board3";
    }

    @PostMapping("/remove3")
    public String remove(Integer bno, SearchCondition sc, RedirectAttributes rattr, HttpSession session) {
        UsersVo writer = (UsersVo) session.getAttribute("loggedInUser");
        String msg = "DEL_OK";

        try {
            if(noticeService.remove(bno, writer.getUserId())!=1)
                throw new Exception("Delete failed.");
        } catch (Exception e) {
            e.printStackTrace();
            msg = "DEL_ERR";
        }

        rattr.addFlashAttribute("msg", msg);
        return "redirect:/board3/list3"+sc.getQueryString();
    }

    @GetMapping("/list3")
    public String list(Model m, SearchCondition sc, HttpServletRequest request) {
        if(!loginCheck(request))
            return "redirect:/users/login.do";  // 로그인을 안했으면 로그인 화면으로 이동

        try {
            int totalCnt = noticeService.getSearchResultCnt(sc);
            m.addAttribute("totalCnt", totalCnt);

            BoardPageHandler pageHandler = new BoardPageHandler(totalCnt, sc);

            List<NoticeDto> list1 = noticeService.getSearchResultPage(sc);
            m.addAttribute("list1", list1);
            m.addAttribute("ph", pageHandler);



            Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
            m.addAttribute("startOfToday", startOfToday.toEpochMilli());
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "LIST_ERR");
            m.addAttribute("totalCnt", 0);
        }

        return "/board/boardList3"; // 로그인을 한 상태이면, 게시판 화면으로 이동
    }




    private boolean loginCheck(HttpServletRequest req) {
        // 1. 세션을 얻어서(false는 session이 없어도 새로 생성하지 않는다. 반환값 null)
        HttpSession session = req.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session!=null && session.getAttribute("loggedInUser")!=null;
    }
}
