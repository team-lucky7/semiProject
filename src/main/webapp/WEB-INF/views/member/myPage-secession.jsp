<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="${contextPath}/resources/css/changePw.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
</head>
<body>
    <section class="myPage-main">
        <h1 class="myPage-title">회원 탈퇴</h1>

        <form action="secession" method="post" name="myPage-form" onsubmit="return secessionValidate()">

                <div class="myPage-box">

                    <div class="myPage-row">
                        <label>이름</label>
                        <input type="text" id="memberName" name="memberName" maxlength="30" placeholder="이름을 입력해주세요.">
                    </div>
                    
                    <div class="myPage-row">
                        <label>비밀번호 </label>
                        <input type= "password" id="memberPw" name="memberPw" maxlength="30" placeholder="비밀번호를 입력해주세요.">
                    </div>
        

                    <div class="myPage-row">
                        <label>비밀번호 확인 </label>
                        <input type="password" id="memberPwConfirm" maxlength="30" placeholder="비밀번호를 한번 더 입력해주세요.">
                    </div>


                    <div class="myPage-row">
                        <label>회원 탈퇴 확인</label>
                        <input type="text" id="secession" maxlength="30" placeholder="'탈퇴하겠습니다'를 입력해주세요.">
                    </div>

                </div>
            <button id="info-update-btn">확인</button>
        </form>
    </section>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <script>
        const loginMemberName = "${loginMember.memberName}";
    </script>

    <script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="${contextPath}/resources/js/secession.js"></script>
</body>
</html>

</body>
</html>