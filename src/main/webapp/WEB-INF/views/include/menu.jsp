<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- views/include/menu.jsp -->
<%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core" %>

<a href="${path}">Home</a> |
<a href="${path}/board/list.do">fund</a> | 
<a href="${path}/board/address.do">주소</a> | 

<div style="text-align:right;">
	<c:choose>
		<c:when test="${sessionScope.userid == null }">
			<!-- 로그인하지 않은 상태 -->
			<a href="${path}/user/login.do">로그인</a> 
		</c:when>
		<c:otherwise>
			<!-- 로그인한 상태 -->
			${sessionScope.userid}님이 로그인중입니다.
			<a href="${path}/user/logout.do">로그아웃</a>
		</c:otherwise>
	</c:choose>
</div>
<hr>  