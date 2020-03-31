<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script>
$(function(){
	$("#btnWrite").click(function(){
		location.href="${path}/board/write.do";
	});
});
</script>
<c:if test="${message != '' }">
				<script type="text/javascript">
					alert(message);
				</script>
</c:if>
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
<h2>fund</h2>
<button type="button" id="btnWrite">글쓰기</button>
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
		<th>서폿터수</th>
		<th>조회수</th>
	</tr>
<c:forEach var="row" items="${list}">
	<tr>
		<td>${row.p_division}</td>
		<td>${row.s_division}</td>
		<td><a href="${path}/board/view/${row.bno}">${row.title}</a></td>
		<td>${row.now_fund}</td>
		<td>${row.max_fund}</td>
		<td>${row.progress}%</td>
		<td>${row.start_date}</td>
		<td>${row.end_date}</td>
		<td>${row.now_date}일</td>
		<td>${row.company_name}</td>
		<td>${row.unit}</td>
		<td>${row.min_fund}</td>
		<td>${row.support}</td>
		<td>${row.viewcnt}</td>
	</tr>
</c:forEach>
</table>
</body>
</html>