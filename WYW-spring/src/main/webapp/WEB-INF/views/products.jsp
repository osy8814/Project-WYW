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

<div class="products_main">
    <div class="products_main-outter">
        <h1 class="main__new-title"><span>PRODUCTS</span></h1>
        <h1 class="products_main_title">검색결과 총 : ${totalResult} 개</h1>
        <c:if test="${listCheck != 'empty' }">
            <div class="products_diplay">
                <c:forEach items="${list}" var="product">

                    <div class="product">
                        <a href="<c:url value='/productDetail'/>?product_id=${product.id}">
                            <div class="product_main-image">
                                <c:choose>
                                    <c:when test="${product.imageVOList.size()==0}">
                                        <img src="<c:url value='/img/noimage.PNG'/>">
                                    </c:when>

                                    <c:when test="${product.imageVOList!=null}">
                                    <img src="/WYW/display?fileName=${product.imageVOList[0].upload_path}/${product.imageVOList[0].uuid}_${product.imageVOList[0].file_name}">
                                    </c:when>
                                </c:choose>
                            </div>
                        </a>
                        <div class="product_infomation">
                            <h1 class="product_name">${product.name}</h1>
                            <h1 class="product_category">${product.cate_name}</h1>
                            <span class="product_price">
                            ￦ <fmt:formatNumber value="${product.price}" pattern="###,###,###"/>
                            </span>
                            <div class="product_bottom-button">
                                <i class="fas fa-shopping-cart"></i><i class="fas fa-heart"></i>
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
            <form id="searchForm" action="/WYW/products" method="get">
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

        <form id="moveForm" action="/WYW/products" method="get">
            <input type="hidden" name="pageNum" value="${pageMarker.pagehandler.pageNum}">
            <input type="hidden" name="amount" value="${pageMarker.pagehandler.amount}">
            <input type="hidden" name="keyword" value="${pageMarker.pagehandler.keyword}">
            <input type="hidden" name="category" value="${pageMarker.pagehandler.category}">
        </form>


    </div>
</div>

<jsp:include page="index_bottom.jsp" flush="false"/>
<script src="${pageContext.request.contextPath}/js/pagehandler.js"></script>
</body>
</html>