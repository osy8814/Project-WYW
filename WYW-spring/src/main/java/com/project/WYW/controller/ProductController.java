package com.project.WYW.controller;

import com.fasterxml.jackson.databind.annotation.JsonAppend;
import com.project.WYW.model.AttachImageVO;
import com.project.WYW.service.AttachService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

@Controller
public class ProductController {

    @Autowired
    private AttachService attachService;



    @GetMapping("/display")
    public ResponseEntity<byte[]> getImage(String fileName){

        File file = new File("c:\\upload\\" + fileName);

        ResponseEntity<byte[]> result = null;

        try {

            HttpHeaders header = new HttpHeaders();

            header.add("Content-type", Files.probeContentType(file.toPath()));

            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

        }catch (IOException e) {
            e.printStackTrace();
        }

        return result;

    }

    /* 이미지 정보 반환 */
    @GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<List<AttachImageVO>> getAttachList(int product_id){

        return new ResponseEntity<List<AttachImageVO>>(attachService.getAttachList(product_id), HttpStatus.OK);

    }

    @GetMapping("/productDetail")
    public String productDtail(){
        return "productDetail";
    }

}
