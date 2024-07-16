<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>

<link rel="stylesheet" href="${contextPath }/resources/css/header.css">
<link rel="stylesheet" href="${contextPath }/resources/css/footer.css">
<link rel="stylesheet" href="${contextPath}/resources/css/myPageSideBar-style.css">
<link rel="stylesheet" href="${contextPath}/resources/css/myPageUpdate-style.css">
<script src="https://kit.fontawesome.com/4bef400c33.js" crossorigin="anonymous"></script>


</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<div class="myPage-content">

		<jsp:include page="/WEB-INF/views/myPageSideBar.jsp"></jsp:include>

		<section class="myPage-main">

			<h1 class="myPage-title">내 정보</h1>

			<form action="#" method="post" name="myPage-form">

				<div class="myPage-row">
					<label>이름</label> 
					<span>${loginMember.memberName}</span>
				</div>

				<div class="myPage-row">
					<label>생년월일</label> 
					<span>${loginMember.memberDOB}</span>
				</div>

				<div class="myPage-row">
					<label>이메일</label> 
					<span>${loginMember.memberEmail}</span>
				</div>

				<div class="myPage-row">
					<label>휴대폰 번호</label>
					<span>${loginMember.memberTel}</span>
				</div>
				<div class="myPage-row">
					<label>성별</label> 
					<span>${loginMember.memberGender}</span>
				</div>

				<div class="myPage-row">
					<label>비밀번호변경</label>
					<a href="${contextPath}/changePw" id="info-Pwchange-btn">확인</a>
				</div>

				<div class="myPage-row profileImage">
					<label for="input-image"> 프로필 이미지 변경 <i
						class="fa-solid fa-camera"></i>
					</label> <input type="file" name="profileImage" id="input-image"
						accept="image/*">
					<button>변경하기</button>
				</div>

				<button id="info-update-btn">수정하기</button>

			</form>

		</section>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script src="${ contextPath }/resources/js/jquery-3.7.1.min.js"></script>
	<script src="${ contextPath }/resources/js/header.js"></script>
</body>
</html>