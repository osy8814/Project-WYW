<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page session="true"%>
<c:set var="loginId" value="${sessionScope.loggedInUser.userId}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Xanh+Mono&display=swap');

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
        }

        /*시작*/
        /* 전체 레이아웃 */
        /*-----------------------------------------------*/
        .main-page__all{
            width: 1300px;
            height: 1100px;
            margin: auto;
        }
        .main-page__top{
            width: 1300px;
            height: 470px;
            margin: auto;
        }

        /* top  */
        /* ----------------------------------------------- */
        .main-title_box{
            width: 1290px;
            height: 330px;
            font-size: 15px;
            border-top: 1px solid rgb(155, 155, 155);

        }


        /*테이블*/
        table{
            color: rgb(148, 144, 144);
            border-collapse: collapse;
        }
        th,td{
            padding-left: 20px;

            border-bottom: 1px solid rgb(214, 210, 210);
        }
        td{
            width: 1400px;
        }
        .td_tag{
            border-bottom: 1px solid rgb(214, 210, 210);
        }
        #nav_SUBJECT,#nav_WRITER,#nav_DATE,#nav_VIEWS {
            width: 130px;
            height: 40px;
            font-size: 18px;
            color: rgb(148, 144, 144);
            border-bottom: 1px solid rgb(214, 210, 210);
            line-height: 40px;
            font-family: 'Xanh Mono', monospace;
        }
        /*테이블 끝*/

        input {
            width: 99%;
            height: 40px;
            border: none;
        }

        textarea {
            width: 1284px;
            height: 120px;
            resize: none;
            padding: 8px;
            border: none;
            border-bottom: 1px solid rgb(155, 155, 155);
        }
        .comments{
            width:1290px;
            height: 600px;
            margin-top:20px;
        }
        .admin_btn{
            display: none;
        }
        /*댓글 아이디 */
        .commenter{
            font-size:12px;
            font-weight: bold;
        }
        /*댓글 내용*/
        .comment{
            font-weight: 100;
        }

        .id_font{
            font-size:15px;
            font-weight: bold;
        }
        #commentList{
            width: 1290px;

        }
        #commentbox{
            width: 1290px;
            height: 90px;
            line-height: 27px;
            padding-left:40px ;
        }
        .Write_box{
            width: 1250px;
            height: 200px;
            padding: 40px;
        }
        .comment_side_btn{
            font-size: 11px;
            color: rgb(148, 144, 144)
        }
        .modBtn1, .delBtn,.delBtnAdmin{
            font-size: 11px;
            color: rgb(148, 144, 144);
            cursor:pointer;
        }
        .id_font{
            font-size:15px;
        }
        .Content_box{
            height: 90px;
            width: 400px;
            border : 1px solid rgb(155, 155, 155);
        }
        comment_page_handel{
            width:1200px;
            height: 500px;
            border: 3px solid saddlebrown;

        }

        /* mid */
        /*-----------------------------------------------*/
        .mid_btn_box{
            margin: 5px 0px 0px 5px;
            width: 110px;
            height: 40px;
            display: flex;

        }
        button{
            margin-top:3px;
            padding-bottom: 4px;
            width: 95px;
            height:35px ;
            background-color:white;
            color:black;
            border: 1px solid  rgb(190, 190, 190);
            border-radius: 3px;
            font-size: 14px;
            cursor:pointer;
        }
        button:hover{
            background-color: rgba(241, 234, 234, 0.959);
            background-blend-mode: multiply;
        }
        .comment_dispaly{

            display: none;
        }
        .modifyList_text{
            height: 40px;
            width: 300px;
            background: white;
            position: static;
            border: 1px solid black;

        }
        .modifyList_text{
            height: 40px;
            width: 300px;
            background: white;
            position: static;
            border: 1px solid black;
        }
        .text_btn{
            margin-top:0px;
            height: 40px;
            width: 350px;
            display: flex;
            justify-content: end;
        }

    </style>

</head>
<body>
<div>

<jsp:include page="../index_top.jsp"/>



<%-- -------------------------------------수정 시작------------------------------------------%>
<script>


</script>



<script>
    let msg = "${msg}";
    if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
    if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
</script>
<div class="main-page__all">
    <div class="main-page__top">
        <div class="main-title_box">

            <table>
                <tbody>
                <tr>
                    <th id="nav_SUBJECT">NOTICE</th>
                    <form id="form" class="frm" action="" method="post">
                        <td class="td_tag"><input type="hidden" name="bno" value="${questionDto.bno}">
                            <input name="title" type="text" value="<c:out value='${questionDto.title}'/>" placeholder="  제목을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}></td>
                <tr>
                    <th id="nav_WRITER">WRITER</th>
                    <td class="td_tag">${mode=="new" ? loginId : questionDto.writer}</td>
                </tr>

                <c:if test="${mode ne 'new'}">
                <tr>
                    <th id="nav_DATE">DATE</th>
                    <c:choose>
                        <c:when test="${questionDto.reg_date.time >= startOfToday}">
                            <td class="td_tag"><fmt:formatDate value="${questionDto.reg_date}" pattern="HH:mm" type="time"/></td>
                        </c:when>
                        <c:otherwise>
                            <td class="td_tag"><fmt:formatDate value="${questionDto.reg_date}" pattern="yyyy-MM-dd" type="date"/></td>
                        </c:otherwise>
                    </c:choose>
                </tr>
                </c:if>

                <c:if test="${mode ne 'new'}">
                <tr>
                    <th id="nav_VIEWS">VIEWS</th>
                    <td class="td_tag">${questionDto.view_cnt}</td>
                </tr>
                </tbody>
                </c:if>
            </table>


            <textarea name="content" rows="20" placeholder=" 내용을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}><c:out value="${questionDto.content}"/></textarea><br>
            <c:if test="${mode eq 'new'}">
                <button type="button" id="writeBtn" class="btn btn-write">등록</button>
            </c:if>
            <c:if test="${'admin' eq loginId}">
                <button type="button" id="writeNewBtn" class="btn btn-write">글쓰기</button>
            </c:if>
            <c:if test="${'admin' eq loginId}">
                <button type="button" id="modifyBtn" class="btn btn-modify">수정</button>
                <button type="button" name="removeBtn" class="btn btn-remove">삭제</button>
            </c:if>
            <button type="button" id="listBtn" class="btn btn-list">목록</button>
            </form>


        </div>

    </div><!--메인 탑 페이지 끝 -->
</div>




<%-- -------------------------------------수정 끝------------------------------------------%>
<jsp:include page="../index_bottom.jsp"/>
<script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
<script src="js/mainSlide.js"></script>
<script>
    let loginId = "${loginId}";
    if(loginId=="admin"){
        $("#btnRemove").show();
    } else{
        $("#btnRemove").hide();
    }

</script>



<script>
    $(document).ready(function(){
        let formCheck = function() {
            let form = document.getElementById("form");
            if(form.title.value=="") {
                alert("제목을 입력해 주세요.");
                form.title.focus();
                return false;
            }
            if(form.content.value=="") {
                alert("내용을 입력해 주세요.");
                form.content.focus();
                return false;
            }
            return true;
        }

        //쓰기
        $("#writeNewBtn").on("click", function(){
            location.href="<c:url value='/board4/write4'/>";
        });
        $("#writeBtn").on("click", function(){
            let form = $("#form");
            form.attr("action", "<c:url value='/board4/write4'/>");
            form.attr("method", "post");
            if(formCheck())
                form.submit();
        });



        //수정
        $("#modifyBtn").on("click", function(){
            let form = $("#form");
            let isReadonly = $("input[name=title]").attr('readonly');
            // 1. 읽기 상태이면, 수정 상태로 변경
            if(isReadonly=='readonly') {
                $(".writing-header").html("게시판 수정");
                $("input[name=title]").attr('readonly', false);
                $("textarea").attr('readonly', false);
                $("#modifyBtn").html("등록");
                return;
            }
            // 2. 수정 상태이면, 수정된 내용을 서버로 전송
            form.attr("action", "<c:url value='/board4/modify4${searchCondition.queryString}'/>");
            form.attr("method", "post");
            if(formCheck())
                form.submit();
        });


            //삭제
        $("button[name=removeBtn]").on("click", function(){
            if(!confirm("정말로 삭제하시겠습니까?")) return;
            let form = $("#form");
            form.attr("action", "<c:url value='/board4/remove4${searchCondition.queryString}'/>");
            form.attr("method", "post");
            form.submit();
        });

        $("button[name=removeBtn1]").on("click", function(){
            if(!confirm("정말로 삭제하시겠습니까?")) return;
            let form = $("#form");
            form.attr("action", "<c:url value='/board4/remove5${searchCondition.queryString}'/>");
            form.attr("method", "post");
            form.submit();
        });

        $("#listBtn").on("click", function(){
            location.href="<c:url value='/board4/list4${searchCondition.queryString}'/>";
        });
    });
    </script>

</body>
</html>