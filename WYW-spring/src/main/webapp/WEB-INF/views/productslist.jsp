<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <div class="admin_main">

      <div class="wrapper">
        <div class="wrap">

          <!-- top_subject_area -->
          <!-- contents-area -->
          <div class="admin_wrap">
            <!-- 네비영역 -->
            <div class="admin_navi_wrap">
              <ul>
                <li >
                  <a href="<c:url value="/admin/productsReg"/> " class="admin_list_01">상품 등록</a>
                </li>
                <li>
                  <a href="<c:url value="/admin/productslist"/> " class="admin_list_02">상품 목록</a>
                </li>
                <lI>
                  <a href="<c:url value="/admin/category"/> " class="admin_list_03">카테고리 등록</a>
                </lI>
                <lI>
                  <a href="<c:url value="/admin/categoryManage"/> " class="admin_list_04">카테고리 관리</a>
                </lI>
                <lI>
                  <a class="admin_list_05">회원 관리</a>
                </lI>
              </ul>

            </div>
            <div class="admin_content_wrap">
              <div>상품 목록
              </div>
              <table>
                <thead>
                <tr>
                  <th>등록인</th>
                  <th>이름</th>
                  <th>카테고리</th>
                  <th>가격</th>
                  <th>수량</th>
                  <th>등록날짜</th>
                  <th>관리</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="product">
                  <tr>
                    <td>${product.user_id}</td>
                    <td>${product.name}</td>
                    <td>${product.cate_code}</td>
                    <td>
                      <fmt:formatNumber value="${product.price}" pattern="###,###,###"/>
                    </td>

                    <td>
                      <fmt:formatNumber value="${product.stock}" pattern="###,###,###"/>
                    </td>
                    <td>
                      <fmt:formatDate value="${product.created_at}" pattern="YYYY/MM/dd"/>
                    </td>
                    <td>
                      <button type="button">관리</button>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>

            </div>
            <div class="clearfix"></div>
          </div>
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
