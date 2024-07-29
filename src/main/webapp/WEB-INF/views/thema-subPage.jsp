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
<link rel="stylesheet" href="${contextPath}/resources/css/themaSubPage.css">

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
    <c:if test="${detail.imageList[0].imageLevel == 0}">
        <c:set var="thumbnail" value="${detail.imageList[0]}"></c:set>
    </c:if>
</c:if>

<div class="img-box">
    <!-- 썸네일 영역(썸네일이 있을 경우) -->
    <c:if test="${!empty thumbnail}">
        <div class="thema-Image thumbnail">
            <img src="${contextPath}${thumbnail.imageRename}">
        </div>
    </c:if>

    <!-- 썸네일이 있을 때와 없을 때를 구분 -->
    <c:set var="start" value="${empty thumbnail ? 0 : 1}" />

    <!-- 업로드 이미지가 있는 경우 -->
    <c:if test="${start < fn:length(detail.imageList)}">
        <!-- 업로드 이미지 목록에서 썸네일 이미지를 제거 -->
        <c:forEach var="i" begin="${start}" end="${fn:length(detail.imageList) -1}">
            <c:choose>
                <c:when test="${detail.imageList[i].imageRename != thumbnail.imageRename}">
                    <div class="thema-Image">
                        <img src="${contextPath}${detail.imageList[i].imageRename}">
                    </div>
                </c:when>
            </c:choose>
        </c:forEach>
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

        <div class="thema-map" id="mapDiv">
            <div class="map_wrap">
                <div id="map"></div>
            </div>
        </div>


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

            <button id="updateBtn" onclick="location.href='themaWrite?mode=update&no=${param.no}&type=${param.type}'">수정</button>
            <button id="deleteBtn">삭제</button>
        </c:if>
            <button id="goToListBtn">목록으로</button>
        </div>
    </div>

</body>
<footer>
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a672d1a3dd18b00d1ead688b41bca007&libraries=services"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${ contextPath }/resources/js/jquery-3.7.1.min.js"></script>
	<script src="${ contextPath }/resources/js/header.js"></script>
	<script src="${ contextPath }/resources/js/regionSubPage.js"></script>
	<script src="${ contextPath }/resources/js/thema.js"></script>

</footer>
</html>