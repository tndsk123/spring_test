<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function check() {
	document.form1.submit();
}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>회원등록</h2>
<form name="form1" method="post"
	action="${path}/board/insert.do">
<div class="form-group">
아이디
    <input class="form-control" placeholder="타이틀" 
    name="title" id="title" type="text" />
</div>
<div class="form-group">
프로젝트구분
    <input class="form-control" placeholder="프로젝트구분" 
    name="p_division" id="p_division" type="text"/>
</div>
<div class="form-group">
주식구분
    <input class="form-control" placeholder="주식구분"  
    name="s_division" id="s_division" type="text" />
</div>

<div class="form-group">
모금액
    <input class="form-control" placeholder="모금액" 
    name="max_fund" id="max_fund" type="text" />
</div>

<div class="form-group">
종료일자
    <input class="form-control" placeholder="종료일자" 
    name="end_date" id="end_date" type="date"/>
</div>
<div class="form-group">
회사명
    <input class="form-control"  
    name="company_name" id="company_name" type="text"  />
</div>
<div class="form-group">
주 단위
    <input class="form-control"  
    name="unit" id="unit" type="text"  />
</div>
<div class="form-group">
최소단위
    <input class="form-control"  
    name="min_fund" id="min_fund" type="text"  />
</div>
<div>	
<input type="button" class="btn btn-lg btn-success btn-block" onclick="check()" value="확인">
</div>
</form>
</body>
</html>