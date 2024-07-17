<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/adminPageInfo.css">
</head>
<body>
	<main>
        <section class="admin-myinfo">
            <h1>관리자 페이지</h1>
            <img src="${contextPath}/resources/images/user.png" id="admin-profileImage">
            <h1>admin</h1>
        </section>

        <section class="info-list">
            <h1 class="info-title">관리자 정보</h1>
            <div class="admin-info">
                <table class="info-table" border="1">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>관리자명</th>
                            <th colspan="3">권한</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>admin</td>
                            <td>최고관리자</td>
                            <td>관리자 관리<input type="checkbox"></td>
                            <td>회원 탈퇴<input type="checkbox"></td>
                            <td>글 삭제 복구<input type="checkbox"></td>
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

            <h1 class="info-title">회원 정보 관리</h1>
            <div class="user-info">
                <table class="info-table" border="1">
                    <thead>
                        <tr>
                            <th>탈퇴여부 변경</th>
                            <th>ID</th>
                            <th>성명</th>
                            <th>생년월일</th>
                            <th>가입일</th>
                            <th>탈퇴여부(Y/N)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user1</td>
                            <td>홍길일</td>
                            <td>2020/06/28</td>
                            <td>2024/06/30</td>
                            <td>N</td>
                        </tr>
                        
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user2</td>
                            <td>홍길이</td>
                            <td>2020/06/28</td>
                            <td>2024/06/30</td>
                            <td>N</td>
                        </tr>
                        
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user3</td>
                            <td>홍길삼</td>
                            <td>2020/06/28</td>
                            <td>2024/06/30</td>
                            <td>N</td>
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
    </main>
</body>
</html>