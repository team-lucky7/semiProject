<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.net.URLEncoder"%>

<c:set var="boardList" value="${map.boardList}"/>
<c:set var="pagination" value="${map.pagination}"/>

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
				
			<h1 class="board-name">검색 결과</h1>
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
									<td colspan="6">게시물 조회 결과가 없습니다.</td>
								</tr>
							</c:when>
							
							<c:otherwise>
								<c:forEach var="board" items="${boardList}">
									<tr>
										<td>${board.boardNo}</td>
										<td>
											<c:if test="${!empty board.thumbnail }">
			                            		<img class="list-thumbnail" src="${contextPath}${board.thumbnail}">
			                            	</c:if>
										
											<c:if test="${board.boardCode == 3}">
												<a href="${contextPath}/freeBoard/detail?no=${board.boardNo}&type=${board.boardCode}&cp=1">${board.boardTitle}</a>
											</c:if>
											
											<c:if test="${board.boardCode >= 4 && board.boardCode <= 5}">
												<a href="${contextPath}/community/detail?no=${board.boardNo}&type=${board.boardCode}&cp=1">${board.boardTitle}</a>
											</c:if>
											
											<c:if test="${board.boardCode >= 6 && board.boardCode <= 9}">
												<a href="${contextPath}/thema/subPage?no=${board.boardNo}&type=${board.boardCode}">${board.boardTitle}</a>
											</c:if>
											
											<c:if test="${board.boardCode >= 10 && board.boardCode <= 16}">
												<a href="${contextPath}/regionSubpage/detail?no=${board.boardNo}&type=${board.boardCode}">${board.boardTitle}</a>
											</c:if>
										</td>
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
			
			<div class="pagination-area">
				<ul class="pagination">
					<c:set var="url" value="search?query=${param.query}&cp="/>
					
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
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
	<script src="${contextPath}/resources/js/header.js"></script>
</body>
</html>