<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="${contextPath}/resources/css/themaWrite.css">

<script src="https://kit.fontawesome.com/4bef400c33.js"crossorigin="anonymous" defer></script>
</head>


	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>


<body>
    <div class="thema-subPage-container">
        <div class="thema-title">
            <p>${detail.boardTitle}</p>
        </div>

        <!-- 테마 이미지가 있을 경우 -->
        <c:if test="${!empty detail.imageList}">
            <!-- 썸네일이 있을 경우 변수 생성 -->
            <c:if test="${detail.imageList[0].imageLevel==0}">
                <c:set var="thumbnail" value="${detail.imageList[0]}"></c:set>
            </c:if>
        </c:if>

        
        
           
        <div class="img-box">

            <c:if test="${!empty thumbnail}"> <!-- 썸네일 영역(썸네일이 있을 경우) -->
                <div class="thema-Image thumbnail">
                    <img src="${contextPath}${thumbnail.imageRename}">
                </div>
            </c:if>

            <c:if test="${empty thumbnail}"> <!-- 썸네일 없을 때 -->
                <c:set var="start" value="0" />
            </c:if>

            <c:if test="${!empty thumbnail}"> <!-- 썸네일 있을 때 -->
                <c:set var="start" value="1" />
            </c:if>   

            <!-- 업로드 이미지가 있는 경우 -->
            <c:if test="${start < fn:length(detail.imageList)}">
                <!-- 업로드 이미지 -->
                <div class="img-box">
                    <c:forEach var="i" begin="${start}" end="${fn:length(detail.imageList) -1}">
                        <div class="thema-Image">
                            <img src="${contextPath}${detail.imageList[i].imageRename}">
                        </div>
                    </c:forEach>
                </div>
            </c:if>        


        </div>
        
        
        <!-- 이용안내 -->
        <div class="thema-title">
            <p>이용안내</p>
        </div>
        <div class="thema-content">
            ${detail.boardContent}
        </div>

        <!-- 지도 -->
        <div class="thema-title">
            <p>위치</p>
        </div>
        <div class="thema-map">
            지도api
        </div>

        <!-- 버튼 -->
        <div class="board-btn-area">
            <!--  관리자 권한이있는 로그인 멤버 -->
            <c:if test="${loginMember.adminLevel != 0}">

            <!-- 파라미터 cp가 없을 경우 1 -->
            <c:if test="${empty param.cp}">
               <c:set var="cp" value="1" />
            </c:if>
                
            <!-- 파라미터 cp가 있을 경우 해당 파라미터로 세팅 -->
            <c:if test="${!empty param.cp}">
                <c:set var="cp" value="${param.cp}"/>
            </c:if>

            <button id="updateBtn" onclick="location.href='themaWrite?mode=update&no=${param.no}&cp=${cp}&type=${param.type}'">수정</button>
            <button id="deleteBtn">삭제</button>
        </c:if>
            <button id="goToListBtn">목록으로</button>
        </div>
    </div>

</body>
<footer>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${ contextPath }/resources/js/jquery-3.7.1.min.js"></script>
	<script src="${ contextPath }/resources/js/header.js"></script>
	<script src="${ contextPath }/resources/js/regionSubPage.js"></script>
	<script src="${ contextPath }/resources/js/thema.js"></script>
</footer>
</html>