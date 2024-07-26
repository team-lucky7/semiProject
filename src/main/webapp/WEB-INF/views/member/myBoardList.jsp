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
                    <h2 class="board-name">내가 작성한 자유게시글</h2>
                </div>
    
                <div class="list-wrapper">
                    <table class="list-table">
                        <thead>
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>날짜</th>
								<th>조회수</th>
								<th>좋아요</th>
							</tr>
						</thead>
						
						<tbody>
							<c:choose>
								<c:when test="${empty boardMap.boardList}">
									<tr>
										<td colspan="5">게시물 조회 결과가 없습니다.</td>
									</tr>
								</c:when>
								
								<c:otherwise>
									<c:forEach var="board" items="${boardMap.boardList}">
										<tr>
											<td>${board.boardNo}</td>
											<td><a href="${contextPath}/freeBoard/detail?no=${board.boardNo}&type=${param.type}&cp=1">${board.boardTitle}</a></td>
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
						<c:set var="url" value="boardList?&type=${param.type}&rCp=${param.rCp}&bCp="/>
						
						<li><a href="${url}1">&lt;&lt;</a></li>
						<li><a href="${url}${boardMap.pagination.prevPage}">&lt;</a></li>
						
						<c:forEach var="i" begin="${boardMap.pagination.startPage}" end="${boardMap.pagination.endPage}" step="1">
							<c:choose>
								<c:when test="${i == boardMap.pagination.currentPage}">
									<li><a class="current">${i}</a></li>
								</c:when>
								
								<c:otherwise>
									<li><a href="${url}${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<li><a href="${url}${boardMap.pagination.nextPage}">&gt;</a></li>
						<li><a href="${url}${boardMap.pagination.maxPage}">&gt;&gt;</a></li>
					</ul>
				</div>
            </section>
    
    
    
            <section class="board-list">
                <div class="board-name-div">
                    <h2 class="board-name">내가 작성한 자유게시글 댓글</h2>
                </div>

                <div class="list-wrapper">
                    <table class="list-table">
                        <thead>
							<tr>
								<th>댓글번호</th>
								<th>내용</th>
								<th>날짜</th>
								<th>좋아요</th>
							</tr>
						</thead>
						
						<tbody>
							<c:choose>
								<c:when test="${empty replyMap.replyList}">
									<tr>
										<td colspan="4">게시물 조회 결과가 없습니다.</td>
									</tr>
								</c:when>
								
								<c:otherwise>
									<c:forEach var="reply" items="${replyMap.replyList}">
										<tr>
											<td>${reply.replyNo}</td>
											<td>${reply.replyContent}</td>
											<td>${reply.createDate}</td>
											<td>${reply.likeCount}</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
                    </table>
                </div>
    
                <div class="pagination-area">
					<ul class="pagination">
						<c:set var="rUrl" value="boardList?&type=${param.type}&bCp=${param.bCp}&rCp="/>
						
						<li><a href="${rUrl}1">&lt;&lt;</a></li>
						<li><a href="${rUrl}${replyMap.pagination.prevPage}">&lt;</a></li>
						
						<c:forEach var="i" begin="${replyMap.pagination.startPage}" end="${replyMap.pagination.endPage}" step="1">
							<c:choose>
								<c:when test="${i == replyMap.pagination.currentPage}">
									<li><a class="current">${i}</a></li>
								</c:when>
								
								<c:otherwise>
									<li><a href="${rUrl}${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<li><a href="${rUrl}${replyMap.pagination.nextPage}">&gt;</a></li>
						<li><a href="${rUrl}${replyMap.pagination.maxPage}">&gt;&gt;</a></li>
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