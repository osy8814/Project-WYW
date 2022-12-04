<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="${pageContext.request.contextPath}/img/WYWlogo.png"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <script src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <title>WYW</title>
    <style></style>
</head>

<body>

<div class="reply_main">
    <div class="reply-main-outter">
        <h1 class="reply_main_title">문의 답변</h1>
        <div class="reply_product_name">
            <h1>제품명 : ${productInfo.name}[${productInfo.cate_name}]</h1>
        </div>
        <div class="reply_product_userId">
            <h1>작성자 : ${qnaInfo.userId}</h1>
        </div>
        <div class="reply_content">
            문의내역
            <textarea placeholder="내용을 작성해주세요." style="margin-top: 10px" readonly>${qnaInfo.content}</textarea>
        </div>
        <div class="reply_product_userId">
            <h1>답변자 : ${answerInfo.userId}</h1>
        </div>
        <div class="reply_content">
            답변내역
            <textarea class="answer" placeholder="내용을 작성해주세요." style="margin-top: 10px"
                      readonly>${answerInfo.content}</textarea>
        </div>

        <div class="reply_btn-set">
            <button class="cancel_btn">확인</button>
        </div>

    </div>
</div>
<script>

    /* 확인 버튼 */
    $(".cancel_btn").on("click", function (e) {
        if (confirm("창을 닫으시겠습니까?")) {
            window.close();
        }
        return false;
    });

</script>
</body>
</html>
