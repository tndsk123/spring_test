<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function my_calc(item, item_count, item_sum){
	
    if(item_count.value=="")    var count = 0; 
    else                        var count = item_count.value; 

    item_sum.value = eval(item.value) + eval(count) ;   
}
function account_charge(){
	document.form1.action="${path}/user/account_up.do";
	document.form1.submit();
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
<h2>계좌 충전</h2>
<form name="form1" method="post" action="">
<table border="1">
	<tr>
		<td>아이디</td>
		<td>${dto.userid}</td>
	</tr>
	<tr>
		<td>현재계좌액</td>
		<td><input name="account" value="${dto.account}" readonly="readonly"></td>
	</tr>
	<tr>
		<td>충전액</td>
		<td><input name="charge" onkeyup="my_calc(this.form.account, this.form.charge, this.form.account_up)"></td>
	</tr>
	<tr>
		<td>충전후 금액</td>
		<td><input type="text" name="account_up" id="account_up" value="0" readonly></td>
	</tr>
</table>
<button type="button" onclick="account_charge()">충전하기</button>
</form>
</html>