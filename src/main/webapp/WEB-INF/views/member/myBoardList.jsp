<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyBoardList</title>
    <link rel="stylesheet" href="${contextPath }/resources/css/header.css">
    <link rel="stylesheet" href="${contextPath }/resources/css/footer.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/myPageSideBar-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/myPageBoardList.css">
    <script src="https://kit.fontawesome.com/4bef400c33.js" crossorigin="anonymous"></script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <div class="myPage-content">

        <jsp:include page="/WEB-INF/views/member/myPageSideBar.jsp"></jsp:include>

        <div class="boardList-container">
            <section class="board-list">
                <div class="board-name-div">
                    <h2 class="board-name">내 게시글</h2>
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
    
    
    
            <section class="board-list">
                <div class="board-name-div">
                    <h2 class="board-name">내 댓글</h2>
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
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${ contextPath }/resources/js/jquery-3.7.1.min.js"></script>
    <script src="${ contextPath }/resources/js/header.js"></script>
</body>


</html>