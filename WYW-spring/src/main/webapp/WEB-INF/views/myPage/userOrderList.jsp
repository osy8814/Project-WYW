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

<div class="user-order-list_main">
    <div class="user-order-list_main-outter">
        <h1 class="user-order-list_main_title">주문내역</h1>
        <div class="before-manage_table-box">
            <h1 class="before-manage_table-box_title">배송준비</h1>

            <c:choose>
                <c:when test="${readyList=='empty'}">
                    <div class="order_empty">
                        등록된 주문내역이 없습니다.
                    </div>
                </c:when>
                <c:when test="${readyList!='empty'}">
                    <table>
                        <tr>
                            <th class="width200px">주문번호</th>
                            <th class="width100px">주문자</th>
                            <th class="width300px">주문상품</th>
                            <th class="width300px">주문날짜</th>
                            <th class="width100px">주문상태</th>
                            <th class="width100px"></th>
                        </tr>
                        <c:forEach items="${readyList}" var="order">
                            <tr>
                                <td class="align_center">${order.orderId}</td>
                                <td class="align_center">${order.userId}</td>
                                <td style="padding-left:10px">
                                    <a href="/WYW/mypage/orderdetail?userId=${order.userId}&orderId=${order.orderId}">
                                         [${order.orders[0].productName}]
                                        <c:if test="${fn:length(order.orders)-1!=0}">
                                            외 ${fn:length(order.orders)-1}개 상품
                                        </c:if>
                                    </a>
                                </td>
                                <td class="align_center">
                                    <fmt:formatDate value="${order.orderDate}" pattern="YYYY/MM/dd HH:mm"/>
                                </td>
                                <td class="align_center" style="font-weight: bold">${order.orderState}</td>
                                <td class="align_center">
                                    <a href="/WYW/mypage/orderdetail?userId=${order.userId}&orderId=${order.orderId}">
                                        <button class="manage_btn" type="button">주문상세</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:when>
            </c:choose>

        </div>

        <div class="after-manage_table-box">
            <h1 class="after-manage_table-box_title">처리완료</h1>

            <c:choose>
                <c:when test="${completeList=='empty'}">
                    <div class="order_empty">
                        등록된 주문내역이 없습니다.
                    </div>
                </c:when>
                <c:when test="${completeList!='empty'}">
                    <table>
                        <tr>
                            <th class="width200px">주문번호</th>
                            <th class="width100px">주문자</th>
                            <th class="width300px">주문상품</th>
                            <th class="width300px">주문날짜</th>
                            <th class="width100px">주문상태</th>
                            <th class="width100px"></th>
                        </tr>
                        <c:forEach items="${completeList}" var="order">

                            <tr>
                                <td class="align_center">${order.orderId}</td>
                                <td class="align_center">${order.userId}</td>
                                <td style="padding-left:10px">
                                    <a href="/WYW/admin/orderdetail?userId=${order.userId}&orderId=${order.orderId}">
                                         [${order.orders[0].productName}]
                                        <c:if test="${fn:length(order.orders)-1!=0}">
                                            외 ${fn:length(order.orders)-1}개 상품
                                        </c:if>
                                    </a>
                                </td>
                                <td class="align_center">
                                    <fmt:formatDate value="${order.orderDate}" pattern="YYYY/MM/dd HH:mm"/>
                                </td>
                                <td class="align_center" style="font-weight: bold">${order.orderState}</td>
                                <td class="align_center">
                                    <a href="/WYW/mypage/orderdetail?userId=${order.userId}&orderId=${order.orderId}">
                                        <button class="manage_btn" type="button">주문상세</button>
                                    </a>
                                </td>
                            </tr>

                        </c:forEach>
                    </table>
                </c:when>
            </c:choose>

        </div>
    </div>
</div>
<jsp:include page="../index_bottom.jsp" flush="false"/>
<script src="${pageContext.request.contextPath}/js/pagehandler.js"></script>
</body>
</html>
