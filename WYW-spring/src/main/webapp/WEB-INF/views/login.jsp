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
    <title>WYW</title>
    <style></style>
</head>

<body>

<jsp:include page="index_top.jsp" flush="false"/>

<div class="login_main">
    <div class="login_main-outter">
        <h1 class="login_main_title">로그인</h1>
        <form method="post" class="login_main_form">
            <h1 class="login_main_form_title">
                <i class="fas fa-unlock-alt"></i>회원 로그인
            </h1>

            <div class="login_main_form_inputAndBtn">
                <div class="login_main_form_idAndPwd">
                    <label for="login_main_form-id"
                    ><input
                            type="text"
                            id="login_main_form-id"
                            name="userId"
                            placeholder="아이디"
                            value="${inputId}"
                            autofocus
                    /></label>
                    <label for="login_main_form-pwd"
                    ><input
                            type="password"
                            id="login_main_form-pwd"
                            name="password"
                            placeholder="비밀번호"
                    /></label>
                </div>
                <button id="confirm">로그인</button>
            </div>
            <c:if test="${msg=='false'}">
                <span style="font-weight: bold">아이디 혹은 비밀번호가 일치하지 않습니다.</span>
            </c:if>
            <ul class="login_main_findAndRegInfo">
                <li><a href="find_id.html">아이디 찾기</a></li>
                <li>|</li>
                <li><a href="find_pwd.jsp">비밀번호 찾기</a></li>
                <li>|</li>
                <li><a href="<c:url value='/users/signup'/>">회원가입</a></li>
            </ul>
        </form>
    </div>
</div>

<jsp:include page="index_bottom.jsp" flush="false"/>
<script>
    let msg = "${msg}"
    if(msg=='inactive'){
        alert("사용이 중지된 계정입니다. 관리자에게 문의 하십시오.");
    }

</script>
</body>
</html>
