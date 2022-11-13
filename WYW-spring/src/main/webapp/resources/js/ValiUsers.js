let complete = false;

$("#info_id").keyup(function (){

    let query = {user_id : $("#info_id").val()};
    const removeSpace = $("#info_id").val().replace(/\s/gi,"");
    $("#info_id").val(removeSpace);
    const regexp = /^[a-zA-Z0-9]{4,16}/;
    const result = regexp.test($("#info_id").val());
    console.log("result"+ result);

    $.ajax({
        url : `/WYW/users/idChk`,
        type : "post",
        data : query,
        success : function(data){

            if(data==1 || !result){
                $(".idErrorMsg").text("사용불가능한 ID입니다.");
                $(".idErrorMsg").attr("style", "color:red");
                complete = false;
            }else{
                $(".idErrorMsg").text("사용가능한 ID입니다.");
                $(".idErrorMsg").attr("style", "color:blue");
                complete = true;
            }
        }
    });
});

$("#info_email").keyup(function (){

    let query = {email : $("#info_email").val()};

    $.ajax({
        url : `/WYW/users/emailChk`,
        type : "post",
        data : query,
        success : function(data){

            if(data==1){
                $(".emailErrorMsg").text("이미 등록된 Email입니다.");
                $(".emailErrorMsg").attr("style", "color:red");
                complete = false;
            }else{
                $(".emailErrorMsg").text("");
                $(".emailErrorMsg").attr("style", "color:blue");
                complete = true;
            }
        }
    });
});


$(".mobileCss").keyup(function (){

    let query = {
        mobile1 : $("#info_mobile1").val(),
        mobile2 : $("#info_mobile2").val(),
        mobile3 : $("#info_mobile3").val()
    };

    $.ajax({
        url : `/WYW/users/mobileChk`,
        type : "post",
        data : query,
        success : function(data){

            if(data==1){
                $(".mobileErrorMsg").text("이미 등록된 전화번호입니다.");
                $(".mobileErrorMsg").attr("style", "color:red");
                complete = false;
            }else{
                $(".mobileErrorMsg").text("");
                $(".mobileErrorMsg").attr("style", "color:blue");
                complete = true;
            }
        }
    });
});


$("#info_pwd").keyup(function (){

    const pwd = $("#info_pwd").val();
    const regexp = /^((?=.*\d)(?=.*[a-zA-Z])(?=.*[\W]).{8,})$/;
    const result = regexp.test($("#info_pwd").val());

    if(!result){
        $(".pwdErrorMsg").text("요구패턴에 일치하지 않습니다.");
        $(".pwdErrorMsg").attr("style", "color:red");
        complete = false;
    }else{
        $(".pwdErrorMsg").text("");
        $(".pwdErrorMsg").attr("style", "color:blue");
        complete = true;
    }
});

$("#info_pwdchk").keyup(function (){

    const pwd = $("#info_pwd").val();
    const pwdChk = $("#info_pwdchk").val();

    console.log(pwd, pwdChk);

    if(pwd!=pwdChk){
        $(".pwdChkErrorMsg").text("비밀번호가 일치하지 않습니다.");
        $(".pwdChkErrorMsg").attr("style", "color:red");
        complete = false;
    }else{
        $(".pwdChkErrorMsg").text("");
        $(".pwdChkErrorMsg").attr("style", "color:blue");
        complete = true;
    }
});

$("#info_pwd").keyup(function (){

    const pwd = $("#info_pwd").val();
    const regexp = /^((?=.*\d)(?=.*[a-zA-Z])(?=.*[\W]).{8,})$/;
    const result = regexp.test($("#info_pwd").val());

    if(!result){
        $(".pwdErrorMsg").text("요구패턴에 일치하지 않습니다.");
        $(".pwdErrorMsg").attr("style", "color:red");
        complete = false;
    }else{
        $(".pwdErrorMsg").text("");
        $(".pwdErrorMsg").attr("style", "color:blue");
        complete = true;
    }
});

$(".chkbox").change(function (){

    const required1 = $(`input:checkbox[name="terms1"]`).is(":checked");
    const required2 = $(`input:checkbox[name="terms2"]`).is(":checked");

    if(required1 && required2){
        complete = true;
    }else {
        complete = false;
    }

});

setInterval(function (){
    if(complete){
        $(".registerSubmit").attr("disabled",false);
    }else
        $(".registerSubmit").attr("disabled",true);
    }
, 1500)
