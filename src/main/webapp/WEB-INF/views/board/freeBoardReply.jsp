<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="reply-area">
    <div class="reply-count">댓글 ${fn:length(replyList)}개</div>
    <div class="reply-list-area">
        <ul id="reply-list">
            <c:if test="${!empty replyList}">
                <c:forEach var="reply" items="${replyList}">
                    <li class="reply-row">
                        <p class="reply-writer">
                            <c:if test="${empty reply.profileImage}">
                                <img src="${contextPath}/resources/images/user.png">
                            </c:if>

                            <c:if test="${!empty reply.profileImage}">
                                <img src="${contextPath}${reply.profileImage}">
                            </c:if>
                            <span>${reply.memberName}</span>
                            <span class="reply-date"> (${reply.createDate})</span>
                            <button type="button" class="like-btn">좋아요 ${reply.likeCount}</button>
                        </p>
        
                        <p class="reply-content">${reply.replyContent}</p>
                        
                        <div class="reply-btn-area">
                        	<c:if test="${reply.memberNo == loginMember.memberNo}">
	                            <button onclick="showUpdateReply(1, this)">수정</button>
	                            <button onclick="deleteReply(1)">삭제</button>
                        	</c:if>
                        </div>
                    </li>
                </c:forEach>
            </c:if>
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