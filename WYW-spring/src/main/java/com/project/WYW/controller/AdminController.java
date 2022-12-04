package com.project.WYW.controller;

import com.project.WYW.dao.OrderDao;
import com.project.WYW.domain.*;
import com.project.WYW.dto.*;
import com.project.WYW.model.AttachImageVO;
import com.project.WYW.model.PageVo;
import com.project.WYW.model.Pagehandler;
import com.project.WYW.service.*;
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
import org.w3c.dom.ls.LSException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
    @Autowired
    UsersSecvice usersSecvice;
    @Autowired
    OrderDao orderDao;
    @Autowired
    OrderService orderService;
    @Autowired
    ReplyQnaService replyQnaService;
    @Autowired
    ProductService productService;

    @GetMapping("/main")
    public String toMain() {
        return "admin/admin";
    }


    /* 상품 등록 페이지 접속 */
    @GetMapping("/productsReg")
    public String getProductsReg(HttpSession session, Model model) throws Exception {

        List<CategoryVo> category = adminService.category();
        UsersVo loginUser = (UsersVo) session.getAttribute("loggedInUser");

        model.addAttribute("category", JSONArray.fromObject(category));
        model.addAttribute("loggedInUser", loginUser);

        return "admin/productsReg";
    }

    @PostMapping("/productsReg")
    public String postProductsReg(ProductsVo productsVo, RedirectAttributes rattr) throws Exception {

        int rowCnt = adminService.regProduct(productsVo);
        if (rowCnt == 1) {
            if (productsVo.getImageVOList() == null) {
                rattr.addFlashAttribute("imgRegtMsg", "empty");
            }

            rattr.addFlashAttribute("msg", "reg_ok");
            return "redirect:/admin/productsReg";
        }
        rattr.addFlashAttribute(productsVo);
        rattr.addFlashAttribute("msg", "reg_err");
        return "redirect:/admin/productsReg";
    }

    /* 상품 목록 페이지 접속 */
    @GetMapping("/productslist")
    public String getProductsList(Pagehandler pagehandler, Model model) throws Exception {

        List<ProductsViewVo> list = adminService.productsViewList(pagehandler);

        if (!list.isEmpty()) {
            model.addAttribute("list", list);
        } else {
            model.addAttribute("listCheck", "empty");
        }
        int total = adminService.productsGetTotal(pagehandler);
        PageVo pageMarker = new PageVo(pagehandler, total);
        model.addAttribute("pageMarker", pageMarker);


        return "admin/productslist";
    }

    @GetMapping("/productsManage")
    public String getProductsManage(Integer id, Model model) throws Exception {

        List<CategoryVo> category = adminService.category();
        ProductsViewVo productsViewVo = adminService.readProduct(id);
        model.addAttribute(productsViewVo);
        model.addAttribute("category", JSONArray.fromObject(category));
        return "admin/productsManage";
    }

    @PostMapping("/modifyProduct")
    public String modifyProduct(ProductsVo productsVo, RedirectAttributes rattr) throws Exception {
        int rowCnt = adminService.modifiyProduct(productsVo);

        if (rowCnt == 1) {
            if (productsVo.getImageVOList() == null) {
                rattr.addFlashAttribute("imgModMsg", "empty");
            }
            rattr.addFlashAttribute("msg", "modify_ok");
            return "redirect:/admin/productsManage" + "?id=" + productsVo.getId();
        }

        rattr.addFlashAttribute("msg", "modify_err");
        return "redirect:/admin/productsManage" + "?id=" + productsVo.getId();
    }

    @PostMapping("/deleteProduct")
    public String deleteProduct(Integer id, Model model, RedirectAttributes rattr) throws Exception {

        List<AttachImageVO> imageList = adminService.getAttachInfo(id);

        if (imageList != null) {

            List<Path> pathList = new ArrayList();

            imageList.forEach(attachImageVO -> {

                // 원본 이미지
                Path path = Paths.get("C:\\upload", attachImageVO.getUpload_path(), attachImageVO.getUuid() + "_" + attachImageVO.getFile_name());
                pathList.add(path);

                // 섬네일 이미지
                path = Paths.get("C:\\upload", attachImageVO.getUpload_path(), "s_" + attachImageVO.getUuid() + "_" + attachImageVO.getFile_name());
                pathList.add(path);

            });

            pathList.forEach(path -> {
                path.toFile().delete();
            });
        }
        int rowCnt = adminService.deleteProduct(id);

        if (rowCnt == 1) {
            rattr.addFlashAttribute("msg", "del_ok");
            return "redirect:/admin/productslist";
        }

        rattr.addFlashAttribute("msg", "del_err");
        return "redirect:/admin/productslist";
    }

    /* 카테고리 등록 페이지 접속 */
    @GetMapping("/category")
    public String getCategory() throws Exception {

        return "admin/category";
    }

    /* 카테고리 관리 페이지 접속 */
    @GetMapping("/categoryManage")
    public String getCategoryManage() throws Exception {

        return "admin/categoryManage";
    }


    @GetMapping("/orderlist")
    public String getOrderList(Pagehandler pagehandler, Model model) {

        List<OrderDto> list = adminService.getOrderList(pagehandler);
        if (!list.isEmpty()) {
            model.addAttribute("list", list);
        } else {
            model.addAttribute("listCheck", "empty");
        }

        int total = adminService.getOrderTotal(pagehandler);
        PageVo pageMarker = new PageVo(pagehandler, total);

        model.addAttribute("pageMarker", pageMarker);

        return "admin/orderList";
    }

    @GetMapping("/orderdetail")
    public String orderDetailGet(OrderDto orderDto, Model model) {

        OrderDto orderInfo = orderDao.getOrder(orderDto.getOrderId());
        List<OrderItemDto> list = orderService.getOrder(orderDto);
        orderInfo.setOrders(list);
        orderInfo.getOrderPriceInfo();

        model.addAttribute("orderInfo", orderInfo);
        model.addAttribute("orderItems", list);

        return "admin/orderListDetail";
    }

    @PostMapping("/orderCancel")
    public String orderCancelPost(OrderManageDto orderManageDto) throws Exception {

        orderService.orderCancel(orderManageDto);

//        return "redirect:/admin/orderlist?keyword=" + orderCancelDto.getKeyword() + "&amount=" + orderCancelDto.getAmount() + "&pageNum=" + orderCancelDto.getPageNum();
        return "redirect:/admin/orderlist";
    }

    @PostMapping("/shipping")
    public String shippingPost(OrderManageDto orderManageDto) {

        orderService.shipping(orderManageDto);

//        return "redirect:/admin/orderlist?keyword=" + orderCancelDto.getKeyword() + "&amount=" + orderCancelDto.getAmount() + "&pageNum=" + orderCancelDto.getPageNum();
        return "redirect:/admin/orderlist";
    }

    @GetMapping("/membermanagement")
    public String memberManagementGet(Pagehandler pagehandler, Model model) throws Exception {

        List<UsersVo> list = adminService.getUserList();

        if (!list.isEmpty()) {
            model.addAttribute("list", list);
        } else {
            model.addAttribute("listCheck", "empty");
        }
        PageVo pageMarker = new PageVo(pagehandler, adminService.getUserTotal());
        model.addAttribute("pageMarker", pageMarker);

        return "admin/memberList";
    }

    @GetMapping("/memberdetail")
    public String memberDetailGet(String userId, Model model) throws Exception {

        UsersVo usersVo = usersSecvice.read(userId);
        model.addAttribute("userInfo", usersVo);

        return "admin/userInfoForAdmin";
    }

    @PostMapping("/modifyuserinfo")
    public String modifyUserInfo(UsersVo usersVo, Model model, RedirectAttributes attributes) throws Exception {
        int rowCnt = adminService.modifyUserInfo(usersVo);

        if (rowCnt == 1) {
            attributes.addFlashAttribute("msg", "edit_ok");
            return "redirect:/admin/membermanagement";
        }
        attributes.addFlashAttribute("msg", "err");
        return "redirect:/admin/memberdetail";
    }

    @PostMapping("/activeaccount")
    public String activeAccountPost(String userId, RedirectAttributes attributes) throws Exception {
        UsersVo usersVo = usersSecvice.read(userId);
        usersVo.setActive(true);
        int rowCnt = adminService.modifyUserInfo(usersVo);
        if (rowCnt == 1) {
            attributes.addFlashAttribute("msg", "active");
            return "redirect:/admin/memberdetail?userId=" + userId;
        }
        attributes.addFlashAttribute("msg", "err");
        return "redirect:/admin/memberdetail?userId=" + userId;
    }

    @PostMapping("/inactiveaccount")
    public String inActiveAccountPost(String userId, RedirectAttributes attributes) throws Exception {
        UsersVo usersVo = usersSecvice.read(userId);
        usersVo.setActive(false);
        int rowCnt = adminService.modifyUserInfo(usersVo);
        if (rowCnt == 1) {
            attributes.addFlashAttribute("msg", "inactive");
            return "redirect:/admin/memberdetail?userId=" + userId;
        }
        attributes.addFlashAttribute("msg", "err");
        return "redirect:/admin/memberdetail?userId=" + userId;
    }

    @PostMapping("/adminaccount")
    public String adminAccountPost(String userId, RedirectAttributes attributes) throws Exception {
        UsersVo usersVo = usersSecvice.read(userId);
        usersVo.setAdmin(true);
        int rowCnt = adminService.modifyUserInfo(usersVo);
        if (rowCnt == 1) {
            attributes.addFlashAttribute("msg", "admin");
            return "redirect:/admin/memberdetail?userId=" + userId;
        }
        attributes.addFlashAttribute("msg", "err");
        return "redirect:/admin/memberdetail?userId=" + userId;
    }

    @PostMapping("/nonadminaccount")
    public String nonAdminAccountPost(String userId, RedirectAttributes attributes) throws Exception {
        UsersVo usersVo = usersSecvice.read(userId);
        usersVo.setAdmin(false);
        int rowCnt = adminService.modifyUserInfo(usersVo);
        if (rowCnt == 1) {
            attributes.addFlashAttribute("msg", "nonadmin");
            return "redirect:/admin/memberdetail?userId=" + userId;
        }
        attributes.addFlashAttribute("msg", "err");
        return "redirect:/admin/memberdetail?userId=" + userId;
    }

    @PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<List<AttachImageVO>> uploadajaxActionPost(MultipartFile[] uploadFile) throws Exception {

        for (MultipartFile multipartFile : uploadFile) {

            File checkfile = new File(multipartFile.getOriginalFilename());
            String type = null;

            try {
                type = Files.probeContentType(checkfile.toPath());
                System.out.println("MIME TYPE : " + type);

            } catch (IOException e) {
                e.printStackTrace();
            }

            /*파일이 이미지가 아닐경우*/
            if (!type.startsWith("image")) {

                /*ResponseEntity 객체에 첨부해줄 값이 null인 List <AttachImageVO>리턴*/
                List<AttachImageVO> list = null;
                return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);

            }
        }


//        기본폴더 경로
        String uploadFolder = "C:\\upload";
//        연/월/일 형태로 폴더 생성
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String str = simpleDateFormat.format(date);
        String datePath = str.replace("-", File.separator);
        String upload_path = str.replace("-", "/");

        File uploadPath = new File(uploadFolder, datePath);
        if (uploadPath.exists() == false) {
//            폴더가 존재하지 않을때만 폴더생성
            uploadPath.mkdirs();
        }

        /* 이미저 정보 담는 객체 */
        List<AttachImageVO> list = new ArrayList();

        for (MultipartFile multipartFile : uploadFile) {

            /*이미지 정보 객체*/
            AttachImageVO vo = new AttachImageVO();

            /* 파일 이름 */
            String uploadFileName = multipartFile.getOriginalFilename();
            vo.setFile_name(uploadFileName);

            /* uuid 적용 파일 이름 */
            String uuid = UUID.randomUUID().toString();

            uploadFileName = uuid + "_" + uploadFileName;
            vo.setUpload_path(upload_path);
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

    /* 이미지 파일 삭제 */
    @PostMapping("/deleteFile")
    public ResponseEntity<String> deleteFile(String fileName) {

        File file = null;

        try {
            /* 썸네일 파일 삭제 */
            file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
            file.delete();

            /* 원본 파일 삭제 */
            String originFileName = file.getAbsolutePath().replace("s_", "");
            System.out.println("originFileName : " + originFileName);
            file = new File(originFileName);
            file.delete();


        } catch (Exception e) {

            e.printStackTrace();
            return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);

        }
        return new ResponseEntity<String>("success", HttpStatus.OK);
    }

    @ResponseBody
    @PostMapping("/emailChk")
    public boolean emailChk(HttpServletRequest request) throws Exception {
        String email = request.getParameter("email");
        UsersVo vo = usersSecvice.emailChk(email);

        String userId = request.getParameter("userId");
        UsersVo usersVo = usersSecvice.read(userId);
        String userEmail = usersVo.getEmail();

        boolean chkEmail = userEmail.equals(email);

        if (vo != null && !chkEmail) {
            return true;
        }
        return false;
    }

    @ResponseBody
    @PostMapping("/mobileChk")
    public boolean mobileChk(HttpServletRequest request) throws Exception {
        String mobile1 = request.getParameter("mobile1");
        String mobile2 = request.getParameter("mobile2");
        String mobile3 = request.getParameter("mobile3");
        String mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
        UsersVo vo = usersSecvice.mobileChk(mobile);

        String userId = request.getParameter("userId");
        UsersVo usersVo = usersSecvice.read(userId);
        String userMobile = usersVo.getMobile();

        boolean chkMobile = userMobile.equals(mobile);

        if (vo != null && !chkMobile) {
            return true;
        }
        return false;
    }

    @GetMapping("/qnalist")
    public String getQnalistGet(Pagehandler pagehandler, Model model) {

        ReplyQnaPageDto replyQnaPageDto = replyQnaService.replyQnaList(pagehandler);

        if (!replyQnaPageDto.getList().isEmpty()) {
            model.addAttribute("list", replyQnaPageDto.getList());
        } else {
            model.addAttribute("listCheck", "empty");
        }
        model.addAttribute("pageMarker", replyQnaPageDto.getPageInfo());

        return "admin/qnaList";
    }

    @GetMapping("/answerreg")
    public String answerWindowGet(ReplyQnaDto replyQnaDto, Model model) {

        replyQnaDto = replyQnaService.getReplyQna(replyQnaDto);
        ProductsViewVo productsViewVo = productService.readProductDetail(replyQnaDto.getProductId());

        model.addAttribute("qnaInfo",replyQnaDto);
        model.addAttribute("productInfo",productsViewVo);

        return "admin/answerPage";
    }

    @ResponseBody
    @PostMapping("/answer")
    public void answerPost(AnswerVo answerVo){
        replyQnaService.regAnswer(answerVo);
    }

    @GetMapping("/answermanage")
    public String answerManageWindowGet(ReplyQnaDto replyQnaDto, Model model) {

        replyQnaDto = replyQnaService.getReplyQna(replyQnaDto);
        ProductsViewVo productsViewVo = productService.readProductDetail(replyQnaDto.getProductId());

        AnswerVo answerVo = new AnswerVo();
        answerVo.setQnaId(replyQnaDto.getQnaId());

        answerVo = replyQnaService.getAnswer(answerVo);

        model.addAttribute("qnaInfo",replyQnaDto);
        model.addAttribute("productInfo",productsViewVo);
        model.addAttribute("answerInfo",answerVo);

        return "admin/answerManagePage";
    }

    @ResponseBody
    @PostMapping("/updateanswer")
    public void updateAnswerPost(AnswerVo answerVo){
        replyQnaService.updateAnswer(answerVo);
    }

}