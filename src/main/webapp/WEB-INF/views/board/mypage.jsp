<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<c:if test="${message == 'account'}">
				<script type="text/javascript">
					alert("계좌 충전이 완료되었습니다.");
				</script>
</c:if>
<c:if test="${message == 'noappend' }">
				<script type="text/javascript">
					alert("기업(회사) 등록을 한 후 가능합니다.");
				</script>
</c:if>
<c:if test="${message == 'grade_up' }">
				<script type="text/javascript">
					alert("등급 요청이 전송되었습니다.");
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
<h2>${dto.userid}님의 정보</h2>
<form name="form1" method="post" action="">
<table border="1">
	<tr>
		<td>아이디</td>
		<td colspan="2"><input name="userid" value="${dto.userid}"></td>		
	</tr>
	<tr>
		<td>비밀번호</td>
		<td colspan="2"><input type="password" name="userid"></td>	
	
	</tr>
	<tr>
		<td>계좌</td>
		<td>${dto.account}</td>
		<td><a href="${path}/user/account.do">계좌 충전하기</a></td>
	</tr>
	<c:choose>
		<c:when test="${dto.fund == 0 || dto.fund == null}">
			<tr>
				<td>투자한 상품수</td>
				<td>아직 투자 정보가 없습니다</td>
				<td><a href="${path}/board/list.do">상품구경하기</a></td>
			</tr>	
		</c:when>
		<c:otherwise>
			<tr>
				<td>투자한 상품수</td>
				<td>${dto.fund}</td>
				<td><a href="${path}/user/fund_confirm.do">상품 확인</a></td>
			</tr>
		</c:otherwise>
	</c:choose>
	<tr>
		<td>등급</td>
		<td>${dto.grade}</td>
		<td><a href="${path}/user/grade_up.do">등급 상향요청</a></td>
	</tr>
	<c:choose>
		<c:when test="${dto.company_name == '' || dto.company_name == null}">
			<tr>
				<td>회사명</td>
				<td>아직 등록된 회사가 없습니다</td>
				<td><a href="${path}/company/write.do">회사 등록하기</a></td>
			</tr>	
		</c:when>
		<c:otherwise>
			<tr>
				<td>회사명</td>
				<td>${dto.company_name}</td>
				<td><a href="${path}/company/view.do?company_name=${dto.company_name}">회사 페이지 확인</a></td>
			</tr>
		</c:otherwise>
	</c:choose>
		<tr>	
		<td>관심분야</td>
		<td colspan="2">${dto.interest}</td>
	</tr>
</table>
</form>
</body>
</html>