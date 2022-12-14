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

<div class="product_main">
    <div class="product_main-outter">
        <h1 class="product_main_title"></h1>


        <form method="post" class="product_main_form">
            <div class="product_img">
                <div class="product_img_main">
                    <img id="main-image"
                         src="/WYW/display?fileName=${productsViewVo.imageVOList[0].upload_path}/${productsViewVo.imageVOList[0].uuid}_${productsViewVo.imageVOList[0].file_name}">
                </div>
                <div class="product_img_thumb-set">
                    <%--<div id='product_img_thumb'></div>--%>
                </div>
            </div>
            <div class="product_info">
                <h1 class="product_info_name">${productsViewVo.name}</h1>
                <h1 class="product_info_cate-name">${productsViewVo.cate_name}
                    <c:if test="${loggedInUser.isAdmin}">
                        <button type="button" onclick="location.href='<c:url
                                value="/admin/productsManage?id=${productsViewVo.id}"/>'">상품관리
                        </button>
                    </c:if>
                </h1>
                <div class="product_info_dox">
                    <div class="product_info_dox_price product_info_dox_inner">
                        <div class="product_info_dox_inner_left">판매가</div>
                        <div class="product_info_dox_inner_right">
                            <fmt:formatNumber value="${productsViewVo.price}" pattern="###,###,###"/> 원
                        </div>
                    </div>
                    <div class="product_info_rating product_info_dox_inner">
                        <div class="product_info_dox_inner_left">평점</div>
                        <div class="product_info_dox_inner_right"><span id="product_ratingAvg"></span> / 5.0 (<span
                                id="reply_count">0</span>)
                        </div>
                    </div>
                    <div class="product_info_dox_shipment product_info_dox_inner">
                        <div class="product_info_dox_inner_left">국내▫해외배송</div>
                        <div class="product_info_dox_inner_right">국내배송</div>
                    </div>
                    <div class="product_info_dox_shipping-method product_info_dox_inner">
                        <div class="product_info_dox_inner_left">배송방법</div>
                        <div class="product_info_dox_inner_right">택배</div>
                    </div>
                    <div class="product_info_dox_delivery-fee product_info_dox_inner">
                        <div class="product_info_dox_inner_left">배송비</div>
                        <div class="product_info_dox_inner_right">20,000원 (100,000원 이상 무료)</div>
                    </div>

                </div>
                <div class="product_info_quantity">
                    <span>주문수량</span>
                    <span>
                        <button type="button" class="value_down">-</button>
                        <input type="text" id="product_quantity" value="1">
                        <button type="button" class="value_up">+</button>
                        <span>(재고 : ${productsViewVo.stock})</span>
                    </span>
                </div>
                <div class="product_info_total-price-set">
                    <span>Total</span>
                    <span class="product_info_total-price"></span>
                    <span class="product_info_total-quantity"></span>
                </div>

                <div class="product_info_btn-set">
                    <button id="buy-now" type="button">바로구매</button>
                    <div class="product_info_btn-set_inner">
                        <button type="button" id="btn_cart">장바구니담기</button>
                        <button type="button" id="btn_wish">찜하기</button>
                    </div>

                </div>
            </div>
        </form>
        <div class="product_main-detail">
            <h1 class="product_main-detail_title">상세정보</h1>
            <div class="product_main-detail_content">
                ${productsViewVo.description}
            </div>
        </div>
        <div class="review_qna_swap_div">
            <h1 class="product_main-review_title active_title">리뷰<span id="review_count"></span></h1>
            <h1 class="product_main-QnA_title inactive_title">문의<span id="qna_count"></span></h1>
        </div>
        <div class="product_main-review">
            <div class="product_main-review_content">
                <div class="reply_not_div">

                </div>
                <ul class="reply_content_ul">

                </ul>

                <div class="product_main-review_btn-set">
                    <c:if test="${loggedInUser!=null}">
                        <button class="reply_button write_button">글쓰기</button>
                    </c:if>

                </div>

                <div class="reply_pageInfo_div">
                    <ul class="pageMarker">

                    </ul>
                </div>
            </div>

        </div>
        <div class="product_main-QnA hidden_div">
            <div class="product_main-QnA_content">
                <div class="replyQnA_not_div">

                </div>
                <ul class="replyQnA_content_ul">

                </ul>

                <div class="product_main-QnA-set">
                    <c:if test="${loggedInUser!=null}">
                        <button class="QnA_button write_button">글쓰기</button>
                    </c:if>

                </div>

                <div class="replyQnA_pageInfo_div">
                    <ul class="pageMarker">

                    </ul>
                </div>
            </div>

        </div>
    </div>
</div>
<!--바로구매-->
<form action="/WYW/order/list" method="get" class="order_form">
    <input type="hidden" name="orders[0].productId" value="${productsViewVo.id}">
    <input type="hidden" name="orders[0].productCount" value="">
</form>

<jsp:include page="../index_bottom.jsp" flush="false"/>
<%--게시판스왑--%>
<script>
    $(".product_main-review_title").on("click", function (){
        $(".product_main-review_title").addClass("active_title");
        $(".product_main-QnA_title").removeClass("active_title");

        $(".product_main-QnA").addClass("hidden_div");
        $(".product_main-review").removeClass("hidden_div");
    });

    $(".product_main-QnA_title").on("click", function (){
        $(".product_main-QnA_title").addClass("active_title");
        $(".product_main-review_title").removeClass("active_title");


        $(".product_main-review").addClass("hidden_div");
        $(".product_main-QnA").removeClass("hidden_div");
    });
</script>
<%--수량조절--%>
<script>
    let max = parseInt(${productsViewVo.stock});
    let min = 1;
    let productPrice = parseInt(${productsViewVo.price});

    showResult(1);

    $(".value_up").on("click", function () {
        let quantity = parseInt($('#product_quantity').val());
        if (quantity < max) {
            $('#product_quantity').val(quantity + 1);
        }
        quantity = parseInt($('#product_quantity').val());
        showResult(quantity);

    });

    $(".value_down").on("click", function () {
        let quantity = parseInt($('#product_quantity').val());
        if (quantity > min) {
            $('#product_quantity').val(quantity - 1);
        }
        quantity = parseInt($('#product_quantity').val());
        showResult(quantity);

    });

    function showResult(quantity) {
        let result = quantity * productPrice;
        const option = {
            maximumFractionDigits: 4
        };
        let transtion = result.toLocaleString('ko-KR', option);
        $(".product_info_total-price").text(transtion + "원");
        $(".product_info_total-quantity").text("(" + quantity + "개)")
    }
</script>
<%--장바구니담기--%>
<script>
    const form = {
        user_id: '${loggedInUser.userId}',
        product_id: '${productsViewVo.id}',
        product_count: ''
    }

    // 장바구니 클릭
    $("#btn_cart").on("click", function (e) {
        if ("${loggedInUser.userId}" === "") {
            alert("로그인 후에 이용해 주십시오.");
        }

        if ("${productsViewVo.stock}" === "0") {
            alert("죄송합니다. 상품의 재고가 모자랍니다. 나중에 다시 이용해 주십시오.");
            return false;
        }

        form.product_count = $("#product_quantity").val();
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
</script>
<%--찜하기--%>
<script>
    const wishform = {
        user_id: '${loggedInUser.userId}',
        product_id: '${productsViewVo.id}',
    }

    // 찜하기 클릭
    $("#btn_wish").on("click", function (e) {
        if ("${loggedInUser}" === "") {
            alert("로그인 후에 이용해 주십시오.");
        }
        $.ajax({
            url: '/WYW/wish/add',
            type: 'POST',
            data: wishform,
            dataType: 'json',
            success: function (result) {
                wishAlert(result);
            },
        })
    });

    function wishAlert(result) {
        if (result == '0') {
            alert("위시리스트에 추가를 하지 못하였습니다.");
        } else if (result == '1') {
            alert("위시리스트에 추가되었습니다.");
        } else if (result == '2') {
            alert("위시리스트에 이미 추가되어 있습니다.");
        } else if (result == '5') {
            alert("로그인이 필요합니다.");
        }
    }
</script>
<%--바로구매--%>
<script>
    /* 바로구매 버튼 */
    $("#buy-now").on("click", function () {
        if ("${productsViewVo.stock}" === "0") {
            alert("죄송합니다. 상품의 재고가 모자랍니다. 나중에 다시 이용해 주십시오.");
            return false;
        }

        let ProductCount = $("#product_quantity").val();

        $(".order_form").find("input[name='orders[0].productCount']").val(ProductCount);
        $(".order_form").submit();
    });
</script>
<%--이미지로더--%>
<script>
    // 이미지로더
    let product_id = ${productsViewVo.id};
    let uploadResult = $(".product_img_thumb-set");

    // 이미지 생성
    $.getJSON("/WYW/getAttachList", {product_id: product_id}, function (arr) {
        if (arr.length === 0) {
            let str = "";
            str += "<div id='result_card'>";
            str += "<img id='no_img' src='/WYW/img/noimage.PNG'>";
            str += "</div>";

            uploadResult.html(str);

            return;
        }
        for (let i = 0; i < arr.length; i++) {

            let str = "";
            let obj = arr[i];

            let fileCallPath = encodeURIComponent(obj.upload_path.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.file_name);
            str += "<div class='product_img_thumb'>";
            str += "<img class='thumbnail-image' src='/WYW/display?fileName=" + fileCallPath + "'>";
            str += "</div>";

            uploadResult.append(str);
        }

        //썸네일 이미지 클릭시 메인 이미지 변경
        const mainImage = $('#main-image');
        const thumbnail = $('.thumbnail-image');
        let thumbnailSrc;
        thumbnail.click(function (event) {
            thumbnailSrc = event.target.getAttribute("src");
            mainImage.attr("src", thumbnailSrc);
        });
    });
</script>
<%--리뷰쓰기--%>
<script>
    /* 리뷰쓰기 */
    $(".reply_button").on("click", function (e) {

        e.preventDefault();
        let userId = "${loggedInUser.userId}";
        let productId = "${productsViewVo.id}";

        let popUrl = "/WYW/reply/replyReg/" + userId + "?productId=" + productId;
        let popOption = "width = 490px, height=400px, top=300px, left=300px, scrollbars=yes, resizable=no";

        window.open(popUrl, "리뷰 쓰기", popOption);

    });
    /* 리뷰 수정 버튼 */
    $(document).on('click', '.update_reply_btn', function (e) {
        e.preventDefault();
        let replyId = $(this).attr("href");
        let productId = "${productsViewVo.id}";

        let popUrl = "/WYW/reply/replyUpdate?replyId=" + replyId + "&productId=" + productId + "&userId=" + '${loggedInUser.userId}';
        let popOption = "width = 490px, height=400px, top=300px, left=300px, scrollbars=yes, resizable=no"

        window.open(popUrl, "리뷰 수정", popOption);
    });

    /* 리뷰 삭제 버튼 */
    $(document).on('click', '.delete_reply_btn', function (e) {

        e.preventDefault();
        let replyId = $(this).attr("href");
        let productId = "${productsViewVo.id}";

        if (!confirm("댓글을 삭제하시겠습니까?")) {
            return false;
        }

        $.ajax({
            data: {
                replyId: replyId,
                productId: productId
            },
            url: '/WYW/reply/delete',
            type: 'POST',
            success: function (result) {
                replyListInit();
                alert('삭제가 완료되엇습니다.');
            }
        });

    });

</script>
<%--리뷰 가져오기--%>
<script>
    // 댓글리스트 전개
    let productId = ${productsViewVo.id};

    $.getJSON("/WYW/reply/list", {productId: productId}, function (obj) {

        makeReplyContent(obj);

    });

    /* 댓글 페이지 정보 */
    const pagehandler = {
        productId: '${productsViewVo.id}',
        pageNum: 1,
        amount: 10
    }

    /* 댓글 데이터 서버 요청 및 댓글 동적 생성 메서드 */
    let replyListInit = function () {
        $.getJSON("/WYW/reply/list", pagehandler, function (obj) {
            makeReplyContent(obj);

        });
    }

    /* 댓글 페이지 이동 버튼 동작 */
    $(document).on('click', '.pageMarker_btn a', function (e) {
        e.preventDefault();

        let page = $(this).attr("href");
        pagehandler.pageNum = page;

        replyListInit();

    });

    /* 댓글(리뷰) 동적 생성 메서드 */
    function makeReplyContent(obj) {
        // 평점 갱신
        $("#product_ratingAvg").html(obj.ratingAvg.toFixed(1));

        if (obj.list.length === 0) {
            $("#review_count").html('');
            $("#reply_count").html("0");
            $(".reply_not_div").html('<span>등록된 리뷰가 없습니다.</span>');
            $(".reply_content_ul").html('');
            $(".reply_pageInfo_div").find(".pageMarker").html('');
        } else {

            $(".reply_not_div").addClass("hidden_div");
            let total = obj.pageInfo.total;
            let list = obj.list;
            let pf = obj.pageInfo;
            let userId = '${loggedInUser.userId}';

            // 댓글개수표시
            $("#review_count").html('(' + total + ')');
            $("#reply_count").html(total);

            /* list */
            let reply_list = '';

            $(list).each(function (i, obj) {
                reply_list += '<li>';
                reply_list += '<div class="comment_wrap">';
                reply_list += '<div class="reply_top">';
                /* 아이디 */
                reply_list += '<span class="id_span">' + obj.userId + '</span>';
                /* 날짜 */
                reply_list += '<span class="date_span">' + obj.createdAt + '</span>';
                /* 평점 */
                reply_list += '<span class="rating_span">평점 : <span class="rating_value_span">' + obj.rating + '</span>점</span>';
                if (obj.userId === userId) {
                    reply_list += '<button class="update_reply_btn" href="' + obj.replyId + '">수정</button><button class="delete_reply_btn" href="' + obj.replyId + '">삭제</button>';
                }
                reply_list += '</div>'; //<div class="reply_top">
                reply_list += '<div class="reply_bottom">';
                reply_list += '<div class="reply_bottom_txt">' + obj.content + '</div>';
                reply_list += '</div>';//<div class="reply_bottom">
                reply_list += '</div>';//<div class="comment_wrap">
                reply_list += '</li>';
            });

            $(".reply_content_ul").html(reply_list);

            /* 페이지 버튼 */
            let reply_pageMarker = '';

            /* prev */
            if (pf.prev) {
                let prev_num = pf.pageStart - 1;
                reply_pageMarker += '<li class="pageMarker_btn prev">';
                reply_pageMarker += '<a href="' + prev_num + '">이전</a>';
                reply_pageMarker += '</li>';
            }
            /* numbre btn */
            for (let i = pf.pageStart; i < pf.pageEnd + 1; i++) {
                reply_pageMarker += '<li class="pageMarker_btn ';
                if (pf.pagehandler.pageNum === i) {
                    reply_pageMarker += 'active';
                }
                reply_pageMarker += '">';
                reply_pageMarker += '<a href="' + i + '">' + i + '</a>';
                reply_pageMarker += '</li>';
            }
            /* next */
            if (pf.next) {
                let next_num = pf.pageEnd + 1;
                reply_pageMarker += '<li class="pageMarker_btn next">';
                reply_pageMarker += '<a href="' + next_num + '">다음</a>';
                reply_pageMarker += '</li>';
            }

            $(".reply_pageInfo_div").find(".pageMarker").html(reply_pageMarker);

        }
    }
</script>
<%--문의쓰기--%>
<script>
    /* 문의쓰기 */
    $(".QnA_button").on("click", function (e) {

        e.preventDefault();
        let userId = "${loggedInUser.userId}";
        let productId = "${productsViewVo.id}";

        let popUrl = "/WYW/replyqna/replyqnaReg/" + userId + "?productId=" + productId;
        let popOption = "width = 490px, height=400px, top=300px, left=300px, scrollbars=yes, resizable=no";

        window.open(popUrl, "문의", popOption);

    });
    /* 문의 수정 버튼 */
    $(document).on('click', '.update_replyQna_btn', function (e) {
        e.preventDefault();
        let qnaId = $(this).attr("href");
        let productId = "${productsViewVo.id}";

        let popUrl = "/WYW/replyqna/replyQnaUpdate?qnaId=" + qnaId + "&productId=" + productId + "&userId=" + '${loggedInUser.userId}';
        let popOption = "width = 490px, height=400px, top=300px, left=300px, scrollbars=yes, resizable=no"

        window.open(popUrl, "문의 수정", popOption);
    });

    /* 문의 삭제 버튼 */
    $(document).on('click', '.delete_replyQna_btn', function (e) {

        e.preventDefault();
        let qnaId = $(this).attr("href");
        let productId = "${productsViewVo.id}";

        if (!confirm("문의사항을 삭제하시겠습니까?")) {
            return false;
        }

        $.ajax({
            data: {
                qnaId: qnaId,
                productId: productId
            },
            url: '/WYW/replyqna/delete',
            type: 'POST',
            success: function (result) {
                replyQnaListInit();
                alert('삭제가 완료되엇습니다.');
            }
        });

    });

</script>
<%--문의가져오기--%>
<script>
    // Qna댓글리스트 전개
    $.getJSON("/WYW/replyqna/list", {productId: productId}, function (obj) {
        makeReplyQnaContent(obj);

    });

    /* 문의 데이터 서버 요청 및 문의 동적 생성 메서드 */
    let replyQnaListInit = function () {
        $.getJSON("/WYW/replyqna/list", pagehandler, function (obj) {
            makeReplyQnaContent(obj);

        });
    }

    /* 문의 페이지 이동 버튼 동작 */
    $(document).on('click', '.pageMarker_btn a', function (e) {
        e.preventDefault();

        let page = $(this).attr("href");
        pagehandler.pageNum = page;

        replyQnaListInit();

    });

    /* 문의 동적 생성 메서드 */
    function makeReplyQnaContent(obj) {

        if (obj.list.length === 0) {
            $("#qna_count").html('');
            $(".replyQnA_not_div").html('<span>등록된 문의글이 없습니다.</span>');
            $(".replyQnA_content_ul").html('');
            $(".replyQnA_pageInfo_div").find(".pageMarker").html('');
        } else {

            $(".replyQnA_not_div").addClass("hidden_div");
            let total = obj.pageInfo.total;
            let list = obj.list;
            let pf = obj.pageInfo;
            let userId = '${loggedInUser.userId}';
            let isAdmin = '${loggedInUser.isAdmin}';

            // 댓글개수표시
            $("#qna_count").html('(' + total + ')');


            /* list */
            let replyQna_list = '';

            $(list).each(function (i, obj) {
                replyQna_list += '<li>';
                replyQna_list += '<div class="comment_wrap">';
                replyQna_list += '<div class="reply_top">';
                /* 아이디 */
                replyQna_list += '<span class="id_span">' + obj.userId + '</span>';
                /* 날짜 */
                replyQna_list += '<span class="date_span">' + obj.createdAt + '</span>';

                // 작성자만 수정삭제 가능
                if (obj.userId === userId && !obj.deleted) {
                    replyQna_list += '<button class="update_replyQna_btn" href="' + obj.qnaId + '">수정</button><button class="delete_replyQna_btn" href="' + obj.qnaId + '">삭제</button>';
                }

                // 답변상태 표기
                if (obj.answered) {
                    replyQna_list += '<span style="color: green; font-weight: bold; margin-left: 10px" >답변완료</span>'
                    if(isAdmin || obj.userId==userId){
                    replyQna_list += '<span class="answer-chk" data-qnaid="'+ obj.qnaId +'" style="cursor: pointer; font-weight: bold; margin-left: 10px" >[답변확인]</span>'
                    }
                } else {
                    replyQna_list += '<span style="color: red; font-weight: bold; margin-left: 10px" >답변대기</span>'
                }
                replyQna_list += '</div>'; //<div class="reply_top">
                replyQna_list += '<div class="reply_bottom">';

                //삭제된 글은 삭제표시 데이터삭제 X
                if (obj.deleted) {
                    replyQna_list += '<div class="reply_bottom_txt">삭제된 글입니다. <i class="fas fa-trash-alt"></i></div>';
                } else {
                    // 문의사항은 본인과 관리자만 확인가능
                    if (obj.userId === userId || isAdmin) {
                        replyQna_list += '<div class="reply_bottom_txt">' + obj.content + '</div>';
                    } else {
                        replyQna_list += '<div class="reply_bottom_txt">문의사항은 본인과 관리자만 확인 볼 수 있습니다. <i class="fas fa-lock"></i></div>';
                    }
                }
                replyQna_list += '</div>';//<div class="reply_bottom">
                replyQna_list += '</div>';//<div class="comment_wrap">
                replyQna_list += '</li>';
            });

            $(".replyQnA_content_ul").html(replyQna_list);

            /* 페이지 버튼 */
            let replyQna_pageMarker = '';

            /* prev */
            if (pf.prev) {
                let prev_num = pf.pageStart - 1;
                replyQna_pageMarker += '<li class="pageMarker_btn prev">';
                replyQna_pageMarker += '<a href="' + prev_num + '">이전</a>';
                replyQna_pageMarker += '</li>';
            }
            /* numbre btn */
            for (let i = pf.pageStart; i < pf.pageEnd + 1; i++) {
                replyQna_pageMarker += '<li class="pageMarker_btn ';
                if (pf.pagehandler.pageNum === i) {
                    replyQna_pageMarker += 'active';
                }
                replyQna_pageMarker += '">';
                replyQna_pageMarker += '<a href="' + i + '">' + i + '</a>';
                replyQna_pageMarker += '</li>';
            }
            /* next */
            if (pf.next) {
                let next_num = pf.pageEnd + 1;
                replyQna_pageMarker += '<li class="pageMarker_btn next">';
                replyQna_pageMarker += '<a href="' + next_num + '">다음</a>';
                replyQna_pageMarker += '</li>';
            }

            $(".replyQnA_pageInfo_div").find(".pageMarker").html(replyQna_pageMarker);

        }
    }
</script>
<%--답변확인--%>
<script>
    // 답변 확인버튼
    $(document).on('click', '.answer-chk', function (e) {
        e.preventDefault();
        let qnaId = $(this).data("qnaid");

        let popUrl = "/WYW/replyqna/answerchk?qnaId=" + qnaId;
        let popOption = "width = 490px, height=650px, top=100px, left=100px, scrollbars=yes, resizable=no"

        window.open(popUrl, "답변확인", popOption);
    });
</script>

</body>
</html>
