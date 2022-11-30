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

<jsp:include page="../index_top.jsp" flush="false"/>

<div class="wish_main">
    <div class="wish_main-outter">
        <h1 class="wish_main_title">위시 리스트</h1>
        <div class="content_totalCount_section">
            <table class="subject_table">
                <tr>
                    <th class="td_width_1"></th>
                    <th class="td_width_2">이미지</th>
                    <th class="td_width_3">상품명</th>
                    <th class="td_width_4">가격</th>
                    <th class="td_width_4">재고</th>
                    <th class="td_width_4">삭제</th>
                </tr>
            </table>
            <table class="wish_table">
                <c:if test="${wishInfo == 'empty'}">
                    <div class="table_empty">
                        등록된 관심 상품이 없습니다.
                    </div>
                </c:if>
                <c:if test="${wishInfo != 'empty'}">
                    <c:forEach items="${wishInfo}" var="wishItem">
                        <tr>>
                            <td class="td_width_1 wish_info_td">
                                <input type="hidden" class="individual_productPrice_input" value="${wishItem.price}">
                                <input type="hidden" class="individual_productId_input" value="${wishItem.product_id}">
                            </td>
                            <td class="td_width_2">
                                <c:choose>
                                    <c:when test="${wishItem.imageVOList.size()==0}">
                                        <img src="<c:url value='/img/noimage.PNG'/>">
                                    </c:when>

                                    <c:when test="${wishItem.imageVOList!=null}">
                                        <img src="/WYW/display?fileName=${wishItem.imageVOList[0].upload_path}/${wishItem.imageVOList[0].uuid}_${wishItem.imageVOList[0].file_name}">
                                    </c:when>
                                </c:choose>
                            </td>
                            <td class="td_width_3">
                                <a href="<c:url value='/productDetail'/>?product_id=${wishItem.product_id}">
                                        ${wishItem.name}
                                </a>
                            </td>
                            <td class="td_width_4 price_td">
                                <del>정가 : <fmt:formatNumber value="${wishItem.price}" pattern="#,### 원"/></del>
                                <br>
                            </td>
                            <td class="td_width_4 table_text_align_center">
                                <h1>${wishItem.stock} EA</h1>
                            </td>
                            <td class="td_width_4 table_text_align_center delete_btn">
                                <button class="cart_product_btn manage_btn" type="button" data-id="${wishItem.product_id}" data-stock="${wishItem.stock}">장바구니추가</button>
                                <button class="delete_product_btn manage_btn" type="button" data-id="${wishItem.id}">삭제</button>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
            <table class="list_table">
            </table>
        </div>
    </div>
</div>

<!--삭제-->
<form action="/WYW/wish/delete" method="post" class="quantity_delete_form">
    <input type="hidden" name="id" class="delete_wishId">
    <input type="hidden" name="user_id" value="${loggedInUser.userId}">
</form>

<jsp:include page="../index_bottom.jsp" flush="false"/>
<script>

    // 장바구니 클릭
    $(".cart_product_btn").on("click", function (e) {

        let form = {
            user_id: '${loggedInUser.userId}',
            product_id: $(this).data("id"),
            product_count: 1,
        }

        if ($(this).data("stock") === "0") {
            alert("죄송합니다. 상품의 재고가 모자랍니다. 나중에 다시 이용해 주십시오.");
            return false;
        }
        console.log(form);
        $.ajax({
            url: '/WYW/cart/add',
            type: 'POST',
            data: form,
            dataType: 'json',
            success: function (result) {
                console.log(result);
                cartAlert(result);
            },
        })
    });

    function cartAlert(result) {
        if (result == '0') {
            alert("장바구니에 추가를 하지 못하였습니다.");
        } else if (result == '1') {
            alert("장바구니에 추가되었습니다.");
        } else if (result == '2') {
            alert("장바구니에 이미 추가되어 있습니다.");
        } else if (result == '5') {
            alert("로그인이 필요합니다.");
        }
    }

    /* 위시 삭제 버튼 */
    $(".delete_product_btn").on("click", function () {
        let wishId = $(this).data("id");
        $(".delete_wishId").val(wishId);
        if (confirm("위시리스트에서 삭제하시겠습니까?")) {
            $(".quantity_delete_form").submit();
        }
    });

</script>
</body>
</html>
