<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/signUp.css">
</head>
<body>
    <main>
        <div class="logo-area">
            <a href="${ contextPath }"><img src="https://design-assets.adobeprojectm.com/content/download/express/public/urn:aaid:sc:VA6C2:fa112eb6-b342-52f5-b85f-24c4c79d3a1f/component?assetType=TEMPLATE&etag=e640f4e20bdc4feda0588705d20129fe&revision=fc0f323f-16bf-4a71-9801-7970433134be&component_id=3e6811a9-4c76-4f28-8199-6b65492c3e43" height="150px"></a>
        </div>
        <section class="signUp-content">
            <form action="${ contextPath }/signUp" name="signUp-form" method="post" onsubmit="return signUpValidate()">
                <h3>회원 정보 입력</h3>

                <label for="memberId">
                    아이디
                </label>

                <div class="signUp-input-area">
                    <input type="text" id="memberId" name="memberId" placeholder="4~20자의 영문 소문자, 숫자 사용 가능" maxlength="30"
                        autocomplete="off" required>
                    <!-- autocomplete="off" : 자동완성 미사용 -->
                    <!-- required : 필수 작성 input 태그 -->

                    <button type="button" id="idDupChkBtn">중복검사</button>
                </div>

                <span class="signUp-message error" id="idMessage">4~20자의 영문 소문자, 숫자만 사용하여 아이디를 입력해주세요.</span>

                <label for="memberPw">
                    비밀번호
                </label>

                <div class="signUp-input-area">
                    <input type="password" id="memberPw" name="memberPw" placeholder="8~20자의 영문, 숫자, 특수문자 조합" maxlength="30">

                </div>

                <div class="signUp-input-area">
                    <input type="password" id="memberPwConfirm" placeholder="비밀번호확인" maxlength="30">

                </div>

                <span class="signUp-message error" id="pwMessage">8~20자의 영문, 숫자, 특수문자를 조합하여 입력해주세요.</span>


                <label for="memberName">
                    이름
                </label>

                <div class="signUp-input-area">
                    <input type="text" id="memberName" name="memberName" placeholder="이름(실명)" maxlength="10">

                </div>

                <span class="signUp-message error" id="nameMessage">필수 입력 사항입니다.</span>

                <label for="memberGender">
                    성별
                </label>
                
                <div class="signUp-input-gender-area">
                    <label><input type="radio" name="memberGender" value="M">남자</label>
                    <label><input type="radio" name="memberGender" value="F">여자</label>
                </div>

                <span class="signUp-message error" id="genderMessage">필수 입력 사항입니다.</span>

                <label for="memberDOB">
                    생년월일
                </label>

                <div class="signUp-input-area">
                    <input type="text" id="memberDOB" name="memberDOB" placeholder="숫자 8자리 (ex. 19980909)" maxlength="8">

                </div>

                <span class="signUp-message error" id="dobMessage">필수 입력 사항입니다.</span>

                <label for="memberEmail">
                    이메일
                </label>

                <div class="signUp-input-area">
                    <input type="text" id="memberEmail" name="memberEmail" placeholder="이메일" maxlength="30">

                </div>

                <span class="signUp-message error" id="emailMessage">필수 입력 사항입니다.</span>


                <label for="memberTel">
                    휴대폰번호
                </label>

                <div class="signUp-input-area">
                    <input type="text" id="memberTel" name="memberTel" placeholder="(-없이 숫자만 입력)" maxlength="11">

                </div>

                <span class="signUp-message error" id="telMessage">필수 입력 사항입니다.</span>

                <button type="submit" id="signUp-btn">가입하기</button>
            </form>
        </section>
    </main>
    <c:if test="${ !empty sessionScope.message}">
		<script>
            alert("${message}");
        </script>
		<c:remove var="message" scope="session" />
	</c:if>
     <script src="${ contextPath }/resources/js/jquery-3.7.1.min.js"></script>
    <script src="${ contextPath }/resources/js/signUp.js"></script>
</body>
</html>