package com.project.WYW.controller;

import com.project.WYW.domain.UsersVo;
import com.project.WYW.dto.CommentDto;
import com.project.WYW.model.CommentPageHandler;
import com.project.WYW.model.CommentSearchCondition;
import com.project.WYW.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
public class CommentController {
    @Autowired
    CommentService service;

//    {
//        "pcno":0,
//            "comment":"hihihi",
//            "commenter":"asdf"
//    }


    // 댓글을 수정하는 메서드

    @PatchMapping("/comments/{cno}") // ch4/comments/70 PATCH
    public ResponseEntity<String> modify(@PathVariable Integer cno , @RequestBody CommentDto dto, HttpSession session){
                UsersVo commenter = (UsersVo) session.getAttribute("loggedInUser");
//        String commenter = "asdf";
        dto.setCommenter(commenter.getUserId());
        dto.setCno(cno);
        System.out.println("dto = " + dto);

        try {
            if(service.modify(dto)!=1)
                throw new Exception("Write failed.");

            return new ResponseEntity<>("MOD_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }


    }

//    {
//        "pcno":0,
//        "comment":"hi"
//    }



    // 댓글을 등록하는 메서드

    @PostMapping("/comments")  //ch4/comments?bno=1085 POST
    public ResponseEntity<String> write(@RequestBody CommentDto dto ,Integer bno, HttpSession session){
                UsersVo commenter = (UsersVo) session.getAttribute("loggedInUser");
//        String commenter = "asdf";
        dto.setCommenter(commenter.getUserId());
        dto.setBno(bno);
        System.out.println("dto = " + dto);

        try {
            if(service.write(dto)!=1)
                throw new Exception("Write failed.");

            return new ResponseEntity<>("WRT_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
        }

    }



    // 지정된 댓글을 삭제하는 메서드
    @DeleteMapping("/comments/{cno}") // /commments/1 <--삭제할 댓글 번호
    public ResponseEntity<String> remove(@PathVariable Integer cno, Integer bno, HttpSession session){
        UsersVo commenter = (UsersVo) session.getAttribute("loggedInUser");
//        String commenter = "asdf";

        try {
            int rowCnt  = service.remove(cno,bno,commenter.getUserId());

            if(rowCnt!=1)
                throw new Exception("Delete Failed");

            return  new ResponseEntity<>("DEL_OK",HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return  new ResponseEntity<>("DEL_ERR",HttpStatus.BAD_REQUEST);
        }

    }



    // 지정된 게시물의 모든 댓글을 가져오는 메서드
    @GetMapping("/comments")
    public ResponseEntity<List<CommentDto>>list(Integer bno, CommentSearchCondition csc, Model m) {
        List<CommentDto> list =null;


        System.out.println("csc"+csc.getCommentPageSize());
        try {
            int totalCnt = service.getCount(bno);
            list = service.getList(bno,csc);

            CommentPageHandler commentPageHandler = new CommentPageHandler(totalCnt,csc);
            m.addAttribute("commentPageHandler",commentPageHandler);
            m.addAttribute("commentPage",csc.getCommentPage());
            m.addAttribute("commentPageSize",csc.getCommentPageSize());



            System.out.println("list="+list);
//            System.out.println("csc"+csc.getCommentPageSize());
            return new ResponseEntity<List<CommentDto>>(list, HttpStatus.MULTI_STATUS.OK); //200
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<CommentDto>>(list, HttpStatus.BAD_REQUEST); //400
        }


    }


    @GetMapping("/page")
    @ResponseBody
    public ResponseEntity<CommentPageHandler> selectPage(Integer bno, Integer page, Integer pageSize){
        CommentPageHandler  cp =null;
        try {
            int totalCnt = service.getCount(bno);
            System.out.println(page+","+ pageSize);
            cp = new CommentPageHandler(totalCnt, page, pageSize);
            // 예외가 발생되어도 상태코드가 200번대
            return new ResponseEntity<CommentPageHandler>(cp, HttpStatus.OK);
        } catch (Exception e) {

            e.printStackTrace();
            return new ResponseEntity<CommentPageHandler>(cp, HttpStatus.BAD_REQUEST);
        }

    }

}
