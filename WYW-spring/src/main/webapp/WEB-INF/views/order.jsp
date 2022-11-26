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

<div class="order_main">
    <div class="order_main-outter">
        <h1 class="order_main_title">주문페이지</h1>
        <div class="addressInfo_div">
            <h1 class="order_title">배송지 지정</h1>
            <div class="addressInfo_button_div">
                <button class="address_btn address_btn_1" onclick="showAdress('1')" style="background-color: #3c3838;">
                    사용자 주소록
                </button>
                <button class="address_btn address_btn_2" onclick="showAdress('2')">직접 입력</button>
            </div>
            <div class="addressInfo_input_div_wrap">
                <div class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
                    <table>
                        <tr>
                            <th>
                                수취인
                            </th>
                            <td>
                                ${memberInfo.name}
                            </td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td>
                                ${memberInfo.address}
                            </td>
                        </tr>
                        <tr>
                            <th>연락처</th>
                            <td>
                                ${memberInfo.mobile}
                            </td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>
                                ${memberInfo.email}
                            </td>
                        </tr>

                    </table>
                </div>
                <div class="addressInfo_input_div addressInfo_input_div_2">
                    <table>
                        <tr>
                            <th>
                                수취인

                            </th>
                            <td>
                                <input type="text" id="info_name" required/>
                            </td>
                        </tr>
                        <tr>
                            <th id="addrth">주소</th>
                            <td id="addrtd">
                                <input type="text" name="APIPostcode" id="API_postcode" placeholder="우편번호">
                                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                                <input type="text" name="APIAddress" id="API_address" placeholder="주소"><br>
                                <input type="text" name="APIDetailAddress" id="API_detailAddress"
                                       placeholder="상세주소">
                                <input type="text" name="APIExtraAddress" id="API_extraAddress" placeholder="참고항목">
                            </td>
                        </tr>
                        <tr>
                            <th>연락처</th>
                            <td>
                                <input type="text" placeholder="전화번호">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <h1 class="order_table_title">주문정보</h1>
        <div class="order_table">

            <div class="order_items">
                <c:forEach items="${orderList}" var="ci">
                    <div class="td_width_1 cart_info_td">
                        <input type="hidden" class="individual_productPrice_input" value="${ci.price}">
                        <input type="hidden" class="individual_productCount_input" value="${ci.productCount}">
                        <input type="hidden" class="individual_totalPrice_input"
                               value="${ci.price * ci.productCount}">
                        <input type="hidden" class="individual_productId_input" value="${ci.productId}">
                            <%--                            <input type="hidden" class="individual_point_input" value="${ci.point}">--%>
                            <%--                            <input type="hidden" class="individual_totalPoint_input" value="${ci.totalPoint}">--%>
                    </div>
                    <div class="order_item">
                        <div class="item_img">
                            <c:choose>
                                <c:when test="${ci.imageVOList.size()==0}">
                                    <img src="<c:url value='/img/noimage.PNG'/>">
                                </c:when>

                                <c:when test="${ci.imageVOList!=null}">
                                    <img src="/WYW/display?fileName=${ci.imageVOList[0].upload_path}/${ci.imageVOList[0].uuid}_${ci.imageVOList[0].file_name}">
                                </c:when>
                            </c:choose>
                        </div>
                        <div class="item_info">
                            <div class="item_info_head">
                                <a href="<c:url value='/productDetail'/>?product_id=${ci.productId}">
                                    <h1> ${ci.name}</h1>
                                </a>
                            </div>
                            <h1>단가 : ￦ <fmt:formatNumber value="${ci.price}" pattern="###,###,###"/></h1>
                            <h1>수량 : ${ci.productCount}</h1>
                            <h1>합계 : ￦ <fmt:formatNumber value="${ci.totalPrice}" pattern="###,###,###"/></h1>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="order_result">
                <div class="total_wrap">
                    <div class="total_wrap_totalPrice_span">
                        <div class="total_wrap_left">총 상품 가격</div>
                        <div class="total_wrap_right">
                            <span class="totalPrice_span"></span> 원
                        </div>
                    </div>
                    <div class="total_wrap_delivery_price">
                        <div class="total_wrap_left">배송비</div>
                        <div class="total_wrap_right">
                            <span class="delivery_price"></span>원
                        </div>
                    </div>
                    <div class="total_wrap_totalKind_span">
                        <div class="total_wrap_left">총 주문 상품수</div>
                        <div class="total_wrap_right">
                            <span class="totalKind_span"></span>종
                            <span class="totalCount_span"></span>개 물품
                        </div>
                    </div>
                    <div class="total_wrap_finalTotalPrice_span">
                        <div class="total_wrap_left" style="font-size: 18px; font-weight: bold">총 결제 예상 금액</div>
                        <div class="total_wrap_right">
                            <span class="finalTotalPrice_span"></span> 원
                        </div>
                    </div>
                    <div class="total_wrap_totalPoint_span">
                        <div class="total_wrap_left">총 적립 예상 마일리지</div>
                        <div class="total_wrap_right">
                            <span class="totalPoint_span"></span> 원
                            <span>(총 금액의 0.5%)</span>
                        </div>
                    </div>
                    <div class="order_result_btn_section">
                        <button type="button">결제하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="index_bottom.jsp" flush="false"/>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/js/addressAPI.js"></script>
<script>
    function showAdress(className) {
        $(".addressInfo_input_div").css('display', 'none');
        $(".addressInfo_input_div_" + className).css('display', 'block');

        $(".address_btn").css('backgroundColor', '#555');
        $(".address_btn_" + className).css('backgroundColor', '#3c3838');
    }
</script>
<script>
    $(document).ready(function () {

        let totalPrice = 0;				// 총 가격
        let totalCount = 0;				// 총 갯수
        let totalKind = 0;				// 총 종류
        let totalPoint = 0;				// 총 마일리지
        let deliveryPrice = 0;			// 배송비
        let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)

        $(".cart_info_td").each(function (index, element) {

            // 총 가격
            totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
            // 총 갯수
            totalCount += parseInt($(element).find(".individual_productCount_input").val());
            // 총 종류
            totalKind += 1;
            // 총 마일리지
            totalPoint += parseInt(totalPrice) * 0.005;

        });

        /* 배송비 결정 */
        if (totalPrice >= 100000) {
            deliveryPrice = 0;
        } else if (totalPrice == 0) {
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
