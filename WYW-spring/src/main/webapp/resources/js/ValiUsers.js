
$("#info_id").keyup(function (){

    let query = {user_id : $("#info_id").val()};

    $.ajax({
        url : `/WYW/users/idChk`,
        type : "post",
        data : query,
        success : function(data){

            if(data==1){
                $(".idErrorMsg").text("사용불가능한 ID입니다.");
                $(".idErrorMsg").attr("style", "color:red");

            }else{
                $(".idErrorMsg").text("사용가능한 ID입니다.");
                $(".idErrorMsg").attr("style", "color:blue");

            }
        }
    });
});


$("#info_pwd").keyup(function (){

    let query = {password : $("#info_pwd").val()};


    $.ajax({
        url : "/WYW/users/pwdChk",
        type : "post",
        data : query,
        success : function(data){

            if(data==1){
                $(".pwdErrorMsg").text("요구패턴에 일치하지 않습니다.");
                $(".pwdErrorMsg").attr("style", "color:red");

            }else{
                $(".pwdErrorMsg").text("");
                $(".pwdErrorMsg").attr("style", "color:blue");

            }
        }
    });
});

$("#info_pwdchk").keyup(function (){

    let query = {password : $("#info_pwd").val(), pwdchk : $("#info_pwdchk").val()};


    $.ajax({
        url : "/WYW/users/pwdChk2",
        type : "post",
        data : query,
        success : function(data){

            if(data==1){
                $(".pwdChkErrorMsg").text("비밀번호가 일치하지 않습니다.");
                $(".pwdChkErrorMsg").attr("style", "color:red");

            }else{
                $(".pwdChkErrorMsg").text("");
                $(".pwdChkErrorMsg").attr("style", "color:blue");

            }
        }
    });
});

