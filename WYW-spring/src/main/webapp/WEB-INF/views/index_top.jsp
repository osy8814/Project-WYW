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
            <form id="topSearchForm" action="/WYW/product.all" method="get">
                <div class="search_input">
                    <input
                            type="text"
                            class="hidden"
                            id="search"
                            name="keyword"
                            placeholder="검색어를 입력하세요."
                            value="<c:out value="${pageMarker.pagehandler.keyword}"></c:out>">

                    <input type="hidden" name="pageNum"
                           value="1">
                    <input type="hidden" name="amount" value="12">
                </div>
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
            <a href="#">회사소개</a>
            <ul id="company_list">
                <li><a href="<c:url value='/introduce'/>">소개글</a></li>
            </ul>
        </li>
        <li>
            <a href="#">쇼핑몰</a>
            <ul id="shop_list">
                <li><a href="<c:url value='/product.all'/>">모든상품</a></li>
                <li><a href="<c:url value='/product.new'/>">신상품</a></li>
                <li><a href="<c:url value='/product.best'/>">인기상품</a></li>
                <c:forEach items="${categorys}" var="cate">
                    <c:if test="${cate.level==1}">
                        <li><a href="<c:url value='/products?category=${cate.cate_code}'/>">${cate.cate_name}</a></li>
                    </c:if>

                </c:forEach>
            </ul>
        </li>
        <li><a href="#">갤러리</a></li>
        <li>
            <a href="#">게시판</a>
            <ul id="community_List">
                <li><a href="#">공지사항</a></li>
                <li><a href="<c:url value='/board/list'/>">자유게시판</a></li>
                <li><a href="#">자주하는 질문</a></li>
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
