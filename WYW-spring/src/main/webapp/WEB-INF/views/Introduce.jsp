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

    <div class="IntroduceMain">
      <div class="IntroduceMain__img"></div>
      <div class="IntroduceMain__img"></div>
      <div class="IntroduceMain__img"></div>
      <div class="IntroduceMain__script">
        <h1 class="IntroduceMain__script-title">
          "<strong style="color: #32343e; margin-left: 15px">W</strong>HAT
          <strong style="color: #32343e; margin-left: 15px">Y</strong>OU
          <strong style="color: #32343e; margin-left: 15px">W</strong>ANT "
        </h1>
        <p>
          아름다움의 기준은 개성과 같이 다릅니다.<br />
          형식화 되어있지 않은 개성을 존중하며, 어떤것이든 표현할 수 있는 현대의
          시점에서 바랍봅니다. 모던미는 현대미술의 관점은 하나의 표현,디자인,
          형상 등 을 각자 다르게 받아들일 수 있으며, "자신의 생각이 옳다면
          답이다." 라는 주관적인 정의를 내립니다. 색다르게 보는 이로 하여금
          호기심과 관심을 느낄 수 있는 제품을 유통하는데 목표를 두고 있습니다.
        </p>
      </div>
    </div>

    <jsp:include page="index_bottom.jsp" flush="false"/>

    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>

  </body>
</html>
