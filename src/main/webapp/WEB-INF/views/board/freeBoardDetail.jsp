<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/header.css">
<link rel="stylesheet" href="${ contextPath }/resources/css/freeBoardDetail.css">
<link rel="stylesheet" href="${ contextPath }/resources/css/freeBoardReply.css">
<link rel="stylesheet" href="${ contextPath }/resources/css/footer.css">
<script src="https://kit.fontawesome.com/4bef400c33.js" crossorigin="anonymous" defer></script>
</head>
<body>
	<main>
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

		<section class="board-detail">
			<h3 class="board-name">자유게시판</h3>
			<div class="board-title">오늘 점심 뭐 먹지?</div>

			<div class="board-header">
                <div class="board-writer">
                	<img src="${ contextPath }/resources/images/user.png">
                    <span>이거아니자나</span>
                </div>

                <div class="board-info">
                    <p> <span>작성일</span> 2024-07-18</p>
                    <p> <span>마지막 수정일</span> 2024-07-18</p>
                    <p> <span>좋아요</span> 1</p>
                    <p> <span>조회수</span> 3</p>
                </div>
            </div>

			<div class="board-content">
				ㅁㄴ어라ㅣㅁㅇ너ㅣ런ㅁ이런이러ㅣㅏㄴㅇ머리ㅏ;ㄴㅇ
			</div>

			<div>
				<button id="likeBtn">좋아요</button>
			</div>

			<div class="board-btn-area">
				<button id="updateBtn">수정</button>
				<button id="deleteBtn">삭제</button>
				<button id="goToListBtn">목록으로</button>
			</div>
			
			<jsp:include page="/WEB-INF/views/board/freeBoardReply.jsp"></jsp:include>

			<div class="pagination-area">
				<ul class="pagination">
					<li><a href="">&lt;&lt;</a></li>
					<li><a href="">&lt;</a></li>
					<li><a href="">1</a></li>
					<li><a href="">2</a></li>
					<li><a href="">3</a></li>
					<li><a href="">4</a></li>
					<li><a href="">5</a></li>
					<li><a href="">&gt;</a></li>
					<li><a href="">&gt;&gt;</a></li>
				</ul>
			</div>
		</section>

		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</main>
	<script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
	<script src="${contextPath}/resources/js/header.js"></script>
</body>
</html>