<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <img src="https://design-assets.adobeprojectm.com/content/download/express/public/urn:aaid:sc:VA6C2:fa112eb6-b342-52f5-b85f-24c4c79d3a1f/component?assetType=TEMPLATE&etag=e640f4e20bdc4feda0588705d20129fe&revision=fc0f323f-16bf-4a71-9801-7970433134be&component_id=3e6811a9-4c76-4f28-8199-6b65492c3e43"
                height="150px">
            <form action="#" name="login-form">
                <p>ID로그인</p>
                <input type="text" name="memberId" placeholder="아이디">
                <input type="password" name="memberPw" placeholder="비밀번호">
                <label><input type="checkbox" name="saveId">아이디 저장</label>
                <button id="login-btn">로그인</button>
            </form>
            <ul>
                <li><a href="">비밀번호 찾기</a></li>
                <li><span>|</span></li>
                <li><a href="">아이디 찾기</a></li>
                <li><span>|</span></li>
                <li><a href="">회원가입</a></li>
            </ul>
        </section>
    </main>
</body>
</html>