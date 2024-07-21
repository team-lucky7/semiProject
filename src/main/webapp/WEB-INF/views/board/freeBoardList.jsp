<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<h1 class="board-name">자유게시판</h1>

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
        <a href="${contextPath}/communityWrite">
          <button id="insertBtn">글쓰기</button>
        </a>
			</div>

			<div class="pagination-area">
            
        <!-- 페이지네이션 a태그에 사용될 공통 주소를 저장할 변수 선언 -->
        <c:set var="url" value="list?type=${param.type}&cp=" />
      
        <ul class="pagination">
          <li><a href="${url}1">&lt;&lt;</a></li>
          <li><a href="${url}${pagination.prevPage}">&lt;</a></li>
      
          <!-- 범위가 정해진 일반 for문 사용 -->
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