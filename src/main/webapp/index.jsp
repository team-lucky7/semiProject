<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>여행</title>
<link rel="stylesheet" href="resources/css/header.css">
<link rel="stylesheet" href="resources/css/index.css">
<script src="https://kit.fontawesome.com/4bef400c33.js"
	crossorigin="anonymous" defer></script>
</head>

<body>
	<main>
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		<section class="container">
			<section class="main-img">
				<div class="main-imgs-wrap">
					<img
						src="https://images.unsplash.com/photo-1433838552652-f9a46b332c40?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
						alt=""> <img
						src="https://images.unsplash.com/photo-1482192505345-5655af888cc4?q=80&w=2128&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
						alt=""> <img
						src="https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=2073&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
						alt=""> <img
						src="https://images.unsplash.com/photo-1532274402911-5a369e4c4bb5?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
						alt="">
				</div>
			</section>

			<section class="region"></section>

			<section class="community"></section>
		</section>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script src="resources/js/jquery-3.7.1.min.js"></script>
	<script src="resources/js/index.js"></script>
</body>

</html>