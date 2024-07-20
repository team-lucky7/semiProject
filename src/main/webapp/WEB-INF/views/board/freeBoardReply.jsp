<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="reply-area">
    <div class="reply-count">댓글 6개</div>
    <div class="reply-list-area">
        <ul id="reply-list">
            <li class="reply-row">
                <p class="reply-writer">
                    <img src="${contextPath}/resources/images/user.png">
                    <span>이거아니자나</span>
                    <span class="reply-date"> (2024.07.11 10:49:34)</span>
                    <span class="like-num">♥ 12</span>
                </p>

                <p class="reply-content">댓글 테스트1<br>asdds</p>
                <div class="reply-btn-area">
                    <button onclick="showUpdateReply(1, this)">수정</button>
                    <button onclick="deleteReply(1)">삭제</button>
                </div>
            </li>
        </ul>
    </div>

    <div class="reply-write-area">
        댓글쓰기
        <div>
        	<c:if test="${empty loginMember}">
        		<c:set var="replyWritePlaceholder"
        			value="댓글 작성 하시려면 로그인 해주세요. 로그인 하시겠습니까?"
        			scope="page"/>
        	</c:if>
        	

            <textarea id="replyContent" placeholder="${replyWritePlaceholder}"></textarea>
            <button id="addReply">등록</button>
        </div>
    </div>
</div>