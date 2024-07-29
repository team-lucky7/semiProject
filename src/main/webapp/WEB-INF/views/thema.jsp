<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>테마</title>
				<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
				<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
				<link rel="stylesheet" href="${contextPath}/resources/css/index.css">
				<link rel="stylesheet" href="${contextPath}/resources/css/thema.css">

				<script src="https://kit.fontawesome.com/4bef400c33.js" crossorigin="anonymous" defer></script>
			</head>

			<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

			<body id="thema-container">


				<section class="thema-main">
					<c:choose>
						<c:when test="${empty boardList}">
							<p id="emptyBoardList">게시글이 존재하지 않습니다.</p>
						</c:when>

						<c:otherwise>

							<c:set var="found" value="false" />
							<c:forEach var="board" items="${boardList}">
								<c:if test="${board.boardCode == 6 && !found}">
									<div class="thema-title first">
										<span>${board.boardName}</span>
									</div>
									<c:set var="found" value="true" />
								</c:if>
							</c:forEach>

							<ul class="thema-contents first">
								<c:forEach var="board" items="${boardList}">
									<c:if test="${board.boardCode == 6}">
										<li>
											<c:if test="${!empty board.thumbnail}">
												<a href="subPage?no=${board.boardNo}&type=6"><img src="${contextPath}${board.thumbnail}"></a>
											</c:if>
											<c:if test="${empty board.thumbnail}">
												<a href="subPage?no=${board.boardNo}&type=6"><img src="${contextPath}/resources/images/image-icon-10.jpg"></a>
											</c:if>
											<a href="${ contextPath }/thema/subPage">
												<p>${board.boardTitle}</p>
											</a>
											<span>${board.locationName}</span>
										</li>
									</c:if>
								</c:forEach>
							</ul>

							<c:set var="found" value="false" />
							<c:forEach var="board" items="${boardList}">
								<c:if test="${board.boardCode == 7 && !found}">
									<div class="thema-title first">
										<span>${board.boardName}</span>
									</div>
									<c:set var="found" value="true" />
								</c:if>
							</c:forEach>

							<ul class="thema-contents first">
								<c:forEach var="board" items="${boardList}">
									<c:if test="${board.boardCode == 7}">
										<li>
											<c:if test="${!empty board.thumbnail}">
												<a href="subPage?no=${board.boardNo}&type=7"><img src="${contextPath}${board.thumbnail}"></a>
											</c:if>
											<c:if test="${empty board.thumbnail}">
												<a href="subPage?no=${board.boardNo}&type=7"><img src="${contextPath}/resources/images/image-icon-10.jpg"></a>
											</c:if>
											<a href="${ contextPath }/thema/subPage">
												<p>${board.boardTitle}</p>
											</a>
											<span>${board.locationName}</span>
										</li>
									</c:if>
								</c:forEach>
							</ul>

							<c:set var="found" value="false" />
							<c:forEach var="board" items="${boardList}">
								<c:if test="${board.boardCode == 8 && !found}">
									<div class="thema-title first">
										<span>${board.boardName}</span>
									</div>
									<c:set var="found" value="true" />
								</c:if>
							</c:forEach>

							<ul class="thema-contents first">
								<c:forEach var="board" items="${boardList}">
									<c:if test="${board.boardCode == 8}">
										<li>
											<c:if test="${!empty board.thumbnail}">
												<a href="subPage?no=${board.boardNo}&type=8"><img src="${contextPath}${board.thumbnail}"></a>
											</c:if>
											<c:if test="${empty board.thumbnail}">
												<a href="subPage?no=${board.boardNo}&type=8"><img src="${contextPath}/resources/images/image-icon-10.jpg"></a>
											</c:if>
											<a href="${ contextPath }/thema/subPage">
												<p>${board.boardTitle}</p>
											</a>
											<span>${board.locationName}</span>
										</li>
									</c:if>
								</c:forEach>
							</ul>

							<c:set var="found" value="false" />
							<c:forEach var="board" items="${boardList}">
								<c:if test="${board.boardCode == 9 && !found}">
									<div class="thema-title first">
										<span>${board.boardName}</span>
									</div>
									<c:set var="found" value="true" />
								</c:if>
							</c:forEach>

							<ul class="thema-contents first">
								<c:forEach var="board" items="${boardList}">
									<c:if test="${board.boardCode == 9}">
										<li>
											<c:if test="${!empty board.thumbnail}">
												<a href="subPage?no=${board.boardNo}&type=9"><img src="${contextPath}${board.thumbnail}"></a>
											</c:if>
											<c:if test="${empty board.thumbnail}">
												<a href="subPage?no=${board.boardNo}&type=9"><img src="${contextPath}/resources/images/image-icon-10.jpg"></a>
											</c:if>
											<a href="${ contextPath }/thema/subPage">
												<p>${board.boardTitle}</p>
											</a>
											<span>${board.locationName}</span>
										</li>
									</c:if>
								</c:forEach>
							</ul>




						</c:otherwise>
					</c:choose>

				</section>




				<div class="write">

					
					<c:if test="${loginMember.adminLevel != 0 && !empty loginMember}">

						<button id="insertBtn"
							onclick="location.href='themaWrite?mode=insert&type=${param.type}'">글쓰기</button>
					</c:if>

				</div>

				<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
				<script src="${ contextPath }/resources/js/jquery-3.7.1.min.js"></script>
				<script src="${ contextPath }/resources/js/header.js"></script>
				<script src="${ contextPath }/resources/js/thema.js"></script>
				<script>
					const contextPath = "${contextPath}";
				</script>

			</body>

			</html>