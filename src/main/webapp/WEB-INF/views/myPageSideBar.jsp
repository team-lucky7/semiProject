<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.min.css">


<div id="middle-area">
    <div id="left-sideBar">
        <div class="sideBarTop">

            <div class="myPageProfile">
                <label for="imageInput">
                    <span>Change!</span>
                </label>
               <!--  프로필 이미지 X  -->
                <c:if test="${empty loginMember.profileImage}" >
                    <img src="/resources/images/user.png" id="profileImage">
                </c:if>

                <!-- 프로필 이미지 O -->
                <c:if test="${!empty loginMember.profileImage}" >
                    <img src="${loginMember.profileImage}" id="profileImage">
                </c:if>
                
                
                <input type="file" name="profileImage" id="imageInput" accept="image/*" >
                
            </div>

            <div class="nickname">
                ${loginMember.memberNickname}
            </div>

        </div>


        <a href="/myPage/myBoardList">
            <div class="sideBarMenu">내 게시글/댓글 조회</div>
        </a>
    
        <a href="/myPage/myUpdate">
            <div class="sideBarMenu">내 정보 수정</div>
        </a>
        <a href="/myPage/mySecession">
            <div class="sideBarMenu">회원 탈퇴</div>
        </a>
        <a href="/myPage/logOut">
            <div class="sideBarMenu">로그아웃</div>
        </a>
    </div>
</div>