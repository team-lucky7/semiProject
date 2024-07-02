<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <header class="header">
    <section class="logo">
      <a href="#">
        <img src="resources/images/logo.png" id="home-logo">
      </a>
    </section>

    <ul class="nav">
      <li><a href="#">홈</a></li>
      <li><a href="#">테마</a></li>
      <li><a href="#">지역</a></li>
      <li>
        <a href="#">커뮤니티</a>
        <div class="community-nav-wrap">
          <ul>
            <li><a href="">휴양지</a></li>
            <li><a href="">맛집</a></li>
            <li><a href="">자유게시판</a></li>
          </ul>
        </div>
      </li>
    </ul>

    <section class="search-area">
      <input type="search" id="query" name="query" autocomplete="off" placeholder="검색어를 입력해주세요">
      <button type="button" id="search-btn" class="fa-solid fa-magnifying-glass"></button>
    </section>
    <a href="#" class="fa-regular fa-circle-user" id="userlogo"></a>
  </header>