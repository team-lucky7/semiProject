<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="boardName" value="${map.boardName}" />
<c:set var="pagination" value="${map.pagination}" />
<c:set var="boardList" value="${map.boardList}" />


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>휴양지 게시판</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/vacation.css">
</head>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<body>
    <div class="vacation-container">
        <div class="vacation-content">

            <div class="vacation-main">
                <div class="vacation-header">
                    <span>휴양지</span>
                </div>
                <div class="vacation-hashtag">
                    <span># 전체</span>
                </div>
                <div class="vacation-array">
                    <p>총 00건</p>
                    <ul>
                        <li><a href="">최신순</a></li>
                        <li>|</li>
                        <li><a href="">조회순</a></li>
                        <li>|</li>
                        <li><a href="">좋아요순</a></li>
                    </ul>


                </div>

                <div class="vacation-post">

                    <c:choose>
                        <c:when test="${empty boardList}">
                            <!-- 게시글 목록 조회 결과가 비어있다면 -->
                            <div>
                                <p>게시글이 존재하지 않습니다.</p>
                            </div>
                        </c:when>

                        <c:otherwise>
                            <!-- 게시글 목록 조회 결과가 비어있지 않다면 -->
                            <c:forEach var="board" items="${boardList}">
                                <tr>
                                    <td>${board.boardNo}</td>
                                    <td>

                                    </td>
                                    <td>${board.memberNickname}</td>
                                    <td>${board.createDate}</td>
                                    <td>${board.readCount}</td>
                                </tr>
                            </c:forEach>

                        </c:otherwise>
                    </c:choose>

                    
                    <img src="https://via.placeholder.com/80" alt="이미지">
                    <div class="vacation-info">
                        <div class="vacation-title">
                            <a
                                href="detail?no=${board.boardNo}&cp=${pagination.currentPage}&type=${param.type}">${board.boardTitle}</a>
                        </div>
                        <div class="vacation-details">
                            ${board.memberId}
                        </div>
                        <div class="vacation-details">지역 (지도에서 주소 확인)</div>
                        <div class="vacation-details">한줄소개(게시글)</div>
                        <div class="vacation-tags">
                            <span>#태그1</span><span>#태그2</span><span>#태그3</span>
                        </div>
                        <div class="vacation-stats">
                            <div>
                                <span>조회수: ${board.readCount}</span><span>❤️ 42</span><span>💬 15</span>
                            </div>
                            <div class="vacation-edit-area">
                                <button id="restoration">복구</button>
                                <button id="change">수정</button>
                                <button id="remove">삭제</button>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="vacation-btn-area">
                    <button id="vatcation-btn">글쓰기</button>
                </div>


                <!-- 페이지네이션 a태그에 사용될 공통 주소를 저장할 변수 선언 -->
                <c:set var="url" value="list?type=${param.type}&cp=" />

                <div class="pagination">
                    <a href="${url}1">&lt;&lt;</a>
                    <a href="${url}${pagination.prevPage}">&lt;이전</a>

                    <!-- 범위가 정해진 일반 for문 사용 -->
                    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                        <c:choose>
                            <c:when test="${i == pagination.currentPage}">
                                <a class="current">${i}</a>
                            </c:when>

                            <c:otherwise>
                                <a href="${url}${i}">${i}</a>
                            </c:otherwise>

                        </c:choose>

                    </c:forEach>

                    <a href="${url}${pagination.nextPage}">다음&gt;</a>
                    <a href="${url}${pagination.maxPage}">&gt;&gt;</a>
                </div>


            </div>

            <div class="vacation-sidebar">
                <div class="sidebar up">
                    <ul>
                        <p>지역</p>
                        <li><a href="#"># 전체</a></li>
                        <li><a href="#"># 경기</a></li>
                        <li><a href="#"># 강원</a></li>
                        <li><a href="#"># 경북</a></li>
                        <li><a href="#"># 전북</a></li>
                        <li><a href="#"># 대구</a></li>
                        <li><a href="#"># 광주</a></li>
                        <li><a href="#"># 인천</a></li>
                        <li><a href="#"># 부산</a></li>
                        <li><a href="#"># 경남</a></li>
                        <li><a href="#"># 전남</a></li>
                        <li><a href="#"># 울산</a></li>
                    </ul>
                </div><br>
                <div class="sidebar down">
                    <ul>
                        <p>키워드</p>
                        <li><a href="#"># 인기</a></li>
                        <li><a href="#"># 수상</a></li>
                        <li><a href="#"># 방송출연</a></li>
                        <li><a href="#"># 지역특산</a></li>
                        <li><a href="#"># 전통</a></li>
                        <li><a href="#"># 3대째</a></li>
                        <li><a href="#"># 창업</a></li>
                        <li><a href="#"># 원조</a></li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</body>









<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>