<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>여행</title>
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<link rel="stylesheet" href="${contextPath}/resources/css/index.css">
<link rel="stylesheet" href="${contextPath}/resources/css/thema.css">

<script src="https://kit.fontawesome.com/4bef400c33.js"
	crossorigin="anonymous" defer></script>
</head>


	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>


<body>
    <div class="thema-explain-div">
        <p>테마설명</p>
    </div>

    <ul class="thema-explain-img">
        <li>
            <iframe width="800" height="500" 
            src="https://www.youtube.com/embed/6GUM-xmPUjc" 
            title="영월동강에서 즐기는 서바이벌게임 페인트볼 전투!! survival game" 
            frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
            referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </li>
        <li>
            <img src="https://ktourtop10.kr/data/editor/2203/7ec9f5113368d99fff1448cc43d38586_1648700040_7386.gif">
        </li>
        <li>
            <img src="https://ktourtop10.kr/data/editor/2203/7ec9f5113368d99fff1448cc43d38586_1648700042_7764.jpg">
        </li>
        <li>
            <img src="https://ktourtop10.kr/data/editor/2203/7ec9f5113368d99fff1448cc43d38586_1648700045_3489.jpg">
        </li>
        <li>
            <img src ="https://ktourtop10.kr/data/editor/2203/7ec9f5113368d99fff1448cc43d38586_1648700047_2739.jpg">
        </li>
        <li>
            <img src ="https://ktourtop10.kr/data/editor/2203/7ec9f5113368d99fff1448cc43d38586_1648700096_9383.jpg">
        </li>
        <li>
            <img src ="https://ktourtop10.kr/data/editor/2203/7ec9f5113368d99fff1448cc43d38586_1648700100_8122.jpg">
        </li>
        <li>
            <img src = "https://ktourtop10.kr/data/editor/2203/7ec9f5113368d99fff1448cc43d38586_1648700102_1909.jpg">
        </li>
    </ul>

    <div class="thema-explain-div">
        <p>이용안내</p>
    </div>
<pre>
영월 동강을 주 필드로 펼쳐지는 서바이벌게임 페인트볼 전투 체험
가족 단위, 소규모 서바이벌 게임 체험 및 초, 중, 고, 대학생 등 학생 단체,
기업 단체 등 대단위 서바이벌 게임 행사도 가능한 영월 동강의 전용 필드장에서 진행되는 생존 체험
        
예약번호: 1544-7569 / 033-375-9800
①이용희망일 1일 전 16시까지 티켓 구매
 ②업체로 전화하여 날짜 및 시간 예약
(예약 시점에 티켓은 사용처리되며, 이후로는 업체규정에 따라 취소 위약금이 발생됩니다.)
③현장 방문 및 구매자 정보 확인 후 이용
        
동강래프팅㈜ 만의 전용샤워장(온수샤워) 무료 이용가능
(전원)젖은옷 보관을 위한 지퍼백 1인 당 1매 기본지급
(래프팅구매자) 스포츠타올 선택구매 가능
현장 사무실 내 무료 와이파이, 휴게실, 매점 등 운영
고객안전 제일주의! 자동제세동기(AED) 완비
동영상 촬영서비스 현장 결제 후 이용가능
        
보다 편리한 이용을 위해 이용날짜, 시간, 참여인원, 참여프로그램 등에 대해 사전 전화예약 후 이용 해주시기 바랍니다.
영월역, 영월시외버스터미널 차량픽업 가능합니다.
(단, 사전 예약시 에만 가능/당일요청 시 픽업불가)
동강서바이벌게임 필드장은 전용필드장 기준이며, 최소 진행 전투 인원은 최대 4~6명 이상 입니다.
각 프로그램 별 최소 참여인원 모집 시 진행이 가능합니다.
(인원 미달 시 다른 프로그램으로 변경 진행이 가능합니다.)
체험 레저활동의 특이사항으로, 우천 시 프로그램 진행이 불가능할 경우 1회에 한하여 날짜변경이 가능합니다.
자세한 내용은 각 프로그램 별 세부일정을 참고해주시기 바랍니다.        
</pre>
    
    <div class="thema-explain-div">
        <p>만나는 장소</p>
    </div>
    <div>
        *지도api
    </div>

</body>
<footer>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${ contextPath }/resources/js/jquery-3.7.1.min.js"></script>
	<script src="${ contextPath }/resources/js/header.js"></script>
	<script src="${ contextPath }/resources/js/regionSubPage.js"></script>
</footer>
</html>