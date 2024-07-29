<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>테마 글쓰기</title>
            <link rel="stylesheet" href="${contextPath}/resources/css/themaWrite.css">
            <link rel="stylesheet" href="${contextPath}/resources/css/header.css">
            <link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
            <link rel="stylesheet" href="${contextPath}/resources/css/index.css">

            <script src="https://kit.fontawesome.com/4bef400c33.js" crossorigin="anonymous" defer></script>
        </head>

        <body>
            <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

            <form action="themaWrite" enctype="multipart/form-data" method="POST" class="thema-write"
                onsubmit="return writeValidate()">

                <input type="hidden" name="mode" value="${param.mode}">
                <input type="hidden" name="no" value="${detail.boardNo}">
                <input type="hidden" name="type" value="${detail.boardCode}">
                <input type="hidden" id="mapAdr" name="mapAdr">

                <div class="thema-select">
                    카테고리 :
                    <select name="category">
                        <option value="6">감성 힐링 여행</option>
                        <option value="7">이색 체험 여행</option>
                        <option value="8">레저 체험 여행</option>
                        <option value="9">맞춤 투어 여행</option>
                    </select>
                </div>


                <div class="thema-title">
                    <input type="text" name="themaTitle" placeholder="제목을 입력해주세요(30자 이내).  ↓↓ 첫 번째 파일은 썸네일입니다. ↓↓"
                        maxlength="30" value="${detail.boardTitle}">
                </div>

                <!-- imageList에 존재하는 이미지 레벨을 이용해서 변수 생성 -->
                <c:forEach items="${detail.imageList}" var="boardImage">

                    <c:choose>

                        <c:when test="${boardImage.imageLevel==0}">
                            <c:set var="img0" value="${contextPath}${boardImage.imageRename}" />
                        </c:when>

                        <c:when test="${boardImage.imageLevel==1}">
                            <c:set var="img1" value="${contextPath}${boardImage.imageRename}" />
                        </c:when>

                        <c:when test="${boardImage.imageLevel==2}">
                            <c:set var="img2" value="${contextPath}${boardImage.imageRename}" />
                        </c:when>

                        <c:when test="${boardImage.imageLevel==3}">
                            <c:set var="img3" value="${contextPath}${boardImage.imageRename}" />
                        </c:when>

                        <c:when test="${boardImage.imageLevel==4}">
                            <c:set var="img4" value="${contextPath}${boardImage.imageRename}" />
                        </c:when>

                    </c:choose>

                </c:forEach>

                <div class="img-box">
                    <div class="thema-Image">
                        <label for="img0">
                            <img class="preview" src="${img0}">
                        </label>
                        <input type="file" class="inputImage" id="img0" name="0" accept="image/*">
                        <span class="delete-image">&times;</span>
                    </div>

                    <div class="thema-Image">
                        <label for="img1">
                            <img class="preview" src="${img1}">
                        </label>
                        <input type="file" class="inputImage" id="img1" name="1" accept="image/*">
                        <span class="delete-image">&times;</span>
                    </div>

                    <div class="thema-Image">
                        <label for="img2">
                            <img class="preview" src="${img2}">
                        </label>
                        <input type="file" class="inputImage" id="img2" name="2" accept="image/*">
                        <span class="delete-image">&times;</span>
                    </div>

                    <div class="thema-Image">
                        <label for="img3">
                            <img class="preview" src="${img3}">
                        </label>
                        <input type="file" class="inputImage" id="img3" name="3" accept="image/*">
                        <span class="delete-image">&times;</span>
                    </div>

                    <div class="thema-Image">
                        <label for="img4">
                            <img class="preview" src="${img4}">
                        </label>
                        <input type="file" class="inputImage" id="img4" name="4" accept="image/*">
                        <span class="delete-image">&times;</span>
                    </div>
                </div>

                <!-- 이용안내 -->
                <div class="thema-title">
                    <p>이용안내</p>
                </div>
                <div class="thema-content">
                    <textarea name="themaContent" placeholder="내용을 입력해주세요(1200자 이내)." maxlength="1200">${detail.boardContent}</textarea>
                </div>

                <!-- 지도 -->
                <div class="thema-title">
                    <p>위치</p>
                </div>
                <div class="thema-map" id="mapDiv">
                    <div class="inputAddress-area">
                        <input type="text" id="inputAddress" placeholder="검색후 위치를 선택해 주세요.">
                        <button type="button" onclick="mapAddress()" id="chk">확인</button>
                    </div>

                    <div class="map_wrap">
                        <div class="hAddr">
                            <span name="locationName" id="centerAddr"></span>
                        </div>
                        <div id="map"></div>
                    </div>
                </div>

                <c:if test="${!empty detail.content}">
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
                </c:if>

                <!-- 버튼 -->
                <div class="board-btn-area">
                    <button type="submit" id="writeBtn">등록</button>

                    <c:if test="${param.mode == 'insert'}">
                        <!-- insert 모드 -->
                        <button type="button" id="goToListBtn">목록으로</button>
                    </c:if>

                    <c:if test="${param.mode=='update'}">
                        <!-- update 모드 -->
                        <button type="button" onclick="location.href='${header.referer}'">이전으로</button>
                    </c:if>
                </div>

                <input type="hidden" name="deleteList" value="" id="deleteList">

            </form>
            <script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a672d1a3dd18b00d1ead688b41bca007&libraries=services"></script>
        </body>

        <footer>
            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
            <script src="${ contextPath }/resources/js/jquery-3.7.1.min.js"></script>
            <script src="${ contextPath }/resources/js/header.js"></script>
            <script src="${ contextPath }/resources/js/regionSubPage.js"></script>
            <script src="${ contextPath }/resources/js/themaWrtie.js"></script>
            <script src="${ contextPath }/resources/js/thema.js"></script>
        </footer>

        </html>