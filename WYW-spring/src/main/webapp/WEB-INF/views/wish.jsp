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

                <c:forEach items="${wishInfo}" var="ci">
                    <tr>
                        <td class="td_width_1 wish_info_td">
                            <input type="hidden" class="individual_productPrice_input" value="${ci.price}">
                            <input type="hidden" class="individual_productId_input" value="${ci.product_id}">
                        </td>
                        <td class="td_width_2">
                            <c:choose>
                                <c:when test="${ci.imageVOList.size()==0}">
                                    <img src="<c:url value='/img/noimage.PNG'/>">
                                </c:when>

                                <c:when test="${ci.imageVOList!=null}">
                                    <img src="/WYW/display?fileName=${ci.imageVOList[0].upload_path}/${ci.imageVOList[0].uuid}_${ci.imageVOList[0].file_name}">
                                </c:when>
                            </c:choose>
                        </td>
                        <td class="td_width_3">
                            <a href="<c:url value='/productDetail'/>?product_id=${ci.product_id}">
                                    ${ci.name}
                            </a>
                        </td>
                        <td class="td_width_4 price_td">
                            <del>정가 : <fmt:formatNumber value="${ci.price}" pattern="#,### 원"/></del>
                            <br>
                                <%--                            마일리지 : <span class="green_color"><fmt:formatNumber value="${ci.point}"--%>
                                <%--                                                                               pattern="#,###"/></span>--%>
                        </td>
                        <td class="td_width_4 table_text_align_center">
                            <h1>${ci.stock} EA</h1>
                        </td>
                        <td class="td_width_4 table_text_align_center delete_btn">
                            <button class="delete_product_btn" type="button" data-id="${ci.id}">삭제</button>
                        </td>
                    </tr>
                </c:forEach>

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

<jsp:include page="index_bottom.jsp" flush="false"/>
<script>

    /* 장바구니 삭제 버튼 */
    $(".delete_product_btn").on("click", function () {
        let wishId = $(this).data("id");
        $(".delete_wishId").val(wishId);
        if (confirm("장바구니에서 삭제하시겠습니까?")) {
            $(".quantity_delete_form").submit();
        }
    });

</script>
</body>
</html>
