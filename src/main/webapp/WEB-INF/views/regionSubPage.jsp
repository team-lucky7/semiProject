<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
               <div class="textbigname"><h1>경복궁</h1></div>
               <div class="textsmallname"><p>서울시 종로구</p></div>
               <div class="textName"><h1>한국의 얼을 느낄 수 있는 경복궁</h1></div>
           </div>
           <div class="icons">
               <i class="fa-regular fa-heart"></i>
               <span class="icons1">asdfa</span>
               <i class="fa-solid fa-eye"></i>
               <span class="icons1">sdf</span>
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
               <img src="${contextPath}/resources/images/region/경복궁.jpg" alt="경복궁" id="slide2">
           </div>

           <div class="writetext">
               <span id="slide">상세정보</span>
           </div>
           <div class="writecontent">
               <span>
                   1963년 사적으로 지정되었다. 도성의 북쪽에 있다고 하여 북궐(北闕)이라고도 불리었다. 
                   <br>조선왕조의 건립에 따라 창건되어 초기에 정궁으로 사용되었으나 임진왜란 때 전소된 후 오랫동안 폐허로 남아 있다가 조선 말기 고종 때 중건되어 잠시 궁궐로 이용되었다.이 당시 궁의 규모는 390여 칸으로 크지 않았다. 
                   <br>정전(正殿)인 근정전(勤政殿) 5칸에 상하층 월대(月臺)와 행랑·근정문·천랑(穿廊)·각루(角樓)·강녕전(康寧殿) 7칸, 연생전(延生殿) 3칸, 경성전(慶成殿) 3칸, 왕의 평상시 집무처인 보평청(報平廳) 5칸 외에 상의원·중추원·삼군부(三軍府) 등이 마련되었다.
                   <br>궁의 명칭은 『시경』 주아(周雅)에 나오는 “이미 술에 취하고 
                   <br>이미 덕에 배부르니 군자만년 그대의 큰 복을 도우리라(旣醉以酒 旣飽以德 君子萬年 介爾景福).”에서 두 자를 따서 경복궁이라고 지었다.
               </span>
           </div>
           <div class="KAKAOAPI">
            <div id="map" style="width:100%;height:300px;"></div>    
        </div> 
        </div>
       </section>

    </main>
    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script src="${ contextPath }/resources/js/jquery-3.7.1.min.js"></script>
  <script type="text/javascript"
  src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a672d1a3dd18b00d1ead688b41bca007&libraries=services"></script>
	<script src="${ contextPath }/resources/js/header.js"></script>
	<script src="${ contextPath }/resources/js/regionSubPage.js"></script>
	
</body>
</html>