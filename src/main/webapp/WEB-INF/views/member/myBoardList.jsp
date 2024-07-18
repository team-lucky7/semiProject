<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyBoardList</title>
    <link rel="stylesheet" href="${contextPath }/resources/css/header.css">
    <link rel="stylesheet" href="${contextPath }/resources/css/footer.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/myPageSideBar-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/myPageBoardList.css">
    <script src="https://kit.fontawesome.com/4bef400c33.js" crossorigin="anonymous"></script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <div class="myPage-content">

        <jsp:include page="/WEB-INF/views/member/myPageSideBar.jsp"></jsp:include>

        <div class="boardList-container">
            <section class="board-list">
                <div class="board-name-div">
                    <h2 class="board-name">내 게시글</h2>
                </div>
    
                <div class="list-wrapper">
                    <table class="list-table">
                        <thead>
                            <tr>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>날짜</th>
                                <th>조회수</th>
                                <th>추천수</th>
                            </tr>
                        </thead>
    
                        <tbody>
                            <tr>
                                <td><a href="${ contextPath }/freeBoard/detail">오늘 점심 뭐 먹지?</a></td>
                                <td>이거맞자나</td>
                                <td>2024-06-25</td>
                                <td>10</td>
                                <td>2</td>
                            </tr>
                            <tr>
                                <td><a href="${ contextPath }/freeBoard/detail">오늘 점심 뭐 먹지?</a></td>
                                <td>이거맞자나</td>
                                <td>2024-06-25</td>
                                <td>10</td>
                                <td>2</td>
                            </tr>
                            <tr>
                                <td><a href="${ contextPath }/freeBoard/detail">오늘 점심 뭐 먹지?</a></td>
                                <td>이거맞자나</td>
                                <td>2024-06-25</td>
                                <td>10</td>
                                <td>2</td>
                            </tr>
                            <tr>
                                <td><a href="${ contextPath }/freeBoard/detail">오늘 점심 뭐 먹지?</a></td>
                                <td>이거맞자나</td>
                                <td>2024-06-25</td>
                                <td>10</td>
                                <td>2</td>
                            </tr>
                            <tr>
                                <td><a href="${ contextPath }/freeBoard/detail">오늘 점심 뭐 먹지?</a></td>
                                <td>이거맞자나</td>
                                <td>2024-06-25</td>
                                <td>10</td>
                                <td>2</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
    
                <div class="pagination-area">
                    <ul class="pagination">
                        <li><a href="">&lt;&lt;</a></li>
                        <li><a href="">&lt;</a></li>
                        <li><a href="">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">4</a></li>
                        <li><a href="">5</a></li>
                        <li><a href="">&gt;</a></li>
                        <li><a href="">&gt;&gt;</a></li>
                    </ul>
                </div>
            </section>
    
    
    
            <section class="board-list">
                <div class="board-name-div">
                    <h2 class="board-name">내 댓글</h2>
                </div>
    
                <div class="list-wrapper">
                    <table class="list-table">
                        <thead>
                            <tr>
                                <th>내용</th>
                                <th>작성자</th>
                                <th>날짜</th>
                                <th>조회수</th>
                                <th>추천수</th>
                            </tr>
                        </thead>
    
                        <tbody>
                            <tr>
                                <td><a href="${ contextPath }/freeBoard/detail">오늘 점심 뭐 먹지?</a></td>
                                <td>이거맞자나</td>
                                <td>2024-06-25</td>
                                <td>10</td>
                                <td>2</td>
                            </tr>
                            <tr>
                                <td><a href="${ contextPath }/freeBoard/detail">오늘 점심 뭐 먹지?</a></td>
                                <td>이거맞자나</td>
                                <td>2024-06-25</td>
                                <td>10</td>
                                <td>2</td>
                            </tr>
                            <tr>
                                <td><a href="${ contextPath }/freeBoard/detail">오늘 점심 뭐 먹지?</a></td>
                                <td>이거맞자나</td>
                                <td>2024-06-25</td>
                                <td>10</td>
                                <td>2</td>
                            </tr>
                            <tr>
                                <td><a href="${ contextPath }/freeBoard/detail">오늘 점심 뭐 먹지?</a></td>
                                <td>이거맞자나</td>
                                <td>2024-06-25</td>
                                <td>10</td>
                                <td>2</td>
                            </tr>
                            <tr>
                                <td><a href="${ contextPath }/freeBoard/detail">오늘 점심 뭐 먹지?</a></td>
                                <td>이거맞자나</td>
                                <td>2024-06-25</td>
                                <td>10</td>
                                <td>2</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
    
                <div class="pagination-area">
                    <ul class="pagination">
                        <li><a href="">&lt;&lt;</a></li>
                        <li><a href="">&lt;</a></li>
                        <li><a href="">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">4</a></li>
                        <li><a href="">5</a></li>
                        <li><a href="">&gt;</a></li>
                        <li><a href="">&gt;&gt;</a></li>
                    </ul>
                </div>
            </section>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    <script src="${ contextPath }/resources/js/jquery-3.7.1.min.js"></script>
    <script src="${ contextPath }/resources/js/header.js"></script>
</body>


</html>