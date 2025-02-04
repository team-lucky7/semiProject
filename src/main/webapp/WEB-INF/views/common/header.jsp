<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<header class="header">
  <section class="logo">
    <a href="${ contextPath }">
      <img src="${contextPath}/resources/images/logo.jpg" id="home-logo" height="100px">
    </a>
  </section>

  <ul class="nav">
    <li><a href="${ contextPath }">홈</a></li>
    <li><a href="${ contextPath }/thema/list?type=1">테마</a></li>
    <li><a href="${ contextPath }/region?type=10">지역</a></li>
    <li>
      <a>커뮤니티</a>
      <div class="community-nav-wrap">
        <ul>
          <li><a href="${ contextPath }/community/list?type=4">휴양지</a></li>
          <li><a href="${ contextPath }/community/list?type=5">맛집</a></li>
          <li><a href="${ contextPath }/freeBoard/list?type=3&cp=1">자유게시판</a></li>
        </ul>
      </div>
    </li>
  </ul>

  <section class="header-inp-area">
    <input type="search" id="inp-search-window" autocomplete="off" placeholder="검색어를 입력해주세요">
    <button type="button" class="fa-solid fa-magnifying-glass"></button>
  </section>
  <c:if test="${empty loginMember}">
    <a href="${ contextPath }/login">
      <img src="${contextPath}/resources/images/user.png"  id="member-profile">
    </a>
  </c:if>

  <c:if test="${!empty loginMember}">
    <c:if test="${empty loginMember.profileImage}">
      <a href="${ contextPath }/myPage/info">
        <img src="${contextPath}/resources/images/user.png"  id="member-profile">
      </a>
    </c:if>

    <c:if test="${!empty loginMember.profileImage}">
      <a href="${ contextPath }/myPage/info">
        <img src="${contextPath}${loginMember.profileImage}"  id="member-profile">
      </a>
    </c:if>
  </c:if>

  <div class="search-index">
    <div>
      <div class="search-wrap">
      	<div class="search-index-logo">
      		<img src="${contextPath}/resources/images/logo.jpg" height="100px">
        	<button type="button" onclick="closeSearch()">&times;</button>
      	</div>
      	
        <div class="search-area">
          <form action="${contextPath}/search" name="query-form">
            <div>
              <input type="text" id="inp-search" name="query" autocomplete="off" placeholder="검색어를 입력해주세요">
              <button class="fa-solid fa-magnifying-glass"></button>
            </div>
          </form>
          <div class="related-search" style="display: none;"></div>

          <div class="recent-search">
            <h2>최근 검색어</h2>
            <ul id="recent-search-ul"></ul>
            <p class="no_data">최근 검색어 내역이 없습니다.</p>
          </div>
          <div class="popualr-search">
            <h2>최근 인기 검색어</h2>
            <div class="popualr">
              <c:if test="${!empty wordMap.wordList}">
                <ol>
                  <c:forEach var="word" items="${wordMap.wordList}">
                    <li><a href="${contextPath}/search?query=${word}">${word}</a></li>
                  </c:forEach>
                </ol>
              </c:if>
              <c:if test="${!empty wordMap.wordList2}">
                <ol start="6">
                  <c:forEach var="word" items="${wordMap.wordList2}">
                    <li><a href="${contextPath}/search?query=${word}">${word}</a></li>
                  </c:forEach>
                </ol>
              </c:if>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>

<script>
  const contextPaaath = "${contextPath}";
</script>