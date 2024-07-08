<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/semiProject/resources/css/login.css">
</head>
<body>
    <main>
        <section class="login-area">
            <a href="${contextPath}">
                <img src="https://design-assets.adobeprojectm.com/content/download/express/public/urn:aaid:sc:VA6C2:fa112eb6-b342-52f5-b85f-24c4c79d3a1f/component?assetType=TEMPLATE&etag=e640f4e20bdc4feda0588705d20129fe&revision=fc0f323f-16bf-4a71-9801-7970433134be&component_id=3e6811a9-4c76-4f28-8199-6b65492c3e43" height="150px">
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
                <li><a href="">비밀번호 찾기</a></li>
                <li><span>|</span></li>
                <li><a href="">아이디 찾기</a></li>
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