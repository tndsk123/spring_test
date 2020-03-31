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
<h1>등급 상향 승인 테이블</h1>
<table border="1">
	<tr>
		<th>아이디</th>
		<th>제목</th>
		<th>현등급</th>
		<th>상향등급</th>
		<th>증빙서류</th>
		<th>요청일자</th>
	</tr>
<c:forEach var="row" items="${list}">
	<tr>
		<td><a href="${path}/user/gradeup_view.do?gno=${row.gno}">${row.userid}</a></td>
		<td>${row.title}</td>
		<td>${row.grade}</td>
		<td>${row.want_grade}</td>
		<td>${row.evidence}</td>
		<td>${row.post_date}</td>
	</tr>
</c:forEach>
</table>
</body>
</html>