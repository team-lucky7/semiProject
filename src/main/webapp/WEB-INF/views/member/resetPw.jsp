<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 초기화</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/searchId.css">

</head>
<header>
    <ul>

      <a href="${contextPath}/searchId">
        <li>
          아이디 찾기
        </li>
      </a>

        <a href="${contextPath}/resetPw">
          <li>
            비밀번호 초기화
          </li>
        </a>
     
    </ul>
</header>

<body>

    <main>
        <section class="searchID-area">
            <a href="${contextPath}">
                <img src="${contextPath}/resources/images/logo.jpg" height="150px">
            </a>
            
            <form action="${contextPath}/searchID" name="searchID-form" onsubmit="">
                <div>
                    <span>아이디</span>
                    <input type="text" name="inputId">
                </div>
                <div>
                    <span>이메일</span>
                    <input type="text" name="inputEmail">
                </div>
                <div>
                    <span>휴대폰 번호</span>
                    <input type="text" name="inputPhone">
                </div>
                <div>
                    <button id="searchID-btn">확인</button>
                </div>

            </form>
        </section>
    </main>
    <script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
</body>

</html>