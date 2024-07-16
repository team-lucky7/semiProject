<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/header.css">
<link rel="stylesheet" href="${ contextPath }/resources/css/freeBoardDetail.css">
<link rel="stylesheet" href="${ contextPath }/resources/css/footer.css">
<script src="https://kit.fontawesome.com/4bef400c33.js" crossorigin="anonymous" defer></script>
</head>
<body>
	<main>
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

		<section class="board-detail">

			<div class="board-name">
				자유게시판
				<div>
					<button>수정</button>
					<button>삭제</button>
				</div>
			</div>
			<div>
				<span>오늘 점심 뭐 먹지?</span>
				<span>작성일</span>
			</div>

			<div>
				이거아니자나
				조회수 4
				추천수 3
				댓글 6
			</div>

			<div class="board-content">
				ㅁㄴ어라ㅣㅁㅇ너ㅣ런ㅁ이런이러ㅣㅏㄴㅇ머리ㅏ;ㄴㅇ
			</div>

			<button id="like">좋아요</button>
			<div class="board-btn-area">
				<button>&lt;이전글</button>
				<button>목록으로</button>
				<button>&gt;다음글</button>
			</div>

			<div class="reply-count">댓글 6개</div>

			<div class="reply-area">
				<ul>
					<li>
						<span>댓글 작성자</span>
						<span>댓글 내용</span>
						<span>따봉 1</span>
					</li>
					<li>
						<span>댓글 작성자</span>
						<span>댓글 내용</span>
						<span>따봉 1</span>
					</li>
					<li>
						<span>댓글 작성자</span>
						<span>댓글 내용</span>
						<span>따봉 1</span>
					</li>
					<li>
						<span>댓글 작성자</span>
						<span>댓글 내용</span>
						<span>따봉 1</span>
					</li>
				</ul>
			</div>
			
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