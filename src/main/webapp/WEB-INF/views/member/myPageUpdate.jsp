<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPageUpdate</title>

<link rel="stylesheet" href="${contextPath }/resources/css/header.css">
<link rel="stylesheet" href="${contextPath }/resources/css/footer.css">
<link rel="stylesheet" href="${contextPath}/resources/css/myPageSideBar-style.css">
<link rel="stylesheet" href="${contextPath}/resources/css/myPageUpdate-style.css">
<script src="https://kit.fontawesome.com/4bef400c33.js" crossorigin="anonymous"></script>


</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<div class="myPage-content">

		<jsp:include page="/WEB-INF/views/member/myPageSideBar.jsp"></jsp:include>

		<section class="myPage-main">

			<h1 class="myPage-title">내 정보 수정</h1>

			<form action="update" enctype="multipart/form-data" method="post" name="myPage-form" onsubmit="return infoValidate()">

				<div class="myPage-row">
					<label>이메일</label> 
					<input type="text" value="${loginMember.memberEmail}" maxlength="30" name="memberEmail">
				</div>

				<div class="myPage-row">
					<label>휴대폰 번호</label>
					<input type="text" value="${loginMember.memberTel}" maxlength="11" name="memberTel">
				</div>
				
				<div class="myPage-row profileImage">
					<span>프로필 이미지</span></label>
					<input type="file" name="profileImage" id="input-image" accept="image/*">
					<label for="input-image">선택하기</label>
				</div>

				<button id="info-update-btn">수정하기</button>

			</form>

		</section>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script src="${ contextPath }/resources/js/jquery-3.7.1.min.js"></script>
	<script src="${ contextPath }/resources/js/header.js"></script>
	<script src="${ contextPath }/resources/js/updateMember.js"></script>
</body>
</html>