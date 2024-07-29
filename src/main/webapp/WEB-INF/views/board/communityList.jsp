<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<c:set var="boardName" value="${map.boardName}" />
<c:set var="pagination" value="${map.pagination}" />
<c:set var="boardList" value="${map.boardList}" />
<c:set var="hashtagList" value="${map.hashtagList}" />
<c:set var="hashtag" value="${map.hashtag}" />
<c:set var="thumbnail" value="${map.thumbnail}" />
<c:set var="query" value="${map.query}" />
<c:set var="replyCount" value="${map.replyCount}" />




<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>커뮤니티 게시판</title>
<link rel="stylesheet"
	href="${contextPath}/resources/css/communityList.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<link rel="stylesheet" href="${contextPath}/resources/css/index.css">
<script src="https://kit.fontawesome.com/4bef400c33.js"
	crossorigin="anonymous"></script>


</head>


<body>
	<main>
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

		<div class="vacation-container">
			<div class="vacation-content">

				<div class="vacation-main">
					<div class="vacation-header">
						<span>${boardName}</span>
					</div>
					<div class="vacation-hashtag">
						<!-- 해시태그 반영 필요 -->
						<c:if test="${empty query}">
							<span># 전체</span>
						</c:if>

						<c:if test="${!empty query}">
							<span>${query}</span>
						</c:if>
					</div>
					<div class="vacation-array">
						<p>총 ${pagination.listCount}건</p>
					</div>

					<div class="vacation-post">

						<c:choose>
							<c:when test="${empty boardList}">
								<!-- 게시글 목록 조회 결과가 비어있다면 -->
								<div>
									<p>게시글이 존재하지 않습니다.</p>
								</div>
							</c:when>

							<c:otherwise>
								<c:if test="${fn:length(boardList) > 0}">
									<c:forEach var="i" begin="0" end="${fn:length(boardList)}">
										<div class="boardListBox">
											<c:if test="${empty thumbnail[i]}">
												<img src="https://via.placeholder.com/100"
													style="width: 100px; height: 100px;" alt="썸네일">
											</c:if>
											<c:if test="${!empty thumbnail[i]}">
												<img src="${contextPath}${thumbnail[i]}"
													style="width: 100px; height: 100px;" alt="썸네일">
											</c:if>

											<div class="vacation-info">
												<div class="vacation-title">
													<a
														href="detail?no=${boardList[i].boardNo}&cp=${pagination.currentPage}&type=${param.type}">${boardList[i].boardTitle}</a>
												</div>
												<div class="vacation-details">작 성 :
													${boardList[i].memberName}</div>
												<div class="vacation-details">한줄소개 :
													${boardList[i].boardContent}</div>
												<div class="vacation-details">소재지역 :
													${boardList[i].locationName}</div>
												<div class="vacation-tags">
													<c:forEach var="hash" items="${hashtag[i]}">
														<span># ${hash}</span>
													</c:forEach>

												</div>
												<div class="vacation-stats">
													<div>
														<span>조회수: ${boardList[i].readCount}</span><span>❤️
															${boardList[i].likeCount}</span><span>💬 ${replyCount[i]}</span>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>

							</c:otherwise>
						</c:choose>


					</div>

					<div class="vacation-btn-area">
						<c:if test="${not empty loginMember}">
							<!-- /community/board/write -->
							<button id="insertBtn"
								onclick="location.href='${contextPath}/community/write'">글쓰기</button>
						</c:if>
					</div>


					<!-- 페이지네이션 a태그에 사용될 공통 주소를 저장할 변수 선언 -->
					<c:set var="url" value="list?type=${param.type}&cp=" />

					<div class="pagination">
						<a href="${url}1">&lt;&lt;</a> <a
							href="${url}${pagination.prevPage}">&lt;이전</a>

						<!-- 범위가 정해진 일반 for문 사용 -->
						<c:forEach var="i" begin="${pagination.startPage}"
							end="${pagination.endPage}" step="1">

							<c:choose>
								<c:when test="${i == pagination.currentPage}">
									<a class="current">${i}</a>
								</c:when>

								<c:otherwise>
									<a href="${url}${i}">${i}</a>
								</c:otherwise>

							</c:choose>

						</c:forEach>

						<a href="${url}${pagination.nextPage}">다음&gt;</a> <a
							href="${url}${pagination.maxPage}">&gt;&gt;</a>
					</div>
				</div>


				<div class="vacation-sidebar">
					<div class="sidebar up">
						<ul>
							<p>지역</p>

							<c:set var="url" value="list?&type=${param.type}&cp=" />

							<li><a
								href="${contextPath}/community/list?&type=${param.type}"
								style="color: blue;"># 전체</a></li>

							<c:if test="${fn:length(boardList) > 0}">

								<c:forEach var="i" begin="0" end="${fn:length(hashtagList)}">
									<c:if
										test="${fn:contains(hashtagList[i].category, 'location')}">

										<li><a href="${url}&query=${hashtagList[i].name}"
											style="color: blue;"># ${hashtagList[i].name}</a></li>
									</c:if>
								</c:forEach>

							</c:if>
						</ul>
					</div>
					<br>
					<div class="sidebar down">
						<ul>
							<p>키워드</p>
							<c:if test="${fn:length(boardList) > 0}">
								<c:forEach var="i" begin="0" end="${fn:length(hashtagList)}">
									<c:if test="${fn:contains(hashtagList[i].category, 'keyword')}">

										<li><a href="${url}&query=${hashtagList[i].name}"
											style="color: blue;"># ${hashtagList[i].name}</a></li>
									</c:if>
								</c:forEach>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>

	</main>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<script src="${contextPath}/resources/js/header.js"></script>