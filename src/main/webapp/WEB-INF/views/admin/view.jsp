<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function approve(){
	location.href="${path}/board/approve/${list.bno}"
}
</script>
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
<button type="button" onclick="approve()">프로젝트 승인</button>
<h2>${list.title}</h2>
<table border="1">
	<tr>
		<th>구분</th>
		<th>주식구분</th>
		<th>제목</th>
		<th>현재금액</th>
		<th>목표금액</th>
		<th>진행률</th>
		<th>시작일자</th>
		<th>종료일자</th>
		<th>남은일자</th>
		<th>회사명</th>
		<th>주당가격</th>
		<th>최소투자액</th>

	</tr>
	<tr>
		<td>${list.p_division}</td>
		<td>${list.s_division}</td>
		<td>${list.title}</td>
		<td>${list.now_fund}</td>
		<td>${list.max_fund}</td>
		<td>${list.progress}%</td>
		<td>${list.start_date}</td>
		<td>${list.end_date}</td>
		<td>${list.now_date}일</td>
		<td>${list.company_name}</td>
		<td>${list.unit}</td>
		<td>${list.min_fund}</td>
	</tr>
</table>
</body>
</html>