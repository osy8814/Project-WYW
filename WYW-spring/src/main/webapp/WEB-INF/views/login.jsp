<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="img/WYWlogo.png" />
    <link rel="stylesheet" href="/css/style.css" />
    <title>WYW</title>
    <style></style>
  </head>

  <body>

    <jsp:include page="index_top.jsp" flush="false"/>

    <div class="login_main">
      <div class="login_main-outter">
        <h1 class="login_main_title">로그인</h1>
        <form class="login_main_form">
          <h1 class="login_main_form_title">
            <i class="fas fa-unlock-alt"></i>회원 로그인
          </h1>

          <div class="login_main_form_inputAndBtn">
            <div class="login_main_form_idAndPwd">
              <label for="login_main_form-id"
                ><input
                  type="text"
                  id="login_main_form-id"
                  name="id"
                  placeholder="아이디"
                  autofocus
              /></label>
              <label for="login_main_form-pwd"
                ><input
                  type="password"
                  id="login_main_form-pwd"
                  name="pwd"
                  placeholder="비밀번호"
              /></label>
            </div>
            <button id="confirm">로그인</button>
          </div>
          <ul class="login_main_findAndRegInfo">
            <li><a href="find_id.html">아이디 찾기</a></li>
            <li>|</li>
            <li><a href="find_pwd.jsp">비밀번호 찾기</a></li>
            <li>|</li>
            <li><a href="signUp.html">회원가입</a></li>
          </ul>
        </form>
      </div>
    </div>

    <jsp:include page="index_bottom.jsp" flush="false"/>

    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>

  </body>
</html>
