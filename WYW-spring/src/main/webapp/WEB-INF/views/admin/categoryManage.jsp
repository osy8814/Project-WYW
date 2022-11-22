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
            <div class="admin_navi_wrap">
              <ul>
                <li >
                  <a href="<c:url value="/admin/productsReg"/>" class="admin_list_01"><i class="far fa-clipboard"></i>
                    상품 등록</a>
                </li>
                <li>
                  <a href="<c:url value="/admin/productslist"/>" class="admin_list_02"><i class="fas fa-list"></i>상품 목록</a>
                </li>
                <lI>
                  <a href="<c:url value="/admin/category"/>" class="admin_list_03"><i class="fas fa-bezier-curve"></i>카테고리 등록</a>
                </lI>
                <lI>
                  <a href="<c:url value="/admin/categoryManage"/>" class="admin_list_04"><i class="fas fa-scroll"></i>카테고리 관리</a>
                </lI>
                <lI>
                  <a class="admin_list_05"><i class="fas fa-users-cog"></i>회원 관리</a>
                </lI>
              </ul>

            </div>
            <div class="admin_content_wrap">
              <div class="admin_content_wrap_title">카테고리관리</div>
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
