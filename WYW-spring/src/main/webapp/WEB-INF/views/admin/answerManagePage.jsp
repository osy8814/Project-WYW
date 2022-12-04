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
            <button class="answer-manage_btn">답변수정</button>
            <button class="modify_btn hidden_div">등록</button>
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

    /* 답변수정 버튼 */
    $(".answer-manage_btn").on("click", function (e) {

        if (!confirm("답변을 수정 하시겠습니까?")) {
            return false;
        }
        $(".answer-manage_btn").addClass("hidden_div");
        $(".modify_btn").removeClass("hidden_div");
        $(".answer").attr("readonly", false);
    });

    $(".modify_btn").on("click", function (e) {
        if (!confirm("수정된 답변을 등록 하시겠습니까?")) {
            return false;
        }

        let qnaId = "${qnaInfo.qnaId}"
        let userId = "${loggedInUser.userId}";
        let content = $(".answer").val();

        const data = {
            qnaId: qnaId,
            userId: userId,
            content: content
        }

        $.ajax({
            data: data,
            type: 'POST',
            url: '/WYW/admin/updateanswer',
            success: function (result) {
                // 부모창새로고침
                alert("답변이 수정되었습니다.");
                opener.parent.location.reload();
                window.close();
            }

        });

    });

</script>
</body>
</html>
