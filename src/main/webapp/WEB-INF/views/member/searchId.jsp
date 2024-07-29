<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/searchId.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
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
            <form action="${contextPath}/searchIdResult" name="searchID-form"  method="POST" onsubmit= "return searchIdValidate()">            
                <div>
                    <span>이메일</span>
                    <input type="text" name="inputEmail">
                </div>
                
                <div>
                    <span>휴대폰 번호</span>
                    <input type="text" name="inputPhone" placeholder="(-)빼고 입력해주세요.">                </div>
                <div>
                  <button id="searchId-btn">확인</button>
                </div>

            </form>
        </section>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${contextPath}/resources/js/searchId.js"></script>
</body>

</html>