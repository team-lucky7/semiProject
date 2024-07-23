<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 글 작성</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/communityWrite.css">
  </head>

  <body>

    <section>
      <div class="container1">
        <h1>여행정보 작성(수정)</h1>
        <div>
          <span class="subtitle"> 커뮤니티 : </span>
          <select name="category">
            <option value="vacation">휴양지</option>
            <option value="resttaurant">맛집정보</option>
          </select>
        </div>
        <div class="subContainer">
          <span class="subtitle">&nbsp;제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목 : </span>
          <input type="text" size="80px" name="inputSubtitle">
        </div>
  
        <div class="subContainer">
          <span class="subtitle"> 한줄소개 : </span>
          <input type="text" size="80px" name="inputintro">
        </div>
      </div>
  
      <div class="container2" id="container2">
  
        <div class="compoContainer">
  
          <div class="compoBox">
            <img src="${contextPath}/resources/images/article-icon-png-14.jpg" alt="글" class="imgFull btn" onclick="addFullText()">
            <img src="${contextPath}/resources/images/image-icon-10.jpg" alt="그림" class="imgFull btn" onclick="addFullImage()">
            <img src="${contextPath}/resources/images/article-icon-png-14.jpg" alt="반글" class="imgHalf btn" onclick="addHalfText()">
            <img src="${contextPath}/resources/images/image-icon-10.jpg" alt="반그림" class="imgHalf btn" onclick="addHalfImage()">
            <img src="${contextPath}/resources/images/Map_1135px_1195280_42272.png" alt="지도" class="imgFull btn" onclick="showMap()">
          </div>
        </div>
      </div>
  
      <div clss="mapImage" id="mapDiv">

        <div>
          <input type="text" id="inputAddress" placeholder="주소를 입력해주세요">
          <button type="button" onclick="mapAddress()" id="chk">확인</button>
        </div>
  
        <div class="map_wrap">
          <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
          <div class="hAddr">
            <span id="centerAddr"></span>
          </div>
        </div>
  
        <img src="${contextPath}/resources/images/x-button-327024.png" class="xBtn" onclick="hideMap()">
      </div>
  
      <div>
        <span class="subtitle"> 해시태그 </span>
        <button type="button" onclick="addHashtag()">+</button>
        <div class="hashtag">
        </div>
      </div>
  
      <div style="text-align: center; width: 800px;">
        <button type="submit" id="submit">작성완료</button>
      </div>

    </section>
    

     
    <script src="${contextPath}/resources/js/communityWrite.js"></script>
    
    <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a672d1a3dd18b00d1ead688b41bca007&libraries=services"></script>
    
    </body>
    
    </html>