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
    <title>WYW</title>
    <style></style>
</head>

<body>
<jsp:include page="index_top.jsp" flush="false"/>
<div class="find_id_main">
    <div class="find_id_main-outter">
        <h1 class="find_id_title">정보찾기</h1>
        <form class="find_id_form">
            <h1 class="find_id_form_title">
                <i class="fas fa-fingerprint"></i>아이디 찾기
            </h1>

            <div class="find_id_form_inputAndBtn">
                <div class="find_id_form_name_email">
                    <label for="find_id_form_email"
                    ><input
                            type="email"
                            id="find_id_form_email"
                            name="email"
                            placeholder="이메일"
                            autofocus
                    /></label>
                    <label for="find_id_form_name"
                    ><input
                            type="text"
                            id="find_id_form_name"
                            name="name"
                            placeholder="이름"
                    /></label>
                </div>
                <button type="button" id="confirm">가입여부확인</button>
            </div>
            <ul class="find_id_findAndRegInfo">

                <li><a href="/WYW/users/findpwd">비밀번호 찾기</a></li>
                <li>|</li>
                <li><a href=/WYW/users/findpwd">회원가입</a></li>
            </ul>
        </form>
    </div>
</div>

<%--    <form id="findIdForm" action="/WYW/users/">--%>
<%--      <input  type="hidden" name="name">--%>
<%--      <input  type="hidden" name="email">--%>
<%--    </form>--%>

<jsp:include page="index_bottom.jsp" flush="false"/>

<script
        src="https://kit.fontawesome.com/6478f529f2.js"
        crossorigin="anonymous"
></script>
<script>
    $("#confirm").on("click", function () {
        const userEmail = $("#find_id_form_email").val();
        const userName = $("#find_id_form_name").val();

        let form = {
            email: userEmail,
            name: userName,
        }

        console.log(form);
        $.ajax({
            url: '/WYW/users/findid',
            type: 'POST',
            data: form,
            success: function (result) {
                if (result == "NOT_FOUND") {
                    alert("일치하는 정보가 없습니다.")
                } else {
                    alert("등록된 아이디는 " +  result + " 입니다.");
                }
            },
        })

    });
</script>
</body>
</html>
