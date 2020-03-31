<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function grade_delete(){
	location.href="${path}/user/grade_delete.do?gno=${grade_dto.gno}";
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
</body>
<h2>${dto.userid}님의 등급 상향요청</h2>
<c:choose>
	<c:when test="${grade_dto == '' || grade_dto == null}">
		<div>${dto.userid}님의 등급 상향요청 정보가 없습니다.</div>
	</c:when>
	<c:otherwise>
		<table border="1">
	<tr>
		<th>아이디</th>
		<th>제목</th>
		<th>현등급</th>
		<th>상향등급</th>
		<th>증빙서류</th>
		<th>요청일자</th>
		<th>진행상태</th>
	</tr>
	<tr>
		<td>${grade_dto.userid}</td>
		<td>${grade_dto.title}</td>
		<td>${grade_dto.grade}</td>
		<td>${grade_dto.want_grade}</td>
		<td>${grade_dto.evidence}</td>
		<td>${grade_dto.post_date}</td>
		<td>
			<c:choose>
				<c:when test="${grade_dto.approve == 0}">
					승인대기중
				</c:when>
				<c:otherwise>
					승인완료 <button type="button" onclick="grade_delete()">내용삭제</button>
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
</table>
	<font color="red">등급 상향 요청은 한번 씩만 가능합니다.</font>
	</c:otherwise>
</c:choose>

<hr>
<h2>등급 상향요청 작성 폼</h2>
<form id="form1" name="form1" method="post" action="${path}/user/grade_insert.do" >
	<div>회원아이디 <input name="userid" id="userid" value="${dto.userid}">
	</div>
	<div>요청사항<input name="title" id="title" placeholder="등급 상향 요청합니다.">
	</div>
	<div>현재등급 <input name="grade" id="grade" type="number" value="${dto.grade}">
	</div>
	<div>요구등급 <input name="want_grade" id="want_grade" type="number" min="1" max="5">
	</div>
	<div>증빙서류<input name="evidence" id="evidence" type="text">
	</div>
	<div><button type="submit">요청</button>
	</div>
</form>
</html>