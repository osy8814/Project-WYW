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
            /*border: 3px solid green;*/
        }
        .main-page__top{
            width: 1300px;
            height: 470px;
            margin: auto;
        }
        .instar_ta{
            width: 1700px;
            height: 200px;
            margin: auto;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
        }

        /* top  */
        /* ----------------------------------------------- */
        .main-title_box{
            width: 1290px;
            height: 330px;
            font-size: 15px;
            border-top: 1px solid rgb(155, 155, 155);

        }
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
        th{
            font-family: 'Xanh Mono', monospace;

        }

        #nav_SUBJECT,#nav_WRITER,#nav_DATE,#nav_VIEWS {
            width: 130px;
            height: 40px;
            font-size: 18px;
            color: rgb(148, 144, 144);

        }
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
            border: 2px solid black;
            /*display: flex;*/
            /*flex-direction: column;*/
        }
        #commentList{
            width: 1290px;
            /*height: 500px;*/
            border: 1px solid red;
        }
        #commentbox{
            width: 1290px;
            height: 90px;
            /*border: 2px solid black;*/
            line-height: 27px;
            padding-left:40px ;
            /*border-bottom: 1px solid rgb(214, 210, 210);*/
            border : 1px solid blue;


        }
        .Write_box{
            width: 1250px;
            height: 200px;
            border: 2px solid green;
            padding: 40px;
        }
        .comment_side_btn{
            font-size: 11px;
            color: rgb(148, 144, 144)
        }
        .modBtn, .delBtn{
            font-size: 11px;
            color: rgb(148, 144, 144)
        }
        /*.commenter{*/
        /*    font-size:12px;*/
        /*}*/
        /*.comment{*/
        /*    font-size: 14px;*/
        /*}*/
        .id_font{
            font-size:15px;
        }
        .Content_box{
            height: 90px;
            width: 900px;
            /*border: 1px solid black;*/
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
        }
        button:hover{
            background-color: rgba(241, 234, 234, 0.959);
            background-blend-mode: multiply;
        }



    </style>
</head>
<body>

<jsp:include page="../index_top.jsp"/>

<script>
    let msg = "${msg}";
    if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
    if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
</script>
<!-- <h2 class="writing-header">게시판 ${mode=="new" ? "글쓰기" : "읽기"}</h2><br> -->
<div class="main-page__all">
    <div class="main-page__top">
        <div class="main-title_box">
            <table>
                <tbody>
                <tr>
                    <th id="nav_SUBJECT">SUBJECT</th>
                    <form id="form" class="frm" action="" method="post">
                        <td><input type="hidden" name="bno" value="${boardDto.bno}">
                            <input name="title" type="text" value="<c:out value='${boardDto.title}'/>" placeholder="  제목을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}></td>
                </tr>
                <tr>
                    <th id="nav_WRITER">WRITER</th>
                    <td id="nav_WRITER_Value">${boardDto.writer}</td>
                </tr>
                <tr>
                    <th id="nav_DATE">DATE</th>
                    <c:choose>
                        <c:when test="${boardDto.reg_date.time >= startOfToday}">
                            <td class="regdate" id="nav_DATE_Value"><fmt:formatDate value="${boardDto.reg_date}" pattern="HH:mm" type="time"/></td>
                        </c:when>
                        <c:otherwise>
                            <td class="regdate" id="nav_DATE_Value"><fmt:formatDate value="${boardDto.reg_date}" pattern="yyyy-MM-dd" type="date"/></td>
                        </c:otherwise>
                    </c:choose>
                </tr>
                <tr>
                    <th id="nav_VIEWS">VIEWS</th>
                    <td id="nav_VIEWS_Value">${boardDto.view_cnt}</td>
                </tr>
                </tbody>
            </table>
            <textarea name="content" rows="20" placeholder=" 내용을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}><c:out value="${boardDto.content}"/></textarea><br>
            <c:if test="${mode eq 'new'}">
                <button type="button" id="writeBtn" class="btn btn-write">등록</button>
            </c:if>
            <c:if test="${mode ne 'new'}">
                <button type="button" id="writeNewBtn" class="btn btn-write">글쓰기</button>
            </c:if>
            <c:if test="${boardDto.writer eq loginId}">
                <button type="button" id="modifyBtn" class="btn btn-modify">수정</button>
                <button type="button" id="removeBtn" class="btn btn-remove">삭제</button>
            </c:if>
            <button type="button" id="listBtn" class="btn btn-list">목록</button>
            </form>
        </div>
        <%--댓글 설정--%>
        <div class="comments">

            <div id="commentList"> </div>
            <div id="replyForm" style="display:none">
                <input type="text" name="replyComment">
                <button id="wrtRepBtn" type="button">등록</button>
            </div>


            <div class="Write_box">
                <div call="comment_page_handel">

                    <div class="pageList"></div>
                </div>




                <strong class="id_font">comment:</strong><br>
                <textarea class="Content_box" placeholder =" 댓글을 남겨보세요" type="text" name="comment"></textarea><br>
                <button id="sendBtn" type="button">SEND</button>
                <button id="modBtn" type="button">수정</button>
            </div>

        </div>


    </div><!--메인 탑 페이지 -->
</div>

<jsp:include page="../index_bottom.jsp"/>
<script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
<script src="js/mainSlide.js"></script>

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
        $("#writeNewBtn").on("click", function(){
            location.href="<c:url value='/board/write'/>";
        });
        $("#writeBtn").on("click", function(){
            let form = $("#form");
            form.attr("action", "<c:url value='/board/write'/>");
            form.attr("method", "post");
            if(formCheck())
                form.submit();
        });
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
            form.attr("action", "<c:url value='/board/modify${searchCondition.queryString}'/>");
            form.attr("method", "post");
            if(formCheck())
                form.submit();
        });
        $("#removeBtn").on("click", function(){
            if(!confirm("정말로 삭제하시겠습니까?")) return;
            let form = $("#form");
            form.attr("action", "<c:url value='/board/remove${searchCondition.queryString}'/>");
            form.attr("method", "post");
            form.submit();
        });
        $("#listBtn").on("click", function(){
            location.href="<c:url value='/board/list${searchCondition.queryString}'/>";
        });
    });
</script>

<!----------------댓글----------------->
<script>
    let bno = ${boardDto.bno}; //sql comment

    let showList = function (bno){
        $.ajax({
            type:'GET',       // 요청 메서드
            url: '/WYW/comments?bno='+bno,  // 요청 URI
            dataType : 'json',
            success : function(result){

                $("#commentList").html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
            },
            error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
    }


    $(document).ready(function(){
        showList(bno); // 미리 보이도록 호출

        $("#modBtn").click(function(){
            let cno = $(this).attr("data-cno");
            let comment = $("textarea[name=comment]").val();

            if(comment.trim()=='') {
                alert("댓글을 입력해주세요.");
                $("textarea[name=comment]").focus()
                return;
            }
            $.ajax({
                type:'PATCH',       // 요청 메서드
                url: '/WYW/comments/'+cno,  // 요청 URI // ch4/comments/70 PATCH
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({cno:cno, comment:comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
                    alert(result);
                    showList(bno);
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });


        $("#wrtRepBtn").click(function(){
            let comment = $("textarea[name=replyComment]").val();
            let pcno  = $("#replyForm").parent().attr("data-pcno");

            if(comment.trim()=='') {
                alert("댓글을 입력해주세요.");
                $("textarea[name=comment]").focus()
                return;
            }
            $.ajax({
                type:'POST',       // 요청 메서드
                url: '/WYW/comments?bno='+bno,  // 요청 URI //ch4/comments?bno=1085 POST
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({pcno:pcno,bno:bno, comment:comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
                    alert(result);
                    showList(bno);
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()

            $("#replyForm").css("display","none")
            $("input[name=comment]").val('')
            $("#replyForm").appendTo("body");
        });



        $("#sendBtn").click(function(){
            let comment = $("textarea[name=comment]").val();

            if(comment.trim()=='') {
                alert("댓글을 입력해주세요.");
                $("textarea[name=comment]").focus()
                return;
            }
            $.ajax({
                type:'POST',       // 요청 메서드
                url: '/WYW/comments?bno='+bno,  // 요청 URI //ch4/comments?bno=1085 POST
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({bno:bno, comment:comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
                    alert(result);
                    // $('#Content_box').removeClass('display-none');
                    $("textarea[name=comment]").val('');
                    showList(bno);
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });

        $("#commentList").on("click",".modBtn",function() {
            let cno = $(this).parent().attr("data-cno");
            let comment = $("span.comment", $(this).parent()).text(); // 다가져와서 조건을 준다 $(this).parent()) this는 버튼

            // 1.comment의 내용을 input에 뿌려주기
            $("textarea[name=comment]").val(comment);
            // 2.cno전달하기
            $("#modBtn").attr("data-cno",cno);
        });

        $("#commentList").on("click",".delBtn",function(){
            let cno = $(this).parent().attr("data-cno");
            let bno = $(this).parent().attr("data-bno");

            $.ajax({
                type:'DELETE',       // 요청 메서드
                url: '/WYW/comments/'+cno+'?bno='+bno,  // 요청 URI
                success : function(result){
                    alert(result)
                    showList(bno);
                },
                error : function(result){
                    alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });

    });


    let toHtml =  function(comments) {

        let tmp = "<div >";

        comments.forEach(function(comment){

            let writer = comment.commenter;
            let loginId = "${loginId}";

            tmp += '<div id="commentbox" data-cno='+ comment.cno;

            tmp += ' data-pcno=' + comment.pcno;
            tmp += ' data-bno=' + comment.bno + '>';
            // if(comment.cno!=comment.pcno)
            //     tmp += 'ㄴ'
            tmp += ' <strong><span class="commenter">' + comment.commenter + '</span></strong><br>';
            tmp += ' <span class="comment">' + comment.comment + '</span><br>';
            // tmp += '<div id=comment_time>'
            tmp += '<a class="comment_side_btn">' +dateToString(comment.up_date)+'</a>'+ '&nbsp;';

            if(writer === loginId){
            tmp += '<submit class="modBtn">수정</submit>';
            tmp += ' <submit class="delBtn">삭제</submit>';
            }
            tmp += '</div>'
            // tmp += ' <button class="replyBtn">답글</button>'
            // tmp += '</div>'
        })

        return tmp + "</div>";
    }






</script>
<script>
    let addZero = function(value=1){
        return value > 9 ? value : "0"+value;
    }

    let dateToString = function(ms=0) {
        let date = new Date(ms);

        let yyyy = date.getFullYear();
        let mm = addZero(date.getMonth() + 1);
        let dd = addZero(date.getDate());

        let HH = addZero(date.getHours());
        let MM = addZero(date.getMinutes());
        let ss = addZero(date.getSeconds());

        return yyyy+"."+mm+"."+dd+ " " + HH + ":" + MM + ":" + ss;
    }

</script>

</body>
</html>