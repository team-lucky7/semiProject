<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>커뮤니티 글 조회</title>
<link rel="stylesheet"
	href="${contextPath}/resources/css/communityWrite.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<link rel="stylesheet" href="${contextPath}/resources/css/freeBoardReply.css">
<script src="https://kit.fontawesome.com/4bef400c33.js" crossorigin="anonymous" defer></script>
<style>
	.footer-row{margin: 0;}
</style>
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<body>
	<main class="community-write">

		<div class="container1">
			<h3>${detail.boardName}</h3>
			<h1>${detail.boardTitle}</h1>
					
		</div>

		<div class="container2" id="container2">
			<div class="basic-Info" style=>
				<span>작성일 : ${detail.createDate}  |  </span> <span>작성자 : ${detail.memberName}  |  </span> <span>조회수 : ${detail.readCount}</span>
			</div>
		</div>
	
	<div class="content-box">
	
	<c:set var= "content" value= "${detail.articleList}"></c:set> 

	<c:forEach var = "i" begin="1" end="${fn:length(detail.articleList)}"> 	
		  
		  <c:if test = "${content[i].contentSize == 0}" >
				<div class = "fullContent">
					<span class = "subtitle"> ${content[i].content} </span>
				</div>
		  </c:if>
		  <c:if test = "${content[i].contentSize == 1}" >
				<div class = "halfContent">
					<span class = "subtitle"> ${content[i].content} </span>
				</div>
		  </c:if>
		  <c:if test = "${content[i].contentSize == 2}" >
		  		<div class = "fullImage">
					<img class = "fullImage" src="${contextPath}${content[i].content}">
				</div>
		  </c:if>
		  <c:if test = "${content[i].contentSize == 3}" >
		   		<div class = "halfContent">
					<img class = "halfImage" src = "${contextPath}${content[i].content}">
				</div>
		  </c:if>
		</c:forEach>
	</div>
			<span>지도정보</span>
			<div id="map" style="width:800px; height: 400px;"></div>

		<div class="hash-Area">
		    
		     
     		<c:forEach var = "hashtag" items = "${detail.hashtagList}">
		      <a href="#" style = "color : blue;" ># ${hashtag}</a>
     		</c:forEach>		

			<hr>
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

	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	<script>
	
            document.addEventListener("DOMContentLoaded", function() {
                // 서버 측에서 전달된 JSON 데이터를 JavaScript로 변환
                var jsonData = '${content[0].content}';
                if (jsonData) {
                    var obj = JSON.parse(jsonData);
                    console.log(obj.lat);
    
                    // 지도 생성 및 초기 설정
                    var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
                    var mapOption = {
                        center: new kakao.maps.LatLng(obj.lat, obj.lng), // 지도의 중심좌표를 JSON 데이터에서 가져온 좌표로 설정
                        level: 3 // 지도의 확대 레벨
                    };
    
                    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
    
                    // 마커가 표시될 위치를 JSON 데이터에서 가져온 좌표로 설정합니다
                    var markerPosition  = new kakao.maps.LatLng(obj.lat, obj.lng); 
    
                    // 마커를 생성합니다
                    var marker = new kakao.maps.Marker({
                        position: markerPosition
                    });
    
                    // 마커가 지도 위에 표시되도록 설정합니다
                    marker.setMap(map);
    
                    // 지도가 숨겨진 상태에서 로드된 경우 resize 이벤트 트리거
                    if (mapContainer.style.display === 'none') {
                        kakao.maps.event.trigger(map, 'resize');
                        map.setCenter(new kakao.maps.LatLng(obj.lat, obj.lng)); // 센터를 다시 잡아줍니다
                    }
                } else {
                    console.error("Invalid map address data");
                }
            });
        </script>
	
		<script>
      
        // 최상위 주소
        const contextPath = "${contextPath}";

        // 게시글 번호
        const boardNo = "${detail.boardNo}"; // 문자로 한다.

        // 로그인한 회원 번호
        const loginMemberNo = "${loginMember.memberNo}";

   </script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a672d1a3dd18b00d1ead688b41bca007&libraries=services"></script>
	<script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
	<script src="${contextPath}/resources/js/communityWrite.js"></script>
	<script src="${contextPath}/resources/js/freeBoardReply.js"></script>
	<script src="${contextPath}/resources/js/header.js"></script>
</body>