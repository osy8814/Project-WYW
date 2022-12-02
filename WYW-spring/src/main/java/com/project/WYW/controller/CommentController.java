package com.project.WYW.controller;

import com.project.WYW.domain.UsersVo;
import com.project.WYW.dto.CommentDto;
import com.project.WYW.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
public class CommentController {
    @Autowired
    CommentService service;

    // 댓글을 수정하는 메서드
    @PatchMapping("/comments/{cno}") // ch4/comments/70 PATCH
    public ResponseEntity<String> modify(@PathVariable Integer cno , @RequestBody CommentDto dto, HttpSession session){
                UsersVo commenter = (UsersVo) session.getAttribute("loggedInUser");

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


    // 댓글을 등록하는 메서드

    @PostMapping("/comments")  //ch4/comments?bno=1085 POST
    public ResponseEntity<String> write(@RequestBody CommentDto dto ,Integer bno, HttpSession session){
                UsersVo commenter = (UsersVo) session.getAttribute("loggedInUser");

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

    @DeleteMapping("/commentsAdmin/{cno}") // /Qcommments/1?bno=8 <--삭제할 댓글 번호
    public ResponseEntity<String> removeAdmin(@PathVariable Integer cno, Integer bno, HttpSession session){
//        UsersVo commenter = (UsersVo) session.getAttribute("loggedInUser");
//        String commenter = "admin";

        try {
            int rowCnt  = service.removeAdmin(cno, bno);
//            int rowCnt  = qcommentService.remove(cno,bno,commenter.getUserId());
            if(rowCnt!=1)
                throw new Exception("Delete Failed");

            return  new ResponseEntity<>("DEL_OK",HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return  new ResponseEntity<>("DEL_ERR",HttpStatus.BAD_REQUEST);
        }

    }



    @GetMapping("/comments")
    public ResponseEntity<List<CommentDto>> list(Integer bno) {
        List<CommentDto> list = null;
        try {
            list = service.getList(bno);
            return new ResponseEntity<List<CommentDto>>(list, HttpStatus.OK); //200

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<CommentDto>>(HttpStatus.BAD_REQUEST); //400
        }
    }




}
