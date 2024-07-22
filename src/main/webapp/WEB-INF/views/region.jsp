<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역</title>
<link rel="stylesheet" href="${contextPath }/resources/css/header.css">
<link rel="stylesheet" href="${contextPath }/resources/css/region.css">
<link rel="stylesheet" href="${contextPath }/resources/css/footer.css">

<script src="https://kit.fontawesome.com/4bef400c33.js" crossorigin="anonymous"></script>
</head>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<body>

<main>
    <section class="region-Btn">
      <div class="Btn-add">
        <a href="#" >
          <button><img src="${contextPath}/resources/images/region/서울버튼.jpg"> <span>서울</span></button>
        </a>
      </div>
      <div class="Btn-add">
        <a href="#">
          <button><img src="${contextPath}/resources/images/region/인천 버튼2.jpg"> <span>인천</span></button>
        </a>
      </div>
      <div class="Btn-add">
        <a href="#">
          <button><img src="${contextPath}/resources/images/region/대전 버튼.jpg"> <span>대전</span></button>
        </a>
      </div>
      <div class="Btn-add">
        <a href="#">
          <button><img src="${contextPath}/resources/images/region/인천 버튼jpg.jpg"> <span>대구</span></button>
        </a>
      </div>
      <div class="Btn-add">
        <a href="#">
          <button><img src="${contextPath}/resources/images/region/서울버튼.jpg"> <span>부산</span></button>
        </a>
      </div>
      <div class="Btn-add">
        <a href="#">
          <button><img src="${contextPath}/resources/images/region/서울버튼.jpg"> <span>수원</span></button>
        </a>
      </div>
      <div class="Btn-add">
        <a href="#">
          <button><img src="${contextPath}/resources/images/region/서울버튼.jpg"> <span>강원도</span></button>
        </a>
      </div>
    </section>

      <section class="content">
        <form action="#">
          <div class="contentMain">
            <a href="${ contextPath }/regionSubpage"> 
              <div class="main-content"> <!--  //== 6000px -->
                <div class="main-add"> <!-- //== 각각 2000px -->
                  <div class="image">
                    <img src="${contextPath}/resources/images/region/경복궁.jpg" id="image">
                  </div>
                  <div class="text">
                    <h1>경복궁</h1>
                    <span>경복궁은 조선 왕조 제일의 법궁이다. <br>
                      1395년 태조 이성계가 창건 하였고, 1592년 임진왜란으로 불타 없어졌다가
                      고종때인 1867년 중건 되었다. <br>
                    </span>
                    <div class="kakaoAPI">
                      <div id="staticMap" style="width:500px;height:300px; border-radius:20px;"></div>
                    </div>
                  </div>
                </div>
                <div class="main-add">
                  <div class="image">
                    <img src="${contextPath}/resources/images/region/인천 배경.jpg" id="image">
                  </div>
                  <div class="text">
                    <h1>인천배경</h1>
                    <span>안녕하십니까 여기는 경복궁입니다. <br>
                      아주 좋아요 한국 좋아요 한국 멋있어요 <br>
                      김치 맛있어요. 경복궁 이뻐요 l love korea
                    </span>
                    <div class="kakaoAPI">
                      카카오
                    </div>
                  </div>
                </div>
                <div class="main-add">
                  <div class="image">
                    <img src="${contextPath}/resources/images/region/대전엑스포.jpg" id="image">
                  </div>
                  <div class="text">
                    <h1>대전엑스포</h1>
                    <span>안녕하십니까 여기는 경복궁입니다. <br>
                      아주 좋아요 한국 좋아요 한국 멋있어요 <br>
                      김치 맛있어요. 경복궁 이뻐요 l love korea
                    </span>
                    <div class="kakaoAPI">
                      카카오
                    </div>
                  </div>
                </div>
                <div class="main-add">
                  <div class="image">
                    <img src="${contextPath}/resources/images/region/경복궁.jpg" id="image">
                  </div>
                  <div class="text">
                    <h1>경복궁</h1>
                    <span>안녕하십니까 여기는 경복궁입니다. <br>
                      아주 좋아요 한국 좋아요 한국 멋있어요 <br>
                      김치 맛있어요. 경복궁 이뻐요 l love korea
                    </span>
                    <div class="kakaoAPI">
                      카카오
                    </div>
                  </div>
                </div>
                <div class="main-add">
                  <div class="image">
                    <img src="${contextPath}/resources/images/region/경복궁.jpg" id="image">
                  </div>
                  <div class="text">
                    <h1>경복궁</h1>
                    <span>안녕하십니까 여기는 경복궁입니다. <br>
                      아주 좋아요 한국 좋아요 한국 멋있어요 <br>
                      김치 맛있어요. 경복궁 이뻐요 l love korea
                    </span>
                    <div class="kakaoAPI">
                      카카오
                    </div>
                  </div>
                </div>
                <div class="main-add">
                  <div class="image">
                    <img src="${contextPath}/resources/images/region/경복궁.jpg" id="image">
                  </div>
                  <div class="text">
                    <h1>경복궁</h1>
                    <span>안녕하십니까 여기는 경복궁입니다. <br>
                      아주 좋아요 한국 좋아요 한국 멋있어요 <br>
                      김치 맛있어요. 경복궁 이뻐요 l love korea
                    </span>
                    <div class="kakaoAPI">
                      카카오
                    </div>
                  </div>
                </div>
              </div>
            </a>
          </div>
          
          <c:if test="${! empty loginMember}">
            
            <div id="write">
              <button id="insertBtn">
                <a href="${contextPath}/board/regionWrite">글쓰기</a>
              </button>
            </div>
          </c:if>

          
         
          
        </form>
        <button id="left"><i class="fa-solid fa-chevron-left"></i></button>
        <button id="right"><i class="fa-solid fa-chevron-right"></i></button>
        <div>
         
        </div>
      </section>
  </main>


	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
  
	<script src="${ contextPath }/resources/js/jquery-3.7.1.min.js"></script>
  <script type="text/javascript"
  src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a672d1a3dd18b00d1ead688b41bca007&libraries=services"></script>
	<script src="${ contextPath }/resources/js/region.js"></script>
	<script src="${ contextPath }/resources/js/header.js"></script>
</body>
</html>