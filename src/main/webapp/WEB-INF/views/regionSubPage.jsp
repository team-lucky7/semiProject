<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역 서브 페이지</title>
	<link rel="stylesheet" href="${ contextPath }/resources/css/header.css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/regionsubpage.css">
    <link rel="stylesheet" href="${contextPath }/resources/css/footer.css">
    
    <script src="https://kit.fontawesome.com/4bef400c33.js" crossorigin="anonymous" defer></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
 	<main>
    ${detail}
       <section class="content">
           <div class="destination">
               <div class="textbigname"><h1>${detail.boardTitle}</h1></div>
               <div class="textsmallname"><p>${detail.locationName}</p></div>
               <div class="textName"><h1>${detail.boardContent}</h1></div>
           </div>
           <div class="icons">
               <i class="fa-regular fa-heart"></i>
               <span class="icons1">asdfa</span>
               <i class="fa-solid fa-eye"></i>
               <span class="icons1">sdf</span>
           </div>

           <div class="text">
               <a href="#slide2">
                   <span>사진보기</span>
               </a>
               <span>|</span>
               <a href="#slide">
                   <span>상세보기</span>
               </a>
           </div>

           <div class="imgs">
            <c:if test="${!empty detail.imageList}">
              <c:forEach var="i" begin="0" end="${fn:length(detail.imageList) - 1}">
                <img src="${contextPath}${detail.imageList[i].imageRename}" id="slide2"></img>
              </c:forEach>
            </c:if>


           <div class="writetext">
               <span id="slide">상세정보</span>
           </div>

           <div class="writecontent">
               <span>
                  ${detail.content}
               </span>
           </div>
           <div class="KAKAOAPI">
            <div id="map" style="width:100%;height:300px;"></div>    
        </div> 
        </div>
       </section>

    </main>
    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script src="${ contextPath }/resources/js/jquery-3.7.1.min.js"></script>
  <script type="text/javascript"
  src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a672d1a3dd18b00d1ead688b41bca007&libraries=services"></script>
	<script src="${ contextPath }/resources/js/header.js"></script>
	<script src="${ contextPath }/resources/js/regionSubPage.js"></script>
	
</body>
</html>