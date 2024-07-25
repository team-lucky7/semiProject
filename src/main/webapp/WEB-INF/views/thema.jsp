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
			<p>게시글이 존재하지 않습니다.</p>
		</c:when>
		
		<c:otherwise>
			
				<c:set var="found" value="false" />
				<c:forEach var="board" items="${boardList}">
					<c:if test="${board.boardCode == 6 && !found}">
						<div class="thema-title first">
							<span>${board.boardName}</span>
							<button>저장</button>
						</div>
						<c:set var="found" value="true" />
					</c:if>
				</c:forEach>

				<ul class="thema-contents first">
					<c:forEach var="board" items="${boardList}">
						<c:if test="${board.boardCode == 6}">
							<c:if test="${!empty board.thumbnail}">
									<li>
										<a href="subPage?no=${board.boardNo}&type=${param.type}">
											<img src="${contextPath}${board.thumbnail}"></a>
										<a href="${ contextPath }/thema/subPage">
											<p>${board.boardTitle}</p>
										</a>
										<span>지역받아오기</span>
									</li>
							</c:if>
						</c:if>
					</c:forEach>
				</ul>
				
				
				<c:set var="found" value="false" />
				<c:forEach var="board" items="${boardList}">
					<c:if test="${board.boardCode == 7 && !found}">
						<div class="thema-title second">
							<span>${board.boardName}</span>
							<button>저장</button>
						</div>
						<c:set var="found" value="true" />
					</c:if>
				</c:forEach>
				<ul class="thema-contents second">
					<c:forEach var="board" items="${boardList}">
						<c:if test="${board.boardCode == 7}">
							<c:if test="${!empty board.thumbnail}">
									<li>
										<a href="subPage?no=${board.boardNo}&type=${param.type}">
											<img src="${contextPath}${board.thumbnail}"></a>
										<a href="${ contextPath }/thema/subPage">
											<p>${board.boardTitle}</p>
										</a>
										<span>지역받아오기</span>
									</li>
							</c:if>
						</c:if>
					</c:forEach>
				</ul>
				
				
				<c:set var="found" value="false" />
				<c:forEach var="board" items="${boardList}">
					<c:if test="${board.boardCode == 8 && !found}">
						<div class="thema-title first">
							<span>${board.boardName}</span>
							<button>저장</button>
						</div>
						<c:set var="found" value="true" />
					</c:if>
				</c:forEach>
				<ul class="thema-contents first">
					<c:forEach var="board" items="${boardList}">
						<c:if test="${board.boardCode == 8}">
							<c:if test="${!empty board.thumbnail}">
									<li>
										<a href="subPage?no=${board.boardNo}&type=${param.type}">
											<img src="${contextPath}${board.thumbnail}"></a>
										<a href="${ contextPath }/thema/subPage">
											<p>${board.boardTitle}</p>
										</a>
										<span>지역받아오기</span>
									</li>
							</c:if>
						</c:if>
					</c:forEach>
				</ul>
				
				
				<c:set var="found" value="false" />
				<c:forEach var="board" items="${boardList}">
					<c:if test="${board.boardCode == 9 && !found}">
						<div class="thema-title second">
							<span>${board.boardName}</span>
							<button>저장</button>
						</div>
						<c:set var="found" value="true" />
					</c:if>
				</c:forEach>
				<ul class="thema-contents second">
					<c:forEach var="board" items="${boardList}">
						<c:if test="${board.boardCode == 9}">
							<c:if test="${!empty board.thumbnail}">
									<li>
										<a href="subPage?no=${board.boardNo}&type=${param.type}">
											<img src="${contextPath}${board.thumbnail}"></a>
										<a href="${ contextPath }/thema/subPage">
											<p>${board.boardTitle}</p>
										</a>
										<span>지역받아오기</span>
									</li>
							</c:if>
						</c:if>
					</c:forEach>
				</ul>
				
				
		</c:otherwise>
	</c:choose>

</section>



<div id="more">
	<button id="load-more-btn">더보기</button>
</div>

<div class="write">

	<c:if test="${!empty loginMember}">

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