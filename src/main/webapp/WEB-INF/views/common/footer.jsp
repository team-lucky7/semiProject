<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer>
    <div class="footer-row">
        개인정보처리방침
    </div>
    <div class="footer-row">
        <div>
            <span>주소 : 서울 강남구 역삼동 운칠기삼 KH지부 </span>
            <span>대표전화 : 02-800-7070 </span>
            <span>사업자등록번호 : 345-89-59997</span>
        </div>
        Copyright CITY. All Rights Reserved.
    </div>
</footer>

<c:if test="${!empty sessionScope.message }">
    	<script>
			alert("${sessionScope.message}");
		</script>
		
		<c:remove var="message" scope="session" />
</c:if>