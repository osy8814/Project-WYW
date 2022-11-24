<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<div class="cart_main">
    <div class="cart_main-outter">
        <h1 class="cart_main_title">장바구니</h1>
        <div class="content_totalCount_section">

            <table class="subject_table">


                <tr>
                    <th class="td_width_1"></th>
                    <th class="td_width_2">이미지</th>
                    <th class="td_width_3">상품명</th>
                    <th class="td_width_4">가격</th>
                    <th class="td_width_4">수량</th>
                    <th class="td_width_4">합계</th>
                    <th class="td_width_4">삭제</th>
                </tr>

            </table>
            <table class="cart_table">
                <caption>표 내용 부분</caption>
                <tbody>
                <c:forEach items="${cartInfo}" var="ci">
                    <tr>
                        <td class="td_width_1 cart_info_td">
                            <input type="hidden" class="individual_bookPrice_input" value="${ci.price}">
                            <input type="hidden" class="individual_bookCount_input" value="${ci.product_count}">
                            <input type="hidden" class="individual_totalPrice_input" value="${ci.price * ci.product_count}">
<%--                            <input type="hidden" class="individual_point_input" value="${ci.point}">--%>
<%--                            <input type="hidden" class="individual_totalPoint_input" value="${ci.totalPoint}">--%>
                        </td>
                        <td class="td_width_2"></td>
                        <td class="td_width_3">${ci.name}</td>
                        <td class="td_width_4 price_td">
                            <del>정가 : <fmt:formatNumber value="${ci.price}" pattern="#,### 원"/></del>
                            <br>
                                <%--                            마일리지 : <span class="green_color"><fmt:formatNumber value="${ci.point}" pattern="#,###" /></span>--%>
                        </td>
                        <td class="td_width_4 table_text_align_center">
                            <div class="table_text_align_center quantity_div">
                                <input type="text" value="${ci.product_count}" class="quantity_input">
                                <button class="quantity_btn plus_btn">+</button>
                                <button class="quantity_btn minus_btn">-</button>
                            </div>
                            <a class="quantity_modify_btn">변경</a>
                        </td>
                        <td class="td_width_4 table_text_align_center">
                            <fmt:formatNumber value="${ci.price * ci.product_count}" pattern="#,### 원"/>
                        </td>
                        <td class="td_width_4 table_text_align_center delete_btn">
                            <button>삭제</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <table class="list_table">
            </table>
        </div>
        <!-- 가격 종합 -->
        <div class="content_total_section">
            <div class="total_wrap">
                <table>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>총 상품 가격</td>
                                    <td>
                                        <span class="totalPrice_span">70000</span> 원
                                    </td>
                                </tr>
                                <tr>
                                    <td>배송비</td>
                                    <td>
                                        <span class="delivery_price">3000</span>원
                                    </td>
                                </tr>
                                <tr>
                                    <td>총 주문 상품수</td>
                                    <td><span class="totalKind_span"></span>종 <span class="totalCount_span"></span>개 물품
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <div class="boundary_div">구분선</div>
                <table>
                    <tr>
                        <td>
                            <table>
                                <tbody>
                                <tr>
                                    <td>
                                        <strong>총 결제 예상 금액</strong>
                                    </td>
                                    <td>
                                        <span class="finalTotalPrice_span">70000</span> 원
                                    </td>
                                </tr>

                            </table>
                        </td>
                        <td>
                            <table>
                                <tbody>
                                <tr>
                                    <td>
                                        <strong>총 적립 예상 마일리지</strong>

                                    </td>
                                    <td>
                                        <span class="totalPoint_span">70000</span> 원
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <!-- 구매 버튼 영역 -->
        <div class="content_btn_section">
            <a>주문하기</a>
        </div>
    </div>
</div>

<jsp:include page="index_bottom.jsp" flush="false"/>
<script>
    $(document).ready(function(){

        let totalPrice = 0;				// 총 가격
        let totalCount = 0;				// 총 갯수
        let totalKind = 0;				// 총 종류
        let totalPoint = 0;				// 총 마일리지
        let deliveryPrice = 0;			// 배송비
        let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)

        $(".cart_info_td").each(function(index, element){

            // 총 가격
            totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
            // 총 갯수
            totalCount += parseInt($(element).find(".individual_bookCount_input").val());
            // 총 종류
            totalKind += 1;
            // 총 마일리지
            totalPoint += parseInt($(element).find(".individual_totalPoint_input").val());

        });

        /* 배송비 결정 */
        if(totalPrice >= 100000){
            deliveryPrice = 0;
        } else if(totalPrice == 0){
            deliveryPrice = 0;
        } else {
            deliveryPrice = 20000;
        }

        /* 최종 가격 */
        finalTotalPrice = totalPrice + deliveryPrice;

        /* 값 삽입 */
        // 총 가격
        $(".totalPrice_span").text(totalPrice.toLocaleString());
        // 총 갯수
        $(".totalCount_span").text(totalCount);
        // 총 종류
        $(".totalKind_span").text(totalKind);
        // 총 마일리지
        $(".totalPoint_span").text(totalPoint.toLocaleString());
        // 배송비
        $(".delivery_price").text(deliveryPrice);
        // 최종 가격(총 가격 + 배송비)
        $(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());

    });
</script>

</body>
</html>
