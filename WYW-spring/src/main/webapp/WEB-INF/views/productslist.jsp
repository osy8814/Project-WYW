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
              <div>상품 목록</div>
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
                    <td>

                      <select class="category1" disabled>
                        <option value="${product.cate_code_ref}" >전체</option>
                      </select>
                      <select class="category2" name="cate_code" disabled>
                        <option value="${product.cate_code}">${product.cate_name}</option>
                      </select>
                    </td>
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
                      <button type="button" onclick="location.href='<c:url value="/admin/productsManage?id=${product.id}"/>'">관리</button>
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
    <script>
      const msg = "${msg}";
      if(msg=="del_ok"){alert("상품이 삭제되었습니다.")};
      if(msg=="del_err"){alert("상품이 삭제에 실패 하였습니다.")};


    </script>
    <script>
      // 컨트롤러에서 데이터 받기
      let jsonData = JSON.parse('${category}');
      console.log(jsonData);

      let cate1Arr = new Array();
      let cate1Obj = new Object();

      // 1차 분류 셀렉트 박스에 삽입할 데이터 준비
      for(let i = 0; i < jsonData.length; i++) {

        if(jsonData[i].level == "1") {
          cate1Obj = new Object();  //초기화
          cate1Obj.cate_code = jsonData[i].cate_code;
          cate1Obj.cate_name = jsonData[i].cate_name;
          cate1Arr.push(cate1Obj);
        }
      }

      // 1차 분류 셀렉트 박스에 데이터 삽입
      let cate1Select = $("select.category1")

      for(let i = 0; i < cate1Arr.length; i++) {
        cate1Select.append("<option value='" + cate1Arr[i].cate_code + "'>"
                + cate1Arr[i].cate_name + "</option>");
      }

      $(document).on("change", "select.category1", function(){

        let cate2Arr = new Array();
        let cate2Obj = new Object();

        // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
        for(let i = 0; i < jsonData.length; i++) {

          if(jsonData[i].level == "2") {
            cate2Obj = new Object();  //초기화
            cate2Obj.cate_code = jsonData[i].cate_code;
            cate2Obj.cate_name = jsonData[i].cate_name;
            cate2Obj.cate_code_ref = jsonData[i].cate_code_ref;

            cate2Arr.push(cate2Obj);
          }
        }

        let cate2Select = $("select.category2");

        cate2Select.children().remove();

        $("option:selected", this).each(function(){

          let selectVal = $(this).val();
          cate2Select.append("<option value='"+selectVal+"'>전체</option>");

          for(let i = 0; i < cate2Arr.length; i++) {
            if(selectVal == cate2Arr[i].cate_code_ref) {
              cate2Select.append("<option value='" + cate2Arr[i].cate_code + "'>"
                      + cate2Arr[i].cate_name + "</option>");
            }
          }

        });

      });

    </script>

  </body>
</html>
