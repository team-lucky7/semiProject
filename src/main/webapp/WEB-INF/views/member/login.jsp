<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="/semiProject/resources/css/login.css">
</head>
<body>
    <main>
        <section class="login-area">
            <a href="${contextPath}">
                <img src="${contextPath}/resources/images/logo.jpg" height="150px">
            </a>
            <form action="${contextPath}/login" name="login-form" method="post" onsubmit="return loginValidate()">
                <p>ID로그인</p>
                <input type="text" name="inputId" placeholder="아이디" value="${ cookie.saveId.value }">
                <input type="password" name="inputPw" placeholder="비밀번호">
                <c:if test="${ !empty cookie.saveId.value }">
                	<c:set var="chk" value="checked"/>
                </c:if>
                <label><input type="checkbox" name="saveId" ${chk}>아이디 저장</label>
                <button id="login-btn">로그인</button>
            </form>
            <ul>
                <li><a href="#">비밀번호 찾기</a></li>
                <li><span>|</span></li>
                <li><a href="#">아이디 찾기</a></li>
                <li><span>|</span></li>
                <li><a href="${ contextPath }/signUp">회원가입</a></li>
            </ul>
        </section>
    </main>
    <script src="${ contextPath }/resources/js/login.js"></script>
    
    <c:if test="${!empty sessionScope.message }">
    	<script>
			alert("${sessionScope.message}");
		</script>
		
		<c:remove var="message" scope="session" />
    </c:if>
</body>
</html>