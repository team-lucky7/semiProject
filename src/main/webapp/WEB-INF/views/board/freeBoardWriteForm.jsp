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
<link rel="stylesheet" href="${contextPath}/resources/css/freeBoardWriteForm.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<main>
		<form action="#" enctype="multipart/form-data" method="post" class="board-write"
		onsubmit="return writeValidate()">
			<div>
				<h3 class="board-name">자유게시판</h3>
				<h1 class="board-title">
					<input type="text" name="boardTitle" placeholder="제목을 입력해주세요." value="${detail.boardTitle}">
				</h1>
		
				<div class="compoContainer">
					<div class="compoBox">
						<img src="${contextPath}/resources/images/article-icon-png-14.jpg" alt="글" class="btn" onclick="addText()">
						<img src="${contextPath}/resources/images/image-icon-10.jpg" alt="그림" class="btn" onclick="addImage()">
					</div>
				</div>
			</div>

			<div id="container">
				<c:if test="${!empty detail}">
					<script>let loadContentCount = 0;</script>
					<% 
						BoardDetail detail = (BoardDetail)request.getAttribute("detail");
						List<BoardArticle> articleList = detail.getArticleList();
						List<BoardImage> imageList = detail.getImageList();
						
						for(int i=0; i<articleList.size() + imageList.size(); i++){
							for(BoardArticle article : articleList){
								if(i == article.getContentLevel()){
									%><div class="boardText">
										<textarea class="submit" name="<%=article.getContentLevel()%>"><%=article.getContent()%></textarea>
										<span class="delete-image" onclick="deleteEl(this)">&times;</span>
									</div>
									<script>loadContentCount++;</script><%
								}
							}
							
							for(BoardImage image : imageList){
								if(i == image.getImageLevel()){
									%><div class="boardImage">
										<label for="img<%=image.getImageLevel()%>">
											<img src="<%=request.getContextPath()%><%=image.getImageRename()%>">
										</label>
										<input type="file" class="inputImage submit" id="img<%=image.getImageLevel()%>" accept="image/*" name="<%=image.getImageLevel()%>" onclick="changeImage(this)">
										<span class="delete-image" onclick="deleteEl(this)">&times;</span>
									</div>
									<script>loadContentCount++;</script><%
								}
							}
						}
				%>
				</c:if>
			</div>
			
			<c:if test="${param.mode == 'insert'}">
				<button id="insert-Btn">작성완료</button>
			</c:if>
			
			<c:if test="${param.mode == 'update'}">
				<button id="update-Btn">수정하기</button>
			</c:if>
			
			<input type="hidden" id="count" name="count" value="">
	    </form>
		<button id="goToListBtn">목록으로</button>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script src="${contextPath}/resources/js/freeBoard.js"></script>
	<script src="${contextPath}/resources/js/freeBoardWriteForm.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a672d1a3dd18b00d1ead688b41bca007&libraries=services"></script>
</body>
</html>