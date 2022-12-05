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
                    <div class="admin_content_wrap_title">문의사항 관리</div>
                    <div style="margin-bottom: 10px; width: 100%; display: flex;justify-content: end; gap: 20px">
                        <button class="basic manage_btn" type="button" data-answer="wait">전체보기</button>
                        <button class="wait manage_btn" type="button" data-answer="wait">답변대기</button>
                        <button class="complete manage_btn" type="button" data-answer="complete">답변완료</button>
                    </div>
                    <c:if test="${listCheck != 'empty' }">
                        <table>
                            <tr>
                                <th>문의번호</th>
                                <th>사용자</th>
                                <th>문의상품</th>
                                <th>문의날짜</th>
                                <th>답변상태</th>
                                <th>답변</th>
                            </tr>

                            <c:forEach items="${list}" var="question">

                                <tr>
                                    <td class="align_center">${question.qnaId}</td>
                                    <td class="align_center">${question.userId}</td>
                                    <td>
                                        <a href="<c:url value='/productDetail'/>?product_id=${question.productId}">
                                                ${question.productName}
                                        </a>
                                    </td>
                                    <td class="align_end">
                                        <fmt:formatDate value="${question.createdAt}" pattern="YYYY/MM/dd HH:mm"/>
                                    </td>
                                    <td class="align_center">
                                        <c:if test="${question.answered}">
                                            <span style="color: green; font-weight: bold; margin-left: 10px">답변완료</span>
                                        </c:if>
                                        <c:if test="${!question.answered}">
                                            <span style="color: red; font-weight: bold; margin-left: 10px">답변대기</span>
                                        </c:if>
                                        <c:if test="${question.deleted}">
                                            [삭제된문의]
                                        </c:if>
                                    </td>
                                    <td class="align_center">
                                        <c:if test="${!question.answered}">
                                            <button class="answer_btn manage_btn" data-qnaId="${question.qnaId}" data-userId="${question.userId}" type="button">
                                                문의관리
                                            </button>
                                        </c:if>
                                        <c:if test="${question.answered}">
                                            <button class="chk_btn manage_btn" data-qnaId="${question.qnaId}" data-userId="${question.userId}" type="button">
                                                답변확인
                                            </button>
                                        </c:if>

                                    </td>
                                </tr>
                            </c:forEach>

                        </table>
                    </c:if>
                    <c:if test="${listCheck == 'empty'}">
                        <div class="table_empty">
                            등록된 문의내역이 없습니다.
                        </div>
                    </c:if>
                    <div class="search_wrap">
                        <form id="searchForm" action="/WYW/admin/qnalist" method="get">
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

                    <form id="moveForm" action="/WYW/admin/qnalist" method="get">
                        <input type="hidden" name="pageNum" value="${pageMarker.pagehandler.pageNum}">
                        <input type="hidden" name="amount" value="${pageMarker.pagehandler.amount}">
                        <input type="hidden" name="keyword" value="${pageMarker.pagehandler.keyword}">
                        <input type="hidden" name="type" value="${pageMarker.pagehandler.type}">
                    </form>
                </div>

            </div>
        </div>
    </div>

</div>
<jsp:include page="../index_bottom.jsp" flush="false"/>
<script src="${pageContext.request.contextPath}/js/pagehandler.js"></script>
<script>
    /* 문의관리 버튼 */
    $(document).on('click', '.answer_btn', function (e) {
        e.preventDefault();
        let qnaId = $(this).data("qnaid");

        let popUrl = "/WYW/admin/answerreg?qnaId=" + qnaId;
        let popOption = "width = 490px, height=650px, top=100px, left=100px, scrollbars=yes, resizable=no"

        window.open(popUrl, "문의답변", popOption);
    });

    // 문의 확인버튼
    $(document).on('click', '.chk_btn', function (e) {
        e.preventDefault();
        let qnaId = $(this).data("qnaid");

        let popUrl = "/WYW/admin/answermanage?qnaId=" + qnaId;
        let popOption = "width = 490px, height=650px, top=100px, left=100px, scrollbars=yes, resizable=no"

        window.open(popUrl, "답변확인", popOption);
    });
</script>
<script>
    $(".basic").on("click", function (){
        let state = $(this).data("answer");

        $("input[name='type']").val(null);
        $("#moveForm").submit();
    });
    $(".wait").on("click", function (){
        let state = $(this).data("answer");

        $("input[name='type']").val(state);
        $("#moveForm").submit();
    });

    $(".complete").on("click", function (){
        let state = $(this).data("answer");

        $("input[name='type']").val(state);
        $("#moveForm").submit();
    });
</script>
</body>
</html>
