<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역 작성 페이지(관리자)</title>
	<link rel="stylesheet" href="${ contextPath }/resources/css/header.css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/regionWrite.css">
    <link rel="stylesheet" href="${ contextPath }/resources/css/footer.css">
    
    <script src="https://kit.fontawesome.com/4bef400c33.js" crossorigin="anonymous" defer></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
    <main>
        <form action="regionWrite" enctype="multipart/form-data" method="POST" onsubmit="return writeValidate()">
            <section class="content">
                <div class="select">
                    <div class="selectRegion">
                        지역 선택 : 
                    </div>
                    <select id="select-region" name="category">
                        <option value="10">서울</option>
                        <option value="11">인천</option>
                        <option value="12">대전</option>
                        <option value="13">대구</option>
                        <option value="14">부산</option>
                        <option value="15">수원</option>
                        <option value="16">강원도</option>
                    </select>
                </div>
             
    
                <div class="destination">
                    <input type="text" class="textbigname" placeholder="제목을 입력하세요." name="regionBoardTitle">
                    <input type="text" class="textsmallname" placeholder="도시명을 입력하세요." name="locationCode">
                    <input type="text" class="textName" placeholder="한 줄 소개를 입력하세요." name="boardContent">
                </div>

                <div class="text">
                  <label for="img0">사진 업로드</label></span>
                </div>
        
                <div class="img-box">
                  <div class="region-Image">
                    <label for="img0" id="OMG">
                      <img class="preview">
                    </label>
                    <input type="file" class="inputImage" id="img0" name="0" accept="image/*" >
                    <span class="delete-image">&times;</span>
                  </div>
                </div>


                <div class="writetext">
                    <span id="slide">상세정보</span>
                </div>
                <div class="writecontent">
                    <textarea name="regionContent"></textarea>
                </div>
        
                <div class="mapImage" id="mapDiv">
                    <div>
                        <input type="text" id="inputAddress">
                        <button type="button" onclick="mapAddress()" id="chk">확인</button>
                    </div>

                    <div class="KAKAOAPI">
                        <div id="map" style="width:100%;height:400px;"></div>    
                        </div>
                    </div>
                </div>

                <div class="board-btn-area">
                    <button type="submit" id="writeBtn">등록</button>
                    <button type="button" id="goToListBtn">목록으로</button>
                </div>


                <input type="hidden" name="mode" value="${param.mode}">

                <input type="hidden" name="type" value="${param.type}">

                <input type="hidden" name="deleteList" value="" id="deleteList">
                
                <input type="hidden" id = "mapAdr" name = "mapAdr">

            </section>
        </form>
       
    </main>
    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a672d1a3dd18b00d1ead688b41bca007&libraries=services"></script>
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
            }
        });
    </script>
	<script src="${ contextPath }/resources/js/jquery-3.7.1.min.js"></script>
	<script src="${ contextPath }/resources/js/header.js"></script>
	<script src="${ contextPath }/resources/js/regionWrite.js"></script>
	
</body>
</html>