<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/header.css">
<link rel="stylesheet" href="${ contextPath }/resources/css/footer.css">
<link rel="stylesheet" href="${ contextPath }/resources/css/searchBoardList.css">
<script src="https://kit.fontawesome.com/4bef400c33.js" crossorigin="anonymous" defer></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<main>
		<section id="search-keyword">
			<form action="${contextPath}/search" name="search-query">
				<input type="text" name="query" placeholder="검색어 입력">
				<button class="fa-solid fa-magnifying-glass"></button>
			</form>
			<h1 class="board-name">테마</h1>
			<div class="list-wrapper">
				<div class="list-row">
					<img src="${contextPath}/resources/images/image-icon-10.jpg" alt="">
					<span>
						<h3>제목</h3>
						<h5>내용</h5>
						<ul class="hashtag-list">
							<li><a href="">#태그</a></li>
							<li><a href="">#태그</a></li>
							<li><a href="">#태그</a></li>
							<li><a href="">#태그</a></li>
							<li><a href="">#태그</a></li>
							<li><a href="">#태그</a></li>
							<li><a href="">#태그</a></li>
							<li><a href="">#태그</a></li>
							<li><a href="">#태그</a></li>
						</ul>
					</span>
				</div>
				<div class="list-row">
					<img src="${contextPath}/resources/images/image-icon-10.jpg" alt="">
					<span>
						<h3>제목</h3>
						<h5>내용</h5>
					</span>
				</div>
				<div class="list-row">
					<img src="${contextPath}/resources/images/image-icon-10.jpg" alt="">
					<span>
						<h3>제목</h3>
						<h5>내용</h5>
					</span>
				</div>
			</div>

			<h1 class="board-name">지역</h1>
			<div class="list-wrapper">
				<div class="list-row">
					<img src="${contextPath}/resources/images/image-icon-10.jpg" alt="">
					<span>
						<h3>제목</h3>
						<h5>내용</h5>
					</span>
				</div>
				<div class="list-row">
					<img src="${contextPath}/resources/images/image-icon-10.jpg" alt="">
					<span>
						<h3>제목</h3>
						<h5>내용</h5>
					</span>
				</div>
				<div class="list-row">
					<img src="${contextPath}/resources/images/image-icon-10.jpg" alt="">
					<span>
						<h3>제목</h3>
						<h5>내용</h5>
					</span>
				</div>
			</div>

			<h1 class="board-name">커뮤니티</h1>
			<div class="list-wrapper">
				<table class="list-table">
					<thead>
						<tr>
							<th>제목</th>
							<th>내용</th>
							<th>날짜</th>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td><a href="${ contextPath }/freeBoard/detail">오늘 점심 뭐 먹지?</a></td>
							<td>이거맞자나</td>
							<td>2024-06-25</td>
						</tr>
						<tr>
							<td><a href="${ contextPath }/freeBoard/detail">오늘 점심 뭐 먹지?</a></td>
							<td>이거맞자나</td>
							<td>2024-06-25</td>
						</tr>
						<tr>
							<td><a href="${ contextPath }/freeBoard/detail">오늘 점심 뭐 먹지?</a></td>
							<td>이거맞자나</td>
							<td>2024-06-25</td>
						</tr>
					</tbody>
				</table>
			</div>
		</section>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
	<script src="${contextPath}/resources/js/header.js"></script>
</body>
</html>