<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>
    <link rel="stylesheet" href="${ contextPath }/resources/css/changePw.css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/footer.css">
    
</head>
<body>
    <section class="myPage-main">
        <h1 class="myPage-title">비밀번호 변경</h1>

        <form action="changePw" method="post" name="myPage-form" onsubmit="return changePwValidate()">
        
            <div class="myPage-box">
                
                <div class="myPage-row">
                    <label>현재 비밀번호</label>
                    <input type="text" id="currentPw"  name="currentPw" maxlength="30">
                </div>
        
                <div class="myPage-row">
                    <label>새 비밀번호 </label>
                    <input type="password" name="newPw" maxlength="30">
                </div>
        
                <div class="myPage-row">
                    <label>새 비밀번호 확인 </label>
                    <input type="password" name="newPwConfirm" maxlength="30">
                </div>
        
            </div>
        
            <button id="info-update-btn">확인</button>
        </form>
    </section>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${contextPath }/resources/js/changePw.js"></script>
</body>
</html>