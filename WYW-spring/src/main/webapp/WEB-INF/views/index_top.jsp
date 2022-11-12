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

    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
    <script src="js/search.js"></script>
    <script src="js/navScroll.js"></script>
  </body>
</html>
