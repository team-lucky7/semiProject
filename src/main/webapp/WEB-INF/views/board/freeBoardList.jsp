<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="boardName" value="${map.boardName}"/>
<c:set var="pagination" value="${map.pagination}"/>
<c:set var="boardList" value="${map.boardList}"/>

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
			<h1 class="board-name">${boardName}</h1>

			<div class="list-wrapper">
				<table class="list-table">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>날짜</th>
							<th>조회수</th>
							<th>좋아요</th>
						</tr>
					</thead>
					
					<tbody>
						<c:choose>
							<c:when test="${empty boardList}">
								<tr>
									<td colspan="6">게시글 조회 결과가 없습니다.<td>
								</tr>
							</c:when>
							
							<c:otherwise>
								<c:forEach var="board" items="${boardList}">
									<tr>
										<td>${board.boardNo}</td>
										<td><a href="detail?no=${board.boardNo}&type=${param.type}&cp=${param.cp}">${board.boardTitle}</a></td>
										<td>${board.memberName}</td>
										<td>${board.createDate}</td>
										<td>${board.readCount}</td>
										<td>${board.likeCount}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<div class="btn-area">
				<button id="insertBtn">글쓰기</button>
			</div>

			<div class="pagination-area">
				<ul class="pagination">
					<c:set var="url" value="list?&type=${param.type}&cp="/>
					
					<li><a href="${url}1">&lt;&lt;</a></li>
					<li><a href="${url}${pagination.prevPage}">&lt;</a></li>
					
					<c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
						<c:choose>
							<c:when test="${i == pagination.currentPage}">
								<li><a class="current">${i}</a></li>
							</c:when>
							
							<c:otherwise>
								<li><a href="${url}${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<li><a href="${url}${pagination.nextPage}">&gt;</a></li>
					<li><a href="${url}${pagination.maxPage}">&gt;&gt;</a></li>
				</ul>
			</div>
		</section>

		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</main>
	<script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
	<script src="${contextPath}/resources/js/header.js"></script>
</body>
</html>