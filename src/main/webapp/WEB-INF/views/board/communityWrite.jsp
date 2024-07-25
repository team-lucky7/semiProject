<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>커뮤니티 글 작성</title>
<link rel="stylesheet"
	href="${contextPath}/resources/css/communityWrite.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

</head>
<body>
	<main class="community-write">

		<div class="container1">
			<h1>제목이 들어갈 겁니다 약간 길지도.</h1>
			<h3>DB에 한줄 요약소개 부분을 넣을 겂니다.</h3>

		</div>

		<div class="container2" id="container2">
			<div class="basic-Info" style=>
				<span>작성일 :</span> <span>작성자:</span> <span>조회수 :</span>
			</div>
			<div class="compoContainer">
				<div class="compoBox">
					<button class="btn" id="gray">수 정</button>
					<button class="btn" id="red">삭 제</button>
					<button class="btn" id="blue">복 구</button>
				</div>
			</div>
		</div>


		<div class="mapImage" id="mapDiv">
			<div class="map_wrap">
				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
				<div class="hAddr">
					<span id="centerAddr"></span>
				</div>

			</div>
		</div>

		<div class="hash-Area">
			<span>#해시태그1</span>
			<span>#해시태그1</span>
			<span>#해시태그1</span>
			<span>#해시태그1</span>
			<hr>
		</div>

		<div style="text-align: center; width: 800px;">
			<button type="submit" id="submit">목록으로</button>
		</div>

	</main>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a672d1a3dd18b00d1ead688b41bca007&libraries=services"></script>

	<script src="${contextPath}/resources/js/communityWrite.js"></script>
</body>


</html>