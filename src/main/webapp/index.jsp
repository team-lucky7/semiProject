<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>여행</title>
		<link rel="stylesheet" href="resources/css/header.css">
		<link rel="stylesheet" href="resources/css/index.css">
		<link rel="stylesheet" href="resources/css/footer.css">
		<script src="https://kit.fontawesome.com/4bef400c33.js" crossorigin="anonymous" defer></script>
	</head>

	<body>
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		<main>
			<section class="main-img">
					<div class="main-imgs-wrap">
						<img src="https://images.unsplash.com/photo-1433838552652-f9a46b332c40?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
							alt=""> <img
							src="https://images.unsplash.com/photo-1482192505345-5655af888cc4?q=80&w=2128&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
							alt=""> <img
							src="https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=2073&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
							alt=""> <img
							src="https://images.unsplash.com/photo-1532274402911-5a369e4c4bb5?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
							alt="">
					</div>
			</section>
			<section class="content">
				<section class="popular-region">
					<h1 class="section-title">인기 관광지</h1>
					<div class="popular-img-wrap">
						<div class="popular-img">
							<a href="">
								<img src="https://images.unsplash.com/photo-1609137144813-7d9921338f24?fm=jpg&w=3000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8OHx8fGVufDB8fHx8fA%3D%3D">
							</a>
						</div>

						<div class="popular-img">
							<div class="popular-img-halfHeight">
								<a href="">
									<img src="https://plus.unsplash.com/premium_photo-1661962425238-aeb9b022a94b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D">
								</a>
							</div>
							<div class="popular-img-halfHeight">
								<a href="">
									<img src="https://plus.unsplash.com/premium_photo-1677002240252-af3f88114efc?q=80&w=2025&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D">
								</a>
							</div>
						</div>
					</div>
				</section>

				<section class="community">
					<h1 class="section-title">커뮤니티</h1>
					<div class="community-cont-wrap">
						<div class="community-cont">
							<p>여행게시판</p>
							<div>
								asdf
							</div>
						</div>

						<div class="community-cont">
							<p><a href="${contextPath}/freeBoard/list">자유게시판</a></p>
							<div class="">
								asdf
							</div>
						</div>
					</div>
				</section>
			</section>
		</main>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		<script src="resources/js/jquery-3.7.1.min.js"></script>
		<script src="${ contextPath }/resources/js/index.js"></script>
		<script src="${ contextPath }/resources/js/header.js"></script>
	</body>

	</html>