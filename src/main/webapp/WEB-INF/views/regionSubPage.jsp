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
            <section class="content">
                <div class="destination">
                    <div class="textbigname"><h1>${detail.boardTitle}</h1></div>
                    <div class="textsmallname"><p>${detail.locationName}</p></div>
                    <div class="textName"><h1>${detail.boardContent}</h1></div>
                </div>
                <div class="icons">
                    <i class="fa-regular fa-heart"></i>
                    <span class="icons1">${detail.likeCount}</span>
                    <i class="fa-solid fa-eye"></i>
                    <span class="icons1">${detail.readCount}</span>
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
                 <div id="map" style="width:100%;height:400px;"></div>    
             </div> 
             </div>
            </section>

            <div class="board-btn-area">
                <button type="submit" id="writeBtn">등록</button>
                <button type="button" id="goToListBtn">목록으로</button>
            </div>

    </main>
    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script src="${ contextPath }/resources/js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a672d1a3dd18b00d1ead688b41bca007&libraries=services"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // 서버 측에서 전달된 JSON 데이터를 JavaScript로 변환
            var jsonData = '${detail.content}';
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
	<script src="${ contextPath }/resources/js/header.js"></script>
	<script src="${ contextPath }/resources/js/regionSubPage.js"></script>
	
</body>
</html>