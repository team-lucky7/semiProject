<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="header">
  <section class="logo">
    <a href="${ contextPath }">
      <img src="${contextPath}/resources/images/logo.jpg" id="home-logo" height="100px">
    </a>
  </section>

  <ul class="nav">
    <li><a href="${ contextPath }">홈</a></li>
    <li><a href="${ contextPath }/thema">테마</a></li>
    <li><a href="${ contextPath }/region">지역</a></li>
    <li>
      <a href="#">커뮤니티</a>
      <div class="community-nav-wrap">
        <ul>
          <li><a href="">휴양지</a></li>
          <li><a href="">맛집</a></li>
          <li><a href="${ contextPath }/freeBoard/list">자유게시판</a></li>
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
</header>

<div class="search-index">
  <div>
    <div class="search-wrap">
      <img src="${contextPath}/resources/images/logo.jpg" height="100px">
      <button type="button" onclick="closeSearch()">X</button>
      <div class="search-area">
        <form action="" name="query-form">
          <div>
            <input type="search" id="inp-search" autocomplete="off" placeholder="검색어를 입력해주세요">
            <button class="fa-solid fa-magnifying-glass"></button>
          </div>
        </form>
        <div class="related-search" style="display: none;"></div>

        <div class="recent-search">
          <h2>최근 검색어</h2>
          <ul></ul>
          <p class="no_data">최근 검색어 내역이 없습니다.</p>
        </div>
        <div class="popualr-search">
          <h2>최근 인기 검색어</h2>
          <div class="popualr">
            <ol>
              <li><a href="">제주도</a></li>
              <li><a href="">부산</a></li>
              <li><a href="">여수</a></li>
              <li><a href="">서울</a></li>
              <li><a href="">단양</a></li>
            </ol>
            
            <ol start="6">
              <li><a href="">강릉</a></li>
              <li><a href="">경주</a></li>
              <li><a href="">속초</a></li>
              <li><a href="">통영</a></li>
              <li><a href="">대전</a></li>
            </ol>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
