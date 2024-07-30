<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>커뮤니티 글 작성</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/communityWrite.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
</head>
<body>
<main class="community-write">

	<form action="write" enctype="multipart/form-data" method="POST" class="community-write" onsubmit = "return writeValidate()">

		<div class="container1">
			<h1>여행정보 작성</h1>
			<div>
				<span class="subtitle"> 커뮤니티 : </span>
				<select name="category">
					<option value = 4>휴양지</option>
					<option value = 5>맛집정보</option>
				</select>
			</div>
			<div class="subContainer">
				<span class="subtitle">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목 : </span>
				<input type="text" size="80px" name="inputSubtitle" required>
			</div>
			
			<div class="subContainer">
				<span class="subtitle"> 한줄소개 : </span>
				<input type="text" size="80px" name="inputIntro" required>
			</div>
		</div>
		
		<div class="container2" id="container2">
		
			<div class="compoContainer">
		
				<div class="compoBox"> 
					<img src="../resources/images/article-icon-png-14.jpg" alt="글" class="imgFull btn" onclick="addFullText()">
					<img src="../resources/images/image-icon-10.jpg" alt="그림" class="imgFull btn" onclick="addFullImage()">
					<img src="../resources/images/article-icon-png-14.jpg" alt="반글" class="imgHalf btn" onclick="addHalfText()">
					<img src="../resources/images/image-icon-10.jpg" alt="반그림" class="imgHalf btn" onclick="addHalfImage()">
					<img src="../resources/images/Map_1135px_1195280_42272.png" alt="지도" class="imgFull btn" onclick="showMap()">
				</div>
			</div>
		</div>
		
		
		
		<div class="mapImage"  id="mapDiv">
			<div>
				<input type="text" id="inputAddress" placeholder="주소를 입력해주세요">
				<button type="button" onclick="mapAddress()">확인</button>
			</div>
			
			<div class="map_wrap">
				<div id="map" style="width:100%;height:400px;position:relative;overflow:hidden;"></div>
				<div class="hAddr">
					<span id="centerAddr"></span>
				</div>
				
			</div>
			
			<img src="../resources/images/x-button-327024.png" class="xBtn" onclick="hideMap()">
		</div>
			
			<div>
				<span>해시태그</span>
				<button type="button" onclick="addHashtag()">+</button>
			<div class="hashtag">
			</div>
		</div>
			
		<div style="text-align: center; width: 800px;">
			<button type="submit" id="submit">작성완료</button>
		</div>

		<input type="hidden" id = "mapAdr" name = "mapAdr">

	</form>
		
</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
	<script src="${contextPath}/resources/js/header.js"></script>
	
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a672d1a3dd18b00d1ead688b41bca007&libraries=services"></script>
	
	<script>
		const contextPath = "${contextPath}";
	</script>
	<script src="${contextPath}/resources/js/communityWrite.js"></script>
	<script src="${contextPath}/resources/js/header.js"></script>
</body>

</html>
