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

            <div class="admin_wrap">
                <!-- 네비영역 -->
                <jsp:include page="../admin/asideMenu.jsp" flush="false"/>

                <div class="admin_content_wrap">
                    <div class="admin_content_wrap_title">배송 관리</div>
                    <c:if test="${listCheck != 'empty' }">
                        <table>
                            <tr>
                                <th>주문번호</th>
                                <th>주문자</th>
                                <th>주문상품</th>
                                <th>주문날짜</th>
                                <th>주문상태</th>
                                <th>관리</th>
                            </tr>

                            <c:forEach items="${list}" var="order">

                                <tr>
                                    <td class="align_center">${order.orderId}</td>
                                    <td class="align_center">${order.userId}</td>
                                    <td>
                                        <a href="/WYW/admin/orderdetail?userId=${order.userId}&orderId=${order.orderId}">
                                                ${order.orders[0].productName}
                                            <c:if test="${fn:length(order.orders)-1!=0}">
                                                외 ${fn:length(order.orders)-1}개 상품
                                            </c:if>
                                        </a>

                                    </td>
                                    <td class="align_end">
                                        <fmt:formatDate value="${order.orderDate}" pattern="YYYY/MM/dd HH:mm"/>
                                    </td>
                                    <td class="align_center">${order.orderState}</td>
                                    <td class="align_center">
                                        <c:if test="${order.orderState == '배송준비' }">
                                            <a href="/WYW/admin/orderdetail?userId=${order.userId}&orderId=${order.orderId}">
                                                <button class="manage_btn" type="button">배송관리</button>
                                            </a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>

                        </table>
                    </c:if>
                    <c:if test="${listCheck == 'empty'}">
                        <div class="table_empty">
                            등록된 주문내역이 없습니다.
                        </div>
                    </c:if>
                    <div class="search_wrap">
                        <form id="searchForm" action="/WYW/admin/orderlist" method="get">
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

                    <form id="moveForm" action="/WYW/admin/orderlist" method="get">
                        <input type="hidden" name="pageNum" value="${pageMarker.pagehandler.pageNum}">
                        <input type="hidden" name="amount" value="${pageMarker.pagehandler.amount}">
                        <input type="hidden" name="keyword" value="${pageMarker.pagehandler.keyword}">
                    </form>
                    <%--                    &lt;%&ndash;                    주문취소&ndash;%&gt;--%>
                    <%--                    <form id="deleteForm" action="/WYW/admin/orderCancel" method="post">--%>
                    <%--                        <input type="hidden" name="orderId">--%>
                    <%--                        <input type="hidden" name="userId">--%>
                    <%--                        <input type="hidden" name="pageNum" value="${pageMarker.pagehandler.pageNum}">--%>
                    <%--                        <input type="hidden" name="amount" value="${pageMarker.pagehandler.amount}">--%>
                    <%--                        <input type="hidden" name="keyword" value="${pageMarker.pagehandler.keyword}">--%>
                    <%--                    </form>--%>
                </div>

            </div>
        </div>
    </div>

</div>
<jsp:include page="../index_bottom.jsp" flush="false"/>
<script src="${pageContext.request.contextPath}/js/pagehandler.js"></script>
</body>
</html>
