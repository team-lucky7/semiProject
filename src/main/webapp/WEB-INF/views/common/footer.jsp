<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer>
    <div class="footer-row">
        개인정보처리방침
    </div>
    <div class="footer-row">
        <div>
            <span>주소 : ~~~~~~~~~~~~~~~</span>
            <span>대표전화 : 010-1234-1234</span>
            <span>사업자등록번호 : ~~~~~~~~~~~~</span>
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