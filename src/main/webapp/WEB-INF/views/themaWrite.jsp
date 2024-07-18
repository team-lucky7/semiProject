<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>테마 글쓰기</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/themaWrite.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/header.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/index.css">
    <script src="https://kit.fontawesome.com/4bef400c33.js" crossorigin="anonymous" defer></script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <form action="#" enctype="multipart/form-data" method="POST" class="thema-write">

        <div class="thema-select">
            카테고리 :
            <select>
                <option value="감성 힐링 여행">감성 힐링 여행</option>
                <option value="이색 체험 여행">이색 체험 여행</option>
                <option value="레저 체험 여행">레저 체험 여행</option>
                <option value="맞춤 투어 여행">맞춤 투어 여행</option>
            </select>
        </div>

        <div class="thema-title">
            <input type="text" name="boardTitle" placeholder="제목을 입력해주세요.  ↓↓↓사진파일을 첨부해주세요 *첫 번째 파일은 썸네일입니다.">
        </div>

        <div class="img-box">
            <div class="thema-Image">
                <label for="img0">
                    <img class="preview">
                </label>
                <input type="file" class="inputImage" id="img0" name="0" accept="image/*">
                <span class="delete-image">&times;</span>
            </div>

            <div class="thema-Image">
                <label for="img1">
                    <img class="preview">
                </label>
                <input type="file" class="inputImage" id="img1" name="1" accept="image/*">
                <span class="delete-image">&times;</span>
            </div>

            <div class="thema-Image">
                <label for="img2">
                    <img class="preview">
                </label>
                <input type="file" class="inputImage" id="img2" name="2" accept="image/*">
                <span class="delete-image">&times;</span>
            </div>

            <div class="thema-Image">
                <label for="img3">
                    <img class="preview">
                </label>
                <input type="file" class="inputImage" id="img3" name="3" accept="image/*">
                <span class="delete-image">&times;</span>
            </div>

            <div class="thema-Image">
                <label for="img4">
                    <img class="preview">
                </label>
                <input type="file" class="inputImage" id="img4" name="4" accept="image/*">
                <span class="delete-image">&times;</span>
            </div>
        </div>

        <!-- 이용안내 -->
        <div class="thema-title">
            <p>이용안내</p>
        </div>
        <div class="thema-content">
            <textarea name="themaContent"></textarea>
        </div>

        <!-- 지도 -->
        <div class="thema-title">
            <p>위치</p>
        </div>
        <div class="thema-map">
            지도api
        </div>

        <!-- 버튼 -->
        <div class="board-btn-area">
            <button type="submit" id="writeBtn">저장</button>
        </div>

    </form>

</body>

<footer>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${ contextPath }/resources/js/jquery-3.7.1.min.js"></script>
    <script src="${ contextPath }/resources/js/header.js"></script>
    <script src="${ contextPath }/resources/js/regionSubPage.js"></script>
</footer>

</html>