<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			
			<c:if test="${fn:length(mapList) == 2}">
				<h1 class="board-name">${mapList[0].boardName}</h1>
				<div class="list-wrapper">
					<c:if test="${empty mapList[0].boardList}">
						<div class="list-row">
							검색 결과가 없습니다.
						</div>
					</c:if>
					<c:if test="${!empty mapList[0].boardList}">
						<c:forEach var="i" begin="0" end="${fn:length(mapList[0].boardList) - 1}">
							<div class="list-row">
								<c:if test="${empty mapList[0].boardList[i].thumbnail}">
									<img src="${contextPath}/resources/images/image-icon-10.jpg">
								</c:if>
								
								<c:if test="${!empty mapList[0].boardList[i].thumbnail}">
									<img src="${contextPath}${mapList[0].boardList[i].thumbnail}">
								</c:if>
								<span>
									<h3>${mapList[0].boardList[i].boardTitle}</h3>
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
						</c:forEach>
					</c:if>
				</div>
			
				<h1 class="board-name">${mapList[1].boardName}</h1>
				<div class="list-wrapper">
					<c:if test="${empty mapList[1].boardList}">
						<div class="list-row">
							검색 결과가 없습니다.
						</div>
					</c:if>
					<c:if test="${!empty mapList[1].boardList}">
						<c:forEach var="i" begin="0" end="${fn:length(mapList[1].boardList) - 1}">
							<div class="list-row">
								<c:if test="${empty mapList[1].boardList[i].thumbnail}">
									<img src="${contextPath}/resources/images/image-icon-10.jpg">
								</c:if>
								
								<c:if test="${!empty mapList[1].boardList[i].thumbnail}">
									<img src="${contextPath}${mapList[1].boardList[i].thumbnail}">
								</c:if>
								<span>
									<h3>${mapList[1].boardList[i].boardTitle}</h3>
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
						</c:forEach>
					</c:if>
				</div>
			</c:if>

			<c:if test="${fn:length(mapList) == 3}">
				<h1 class="board-name">${mapList[0].boardName}</h1>
				<div class="list-wrapper">
					<c:if test="${empty mapList[0].boardList}">
						<div class="list-row">
							검색 결과가 없습니다.
						</div>
					</c:if>
					<c:if test="${!empty mapList[0].boardList}">
						<c:forEach var="i" begin="0" end="${fn:length(mapList[0].boardList) - 1}">
							<div class="list-row">
								<c:if test="${empty mapList[0].boardList[i].thumbnail}">
									<img src="${contextPath}/resources/images/image-icon-10.jpg">
								</c:if>
								
								<c:if test="${!empty mapList[0].boardList[i].thumbnail}">
									<img src="${contextPath}${mapList[0].boardList[i].thumbnail}">
								</c:if>
								<span>
									<h3>${mapList[0].boardList[i].boardTitle}</h3>
									<h5>내용</h5>
								</span>
							</div>
						</c:forEach>
					</c:if>
				</div>
				
				<h1 class="board-name">${mapList[1].boardName}</h1>
				<div class="list-wrapper">
					<c:if test="${empty mapList[1].boardList}">
						<div class="list-row">
							검색 결과가 없습니다.
						</div>
					</c:if>
					<c:if test="${!empty mapList[1].boardList}">
						<c:forEach var="i" begin="0" end="${fn:length(mapList[1].boardList) - 1}">
							<div class="list-row">
								<c:if test="${empty mapList[1].boardList[i].thumbnail}">
									<img src="${contextPath}/resources/images/image-icon-10.jpg">
								</c:if>
								
								<c:if test="${!empty mapList[1].boardList[i].thumbnail}">
									<img src="${contextPath}${mapList[1].boardList[i].thumbnail}">
								</c:if>
								<span>
									<h3>${mapList[1].boardList[i].boardTitle}</h3>
									<h5>내용</h5>
								</span>
							</div>
						</c:forEach>
					</c:if>
				</div>
				
				<h1 class="board-name">${mapList[2].boardName}</h1>
				<div class="list-wrapper">
					<table class="list-table">
						<c:if test="${empty mapList[2].boardList}">
							검색 결과가 없습니다.
						</c:if>
						<c:if test="${!empty mapList[2].boardList}">
							<thead>
								<tr>
									<th>제목</th>
									<th>내용</th>
									<th>날짜</th>
								</tr>
							</thead>
							<c:forEach var="i" begin="0" end="${fn:length(mapList[2].boardList) - 1}">
								<tbody>
									<tr>
										<td><a href="${contextPath}/freeBoard/detail?no=${mapList[2].boardList[i].boardNo}&type=3&cp=${mapList[2].pagination.currentPage}">${mapList[2].boardList[i].boardTitle}</a></td>
										<td>${mapList[2].boardList[i].memberName}</td>
										<td>${mapList[2].boardList[i].createDate}</td>
									</tr>
								</tbody>
							</c:forEach>
						</c:if>
					</table>
				</div>
			</c:if>
		</section>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
	<script src="${contextPath}/resources/js/header.js"></script>
</body>
</html>