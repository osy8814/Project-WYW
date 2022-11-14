<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="${pageContext.request.contextPath}/img/WYWlogo.png" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <title>WYW</title>
    <style></style>
  </head>

  <body>
    <jsp:include page="index_top.jsp" flush="false"/>

    <div class="main">
      <div class="main__slide">
        <button class="main__slide-left">
          <i class="fas fa-angle-left"></i>
        </button>
        <button class="main__slide-right">
          <i class="fas fa-angle-right"></i>
        </button>
        <!-- <img src="img/slide/slide_1.png" alt="" /> -->
      </div>

      <div class="main__best">
        <h1 class="main__best-title"><span>BEST</span> PRODUCT</h1>
        <div class="main__best__product">
          <div class="main__best__product__componet">
            <div class="main__best__product__componet-description">
              <h1 class="main__best__product__componet-description-title">
                상품명
              </h1>
              <p class="main__best__product__componet-description-descrip">
                상품설명
              </p>
              <span class="main__best__product__componet-description-price">
                20,000원
              </span>
            </div>
          </div>
          <div class="main__best__product__componet">
            <div class="main__best__product__componet-description">
              <h1 class="main__best__product__componet-description-title">
                상품명
              </h1>
              <p class="main__best__product__componet-description-descrip">
                상품설명
              </p>
              <span class="main__best__product__componet-description-price">
                20,000원
              </span>
            </div>
          </div>
          <div class="main__best__product__componet">
            <div class="main__best__product__componet-description">
              <h1 class="main__best__product__componet-description-title">
                상품명
              </h1>
              <p class="main__best__product__componet-description-descrip">
                상품설명
              </p>
              <span class="main__best__product__componet-description-price">
                20,000원
              </span>
            </div>
          </div>
          <div class="main__best__product__componet">
            <div class="main__best__product__componet-description">
              <h1 class="main__best__product__componet-description-title">
                상품명
              </h1>
              <p class="main__best__product__componet-description-descrip">
                상품설명
              </p>
              <span class="main__best__product__componet-description-price">
                20,000원
              </span>
            </div>
          </div>
        </div>
      </div>

      <div class="main__new">
        <h1 class="main__new-title"><span>NEW</span> PRODUCT</h1>
        <div class="main__new__product">
          <div class="main__new__product__componet">
            <div class="main__new__product__componet-description">
              <h1 class="main__new__product__componet-description-title">
                상품명
              </h1>
              <p class="main__new__product__componet-description-descrip">
                상품설명
              </p>
              <span class="main__new__product__componet-description-price">
                20,000원
              </span>
            </div>
          </div>
          <div class="main__new__product__componet">
            <div class="main__new__product__componet-description">
              <h1 class="main__new__product__componet-description-title">
                상품명
              </h1>
              <p class="main__new__product__componet-description-descrip">
                상품설명
              </p>
              <span class="main__new__product__componet-description-price">
                20,000원
              </span>
            </div>
          </div>
          <div class="main__new__product__componet">
            <div class="main__new__product__componet-description">
              <h1 class="main__new__product__componet-description-title">
                상품명
              </h1>
              <p class="main__new__product__componet-description-descrip">
                상품설명
              </p>
              <span class="main__new__product__componet-description-price">
                20,000원
              </span>
            </div>
          </div>
          <div class="main__new__product__componet">
            <div class="main__new__product__componet-description">
              <h1 class="main__new__product__componet-description-title">
                상품명
              </h1>
              <p class="main__new__product__componet-description-descrip">
                상품설명
              </p>
              <span class="main__new__product__componet-description-price">
                20,000원
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <jsp:include page="index_bottom.jsp" flush="false"/>
    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
    <script src="${pageContext.request.contextPath}/js/mainSlide.js"></script>
  </body>
</html>
