<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
 ${detail}
    <section class="region-Btn">
      <div class="Btn-add">
        <a href="${ contextPath }/region?type=10" >
          <button><img src="${contextPath}/resources/images/region/서울버튼.jpg"> <span>서울</span></button>
        </a>
      </div>
      <div class="Btn-add">
        <a href="${ contextPath }/region?type=11&no=521">
          <button><img src="${contextPath}/resources/images/region/인천버튼.jpg"> <span>인천</span></button>
        </a>
      </div>
      <div class="Btn-add">
        <a href="${ contextPath }/region?type=12">
          <button><img src="${contextPath}/resources/images/region/대전버튼.jpg"> <span>대전</span></button>
        </a>
      </div>
      <div class="Btn-add">
        <a href="${ contextPath }/region?type=13">
          <button><img src="${contextPath}/resources/images/region/대구버튼.png"> <span>대구</span></button>
        </a>
      </div>
      <div class="Btn-add">
        <a href="${ contextPath }/region?type=14">
          <button><img src="${contextPath}/resources/images/region/부산버튼.png"> <span>부산</span></button>
        </a>
      </div>
      <div class="Btn-add">
        <a href="${ contextPath }/region?type=15">
          <button><img src="${contextPath}/resources/images/region/수원버튼.png"> <span>수원</span></button>
        </a>
      </div>
      <div class="Btn-add">
        <a href="${ contextPath }/region?type=16">
          <button><img src="${contextPath}/resources/images/region/강원도버튼.jpg"> <span>강원도</span></button>
        </a>
      </div>
    </section>
      <section class="content">
        <form action="#">
          <div class="contentMain">
            <div class="main-content">
          
              <a href="regionSubpage/detail?no=${board.boardNo}&type=${param.type}">
                <div class="main-add">
          
                  <div class="imgs">
                    <c:if test="${!empty detail.imageList}">
                      <c:forEach var="i" begin="0" end="${fn:length(detail.imageList) - 1}">
                        <img src="${contextPath}${detail.imageList[i].imageRename}" id="image${i}">
                      </c:forEach>
                    </c:if>
                  </div>
                  <div class="text">
                    <h1>${detail.boardTitle}</h1>
                    <span>${detail.boardContent}</span>
          
                    <div class="kakaoAPI">
                      <div class="staticMap" style="width:500px;height:300px; border-radius:20px;"></div>
                    </div>
                  </div>
                </div>
              </a>
          
              <a href="regionSubpage/detail?no=${board.boardNo}&type=${param.type}">
                <div class="main-add">
                  <div class="image">
                    <img src="${contextPath}/resources/images/region/남산타워.jpg" id="image">
                  </div>
                  <div class="text">
                    <h1>남산 타워</h1>
                    <span>서울특별시 용산구 남산에 있는 송신탑이자 서울을 대표하는 랜드마크이다. <br>
                      정식 명칭은 남산서울타워이며 보통은 남산타워로 불리는 편이다. <br>
                    </span>
                    <div class="kakaoAPI">
                      <div class="staticMap" style="width:500px;height:300px; border-radius:20px;"></div>
                    </div>
                  </div>
                </div>
              </a>

              <a href="regionSubpage/detail?no=${board.boardNo}&type=${param.type}">
                <div class="main-add">
                  <div class="image">
                    <img src="${contextPath}/resources/images/region/국중박.jpg" id="image">
                  </div>
                  <div class="text">
                    <h1>국립중앙박물관</h1>
                    <span>서울특별시 용산구 용산동6가에 위치한 한국 최대의 대표 국립 박물관.
                      한국의 고미술, 유물을 중심으로 소장하고 있다.<br>
                      가까운 곳에는 국립한글박물관이 있다.<br>
                    </span>
                    <div class="kakaoAPI">
                      <div class="staticMap" style="width:500px;height:300px; border-radius:20px;"></div>
                    </div>
                  </div>
                </div>
              </a>

              <a href="regionSubpage/detail?no=${board.boardNo}&type=${param.type}">
                <div class="main-add">
                  <div class="image">
                    <img src="${contextPath}/resources/images/region/북촌한옥마을.jpg" id="image">
                  </div>
                  <div class="text">
                    <h1>북촌한옥마을</h1>
                    <span>서울특별시 종로구 가회동, 삼청동 내의 한옥 밀집지역을 칭한다.<br>
                      편의상 그 일대를 북촌이라 부르나 엄밀하게는 가회동, 계동, 화동 등 일부 법정동만을 포함한다.<br>
                    </span>
                    <div class="kakaoAPI">
                      <div class="staticMap" style="width:500px;height:300px; border-radius:20px;"></div>
                    </div>
                  </div>
                </div>
              </a>

              <a href="regionSubpage/detail?no=${board.boardNo}&type=${param.type}">
                <div class="main-add">
                  <div class="image">
                    <img src="${contextPath}/resources/images/region/DDP.jpg" id="image">
                  </div>
                  <div class="text">
                    <h1>DDP</h1>
                    <span>서울특별시 중구의 전시장 및 쇼핑몰. 영국의 건축가 자하 하디드가 설계했다<br>
                      건물 구역은 크게 아트홀(A), 뮤지엄(M), 디자인랩(D), 어울림광장(DDP마켓 포함),<br>
                      동대문역사문화공원으로 이루어져 있다.<br>
                    </span>
                    <div class="kakaoAPI">
                      <div class="staticMap" style="width:500px;height:300px; border-radius:20px;"></div>
                    </div>
                  </div>
                </div>
              </a>

            </div>
          </div>
        </form>

        <c:if test="${! empty loginMember}">
          <div id="write">
              <button id="insertBtn" onclick="location.href='regionWrite?mode=insert&type=${param.type}'">글쓰기</button>
            </a>
          </div>
        </c:if>

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