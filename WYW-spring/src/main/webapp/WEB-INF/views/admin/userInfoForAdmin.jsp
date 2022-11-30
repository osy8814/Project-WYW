<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="img/WYWlogo.png"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
    <title>WYW</title>
    <style></style>
</head>

<jsp:include page="../index_top.jsp" flush="false"/>
<div class="signUpMain">
    <form action="/WYW/admin/modifyuserinfo" method="post" class="signUpMain__register">
        <div class="signUpMain__register__userInfo">
            <h1 class="signUpMain__register__userInfo-title">회원 정보</h1>
            <div class="signUpMain__register__userInfo__infomation">
                <table>
                    <tr>
                        <th>아이디</th>
                        <td>
                            <input type="text" name="userId" id="info_id" minlength="4" maxlength="16" readonly
                                   value="${userInfo.userId}"/>
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td>
                            <input type="password" name="password" id="info_pwd" value="${userInfo.password}" required/>
                        </td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td>
                            <input type="text" name="name" id="info_name" required readonly value="${userInfo.name}"/>
                        </td>
                    </tr>
                    <tr>
                        <th>휴대전화</th>
                        <td>
                            <select name="mobile1" id="info_mobile1" class="mobileCss">
                                <option value="010">010</option>
                                <option value="010">011</option>
                            </select>
                            <input
                                    type="text"
                                    name="mobile2"
                                    id="info_mobile2"
                                    class="mobileCss"
                                    minlength="4"
                                    maxlength="4"
                                    value="${userInfo.mobile2}"
                            />
                            <input
                                    type="text"
                                    name="mobile3"
                                    id="info_mobile3"
                                    class="mobileCss"
                                    minlength="4"
                                    maxlength="4"
                                    value="${userInfo.mobile3}"
                            />
                            <span class="mobileErrorMsg"></span>
                        </td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>
                            <input type="email" name="email" id="info_email" required value="${userInfo.email}"/>
                            <span class="emailErrorMsg"></span>
                        </td>
                    </tr>
                    <tr>
                        <th id="addrth">주소
                        </th>
                        <td id="addrtd">
                            <input type="text" name="APIPostcode" id="API_postcode" placeholder="우편번호"
                                   value="${userInfo.APIPostcode}">
                            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                            <input type="text" name="APIAddress" id="API_address" placeholder="주소"
                                   value="${userInfo.APIAddress}"><br>
                            <input type="text" name="APIDetailAddress" id="API_detailAddress" placeholder="상세주소"
                                   value="${userInfo.APIDetailAddress}">
                            <input type="text" name="APIExtraAddress" id="API_extraAddress" placeholder="참고항목"
                                   value="${userInfo.APIExtraAddress}">
                        </td>
                    </tr>
                    <tr>
                        <th>계정상태</th>
                        <td>
                            <input type="hidden" name="isActive" value="${userInfo.active}">
                            <c:if test="${userInfo.active==true}">
                                활성화
                                <button type="button" class="manage_btn inactive_btn">
                                    계정비활성화
                                </button>
                            </c:if>
                            <c:if test="${userInfo.active==false}">
                                비활성화
                                <button type="button" class="manage_btn active_btn">
                                    계정활성화
                                </button>
                            </c:if>
                        </td>
                    </tr>
                    <c:if test="${loggedInUser.userId=='admin'}">
                        <tr>
                            <th>관리권한</th>
                            <td>
                                <input type="hidden" name="isAdmin" value="${userInfo.admin}">

                                <c:if test="${userInfo.isAdmin==true}">
                                    관리자
                                    <button type="button" class="manage_btn non-admin_btn">관리권한해제</button>
                                </c:if>
                                <c:if test="${userInfo.isAdmin==false}">
                                    비관리자
                                    <button type="button" class="manage_btn admin_btn">관리권한부여</button>
                                </c:if>
                            </td>
                        </tr>
                    </c:if>
                </table>
            </div>
        </div>
        <div class="manage_btn_set">
            <button type="button" class="editCancel" onclick="location.href='/WYW/admin/membermanagement'">
                수정취소
            </button>
            <button type="submit" class="editSubmit" disabled>정보수정</button>
        </div>
    </form>
</div>

<jsp:include page="../index_bottom.jsp" flush="false"/>
<form action="" method="post" class="modify_form">
    <input type="hidden" name="userId" value="${userInfo.userId}">
</form>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/js/addressAPI.js"></script>
<script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
<script>
    let msg = "${msg}"
    if (msg == "err") {
        alert("회원정보 수정에 실패하였습니다.");
    }
    if (msg == "active") {
        alert("계정이 활성화 되었습니다.");
    }
    if (msg == "inactive") {
        alert("계정이 비활성화 되었습니다.");
    }
    if (msg == "admin") {
        alert("계정에 관리권한이 부여 되었습니다.");
    }
    if (msg == "nonadmin") {
        alert("계정이 관리권한이 해제 되었습니다.");
    }
    if (msg == "edit_err") {
        alert("계정이 관리권한이 해제 되었습니다.");
    }
</script>
<script>
    $(".active_btn").on("click", function () {
        $(".modify_form").attr("action", "/WYW/admin/activeaccount");
        $(".modify_form").submit();
    })

    $(".inactive_btn").on("click", function () {
        $(".modify_form").attr("action", "/WYW/admin/inactiveaccount");
        $(".modify_form").submit();
    })

    $(".admin_btn").on("click", function () {
        $(".modify_form").attr("action", "/WYW/admin/adminaccount");
        $(".modify_form").submit();
    })

    $(".non-admin_btn").on("click", function () {
        $(".modify_form").attr("action", "/WYW/admin/nonadminaccount");
        $(".modify_form").submit();
    })
</script>
<script>
    let completeEmail = true;

    $("#info_email").keyup(function () {

        let query = {email: $("#info_email",).val(),userId:"${userInfo.userId}"};

        $.ajax({
            url: `/WYW/admin/emailChk`,
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
            mobile3: $("#info_mobile3").val(),
            userId : "${userInfo.userId}"
        };

        $.ajax({
            url: `/WYW/admin/mobileChk`,
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

    function allComplete() {
        if (completeEmail && completeMobile){
            $(".editSubmit").attr("disabled", false);
            $(".editSubmit").css("background-color", "black");
        } else {
            $(".editSubmit").attr("disabled", true);
            $(".editSubmit").css("background-color", "#D6D6D6");
        }
    }

    setInterval(allComplete, 1000)
</script>
</body>
</html>
