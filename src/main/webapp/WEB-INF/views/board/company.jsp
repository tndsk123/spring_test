<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
var sel_file;
function check() {
	document.form1.submit();
}
function handleImgFileSelect(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 파일만 가능합니다.");
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e){
			$("#img").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
	});
}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>회사 등록</h2>
<form name="form1" method="post" action="${path}/company/insert" enctype="multipart/form-data">
<div class="form-group">
회사명
    <input class="form-control" placeholder="회사명" 
    name="company_name" id="company_name" type="text" />
</div>
<div class="form-group">
사업자번호
    <input class="form-control" placeholder="(-)빼고 입력" 
    name="company_num" id="company_num" type="text" />
</div>
<div class="form-group">
회사 로고
    <input class="form-control"  
    name="file" id="file" type="file" />
</div>
<div id="img_wrap"><img id="img"></div>
<div class="form-group">
대표명
    <input class="form-control" placeholder="대표명" 
    name="ceo" id="ceo" type="text"/>
</div>
<div class="form-group">
사원수
    <input class="form-control" placeholder="사원수" 
    name="count_member" id="count_member" type="text"/>
</div>
<div class="form-group">
설립일자
    <input class="form-control" placeholder="설립일자" 
    name="found_date" id="found_date" type="date"/>
</div>
<div class="form-group">
회사소개
    <input class="form-control" placeholder="종료일자" 
    name="greeting" id="greeting" type="text"/>
</div>
<div>	
<input type="button" class="btn btn-lg btn-success btn-block" onclick="check()" value="확인">
</div>
</form>
</body>
</html>