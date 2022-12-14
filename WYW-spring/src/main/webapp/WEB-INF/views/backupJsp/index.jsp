<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="img/WYWlogo.png" />
    <link rel="stylesheet" href="css/style.css" />
    <title>WYW</title>
    <style></style>
  </head>

  <body>
    <div class="top-loginSet">
      <ul id="top-loginSet-list">
        <li><a href="login.html">Login</a></li>
        <li><a href="signUp.html">SignUp</a></li>
        <li><a href="mypage.html">My Page</a></li>
      </ul>
      <div id="top-loginSet__iconSet">
        <a href="#"
          ><i class="fas fa-search"></i>
          <form action="#">
            <input
              type="text"
              class="hidden"
              id="search"
              name="search"
              placeholder="검색어를 입력하세요."
            />
          </form>
        </a>
        <!-- <a href="#"><i class="fas fa-bars"></i></a> -->
      </div>
    </div>
    <div class="logoSet">
      <h1 class="logoSet__title">
        <a href="index.html">
          <div class="logoSet__logo"></div>
          <strong style="color: #32343e; margin-left: 15px">W</strong>HAT
          <strong style="color: #32343e; margin-left: 15px">Y</strong>OU
          <strong style="color: #32343e; margin-left: 15px">W</strong>ANT
        </a>
      </h1>
    </div>
    <div class="nav">
      <ul class="nav__topNav" id="topNav">
        <li>
          <a href="#">COMPANY</a>
          <ul id="company_list">
            <li><a href="Introduce.html">INTRODUCE</a></li>
            <li><a href="#">LOCATION</a></li>
          </ul>
        </li>
        <li>
          <a href="#">SHOP</a>
          <ul id="shop_list">
            <li><a href="#">NEW</a></li>
            <li><a href="#">BEST</a></li>
            <li><a href="#">BEDROOM</a></li>
            <li><a href="#">KITCHEN</a></li>
            <li><a href="#">BATHROOM</a></li>
          </ul>
        </li>
        <li><a href="#">GALLERY</a></li>
        <li>
          <a href="#">COMMUNITY</a>
          <ul id="community_List">
            <li><a href="#">FREES</a></li>
            <li><a href="#">REVIEWS</a></li>
            <li><a href="#">Q&A</a></li>
          </ul>
        </li>
      </ul>
    </div>

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

    <div class="bottomNavBox">
      <div class="bottomNavBox__navBox">
        <ul class="bottomNavBox__navBox-nav">
          <li><a href="index.html">HOME</a></li>
          <li>|</li>
          <li><a href="">AGREEMENT</a></li>
          <li>|</li>
          <li><a href="">PRIVACY</a></li>
          <li>|</li>
          <li><a href="">GUIDE</a></li>
        </ul>
      </div>
      <div class="bottomNavBox__main">
        <div class="bottomNavBox__main__box Customer">
          <h3 class="bottomNavBox__main__box-title">customer center</h3>
          <h1 class="bottomNavBox__main__box-number">010-1234-1234</h1>
          <p class="bottomNavBox__main__box-script">
            평일,토요일 : Am 07:00 ~ Pm 06:00<br />
            일요일,공휴일은 휴무입니다.
          </p>
        </div>
        <div class="bottomNavBox__main__box Banking">
          <h3 class="bottomNavBox__main__box-title">banking account</h3>
          <h1 class="bottomNavBox__main__box-number">352-0000-0000-00</h1>
          <p class="bottomNavBox__main__box-script">농협/000</p>
          <h1 class="bottomNavBox__main__box-number">352-0000-0000-00</h1>
          <p class="bottomNavBox__main__box-script">농협/000</p>
        </div>
        <div class="bottomNavBox__main__box Cominfo">
          <h3 class="bottomNavBox__main__box-title">Company info</h3>
          <p class="bottomNavBox__main__box-script">COMPANY : S.Y.H</p>
          <p class="bottomNavBox__main__box-script">CALL : 043-123-4567</p>
          <p class="bottomNavBox__main__box-script">EMAIL : SYH@gmail.com</p>
          <p class="bottomNavBox__main__box-script">ADRESS :</p>
          <p class="bottomNavBox__main__box-script">
            BUSINESS NUMBER : 301-20-00123
          </p>
        </div>
      </div>
      <div class="copy">
        <p class="copyScript">Copyright(c) S.Y.H all rights reserved.</p>
      </div>
    </div>
    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
    <script src="js/mainSlide.js"></script>
    <script src="js/search.js"></script>
    <script src="js/navScroll.js"></script>
  </body>
</html>
