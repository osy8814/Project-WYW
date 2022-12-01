<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="${pageContext.request.contextPath}/img/WYWlogo.png"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <title>WYW</title>
    <style></style>
</head>

<body>
<jsp:include page="index_top.jsp" flush="false"/>
<div class="find_pwd_main">
    <div class="find_pwd_main-outter">
        <h1 class="find_pwd_title">정보찾기</h1>
        <form class="find_pwd_form">
            <h1 class="find_pwd_form_title">
                <i class="fas fa-fingerprint"></i>비밀번호 찾기
            </h1>

            <div class="find_pwd_form_inputAndBtn">
                <div class="find_pwd_form_name_email">
                    <label for="find_pwd_form_email"
                    ><input
                            type="email"
                            id="find_pwd_form_email"
                            name="email"
                            placeholder="이메일"
                            autofocus
                    /></label>
                    <label for="find_pwd_form_name"
                    ><input
                            type="text"
                            id="find_pwd_form_name"
                            name="pwd"
                            placeholder="이름"
                    /></label>
                </div>
                <button type="button"  class="confirm" >비밀번호 찾기</button>
            </div>
            <div class="find_pwd_certification_number hidden_div">
                <input id="certification_number" style="margin-right: 10px">
                <button id="certification_btn" type="button">인증번호확인</button>
            </div>
            <ul class="find_pwd_findAndRegInfo">
                <li><a href="/WYW/users/findid">아이디 찾기</a></li>
                <li>|</li>
                <li><a href="/WYW/users/signup">회원가입</a></li>
            </ul>
        </form>
    </div>
</div>
<jsp:include page="index_bottom.jsp" flush="false"/>

<script
        src="https://kit.fontawesome.com/6478f529f2.js"
        crossorigin="anonymous"
></script>
<script>

    let dto;

    $(".confirm").on("click", function (){
        const userEmail = $("#find_pwd_form_email").val();
        const userName = $("#find_pwd_form_name").val();
        let form = {
            email: userEmail,
            name: userName,
        }

        alert("메일 발송중입니다. 잠시만 기다려주세요.")
        $(".confirm").attr("disabled",true);
        $(".confirm").addClass("disabled_btn");
        $(".find_pwd_certification_number").removeClass("hidden_div");
        $("#certification_btn").attr("disabled",true);
        $.ajax({
            url: '/WYW/users/sendMail',
            type: 'POST',
            data: form,
            dataType: "json",
            success: function (result) {
                dto = result;
                $(".confirm").attr("disabled",false);
                $(".confirm").removeClass("disabled_btn");
                $("#certification_number").attr("disabled",true);
                if (dto.resultMsg == "NOT_FOUND") {
                    alert("일치하는 정보가 없습니다.")
                }else if(dto.resultMsg == "SEND_FAIL"){
                    alert("메일 발송에 실패 하였습니다. 다시 시도해주세요")
                }else {
                    alert("인증번호가 발송되었습니다.");
                    $("#certification_number").attr("disabled",false);
                    $("#certification_btn").attr("disabled",false);
                }
            }
        });
    });

    $("#certification_btn").on("click", function (){
        let inputNumber = $("#certification_number").val();
        console.log(inputNumber);
        console.log(dto.certification);
        if(inputNumber==dto.certification){
            alert("인증번호가 일치합니다. 메일이 발송됩니다.")
            $.ajax({
                url: '/WYW/users/sendpass',
                type: 'POST',
                dataType: "json",
                success: function (result) {
                    if(result==1){
                        alert("비밀번호가 메일로 발송되었습니다. 로그인 페이지로 이동합니다.");
                        window.location.replace("/WYW/users/login.do");
                    }else {
                        alert("메일 발송에 실패하였습니다. 다시 시도해주세요.")
                    }

                }
            });
        }else {
            alert("인증번호가 일치하지 않습니다. 다시 확인해주세요.")
        }
    });
</script>
</body>
</html>
