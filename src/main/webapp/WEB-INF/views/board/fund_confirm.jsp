<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<c:choose>
		<c:when test="${sessionScope.userid == 'tndsk123' }">
			<%@ include file="../include/admin_menu.jsp"%>
		</c:when>
		<c:otherwise>
			<%@ include file="../include/menu.jsp"%>
		</c:otherwise>
</c:choose>
</body>
<h2>${sessionScope.userid}님의 투자 목록</h2>
<table border="1">
	<tr>
		<th>아이디</th>
		<th>프로젝트명</th>
		<th>회사명</th>
		<th>주당단위</th>
		<th>매수한 주식수</th>
		<th>투자한 금액</th>
	</tr>
<c:forEach var="row" items="${list}">
	<tr>
		<td>${row.userid}</td>
		<td>${row.title}</td>
		<td>${row.company_name}</td>
		<td>${row.unit}</td>
		<td>${row.count}</td>
		<td>${row.now_fund}</td>
	</tr>
</c:forEach>
</table>
</html>