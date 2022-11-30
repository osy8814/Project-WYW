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
                    <div class="admin_content_wrap_title">주문 정보 : ${orderInfo.orderId}</div>
                    <div class="">
                        <table>
                            <tr>
                                <th>상품번호</th>
                                <th>이미지</th>
                                <th>상품명</th>
                                <th>주문정보</th>

                            </tr>
                            <c:forEach items="${orderItems}" var="order">
                                <tr>
                                    <td class="align_center">${order.productId}</td>

                                    <td class="admin_product_img align_center">
                                        <c:choose>
                                            <c:when test="${order.imageVOList.size()==0}">
                                                <img src="<c:url value='/img/noimage.PNG'/>">
                                            </c:when>

                                            <c:when test="${order.imageVOList!=null}">
                                                <img src="/WYW/display?fileName=${order.imageVOList[0].upload_path}/${order.imageVOList[0].uuid}_${order.imageVOList[0].file_name}">
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td class="align_center">
                                            ${order.productName}
                                    </td>
                                    <td class="align_center">
                                        <h1>주문수량 : ${order.productCount} 개</h1>
                                        <h1>
                                            상품단가 : <fmt:formatNumber value="${order.price}" pattern="###,###,###,### 원"/>
                                        </h1>
                                        <h1 style="font-weight: bold">
                                            합계가격 : <fmt:formatNumber value="${order.totalPrice}" pattern="###,###,###,### 원"/>
                                        </h1>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>

                        <div class="signUpMain__register__userInfo">

                            <div class="orderDetailMain__register__userInfo">
                                <table>
                                    <tr>
                                        <th style="width: 100px">수취인</th>
                                        <td>${orderInfo.receiver}</td>
                                    </tr>
                                    <tr>
                                        <th>휴대전화</th>
                                        <td>${orderInfo.mobile}</td>
                                    </tr>
                                    <tr>
                                        <th>배송주소</th>
                                        <td>${orderInfo.address1},${orderInfo.address2},${orderInfo.address3}</td>
                                    </tr>
                                    <tr>
                                        <th>주문요청일</th>
                                        <td><fmt:formatDate value="${orderInfo.orderDate}"
                                                            pattern="YYYY/MM/dd HH:mm"/></td>
                                    </tr>
                                    <tr>
                                        <th>주문금액</th>
                                        <td>
                                            <fmt:formatNumber value="${orderInfo.orderSalePrice}" pattern="###,###,###,### 원"/>
                                            (배송비 : <fmt:formatNumber value="${orderInfo.deliveryCost}" pattern="###,###,###,### 원"/>)
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>주문상태</th>
                                        <td>${orderInfo.orderState}</td>
                                    </tr>
                                </table>
                            </div>

                            <div class="manage_btn_set">
                                <c:if test="${orderInfo.orderState == '배송준비' }">
                                    <button class="shipping_btn manage_btn" data-userid="${orderInfo.userId}"
                                            data-orderid="${orderInfo.orderId}">배송시작
                                    </button>
                                    <button class="delete_btn manage_btn" data-userid="${orderInfo.userId}"
                                            data-orderid="${orderInfo.orderId}">진행취소
                                    </button>
                                </c:if>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

</div>
<form id="deleteForm" action="/WYW/admin/orderCancel" method="post">
    <input type="hidden" name="orderId">
    <input type="hidden" name="userId">
</form>
<form id="shippingForm" action="/WYW/admin/shipping" method="post">
    <input type="hidden" name="orderId">
    <input type="hidden" name="userId">
</form>
<jsp:include page="../index_bottom.jsp" flush="false"/>
<script src="${pageContext.request.contextPath}/js/pagehandler.js"></script>
<script>
    // 주문취소
    $(".delete_btn").on("click", function (e) {
        if(!confirm("주문진행을 취소하시겠습니까?")){
            return false;
        }
        e.preventDefault();

        let orderid = $(this).data("orderid");
        let userid = $(this).data("userid");

        $("#deleteForm").find("input[name='orderId']").val(orderid);
        $("#deleteForm").find("input[name='userId']").val(userid);

        $("#deleteForm").submit();
    });

    // 배송시작
    $(".shipping_btn").on("click", function (e) {
        if(!confirm("주문을 진행하시겠습니까?")){
            return false;
        }
        e.preventDefault();

        let orderid = $(this).data("orderid");
        let userid = $(this).data("userid");

        $("#shippingForm").find("input[name='orderId']").val(orderid);
        $("#shippingForm").find("input[name='userId']").val(userid);

        $("#shippingForm").submit();
    });
</script>
</body>
</html>
