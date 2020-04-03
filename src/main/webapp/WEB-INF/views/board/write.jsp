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
$(function(){
	$("#bond").click(function(){
			$("#margin").attr("type","text");
	});
	$("#stock").click(function(){
		$("#margin").attr("type","hidden");
	});
	
	$("#file").on("change", handleImgFileSelect);
});
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
<h2>프로젝트 등록</h2>
<form name="form1" method="post" action="${path}/board/insert" enctype="multipart/form-data">
<div class="form-group">
프로젝트 타이틀
    <input class="form-control" placeholder="타이틀" 
    name="title" id="title" type="text" />
</div>
<div class="form-group">
타이틀 이미지
    <input class="form-control"  
    name="file" id="file" type="file" />
</div>
<div id="img_wrap"><img id="img"></div>
<div class="form-group">
프로젝트구분
    <input class="form-control" placeholder="프로젝트구분" 
    name="p_division" id="p_division" type="text"/>
</div>
<div class="form-group">
주식구분
    <input class="form-control"   
    name="s_division" id="stock" type="radio" value="주식" /> 주식
    <input class="form-control"   
    name="s_division" id="bond" type="radio" value="채권" /> 채권
     <input class="form-control"   
    name="margin" id="margin" type="hidden" placeholder="이익률 입력" />
</div> 

<div class="form-group">
모금액
    <input class="form-control" placeholder="모금액" 
    name="max_fund" id="max_fund" type="text" />
</div>
<div class="form-group">
모금액 한도여부(모금액 이상 투자 허용시 체크)
    <input class="form-control" 
    name="limit" id="limit" type="radio" value="1"/>
</div>
<div class="form-group">
시작일자
    <input class="form-control" placeholder="시작일자" 
    name="start_date" id="start_date" type="date"/>
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