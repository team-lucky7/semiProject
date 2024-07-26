<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
              <a href="${ contextPath }/region?type=10">
                <button><img src="${contextPath}/resources/images/region/button/서울버튼.jpg"> <span>서울</span></button>
              </a>
            </div>
            <div class="Btn-add">
              <a href="${ contextPath }/region?type=11">
                <button><img src="${contextPath}/resources/images/region/button/인천버튼.jpg"> <span>인천</span></button>
              </a>
            </div>
            <div class="Btn-add">
              <a href="${ contextPath }/region?type=12">
                <button><img src="${contextPath}/resources/images/region/button/대전버튼.jpg"> <span>대전</span></button>
              </a>
            </div>
            <div class="Btn-add">
              <a href="${ contextPath }/region?type=13">
                <button><img src="${contextPath}/resources/images/region/button/대구버튼.png"> <span>대구</span></button>
              </a>
            </div>
            <div class="Btn-add">
              <a href="${ contextPath }/region?type=14">
                <button><img src="${contextPath}/resources/images/region/button/부산버튼.png"> <span>부산</span></button>
              </a>
            </div>
            <div class="Btn-add">
              <a href="${ contextPath }/region?type=15">
                <button><img src="${contextPath}/resources/images/region/button/수원버튼.png"> <span>수원</span></button>
              </a>
            </div>
            <div class="Btn-add">
              <a href="${ contextPath }/region?type=16">
                <button><img src="${contextPath}/resources/images/region/button/강원도버튼.jpg"> <span>강원도</span></button>
              </a>
            </div>
          </section>
          <section class="content">

                <c:if test="${ empty boardList}">
                  <p style="font-size: 100px;">게시글이 존재하지 않습니다.</p>
                </c:if>
        
                <c:if test="${!empty boardList}">
                  <div class="contentMain">
                    <div class="main-content">
                        <c:forEach var="board" items="${boardList}">
                          <a href="regionSubpage/detail?no=${board.boardNo}&type=${param.type}">
                            <div class="main-add">
                              <div class="imgs">
                                <c:if test="${!empty board.imageList}">
                                  <c:forEach var="i" begin="0" end="${fn:length(board.imageList) - 1}">
                                    <img src="${contextPath}${board.imageList[i].imageRename}" id="image${i}">
                                  </c:forEach>
                                </c:if>
                          
                              </div>
                          
                              <div class="text">
                                <h1>${board.boardTitle}</h1>
                                <span>${board.boardContent}</span>
                          
                                <div class="kakaoAPI">
                                  <div class="staticMap" style="width:500px;height:300px; border-radius:20px;"></div>
                                </div>
                              </div>
                            </div>
                          </a>
                        </c:forEach>

                    </div>
                  </div>
                </c:if>

                <!--  로그인 한 사람만 글쓰기 버튼 보임 -->
            <c:if test="${! empty loginMember}">
              <div id="write">
                <button id="insertBtn" onclick="location.href='regionWrite?mode=insert&type=${param.type}'">글쓰기</button>
                </a>
              </div>
            </c:if>

            <!-- 버튼 구역  -->
            <c:if test="${ ! empty boardList}">
              <button id="left"><i class="fa-solid fa-chevron-left"></i></button>
              <button id="right"><i class="fa-solid fa-chevron-right"></i></button>
            </c:if>

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