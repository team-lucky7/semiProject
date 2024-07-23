<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/freeBoardWriteForm.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<main>
		<form action="#" enctype="multipart/form-data" method="post" class="board-write"
		onsubmit="return writeValidate()">
			<div>
				<h1 class="board-title">
					<input type="text" name="boardTitle" placeholder="제목을 입력해주세요." value="${detail.boardTitle}">
				</h1>
		
				<div class="compoContainer">
					<div class="compoBox">
						<img src="${contextPath}/resources/images/article-icon-png-14.jpg" alt="글" class="btn" onclick="addText()">
						<img src="${contextPath}/resources/images/image-icon-10.jpg" alt="그림" class="btn" onclick="addImage()">
					</div>
				</div>
			</div>

			<div id="container"></div>

			<button id="insert-Btn">작성완료</button>
			<input type="hidden" id="count" name="count" value="">
	    </form>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
<script src="${contextPath}/resources/js/freeBoardWriteForm.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a672d1a3dd18b00d1ead688b41bca007&libraries=services"></script>
</html>