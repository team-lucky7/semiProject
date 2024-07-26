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
                    <input type="text" class="textbigname" placeholder="BOARD_TITLE" name="regionBoardTitle">
                    <input type="text" class="textsmallname" placeholder="LOCATION_NM" name="locationCode">
                    <input type="text" class="textName" placeholder="BOARD_CONTENT" name="regionContent">
                </div>

                <div class="text">
                  <label for="img0">사진 업로드</label></span>
                </div>
        
                <div class="img-box">
                  <div class="region-Image">
                    <label for="img0">
                      <img class="preview">
                    </label>
                    <input type="file" class="inputImage" id="img0" name="0" accept="image/*">
                    <span class="delete-image">&times;</span>
                  </div>
                </div>


                <div class="writetext">
                    <span id="slide">상세정보</span>
                </div>
                <div class="writecontent">
                    <textarea name="boardContent"></textarea>
                </div>
        
                <div class="mapImage" id="mapDiv">
                    <div>
                        <input type="text" id="inputAddress" placeholder="LOCATION_CD">
                        <button type="button" onclick="mapAddress()" id="chk">확인</button>
                    </div>

                    <div class="mapImage">
                        <div id="map" style="width:100%;height:100%;"></div>
                        <div class="hAddr">
                            <span id="centerAddr"></span>
                        </div>
                    </div>
                </div>

                <div class="board-btn-area">
                    <button type="submit" id="writeBtn">등록</button>
                    <button type="button" id="goToListBtn">목록으로</button>
                </div>


                <input type="hidden" name="mode" value="${param.mode}">

                <input type="hidden" name="type" value="${param.type}">

                <input type="hidden" name="no"   value="${param.no}">

                <input type="hidden" name="deleteList" value="" id="deleteList">
            </section>
        </form>
       
    </main>
    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a672d1a3dd18b00d1ead688b41bca007&libraries=services"></script>
	<script src="${ contextPath }/resources/js/jquery-3.7.1.min.js"></script>
	<script src="${ contextPath }/resources/js/header.js"></script>
	<script src="${ contextPath }/resources/js/regionWrite.js"></script>
	
</body>
</html>