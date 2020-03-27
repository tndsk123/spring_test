<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript">
function my_calc(item, item_count, item_sum){
	
    if(item_count.value=="")    var count = 0; 
    else                        var count = item_count.value; 

    item_sum.value = eval(item.value) * eval(count) ; 
    
} 
function okay(item, item_count, item_sum, min_fund, max_fund, account, limit){
	var unit=eval(min_fund.value) / eval(item.value);
	var unit2=eval(max_fund.value) / eval(item.value);
	var grade=$("#grade").val();
	if(eval(item_count.value) * eval(item.value) < eval(min_fund.value)){
		alert("최소 구매 구좌는"+unit+"입니다.");
		return;
	}
	if(eval(item_count.value) * eval(item.value) > eval(limit.value)){
		alert(grade+"등급 한도는 "+limit.value+"원 미만입니다.");
		return;
	}	
	if(eval(item_count.value) * eval(item.value) > eval(account.value)){
		alert("계좌 금액이 부족합니다");
		return;
	}
	if(eval(item_count.value) * eval(item.value) > eval(max_fund.value)){
		alert("목표 투자액보다 금액이 많습니다. /n 최대 구매 구좌는"+unit2+"입니다.");
		return;
	}
}
$(function() {
	$("#btnBuy").click(function(){
		var now_fund = $("#now_fund").val();
		var account = $("#account").val();
		if(eval(now_fund) > eval(account)){
			alert("투자 금액이 계좌 금액보다 많습니다.");
			return;	
		}
		document.form1.action="${path}/board/buy_success/${list.bno}";
		document.form1.submit();
	});
});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp"%>
<form name="form1" method="post" action="">
<table border="1">
	<tr>
		<td>타이틀</td>
		<td>${list.title}</td>
		<td><input name="title" value="${list.title}" type="hidden"></td>
	</tr>
	<tr>
		<td>회사명</td>
		<td>${list.company_name}</td>
		<td><input name="company_name" value="${list.company_name}" type="hidden"></td>
	</tr>
	<tr>
		<td>한 주당 가격</td>
		<td>${list.unit}</td>
		<td><input type="text" name="unit" type="hidden" value="${list.unit}"></td>
	</tr>
	<tr>
		<td>구매할 주수</td>
		<td><input type="text" name="count" 
		onkeyup="my_calc(this.form.unit, this.form.count, this.form.now_fund)"
		onchange="okay(this.form.unit, this.form.count, this.form.now_fund, 
		this.form.min_fund, this.form.max_fund, this.form.account, this.form.grade_limit)" value="5" min="5"></td>
		<td><input type="hidden" name="min_fund" id="min_fund" value="${list.min_fund}"></td>
	</tr>
	<tr>
		<td>총 금액</td>
		<td><input type="text" name="now_fund" id="now_fund" value="0" readonly></td>
		<td><input type="hidden" name="max_fund" id="max_fund" value="${list.max_fund}"></td>
	</tr>
	<tr>
		<td>현재 보유액</td>
		<td><input type="number" name="account" id="account" value="${user_info.account}"></td>
		<td><input type="hidden" name="grade" value="${user_info.grade}"></td>
	</tr>
	<tr align="center">
		<td colspan="2">
			<input type="button" value="투자" id="btnBuy">
			<input type="button" value="취소" id="btnCansel">
		</td>
	</tr>
</table>
<span>회원님의 등급은 <font style="color: red">${grade.name}</font> 이며
 <font style="color: blue">${grade.grade_limit}원</font> 까지 투자 가능하십니다.</span>
 <input type="hidden" name="grade_limit" id="grade_limit" value="${grade.grade_limit}">
 <input type="hidden" name="grade" id="grade" value="${grade.name}">
</form>
</body>
</html>