<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/header.css">
<link rel="stylesheet" href="${ contextPath }/resources/css/freeBoardList.css">
<link rel="stylesheet" href="${ contextPath }/resources/css/footer.css">
<script src="https://kit.fontawesome.com/4bef400c33.js" crossorigin="anonymous" defer></script>
</head>
<body>
	<main>
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

		<section class="board-list">
			<div class="board-name-div">
				<h1 class="board-name">자유게시판</h1>
			</div>

			<div class="list-wrapper">
				<table class="list-table">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>날짜</th>
							<th>조회수</th>
							<th>추천수</th>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td>10</td>
							<td><a href="${ contextPath }/freeBoard/detail">오늘 점심 뭐 먹지?</a></td>
							<td>이거맞자나</td>
							<td>2024-06-25</td>
							<td>10</td>
							<td>2</td>
						</tr>
						<tr>
							<td>10</td>
							<td><a href="${ contextPath }/freeBoard/detail">오늘 점심 뭐 먹지?</a></td>
							<td>이거맞자나</td>
							<td>2024-06-25</td>
							<td>10</td>
							<td>2</td>
						</tr>
						<tr>
							<td>10</td>
							<td><a href="${ contextPath }/freeBoard/detail">오늘 점심 뭐 먹지?</a></td>
							<td>이거맞자나</td>
							<td>2024-06-25</td>
							<td>10</td>
							<td>2</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn-area">
				<button id="insertBtn">글쓰기</button>
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