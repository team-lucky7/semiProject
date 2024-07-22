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
        <form action="">
            <section class="content">
                <div class="select">
                    <div class="selectRegion">
                        지역 선택 : 
                    </div>
                    <select id="select-region">
                        <option value="#">서울10</option>
                        <option value="#">인천11</option>
                        <option value="#">대전12</option>
                        <option value="#">대구13</option>
                        <option value="#">부산14</option>
                        <option value="#">수원15</option>
                        <option value="#">강원도16</option>
                    </select>
                </div>
             
    
                <div class="destination">
                    <input type="text" class="textbigname" placeholder="제목을 입력해주세요.">
                    <input type="text" class="textsmallname" placeholder="지역을 입력해주세요.">
                    <input type="text" class="textName" placeholder="한줄 설명을 입력해주세요(20글자이내)">
                </div>
                <div class="text">
                  <label for="image1">사진 업로드</label></span>
                </div>
        
                <div class="boardImage">
                    <label for="image1">
                        <img src="${contextPath}/resources/images/image-icon-10.jpg">
                    </label>
                    <input type="file" class="inputImage" id="image1" accept="image/*" name="1">
                   
                    <span class="delete-image">&times;</span>
                </div>
        
                <div class="writetext">
                    <span id="slide">상세정보</span>
                </div>
                <div class="writecontent">
                    <textarea></textarea>
                </div>
        
                <div class="mapImage" id="mapDiv">
                    <div>
                        <input type="text" id="inputAddress" placeholder="주소를 입력해주세요">
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