<%@page import="semiProject.board.model.vo.BoardImage"%>
<%@page import="semiProject.board.model.vo.BoardArticle"%>
<%@page import="java.util.List"%>
<%@page import="semiProject.board.model.vo.BoardDetail"%>
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
<link rel="stylesheet" href="${ contextPath }/resources/css/freeBoardDetail.css">
<link rel="stylesheet" href="${ contextPath }/resources/css/freeBoardReply.css">
<link rel="stylesheet" href="${ contextPath }/resources/css/footer.css">
<script src="https://kit.fontawesome.com/4bef400c33.js" crossorigin="anonymous" defer></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<main>
  
		<section class="board-detail">
			<h3 class="board-name">${detail.boardName}</h3>
			<div class="board-title">${detail.boardTitle}</div>
			<div class="board-header">
                <div class="board-writer">
                	<c:if test="${empty detail.profileImage}">
                		<img src="${contextPath}/resources/images/user.png">
                	</c:if>
                	
                	<c:if test="${!empty detail.profileImage}">
                		<img src="${contextPath}${detail.profileImage}">
                	</c:if>
                	
                    <span>${detail.memberName}</span>
                </div>

                <div class="board-info">
                    <p> <span>작성일</span> ${detail.createDate}</p>
                    
                    <c:if test="${!empty detail.updateDate}">
                    	<p> <span>마지막 수정일</span> ${detail.updateDate}</p>
                    </c:if>
                    <p> <span>조회수</span> ${detail.readCount}</p>
                </div>
            </div>

			<div class="board-content">
				<% 
					BoardDetail detail = (BoardDetail)request.getAttribute("detail");
					List<BoardArticle> articleList = detail.getArticleList();
					List<BoardImage> imageList = detail.getImageList();
					
					for(int i=0; i<articleList.size() + imageList.size(); i++){
						for(BoardArticle article : articleList){
							if(i == article.getContentLevel()){
								%><p><%=article.getContent()%></p><%
							}
						}
						
						for(BoardImage image : imageList){
							if(i == image.getImageLevel()){
								 %><img src="<%=request.getContextPath()%><%=image.getImageRename()%>"><%
							}
						}
					}
				%>
			</div>

			<div>
				<c:if test="${detail.like == true}">
					<button id="likeBtn" class="like-true" onclick="deleteLike(${detail.boardNo})">좋아요 ${detail.likeCount}</button>
				</c:if>
				
				<c:if test="${detail.like == false}">
					<button id="likeBtn" onclick="insertLike(${detail.boardNo})">좋아요 ${detail.likeCount}</button>
				</c:if>
			</div>

			<div class="board-btn-area">
				<c:if test="${loginMember.memberNo == detail.memberNo}">
					<button id="updateBtn" onclick="location.href='write?mode=update&type=${param.type}&cp=${param.cp}&no=${param.no}'">수정</button>
					<button id="deleteBtn">삭제</button>
				</c:if>
				<button id="goToListBtn">목록으로</button>
			</div>
			
			<jsp:include page="/WEB-INF/views/board/freeBoardReply.jsp"></jsp:include>

		</section>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script>
		const loginMemberNo = "${loginMember.memberNo}";
		const contextPath = "${contextPath}";
		const boardNo = "${detail.boardNo}";
	</script>
	<script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
	<script src="${contextPath}/resources/js/header.js"></script>
	<script src="${contextPath}/resources/js/freeBoard.js"></script>
	<script src="${contextPath}/resources/js/freeBoardReply.js"></script>
</body>
</html>