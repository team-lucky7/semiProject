<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 결과창</title>
    <link rel="stylesheet" href="${contextPath }/resources/css/searchIdResult.css">

</head>
<body>
    <main>
        <section class="searchID-area">
            <a href="${contextPath}">
                <img src="${contextPath}/resources/images/logo.jpg" height="150px">
            </a>

            <form action="${contextPath}/login" name="searchID-form" >
                <div>
                    <label>아이디</label> 
                    <span>${loginMember.memberId}</span>
                </div>

                <a href="${contextPath}/resetPw">비밀번호를 초기화하시겠습니까?</a>
                
                <div>
                    <button id="searchId-btn">확인</button>
                </div>

            </form>
        </section>
    </main>
  
</body>

</html>