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
              <div>상품 관리
              </div>
              <div>
                <form role="form" method="post" autocomplete="off" >

                  <div class="inputArea">
                    <label>1차 분류</label>
                    <select class="category1">
                      <option value="">전체</option>
                    </select>

                    <label>2차 분류</label>
                    <select class="category2" name="cate_code">
                      <option value="">전체</option>
                    </select>
                  </div>

                  <div class="inputArea">
<%--                    <label for="gdsName">상품번호</label>--%>
                    <input type="hidden" id="gdsId" name="id" value="${productsViewVo.id}" />
                  </div>
                  <div class="inputArea">
                    <label for="gdsName">등록인</label>
                    <input type="text" id="gdsUser" name="user_id" value="${productsViewVo.user_id}" readonly/>
                  </div>
                  <div class="inputArea">
                    <label for="gdsName">상품명</label>
                    <input type="text" id="gdsName" name="name" value="${productsViewVo.name}" />
                  </div>

                  <div class="inputArea">
                    <label for="gdsPrice">상품가격</label>
                    <input type="number" id="gdsPrice" name="price" value="${productsViewVo.price}" />
                  </div>

                  <div class="inputArea">
                    <label for="gdsStock">상품수량</label>
                    <input type="number" id="gdsStock" name="stock" value="${productsViewVo.stock}" />
                  </div>

                  <div class="inputArea">
                    <label for="gdsDes">상품소개</label>
                    <textarea rows="5" cols="50" id="gdsDes" name="description" >${productsViewVo.description}</textarea>
                  </div>

                  <div class="inputArea">
                    <button type="button" id="modify_Btn">수정</button>
                  </div>
                  <div class="inputArea">
                    <button type="button" id="delete_Btn">삭제</button>
                  </div>

                </form>
              </div>
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

      if(msg=="modify_ok"){alert("상품이 수정되었습니다.")};
      if(msg=="modify_err"){alert("상품수정에 실패 하였습니다. 입력값을 확인해 주세요.")};
    </script>
    <script>
      const modifyForm = $("form[role='form']");

      $("#delete_Btn").click(function (){
        if(confirm("상품을 삭제 하시겠습니까?")){
          modifyForm.attr("action", "/WYW/admin/deleteProduct");
          modifyForm.submit();
        }
      });

      $("#modify_Btn").click(function (){
        if(confirm("상품을 수정 하시겠습니까?")){
          modifyForm.attr("action", "/WYW/admin/modifyProduct");
          modifyForm.submit();
        }
      });
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

      let select_catecode = '${productsViewVo.cate_code}';
      let select_catecoderef = '${productsViewVo.cate_code_ref}';
      let select_catename = '${productsViewVo.cate_name}';

      if(select_catecoderef != null && select_catecoderef != '') {
          $(".category1").val(select_catecoderef);
          $(".category2").val(select_catecode);
          $(".category2").children().remove();
          $(".category2").append("<option value='"
              + select_catecode + "'>" + select_catename + "</option>");
      } else {
          $(".category1").val(select_catecode);
          $(".category2").append("<option value='" + select_catecode + "' selected='selected'>전체</option>");
      }

    </script>
  </body>
</html>
