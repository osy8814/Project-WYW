let completeEmail = true;

$("#info_email").keyup(function () {

    let query = {email: $("#info_email").val()};

    $.ajax({
        url: `/WYW/mypage/emailChk`,
        type: "post",
        dataType: 'json',
        data: query,
        success: function (data) {

            if (data) {
                $(".emailErrorMsg").text("이미 등록된 Email입니다.");
                $(".emailErrorMsg").attr("style", "color:red");
                $(".registerSubmit").attr("disabled", true);
                completeEmail = false;
            } else {
                $(".emailErrorMsg").text("");
                $(".emailErrorMsg").attr("style", "color:blue");
                completeEmail = true;
            }
        }
    });
});

let completeMobile = true;

$(".mobileCss").keyup(function () {

    let query = {
        mobile1: $("#info_mobile1").val(),
        mobile2: $("#info_mobile2").val(),
        mobile3: $("#info_mobile3").val()
    };

    $.ajax({
        url: `/WYW/mypage/mobileChk`,
        type: "post",
        dataType: 'json',
        data: query,
        success: function (data) {

            if (data) {
                $(".mobileErrorMsg").text("이미 등록된 전화번호입니다.");
                $(".mobileErrorMsg").attr("style", "color:red");
                $(".registerSubmit").attr("disabled", true);
                completeMobile = false;
            } else {
                $(".mobileErrorMsg").text("");
                $(".mobileErrorMsg").attr("style", "color:blue");
                completeMobile = true;
            }
        }
    });
});

let completePwd = false;

$("#info_pwd").keyup(function () {

    const pwd = $("#info_pwd").val();
    const regexp = /^((?=.*\d)(?=.*[a-zA-Z])(?=.*[\W]).{8,})$/;
    const result = regexp.test(pwd);

    if (!result) {
        $(".pwdErrorMsg").text("요구패턴에 일치하지 않습니다.");
        $(".pwdErrorMsg").attr("style", "color:red");
        completePwd = false;
    } else {
        $(".pwdErrorMsg").text("");
        $(".pwdErrorMsg").attr("style", "color:blue");
        completePwd = true;
    }
});

let completeChkPwd = true;

$("#info_pwdchk").keyup(function () {

    const pwd = $("#info_pwd").val();
    const pwdChk = $("#info_pwdchk").val();

    if (pwd != pwdChk) {
        $(".pwdChkErrorMsg").text("비밀번호가 일치하지 않습니다.");
        $(".pwdChkErrorMsg").attr("style", "color:red");
        completeChkPwd = false;
    } else {
        $(".pwdChkErrorMsg").text("");
        $(".pwdChkErrorMsg").attr("style", "color:blue");
        completeChkPwd = true;
    }
});

function allComplete() {
    if (completeEmail && completeMobile
        && completePwd && completeChkPwd) {
        $(".editSubmit").attr("disabled", false);
        $(".editSubmit").css("background-color", "black");
    } else {
        $(".editSubmit").attr("disabled", true);
        $(".editSubmit").css("background-color", "#D6D6D6");
    }
}

setInterval(allComplete, 1000)
