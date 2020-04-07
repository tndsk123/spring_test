<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html,body {
    margin:0;
    padding:0;
    height:100%;

}

.wrapper {
	position:relative;
    min-height:100%;
}

.footer {
    position:absolute;
    text-align:center;
    padding : 30px 0;
    border-top : 1px solid #ccc;
    background-color : #ed0f5;
    margin-top : 30px;
    bottom:0;
    width:100%;
    height:100px;   
}


.footer li {
	display: inline;
	padding: 0 10px;
	no-repeat : 0 2px;
}
.footer li a{
	text-decoration: none;

}

.footer li:first-child {
	background: none;
	padding-left: 0;
}

.footer address {
	padding-top: 30px;
	padding-bottom: 30px;
}

.footer address a{
	text-decoration: none;
}


</style>
</head>
<body>
<div class="wrapper">

	<div class="footer">
	<ul>
	<li><a href="#">회원가입약관</a></li>
	<li><a href="#">서비스이용약관</a></li>
	<li><a href="#"><strong>개인정보처리방침</strong></a></li>
	<li><a href="#">운영정책</a></li>
	<li><a href="#">제휴문의</a></li>
	<li><a href="#">공지사항</a></li>
	<li><a href="#">인재채용</a></li>
	<li><a href="#">SNS</a></li>
	</ul>
	<address>
		<em>Copyright &copy;</em>
		<a href="#">IFU.co.kr</a>
		<span>All Right Rederved</span>
	</address>
	</div>   
</div>

</body>
</html>