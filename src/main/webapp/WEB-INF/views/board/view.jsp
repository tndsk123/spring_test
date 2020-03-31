<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript">
function buy(){
	location.href="${path}/board/buy/${list.bno}"
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
<button type="button" onclick="buy()">구매하기</button>
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
		<th>서폿터수</th>
		<th>조회수</th>
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
		<td>${list.support}</td>
		<td>${list.viewcnt}</td>
	</tr>
</table>
<a href="${path}/board/good.do?bno=${list.bno}"><img src="${path}/images/good.jpg"></a>${list.good}
</body>
</html>