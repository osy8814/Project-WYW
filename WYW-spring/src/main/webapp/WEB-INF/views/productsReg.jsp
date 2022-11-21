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
    <script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
    <title>WYW</title>
    <style></style>
  </head>

  <body>

    <jsp:include page="index_top.jsp" flush="false"/>

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
              <div class="admin_content_wrap_title">상품 등록</div>
              <div>
                <form role="form" method="post" autocomplete="off">

                  <div class="inputArea">
                    <label>1차 분류</label>
                    <select class="category1 category">
                      <option value="">전체</option>
                    </select>

                    <label>2차 분류</label>
                    <select class="category2 category" name="cate_code" id="cate_code">
                      <option value="">전체</option>
                    </select>
                  </div>

                  <div class="inputArea">
                    <label for="user_id">등록인</label>
                    <input type="text" id="user_id" name="userId" value="${loggedInUser.userId}" readonly/>
                  </div>

                  <div class="inputArea">
                    <label for="name">상품명</label>
                    <input type="text" id="name" name="name" value="${productsVo.name}" required />

                  </div>

                  <div class="inputArea">
                    <label for="price">상품가격</label>
                    <input type="number" id="price" name="price" value="${productsVo.price}" required />
                  </div>

                  <div class="inputArea">
                    <label for="stock">상품수량</label>
                    <input type="number" id="stock" name="stock" value="${productsVo.stock}" required />
                  </div>

                  <div class="inputArea">
                    <label for="description">상품소개</label>
                    <textarea rows="5" cols="50" id="description" name="description" required>${productsVo.description}</textarea>
                  </div>

                  <div class="inputArea">
                    <label>상품 이미지</label>
                    <div>
                    <div class="form_section_content">
                      <input type="file" id ="fileItem" name='uploadFile' style="height: 30px;">
                        <div id="uploadResult">

<%--                      <div id="result_card">--%>
<%--                        <div class="imgDeleteBtn">x</div>--%>
<%--                        <img src="${pageContext.request.contextPath}/display?fileName=test.png">--%>
<%--                      </div>--%>
                        </div>
                    </div>
                    </div>
                  </div>


                  <div class="inputArea">
                    <button type="button" id="register_Btn" class="btn btn-primary">등록</button>
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
    <script>


      $("input[type='file']").on("change", function(e){

        let formData = new FormData();
        let fileInput = $('input[name="uploadFile"]');
        let fileList = fileInput[0].files;
        let fileObj = fileList[0];

        console.log("fileList : " + fileList);
        console.log("fileObj : " + fileObj);
        console.log("fileName : " + fileObj.name);
        console.log("fileSize : " + fileObj.size);
        console.log("fileType(MimeType) : " + fileObj.type);

        if(!fileCheck(fileObj.name, fileObj.size)){
          return false;
        }
        alert("이미지 파일이 선택 되었습니다.");

        formData.append("uploadFile", fileObj);
        $.ajax({
          url: '/WYW/admin/uploadAjaxAction',
          processData : false,
          contentType : false,
          data : formData,
          type : 'post',
          dataType : 'json',
          success : function(result){
            console.log(result);
            showUploadImage(result);
          },
          error : function(result){
            alert("이미지 파일이 아닙니다.");
          }
        });

      });

      /* var, method related with attachFile */
      let regex = new RegExp("(.*?)\.(jpg|png)$");
      let maxSize = 1048576; //1MB

      function fileCheck(fileName, fileSize){

        if(fileSize >= maxSize){
          alert("파일 사이즈 초과");
          return false;
        }

        if(!regex.test(fileName)){
          alert("해당 종류의 파일은 업로드할 수 없습니다.");
          return false;
        }

        return true;

      }

      let index=0;
      /* 이미지 출력 */
      function showUploadImage(uploadResultArr){


                /* 전달받은 데이터 검증 */
                if(!uploadResultArr || uploadResultArr.length == 0){return}

                let uploadResult = $("#uploadResult");

                let obj = uploadResultArr[0];

                let str = "";

                let fileCallPath = obj.upload_path.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.file_name;

                str += "<div id='result_card'>";
                str += "<img src='/WYW/display?fileName=" + fileCallPath +"'>";
                str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
                str += "<input type='hidden' name='imageVOList["+index+"].file_name' value='"+ obj.file_name +"'>";
                str += "<input type='hidden' name='imageVOList["+index+"].uuid' value='"+ obj.uuid +"'>";
                str += "<input type='hidden' name='imageVOList["+index+"].upload_path' value='"+ obj.upload_path +"'>";
                str += "</div>";


                uploadResult.append(str);

          index +=1;


      }
      /* 이미지 삭제 버튼 동작 */
      $("#uploadResult").on("click", ".imgDeleteBtn", function(e){

          /* 이미지 존재시 삭제 */
          if($(".imgDeleteBtn").length > 0){
              if(index!=0){
                  index -=1;
              }

              deleteFile(e.target);
          }
      });


      /* 파일 삭제 메서드 */
      function deleteFile(target){

          let targetFile = target.dataset.file;

          let targetDiv = target.parentElement;

          $.ajax({
              url: '/WYW/admin/deleteFile',
              data : {fileName : targetFile},
              dataType : 'text',
              type : 'POST',
              success : function(result){
                  console.log(result);

                  targetDiv.remove();
                  $("input[type='file']").val("");

              },
              error : function(result){
                  console.log(result);

                  alert("파일을 삭제하지 못하였습니다.")
              }
          });
      }



    </script>

    <script>
      let Editor;
      ClassicEditor
              .create(document.querySelector('#description'),{
                language:'ko',
                toolbar: {
                  items : ['bold', 'italic', 'link', 'insertTable', 'undo'],
                  shouldNotGroupWhenFull: true
                }
              })
              .catch(error=>{
                console.error(error);
      });
    </script>

    <script>
      const modifyForm = $("form[role='form']");

      let cate_code_val = false;
      let name_val = false;
      let price_val = false;
      let stock_val = false;

      $("#register_Btn").click(function (){

        cate_code_val = $("#cate_code").val();
        name_val = $("#name").val();
        price_val = $("#price").val();
        stock_val = $("#stock").val();

        let completeForm;
        if(cate_code_val!=="" && name_val!==""&& price_val!=="" && stock_val!==""){
          completeForm = true;
        }

        if(confirm("상품을 등록 하시겠습니까?") && completeForm){
          modifyForm.attr("action", "/WYW/admin/productsReg");
          modifyForm.submit();
        }else{
          alert("입력값이 잘못 되었습니다. 입력값을 확인해주세요.")
        }
      });

      const msg = "${msg}";
      if(msg=="reg_ok"){alert("상품이 등록되었습니다.");}
      if(msg=="reg_err"){alert("상품이 등록에 실패 하였습니다. 입력값을 확인해주세요.");}

    </script>

    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
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
