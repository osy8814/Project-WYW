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

<div class="product_main">
    <div class="product_main-outter">
        <h1 class="product_main_title"></h1>


        <form method="post" class="product_main_form">
            <div class="product_img">
                <div class="product_img_main">
                    <img src="/WYW/display?fileName=${productsViewVo.imageVOList[0].upload_path}/${productsViewVo.imageVOList[0].uuid}_${productsViewVo.imageVOList[0].file_name}">
                </div>
                <div class="product_img_thumb-set"></div>
            </div>
            <div class="product_info">
                <h1 class="product_info_name">${productsViewVo.name}</h1>
                <h1 class="product_info_cate-name">${productsViewVo.cate_name}</h1>
                <div class="product_info_dox">
                    <div class="product_info_dox_price product_info_dox_inner">
                        <div class="product_info_dox_inner_left">판매가</div>
                        <div class="product_info_dox_inner_right">
                            <fmt:formatNumber value="${productsViewVo.price}" pattern="###,###,###"/> 원
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
                        <div class="product_info_dox_inner_right">20,000원</div>
                    </div>

                </div>
                <div class="product_info_quantity">
                    <span>주문수량</span>
                    <span>
                        <button type="button" class="value_down">-</button>
                        <input type="text" id="product_quantity" value="1">
                        <button type="button" class="value_up">+</button>
                    </span>
                </div>
                <div class="product_info_total-price-set">
                    <span>Total</span>
                    <span class="product_info_total-price"></span>
                    <span class="product_info_total-quantity"></span>
                </div>
                <div class="product_info_btn-set">
                    <button type="button">바로구매</button>
                    <div class="product_info_btn-set_inner">
                        <button type="button">장바구니담기</button>
                        <button type="button">찜하기</button>
                    </div>
                </div>
            </div>
        </form>
        <div class="product_main-detail">
            <h1 class="product_main-detail-title">상세정보</h1>
            <div class="product_main-detail_content">
                ${productsViewVo.description}
            </div>
        </div>
    </div>
</div>
<jsp:include page="index_bottom.jsp" flush="false"/>
<script>
    let max = parseInt(${productsViewVo.stock});
    let min = 1;
    let productPrice = parseInt(${productsViewVo.price});
    let deliveryFee = 20000;

    showResult(1);

    $(".value_up").on("click", function () {
        let quantity = parseInt($('#product_quantity').val());
        if (quantity != max) {
            $('#product_quantity').val(quantity + 1);
        }
        quantity = parseInt($('#product_quantity').val());
        showResult(quantity);

    });

    $(".value_down").on("click", function () {
        let quantity = parseInt($('#product_quantity').val());
        if (quantity != min) {
            $('#product_quantity').val(quantity - 1);
        }
        quantity = parseInt($('#product_quantity').val());
        showResult(quantity);

    });

    function showResult(quantity){
        let result = quantity*productPrice+deliveryFee;
        const option = {
            maximumFractionDigits: 4
        };
        let transtion = result.toLocaleString('ko-KR', option);
        $(".product_info_total-price").text(transtion+"원");
        $(".product_info_total-quantity").text("("+quantity+"개)")
    }
</script>
<script>

</script>
</body>
</html>
