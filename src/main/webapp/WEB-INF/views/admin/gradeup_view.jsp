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
<button type="button" onclick="location.href='${path}/user/approve_gradeup.do?gno=${list.gno}'">등급상향승인</button>
<h2>${list.title}</h2>
<table border="1">
	<tr>
		<th>아이디</th>
		<th>제목</th>
		<th>현등급</th>
		<th>상향등급</th>
		<th>증빙서류</th>
		<th>요청일자</th>
	</tr>
	<tr>
		<td>${list.userid}</td>
		<td>${list.title}</td>
		<td>${list.grade}</td>
		<td>${list.want_grade}</td>
		<td>${list.evidence}</td>
		<td>${list.post_date}</td>
	</tr>
</table>
</html>