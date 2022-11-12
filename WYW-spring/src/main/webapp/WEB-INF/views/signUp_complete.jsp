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
    <jsp:include page="index_top.jsp" flush="false"/>

    <div class="signUp_complete_main">
      <div class="signUp_complete_main_regist-outter">
        <h1 class="signUp_complete_main_regist-info_title">회원 가입</h1>
        <div class="signUp_complete_main_regist-info">
          <h1 class="signUp_complete_main_regist-info_msg">
            <i class="fas fa-id-badge"></i>회원 가입이 완료 되었습니다.
          </h1>
          <h1 class="signUp_complete_main_regist-info_thanksTo">
            "홍길동"님
            <strong
              style="
                font-weight: bold;
                background-color: #1f1f1f;
                color: white;
                padding: 0 3px;
              "
              >WYW</strong
            >
            에 가입해주셔서 감사합니다.
          </h1>
          <div class="signUp_complete_main_regist-info_infoSet">
            <div
              class="signUp_complete_main_regist-info_infoSet-box infoSet-id"
            >
              <h2 class="signUp_complete_main_regist-info_infoSet-id-h">
                아이디
              </h2>
              <h2 class="signUp_complete_main_regist-info_infoSet-id-d">
                아이디
              </h2>
            </div>
            <div
              class="signUp_complete_main_regist-info_infoSet-box infoSet-name"
            >
              <h2 class="signUp_complete_main_regist-info_infoSet-name-h">
                이름
              </h2>
              <h2 class="signUp_complete_main_regist-info_infoSet-name-d">
                이름
              </h2>
            </div>
            <div
              class="signUp_complete_main_regist-info_infoSet-box infoSet-email"
            >
              <h2 class="signUp_complete_main_regist-info_infoSet-email-h">
                이메일
              </h2>
              <h2 class="signUp_complete_main_regist-info_infoSet-email-d">
                이메일
              </h2>
            </div>

          </div>
          <form action="index.html">
            <button id="signup_confirm">확인</button>
          </form>
        </div>
      </div>
    </div>

    <jsp:include page="index_bottom.jsp" flush="false"/>

    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>

  </body>
</html>
