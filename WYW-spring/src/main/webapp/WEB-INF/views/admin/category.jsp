<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <jsp:include page="../index_top.jsp" flush="false"/>

    <div class="admin_main">

      <div class="wrapper">

        <div class="wrap">
          <div class="wrap_title">관리자 페이지</div>

          <div class="admin_wrap">
            <!-- 네비영역 -->
            <jsp:include page="../admin/asideMenu.jsp" flush="false"/>

            <div class="admin_content_wrap">
              <div class="admin_content_wrap_title">카테고리 목록</div>
            </div>
            <div class="clearfix"></div>
          </div>
        </div>
      </div>

    </div>
    <jsp:include page="../index_bottom.jsp" flush="false"/>

    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
