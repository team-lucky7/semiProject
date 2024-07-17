<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>
    <link rel="stylesheet" href="${ contextPath }/resources/css/changePw.css">
</head>
<body>
    <section class="myPage-main">
        <h1 class="myPage-title">비밀번호 변경</h1>

        <form action="#" method="post" name="myPage-form">
                <div class="myPage-box">

                    <div class="myPage-row">
                        <label>현재 비밀번호</label>
                        <input type="text" id="currentPw" value="" maxlength="30" placeholder="현재 비밀번호를 입력해주세요.">
                    </div>
                    <div id="currentPwMessage" class="Message"></div>
                    
                    <div class="myPage-row">
                        <label>비밀번호 </label>
                        <input type= "password" name="newPw" value="" maxlength="30" placeholder="바꿀 새 비밀번호를 입력해주세요.">
                    </div>

                    <div id="newPwMessage" class="Message"></div>
        
                    <div class="myPage-row">
                        <label>새 비밀번호 확인 </label>
                        <input type="password" name="newPwConfirm" value="" maxlength="30" placeholder="새 비밀번호를 입력해주세요.">
                    </div>

                    <div id="newPwConfirmMessage" class="Message"></div>

                </div>

            <button id="info-update-btn">확인</button>
        </form>
    </section>
    <script src="${contextPath }/resources/js/jquery-3.7.1.min.js"></script>
    <script src="${contextPath }/resources/js/changePw.js"></script>
</body>
</html>