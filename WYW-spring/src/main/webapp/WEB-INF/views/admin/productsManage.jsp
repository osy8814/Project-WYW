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
              <div class="admin_content_wrap_title">상품 관리</div>
              <div>
                <form role="form" method="post" autocomplete="off" >

                  <div class="inputArea">
                    <label>1차 분류</label>
                    <select class="category1 category">
                      <option value="">전체</option>
                    </select>

                    <label>2차 분류</label>
                    <select class="category2 category" name="cate_code">
                      <option value="">전체</option>
                    </select>
                  </div>

                  <div class="inputArea">
<%--                    <label for="gdsName">상품번호</label>--%>
                    <input type="hidden" id="gdsId" name="id" value="${productsViewVo.id}" />
                  </div>
                  <div class="inputArea">
                    <label for="user_id">등록인</label>
                    <input type="text" id="user_id" name="user_id" value="${productsViewVo.user_id}" readonly/>
                  </div>
                  <div class="inputArea">
                    <label for="name">상품명</label>
                    <input type="text" id="name" name="name" value="${productsViewVo.name}" />
                  </div>

                  <div class="inputArea">
                    <label for="price">상품가격</label>
                    <input type="number" id="price" name="price" value="${productsViewVo.price}" />
                  </div>

                  <div class="inputArea">
                    <label for="stock">상품수량</label>
                    <input type="number" id="stock" name="stock" value="${productsViewVo.stock}" />
                  </div>

                  <div class="inputArea">
                    <label for="description">상품소개</label>
                    <textarea rows="5" cols="50" id="description" name="description" >${productsViewVo.description}</textarea>
                  </div>
                  <div class="form_section">
                     <div class="form_section_title">
                         <div class="inputArea">
                            <label>상품 이미지</label>
                         </div>
                     </div>
                      <div class="form_section_content">
                          <input type="file" id ="fileItem" name='uploadFile' style="height: 30px;">
                          <div id="uploadResult"></div>
                      </div>
                  </div>

                  <div class="inputArea">
                     <button type="button" id="cancel_Btn">취소</button>
                     <button type="button" id="modify_Btn">수정</button>
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
    <jsp:include page="../index_bottom.jsp" flush="false"/>


    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
    <script>
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
      const msg = "${msg}";

      if(msg=="modify_ok"){alert("상품이 수정되었습니다.")};
      if(msg=="modify_err"){alert("상품수정에 실패 하였습니다. 입력값을 확인해 주세요.")};
    </script>
    <script>
      /* 이미지 정보 호출 */
      let product_id = ${productsViewVo.id};
      let uploadReslut = $("#uploadResult");

      $.getJSON("/WYW/getAttachList", {product_id : product_id}, function(arr){
          if(arr.length===0){
              let str = "";
              str += "<div id='result_card'>";
              str += "<img id='no_img' src='/WYW/img/noimage.PNG'>";
              str += "</div>";

              uploadReslut.html(str);

              return;
          }
          for (let i = 0; i <arr.length ; i++) {

              let str ="";
              let obj = arr[i];

              let fileCallPath = encodeURIComponent(obj.upload_path.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.file_name);
              str += "<div id='result_card'";
              str += "data-path='" + obj.upload_path + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.file_name + "'";
              str += ">";
              str += "<img src='/WYW/display?fileName=" + fileCallPath +"'>";
              str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
              str += "<input type='hidden' name='imageVOList[0].file_name' value='"+ obj.file_name +"'>";
              str += "<input type='hidden' name='imageVOList[0].uuid' value='"+ obj.uuid +"'>";
              str += "<input type='hidden' name='imageVOList[0].upload_path' value='"+ obj.upload_path +"'>";
              str += "</div>";

              uploadReslut.append(str);
          }




      });
      /* 이미지 삭제 버튼 동작 */
      $("#uploadResult").on("click", ".imgDeleteBtn", function(e){

          /* 이미지 존재시 삭제 */
          if($(".imgDeleteBtn").length > 0){

              deleteFile(e.target);
          }
      });


      /* 파일 삭제 메서드 */
      function deleteFile(target){

          target.parentElement.remove();
      }


      const modifyForm = $("form[role='form']");

      $("#cancel_Btn").click(function (){
          if(confirm("상품을 수정을 취소하시겠습니까?")){
              modifyForm.attr("action", "/WYW/admin/productslist");
              modifyForm.attr("method", "GET");
              modifyForm.submit();
          }
      });

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

        $("input[type='file']").on("change", function(e){


            if($("#result_card").length > 0){
                $("#no_img").remove();
            }

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
