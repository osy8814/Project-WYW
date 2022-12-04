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
        <h1 class="reply_main_title">문의(수정)</h1>
        <div class="reply_product_name">
            <h1>제품명 : ${productInfo.name}[${productInfo.cate_name}]</h1>
        </div>
        <div class="reply_product_userId">
            <h1>작성자 : ${userId}</h1>
        </div>
        <div class="reply_content">
            <textarea name="content" placeholder="내용을 작성해주세요.">${replyQnaInfo.content}</textarea>
        </div>
        <div class="reply_btn-set">
            <button class="update_btn">수정</button>
            <button class="cancel_btn">취소</button>
        </div>

    </div>
</div>
<script>

    /* 취소 버튼 */
    $(".cancel_btn").on("click", function (e) {
        if (confirm("문의 수정을 취소하시겠습니까?")) {
            window.close();
        }
        return false;
    });

    /* 수정 버튼 */
    $(".update_btn").on("click", function (e) {

        if (!confirm("문의 수정을 하시겠습니까?")) {
            return false;
        }

        let qnaId = "${replyQnaInfo.qnaId}"
        let userId = "${userId}";
        let productId = "${productInfo.id}";
        let content = $("textarea").val();

        const data = {
            qnaId : qnaId,
            userId: userId,
            productId: productId,
            content: content
        }

        $.ajax({
            data: data,
            type: 'POST',
            url: '/WYW/replyqna/update',
            success: function (result) {
                /* 문의 초기화 */
                $(opener.location).attr("href", "javascript:replyQnaListInit();");
                window.close();
            }

        });

    });

</script>
</body>
</html>
