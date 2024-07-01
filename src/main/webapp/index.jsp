<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>여행</title>
  <link rel="stylesheet" href="resources/css/header.css">
  <link rel="stylesheet" href="resources/css/index.css">
  <script src="https://kit.fontawesome.com/4bef400c33.js" crossorigin="anonymous" defer></script>
</head>

<body>
  <main>
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

    <section class="container">
      <section class="main-img">
        <div class="main-imgs-wrap">
          <img src="https://images.unsplash.com/photo-1433838552652-f9a46b332c40?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
          <img src="https://images.unsplash.com/photo-1482192505345-5655af888cc4?q=80&w=2128&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
          <img src="https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=2073&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
          <img src="https://images.unsplash.com/photo-1532274402911-5a369e4c4bb5?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
        </div>
      </section>

      <section class="region">

      </section>

      <section class="community">

      </section>
  </section>

    <footer></footer>
  </main>
  <script src="resources/js/jquery-3.7.1.min.js"></script>
  <script src="resources/js/index.js"></script>
</body>

</html>