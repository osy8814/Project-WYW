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
    <form role="form" method="post" onsubmit="return confirm('회원정보를 수정 하시겠습니까?');" class="signUpMain__register">
        <div class="signUpMain__register__userInfo">
            <h1 class="signUpMain__register__userInfo-title">회원 정보</h1>
            <div class="signUpMain__register__userInfo__infomation">
                <table>
                    <tr>
                        <th>
                            아이디
                            <strong style="color: blue">*</strong>
                        </th>
                        <td>
                            <input type="text" name="userId" id="info_id" minlength="4" maxlength="16" readonly value="${userinfo.userId}"/>
                            <span class="infoHint">(영어 대소문자/숫자, 4~16자)</span>

                        </td>
                    </tr>
                    <tr>
                        <th>
                            비밀번호
                            <strong style="color: blue">*</strong>
                        </th>
                        <td>
                            <input type="password" name="password" id="info_pwd" minlength="8" required/>
                            <span class="infoHint">
                    (영어 대소문자/숫자/특수문자 조합, 8자 이상)
                  </span>
                            <span class="pwdErrorMsg"></span>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            비밀번호 확인
                            <strong style="color: blue">*</strong>
                        </th>
                        <td>
                            <input type="password" name="chkPassword" id="info_pwdchk" required/>
                            <span class="pwdChkErrorMsg"></span>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            이름
                            <strong style="color: blue">*</strong>
                        </th>
                        <td>
                            <input type="text" name="name" id="info_name" required readonly value="${userinfo.name}"/>
                        </td>
                    </tr>
                    <tr>
                        <th>휴대전화
                            <strong style="color: blue">*</strong>
                        </th>
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
                                    value="${userinfo.mobile2}"
                            />
                            <input
                                    type="text"
                                    name="mobile3"
                                    id="info_mobile3"
                                    class="mobileCss"
                                    minlength="4"
                                    maxlength="4"
                                    value="${userinfo.mobile3}"
                            />
                            <span class="mobileErrorMsg"></span>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            이메일
                            <strong style="color: blue">*</strong>
                        </th>
                        <td>
                            <input type="email" name="email" id="info_email" required value="${userinfo.email}"/>
                            <span class="infoHint">
                    아이디/비밀번호 찾기에 활용됩니다. 정확히 입력해주세요.
                  </span>
                            <span class="emailErrorMsg"></span>
                        </td>
                    </tr>
                    <tr>
                        <th id="addrth">주소
                            <strong style="color: blue">*</strong>
                        </th>
                        <td id="addrtd">
                            <input type="text" name="APIPostcode" id="API_postcode" placeholder="우편번호" value="${userinfo.APIPostcode}">
                            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                            <input type="text" name="APIAddress" id="API_address" placeholder="주소" value="${userinfo.APIAddress}"><br>
                            <input type="text" name="APIDetailAddress" id="API_detailAddress" placeholder="상세주소" value="${userinfo.APIDetailAddress}" >
                            <input type="text" name="APIExtraAddress" id="API_extraAddress" placeholder="참고항목" value="${userinfo.APIExtraAddress}">
                        </td>
                    </tr>

                </table>
            </div>
        </div>

        <span style="font-weight: bold; font-size: 12px; margin-top: 20px">* 조건이 만족되면 버튼이 활성화 됩니다.</span>
        <button type="submit" class="editSubmit" disabled>정보수정</button>
    </form>
</div>

<jsp:include page="../index_bottom.jsp" flush="false"/>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/js/addressAPI.js"></script>
<script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/mypageVali.js"></script>
<script>
    let msg = "${msg}"
    if(msg=="edit_err"){
        alert("회원정보 수정에 실패하였습니다. 입력값을 다시 확인하여 주시기 바랍니다.");
    }
</script>
</body>
</html>
