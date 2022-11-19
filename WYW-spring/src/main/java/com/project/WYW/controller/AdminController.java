package com.project.WYW.controller;

import com.project.WYW.domain.CategoryVo;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.ProductsVo;
import com.project.WYW.domain.UsersVo;
import com.project.WYW.model.AttachImageVO;
import com.project.WYW.service.AdminService;
import net.coobird.thumbnailator.Thumbnails;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService adminService;
    @GetMapping("/main")
    public String toMain() {
        return "admin";
    }


    /* 상품 등록 페이지 접속 */
    @GetMapping("/productsReg")
    public String getProductsReg(HttpSession session, Model model) throws Exception {
        List<CategoryVo> category = adminService.category();
        UsersVo loginUser = (UsersVo)session.getAttribute("loggedInUser");

        model.addAttribute("category", JSONArray.fromObject(category));
        model.addAttribute("loggedInUser", loginUser);

        return "productsReg";
    }

    @PostMapping("/productsReg")
    public String postProductsReg(ProductsVo productsVo, RedirectAttributes rattr) throws Exception {


        int rowCnt = adminService.regProduct(productsVo);
        if(rowCnt==1){
            rattr.addFlashAttribute("msg", "reg_ok");
            return "redirect:/admin/productsReg";
        }
        rattr.addFlashAttribute(productsVo);
        rattr.addFlashAttribute("msg", "reg_err");
        return "redirect:/admin/productsReg";
    }

    /* 상품 목록 페이지 접속 */
    @GetMapping("/productslist")
    public String getProductslist(Model model) throws Exception {

        List<ProductsViewVo> list = adminService.productsViewList();
        model.addAttribute("list", list);

        return "productslist";
    }

    @GetMapping("/productsManage")
    public String getProductsManage(Integer id, Model model) throws Exception {
        List<CategoryVo> category = adminService.category();
        ProductsViewVo productsViewVo = adminService.readProduct(id);
        model.addAttribute(productsViewVo);
        model.addAttribute("category", JSONArray.fromObject(category));
        return "productsManage";
    }

    @PostMapping("/modifyProduct")
    public String modifyProduct(ProductsVo productsVo,Model model,RedirectAttributes rattr)throws Exception{
        int rowCnt = adminService.modifiyProduct(productsVo);
        System.out.println("rowCnt = " + rowCnt);
        if(rowCnt==1){
            rattr.addFlashAttribute("msg","modify_ok");
            return "redirect:/admin/productsManage"+"?id=" + productsVo.getId();
        }

        rattr.addFlashAttribute("msg","modify_err");
        return "redirect:/admin/productsManage"+"?id=" + productsVo.getId();
    }
    @PostMapping("/deleteProduct")
    public String deleteProduct(Integer id,Model model,RedirectAttributes rattr)throws Exception{
        int rowCnt = adminService.deleteProduct(id);
        if(rowCnt==1){
            rattr.addFlashAttribute("msg","del_ok");
            return "redirect:/admin/productslist";
        }

        rattr.addFlashAttribute("msg","del_err");
        return "redirect:/admin/productslist";
    }

    /* 카테고리 등록 페이지 접속 */
    @GetMapping("/category")
    public String getCategory() throws Exception {

        return "category";
    }

    /* 카테고리 관리 페이지 접속 */
    @GetMapping("/categoryManage")
    public String getCategoryManage() throws Exception {

        return "categoryManage";
    }


    @PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<List<AttachImageVO>> uploadajaxActionPost(MultipartFile[] uploadFile)throws Exception{

        for(MultipartFile multipartFile : uploadFile){

            File checkfile = new File(multipartFile.getOriginalFilename());
            String type = null;

            try {
                type = Files.probeContentType(checkfile.toPath());
                System.out.println("MIME TYPE : " + type);

            } catch (IOException e) {
                e.printStackTrace();
            }

            /*파일이 이미지가 아닐경우*/
            if(!type.startsWith("image")) {

                /*ResponseEntity 객체에 첨부해줄 값이 null인 List <AttachImageVO>리턴*/
                List<AttachImageVO> list = null;
                return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);

            }
        }


//        기본폴더 경로
        String uploadFolder = "C:\\upload";

//        연/월/일 형태로 폴더 생성
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String str = sdf.format(date);
        String datePath = str.replace("-", File.separator);

        File uploadPath = new File(uploadFolder, datePath);
        if(uploadPath.exists() == false) {
//            폴더가 존재하지 않을때만 폴더생성
            uploadPath.mkdirs();
        }

        /* 이미저 정보 담는 객체 */
        List<AttachImageVO> list = new ArrayList();

        for(MultipartFile multipartFile : uploadFile){

            /*이미지 정보 객체*/
            AttachImageVO vo = new AttachImageVO();

            /* 파일 이름 */
            String uploadFileName = multipartFile.getOriginalFilename();

            /* uuid 적용 파일 이름 */
            String uuid = UUID.randomUUID().toString();

            uploadFileName = uuid + "_" + uploadFileName;

            vo.setFile_name(uploadFileName);
            vo.setUpload_path(datePath);
            vo.setUuid(uuid);

            /* 파일 위치, 파일 이름을 합친 File 객체 */
            File saveFile = new File(uploadPath, uploadFileName);

            /*  섬네일 파일 "s_" + 파일 이름 */
            File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);


            try {

                /* 파일 저장 */
                multipartFile.transferTo(saveFile);

                /* Thumbnailator라이브러리 사용 */
                BufferedImage bo_image = ImageIO.read(saveFile);

                //비율
                double ratio = 3;
                //넓이 높이
                int width = (int) (bo_image.getWidth() / ratio);
                int height = (int) (bo_image.getHeight() / ratio);


                Thumbnails.of(saveFile)
                        .size(width, height)
                        .toFile(thumbnailFile);

            } catch (Exception e) {
                e.printStackTrace();
            }
            list.add(vo);
        }

        ResponseEntity<List<AttachImageVO>> result = new ResponseEntity(list, HttpStatus.OK);

        return result;
    }
}