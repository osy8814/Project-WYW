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

<div class="products_main">
    <div class="products_main-outter">
        <h1 class="main__new-title"><span>NEW</span> PRODUCT</h1>
        <h1 class="products_main_title" style="width: 100%;">검색결과 총 : ${totalResult} 개</h1>
        <c:if test="${listCheck != 'empty' }">
        <div class="products_diplay">
            <c:forEach items="${list}" var="product">

            <div class="product">
                <a href="<c:url value='/productDetail'/>?product_id=${product.id}">
                    <div class="product_main-image">
                        <img src="/WYW/display?fileName=${product.imageVOList[0].upload_path}/${product.imageVOList[0].uuid}_${product.imageVOList[0].file_name}">
                    </div>
                </a>
                <div class="product_infomation">
                    <h1 class="product_name">${product.name}</h1>
                    <h1 class="product_category">${product.cate_name}</h1>
                    <span class="product_price">
                            ￦ <fmt:formatNumber value="${product.price}" pattern="###,###,###"/>
                            </span>
                    <h1 class="product_rating">${product.ratingAvg} / 5.0 </h1>
                    <div class="product_bottom-button">
                        <i class="fas fa-shopping-cart cart_btn" data-stock="${product.stock}"
                           data-productId="${product.id}"></i>
                        <c:if test="${product.wishList==null}">
                            <i class="fas fa-heart wish_btn"
                               data-productId="${product.id}"></i>
                        </c:if>
                        <c:if test="${product.wishList==[]}">
                            <i class="fas fa-heart wish_btn"
                               data-productId="${product.id}"></i>
                        </c:if>
                        <c:if test="${product.wishList!=[]}">
                            <c:set var="isWish" value='false'/>
                            <c:forEach items="${product.wishList}" var="wish" varStatus="status">
                                <c:choose>
                                    <c:when test="${wish.product_id==product.id}">
                                        <c:set var="isWish" value='true'/>
                                        <i class="fas fa-heart wish_btn activeWish"
                                           data-productId="${product.id}"></i>
                                    </c:when>
                                    <c:when test="${status.last && isWish=='false' && wish.product_id!=product.id}">
                                        <c:set var="isWish" value='false'/>
                                        <i class="fas fa-heart wish_btn"
                                           data-productId="${product.id}"></i>
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>

            </c:forEach>
        </div>
        </c:if>
        <c:if test="${listCheck == 'empty'}">
            <div class="table_empty">
                등록된 상품이 없습니다.
            </div>
        </c:if>
        <div class="search_wrap">
            <form id="searchForm" action="/WYW/product.new" method="get">
                <div class="search_input">
                    <input type="text" name="keyword" value='<c:out value="${pageMarker.pagehandler.keyword}"></c:out>'>
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

        <form id="moveForm" action="/WYW/product.new" method="get">
            <input type="hidden" name="pageNum" value="${pageMarker.pagehandler.pageNum}">
            <input type="hidden" name="amount" value="${pageMarker.pagehandler.amount}">
            <input type="hidden" name="keyword" value="${pageMarker.pagehandler.keyword}">
        </form>


    </div>
</div>

<jsp:include page="../index_bottom.jsp" flush="false"/>
<script src="${pageContext.request.contextPath}/js/pagehandler.js"></script>
<script>
    // 장바구니 클릭
    $(".cart_btn").on("click", function (e) {
        if ("${loggedInUser.userId}" === "") {
            alert("로그인 후에 이용해 주십시오.");
            return false
        }

        let form = {
            user_id: '${loggedInUser.userId}',
            product_id: $(this).data("productid"),
            product_count: 1,
        }

        let stock = $(this).data("stock");
        if (stock == "0") {
            alert("죄송합니다. 상품의 재고가 모자랍니다. 나중에 다시 이용해 주십시오.");
            return false;
        }

        $.ajax({
            url: '/WYW/cart/add',
            type: 'POST',
            data: form,
            dataType: 'json',
            success: function (result) {
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


    // 찜하기 클릭
    $(".wish_btn").on("click", function (e) {
        if ("${loggedInUser.userId}" === "") {
            alert("로그인 후에 이용해 주십시오.");
            return false
        }

        let productId = $(this).data("productid")

        const wishForm = {
            user_id: '${loggedInUser.userId}',
            product_id: productId,
        }

        $(this).addClass("activeWish");
        $.ajax({
            url: '/WYW/wish/add',
            type: 'POST',
            data: wishForm,
            dataType: 'json',
            success: function (result) {
                wishAlert(productId, result);
            },

        })
    });

    function wishAlert(productId, result) {

        if (result == '0') {
            alert("위시리스트에 추가를 하지 못하였습니다.");
        } else if (result == '1') {
            $("i[date='productId']").addClass("activeWish");
            alert("위시리스트에 추가되었습니다.");
        } else if (result == '2') {
            alert("위시리스트에 이미 추가되어 있습니다.");
        } else if (result == '5') {
            alert("로그인이 필요합니다.");
        }
    }
</script>
</body>
</html>
