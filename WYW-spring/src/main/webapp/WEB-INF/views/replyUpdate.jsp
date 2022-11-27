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
        <h1 class="reply_main_title">Review(Edit)</h1>
        <div class="reply_product_name">
            <h1>제품명 : ${productInfo.name}[${productInfo.cate_name}]</h1>
        </div>
        <div class="reply_product_userId">
            <h1>작성자 : ${userId}</h1>
        </div>
        <div class="reply_rating">
            <h4>평점</h4>
            <select name="rating">
                <option value="0.5">0.5</option>
                <option value="1.0">1.0</option>
                <option value="1.5">1.5</option>
                <option value="2.0">2.0</option>
                <option value="2.5">2.5</option>
                <option value="3.0">3.0</option>
                <option value="3.5">3.5</option>
                <option value="4.0">4.0</option>
                <option value="4.5">4.5</option>
                <option value="5.0" selected>5.0</option>
            </select>
            <h2>평점을 선택해주세요.</h2>
        </div>
        <div class="reply_content">
            <textarea name="content" placeholder="내용을 작성해주세요.">${replyInfo.content}</textarea>
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
        if (confirm("리뷰 수정을 취소하시겠습니까?")) {
            window.close();
        }
        return false;
    });

    /* 수정 버튼 */
    $(".update_btn").on("click", function (e) {

        if (!confirm("리뷰 수정을 하시겠습니까?")) {
            return false;
        }

        let replyId = "${replyInfo.replyId}"
        let userId = "${userId}";
        let productId = "${productInfo.id}";
        let rating = $("select").val();
        let content = $("textarea").val();

        const data = {
            replyId : replyId,
            userId: userId,
            productId: productId,
            rating: rating,
            content: content
        }

        $.ajax({
            data: data,
            type: 'POST',
            url: '/WYW/reply/update',
            success: function (result) {
                /* 댓글 초기화 */
                $(opener.location).attr("href", "javascript:replyListInit();");
                window.close();
            }

        });

    });

</script>
<script>
    $(document).ready(function(){

        let rating = '${replyInfo.rating}';

        $("option").each(function(i,obj){
            if(rating === $(obj).val()){
                $(obj).attr("selected", "selected");
            }
        });
    });
</script>
</body>
</html>
