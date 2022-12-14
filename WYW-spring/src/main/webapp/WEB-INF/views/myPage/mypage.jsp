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
<div class="mypage_main">
    <div class="mypage_main-outter">
        <h1 class="mypage_main_title">마이페이지</h1>
        <div class="mypage_main_box">
            <ul class="mypage_list">
                <li>
                    <a href="/WYW/mypage/info">
                        <div>
                            <i class="fas fa-id-card"></i>
                            <h1>Profile</h1>
                            <h2>회원정보</h2>
                            <p>회원정보 관리, 수정하는 공간입니다.</p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="/WYW/wish/wishlist">
                        <div>
                            <i class="fas fa-gift"></i>
                            <h1>Wishlist</h1>
                            <h2>관심상품</h2>
                            <p>등록하신 관심상품을 한눈에 볼 수 있습니다.</p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="/WYW/mypage/orders">
                        <div>
                            <i class="fas fa-truck"></i>
                            <h1>Orders</h1>
                            <h2>배송현황</h2>
                            <p>구매상품의 배송현황을 확인하실 수 있습니다.</p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div>
                            <i class="fas fa-ticket-alt"></i>
                            <h1>Coupon</h1>
                            <h2>쿠폰</h2>
                            <p>보유하신 쿠폰 내역을 보여드립니다.</p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div>
                            <i class="fas fa-coins"></i>
                            <h1>Mileage</h1>
                            <h2>적립포인트</h2>
                            <p>상품구매시 사용할수 있는 적립금 내역입니다.</p>
                        </div>
                    </a>
                </li>

            </ul>
        </div>
    </div>
</div>
<jsp:include page="../index_bottom.jsp" flush="false"/>
<script>
    let msg="${msg}"
    if(msg=="edit_ok"){
        alert("회원정보 수정에 성공하였습니다.");
    }
</script>

</body>
</html>
