<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="/WYW/img/WYWlogo.png"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?after"/>
    <script src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/35.3.0/classic/ckeditor.js"></script>
    <title>WYW</title>
    <style></style>
</head>

<body>
<div class="top-loginSet">
    <ul id="top-loginSet-list">
        <c:if test="${loggedInUser == null}">
            <li><a href="<c:url value='/users/login.do'/>">Login</a></li>
            <li><a href="<c:url value='/users/signup'/>">SignUp</a></li>
        </c:if>
        <c:if test="${loggedInUser != null}">
            <li>
                    ${loggedInUser.name}님 환영합니다.
            </li>
            <li><a id="nav_logout" href="#">LogOut</a></li>
            <li><a href="mypage.html">My Page</a></li>
            <c:if test="${loggedInUser.isAdmin}">
                <li><a href="<c:url value='/admin/productslist'/>">관리자페이지</a></li>
            </c:if>
        </c:if>
    </ul>
    <div id="top-loginSet__iconSet">
        <a href="#"
        ><i class="fas fa-search"></i>
            <form action="#">
                <input
                        type="text"
                        class="hidden"
                        id="search"
                        name="search"
                        placeholder="검색어를 입력하세요."
                />
            </form>
        </a>

    </div>
</div>
<div class="logoSet">
    <h1 class="logoSet__title">
        <a href="${pageContext.request.contextPath}">
            <div class="logoSet__logo"></div>
            <strong style="color: #32343e; margin-left: 15px">W</strong>HAT
            <strong style="color: #32343e; margin-left: 15px">Y</strong>OU
            <strong style="color: #32343e; margin-left: 15px">W</strong>ANT
        </a>
    </h1>
</div>
<div class="nav">
    <ul class="nav__topNav" id="topNav">
        <li>
            <a href="#">COMPANY</a>
            <ul id="company_list">
                <li><a href="<c:url value='/introduce'/>">INTRODUCE</a></li>
            </ul>
        </li>
        <li>
            <a href="#">SHOP</a>
            <ul id="shop_list">
                <li><a href="${pageContext.request.contextPath}/product.all">ALL</a></li>
                <li><a href="${pageContext.request.contextPath}/product.new">NEW</a></li>
                <li><a href="${pageContext.request.contextPath}/product.best">BEST</a></li>
                <li><a href="#">BEDROOM</a></li>
                <li><a href="#">KITCHEN</a></li>
                <li><a href="#">BATHROOM</a></li>
            </ul>
        </li>
        <li><a href="#">GALLERY</a></li>
        <li>
            <a href="#">COMMUNITY</a>
            <ul id="community_List">
                <li><a href="#">NOTICE</a></li>
                <li><a href="<c:url value='/board/list'/>">FREES</a></li>
                <li><a href="#">F&A</a></li>
            </ul>
        </li>
    </ul>
</div>

<script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
<script src="<c:url value="/js/search.js"/>"></script>
<script src="<c:url value="/js/navScroll.js"/>"></script>
<script>
    $("#nav_logout").click(function () {

        if (confirm("로그아웃 하시겠습니까?")) {
            $.ajax({
                type: "POST",
                url: `/WYW/users/logout`,
                success: function (data) {
                    document.location.reload();
                }
            });
        }
    });
</script>
</body>
</html>
