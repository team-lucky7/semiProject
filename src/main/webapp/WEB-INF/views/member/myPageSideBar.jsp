<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="../resources/css/myPageSideBar-style.css">

<div class="middle-area">
    <div class="left-sideBar">
        <div class="sideBarTop">
            <div class="myPageProfile">
               <!--  프로필 이미지 X  -->
                <c:if test="${empty loginMember.profileImage}" >
                    <img src="${contextPath}/resources/images/user.png" id="profileImage">
                </c:if>

                <!-- 프로필 이미지 O -->  
                <c:if test="${!empty loginMember.profileImage}" >
                    <img src="${contextPath}${loginMember.profileImage}" id="profileImage">
                </c:if>
                
            </div>

            <div class="memberId">
                ${loginMember.memberId}
            </div>
        </div>


        <a href="${contextPath}/myPage/boardList">
            <div class="sideBarMenu">내 게시글/댓글 조회</div>
        </a>
        
        <a href="${contextPath}/myPage/info">
            <div class="sideBarMenu">내 정보 조회</div>
        </a>

        <a href="${contextPath}/myPage/update">
            <div class="sideBarMenu">내 정보 수정</div>
        </a>

        <a href="${contextPath}/myPage/changePw">
            <div class="sideBarMenu">비밀번호 변경</div>
        </a>
        <a href="${contextPath}/myPage/secession">
            <div class="sideBarMenu">회원 탈퇴</div>
        </a>
        
        <a href="${contextPath}/myPage/logout">
            <div class="sideBarMenu">로그아웃</div>
        </a>
    </div>
</div>