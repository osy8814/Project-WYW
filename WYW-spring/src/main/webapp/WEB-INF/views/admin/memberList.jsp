<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="${pageContext.request.contextPath}/img/WYWlogo.png"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?after"/>
    <title>WYW</title>
    <style></style>
</head>

<body>

<jsp:include page="../index_top.jsp" flush="false"/>

<div class="admin_main">

    <div class="wrapper">


        <div class="wrap">
            <div class="wrap_title">관리자 페이지</div>

            <div class="user_wrap">
                <!-- 네비영역 -->
                <jsp:include page="../admin/asideMenu.jsp" flush="false"/>

                <div class="user-list-wrap">
                    <h1 class="user-list-wrap_title">회원 관리</h1>
                    <c:if test="${list != 'empty' }">

                        <table class="user-list-table">
                            <tr>
                                <th style="width: 100px">아이디</th>
                                <th style="width: 100px">이름</th>
                                <th style="width: 100px">가입일자</th>
                                <th style="width: 100px">활성화상태</th>
                                <th style="width: 100px">관리</th>
                            </tr>
                            <c:forEach items="${list}" var="user">
                                <tr>
                                    <td class="align_center">${user.userId}</td>
                                    <td class="align_center">${user.name}</td>
                                    <td class="align_end">
                                        <fmt:formatDate value="${user.createdAt}" pattern="YYYY/MM/dd HH:mm"/>
                                    </td>
                                    <td class="align_center">
                                        <c:if test="${user.active==true}">
                                            활성
                                        </c:if>
                                        <c:if test="${user.active==false}">
                                            비활성
                                        </c:if>
                                    </td>
                                    <td class="align_center">
                                        <a href="/WYW/admin/memberdetail?userId=${user.userId}">
                                            <button class="manage_btn" type="button">회원관리</button>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>

                        </table>
                    </c:if>
                    <c:if test="${list == 'empty'}">
                        <div class="table_empty">
                            등록된 회원이 없습니다.
                        </div>
                    </c:if>
                    <div class="search_wrap">
                        <form id="searchForm" action="/WYW/admin/membermanagement" method="get">
                            <div class="search_input">
                                <input type="text" name="keyword"
                                       value='<c:out value="${pageMarker.pagehandler.keyword}"></c:out>'>
                                <input type="hidden" name="pageNum"
                                       value='<c:out value="${pageMarker.pagehandler.pageNum }"></c:out>'>
                                <input type="hidden" name="amount" value='${pageMarker.pagehandler.amount}'>
                                <button class='btn search_btn'>검 색</button>
                            </div>
                        </form>
                    </div>

                    <div class="pageMarker_wrap">
                        <ul class="pageMarker">
                            <!-- 이전 버튼 -->
                            <c:if test="${pageMarker.prev}">
                                <li class="pageMarker_btn prev">
                                    <a href="${pageMarker.pageStart - 1}">이전</a>
                                </li>
                            </c:if>


                            <!-- 페이지 번호 -->
                            <c:forEach begin="${pageMarker.pageStart}" end="${pageMarker.pageEnd}" var="num">
                                <li class="pageMarker_btn ${pageMarker.pagehandler.pageNum == num ? "active":""}">
                                    <a href="${num}">${num}</a>
                                </li>
                            </c:forEach>

                            <!-- 다음 버튼 -->
                            <c:if test="${pageMarker.next}">
                                <li class="pageMarker_btn next">
                                    <a href="${pageMarker.pageEnd + 1 }">다음</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>

                    <form id="moveForm" action="/WYW/admin/membermanagement" method="get">
                        <input type="hidden" name="pageNum" value="${pageMarker.pagehandler.pageNum}">
                        <input type="hidden" name="amount" value="${pageMarker.pagehandler.amount}">
                        <input type="hidden" name="keyword" value="${pageMarker.pagehandler.keyword}">
                    </form>
                </div>

            </div>
        </div>
    </div>

</div>
<jsp:include page="../index_bottom.jsp" flush="false"/>
<script src="${pageContext.request.contextPath}/js/pagehandler.js"></script>
<script>
    let msg = "${msg}"
    if (msg == "edit_ok") {
        alert("회원정보가 수정되었습니다.");
    }
</script>
</body>
</html>
