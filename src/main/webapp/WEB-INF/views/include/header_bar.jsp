<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="header.jsp" %>
 <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
/* 드롭다운 스크립트 */

</script>
<style type="text/css">
.navbar {
	height: 70px;
	display: flex;
	margin: 0 auto;
    margin-top: 10px;
    margin-right: auto;
    margin-bottom: 10px;
    margin-left: auto;
    padding: 0 80px;
    max-width: 1440px;
    
    
}
.navbar-right-items {
	display: flex;
	margin-left: auto;
	
}
.nav-item{
	margin-left: 10px;
	
	
}

.nav-item a:visited {
	color: #666666;

}

.company-name { 
    cursor: pinter;
    font-size: 32px;
    margin-left: 40px;
    display: flex;
    
}
a{
	text-decoration: none;
}

.invest {
	font-size: 25px;
	font-weight: bold;
	margin-top: 10px;
}

.invest a:visited {
	color: #404040;
}
.invest a:active {
	color: #66a3ff;
}
.reward {
	font-size: 25px;
	margin-top: 10px;
	font-weight: bold;
}
.reward a:visited {
	color : #404040;
}
.reward a:active {
	color: #66a3ff;
}
.invest, .reward {
	margin-bottom: 10px;
}
.nav-item {
	margin-top: 15px;
}
.navbar input#search{
  margin-top: 10px;	 
  margin-right : 10px;
  width: 250px;
  height: 37px;
  background: #d9d9d9;
  border: none;
  font-size: 10pt;
  float: left;
  color: #63717f;
  padding-left: 45px;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
}
.navbar .icon{	
  position: absolute;
  top: 10px;
  margin-left: 17px;
  margin-top: 17px;
  z-index: 1;
  color: #4f5b66;
}
.navbar input#search:hover, .navbar input#search:focus, .navbar input#search:active{
    outline:none;
    background: #a6a6a6;
  }
.navbar input#search::-webkit-input-placeholder {
   color: #65737e;
}
 
.navbar input#search:-moz-placeholder { 
   color: #65737e;  
}
 
.navbar input#search::-moz-placeholder { 
   color: #65737e;  
}
 
.navbar input#search:-ms-input-placeholder {  
   color: #65737e;  
}
body, html {
  height: 100%;
}

* {
  box-sizing: border-box;
}

.bg-image {
  /* The image used */
  background-image: url("../images/cock.jpg");

  /* Add the blur effect */
  filter: blur(8px);
  -webkit-filter: blur(8px);

  /* Full height */
  height: 30%;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  margin-bottom: 30px;
}

/* Position text in the middle of the page/image */
.bg-text {
  
  color: #666666;
  font-weight: bold;
  position: absolute;
  text-align : center;
  top: 20%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
  width: 80%;
  padding: 20px;
  
}
.bg-text img {
	
	width: 500px;
	height: 300px;
	position : absolute;
	left: 600px;
}

/* 버튼 드롭다운 */
.menu {    
  margin-top : 5px;
  margin-left : 20px;
  position: relative;
  height: 44px;	
  width: auto;
}
.menu ul {
  list-style: none;
  padding: 0;
  margin: 0;
  line-height: 1;
}
.menu > ul {
  position: relative;
  display: block;
  
  width: 100%;
  z-index: 500;
}
.menu:after, .menu > ul:after {
  content: ".";
  display: block;
  clear: both;
  visibility: hidden;
  line-height: 0;
  height: 0;
}
.menu.align-right > ul > li {
  float: right;
}
.menu.align-center ul {
  text-align: center;
}
.menu.align-center ul ul {
  text-align: left;
}
.menu > ul > li {
  display: inline-block;
  position: relative;
  margin: 0;
  padding: 0;
}
.menu > ul > #menu-button {
  display: none;
}
.menu ul li a {
  display: block;
  font-family: Helvetica, sans-serif;
  text-decoration: none;
}
.menu > ul > li > a {
  font-size: 14px;
  font-weight: bold;
  padding: 15px 20px;
  color: #a6a6a6;
  text-transform: uppercase;
  -webkit-transition: color 0.25s ease-out;
  -moz-transition: color 0.25s ease-out;
  -ms-transition: color 0.25s ease-out;
  -o-transition: color 0.25s ease-out;
  transition: color 0.25s ease-out;
}
.menu > ul > li.sub > a {
  padding-right: 32px;
}
.menu > ul > li:hover > a {
  color: black;
}
.menu li.sub::after {
  display: block;
  content: "";
  position: absolute;
  width: 0;
  height: 0;
}
.menu > ul > li.sub::after {
  right: 10px;
  top: 20px;
  border: 5px solid transparent;
  border-top-color: #7a8189;
}
.menu > ul > li:hover::after {
  border-top-color: black;
}
.menu ul ul {
  position: absolute;
  left: -9999px;
  top: 70px;
  opacity: 0;
  -webkit-transition: opacity .3s ease, top .25s ease;
  -moz-transition: opacity .3s ease, top .25s ease;
  -ms-transition: opacity .3s ease, top .25s ease;
  -o-transition: opacity .3s ease, top .25s ease;
  transition: opacity .3s ease, top .25s ease;
  z-index: 1000;
}
.menu ul ul ul {
  top: 37px;
  padding-left: 5px;
}
.menu ul ul li {
  position: relative;
}
.menu > ul > li:hover > ul {
  left: auto;
  top: 44px;
  opacity: 1;
}
.menu.align-right > ul > li:hover > ul {
  left: auto;
  right: 0;
  opacity: 1;
}
.menu ul ul li:hover > ul {
  left: 170px;
  top: 0;
  opacity: 1;
}
.menu.align-right ul ul li:hover > ul {
  left: auto;
  right: 170px;
  top: 0;
  opacity: 1;
  padding-right: 5px;
}
.menu ul ul li a {
  width: 130px;
  border-bottom: 1px solid #eeeeee;
  padding: 10px 20px;
  font-size: 12px;
  color: #9ea2a5;
  background: #ffffff;
  -webkit-transition: all .35s ease;
  -moz-transition: all .35s ease;
  -ms-transition: all .35s ease;
  -o-transition: all .35s ease;
  transition: all .35s ease;
}
.menu.align-right ul ul li a {
  text-align: right;
}
.menu ul ul li:hover > a {
  background: #f2f2f2;
  color: #8c9195;
}
.menu ul ul li:last-child > a, .menu ul ul li.last > a {
  border-bottom: 0;
}
.menu > ul > li > ul::after {
  content: '';
  border: 6px solid transparent;
  width: 0;
  height: 0;
  border-bottom-color: #ffffff;
  position: absolute;
  top: -12px;
  left: 30px;
}
.menu.align-right > ul > li > ul::after {
  left: auto;
  right: 30px;
}
.menu ul ul li.sub::after {
  border: 4px solid transparent;
  border-left-color: #9ea2a5;
  right: 10px;
  top: 12px;
  -moz-transition: all .2s ease;
  -ms-transition: all .2s ease;
  -o-transition: all .2s ease;
  transition: all .2s ease;
  -webkit-transition: -webkit-transform 0.2s ease, right 0.2s ease;
}
.menu.align-right ul ul li.sub::after {
  border-left-color: transparent;
  border-right-color: #9ea2a5;
  right: auto;
  left: 10px;
}
.menu ul ul li.sub:hover::after {
  border-left-color: #ffffff;
  right: -5px;
  -webkit-transform: rotateY(180deg);
  -ms-transform: rotateY(180deg);
  -moz-transform: rotateY(180deg);
  -o-transform: rotateY(180deg);
  transform: rotateY(180deg);
}
.menu.align-right ul ul li.sub:hover::after {
  border-right-color: #ffffff;
  border-left-color: transparent;
  left: -5px;
  -webkit-transform: rotateY(180deg);
  -ms-transform: rotateY(180deg);
  -moz-transform: rotateY(180deg);
  -o-transform: rotateY(180deg);
  transform: rotateY(180deg);
}
/* 로고이미지 */
.logo {
	width: 80px;
	height: 80px;
	padding-right: 10px;
	
}
.company-name span {
	font-weight: bold;
}

/* 버튼 이미지 */
.funding-open-button{
  width:150px;
  height:45px;
  padding : 10px 10px 0 0;
  border:2px solid #66a3ff;
  float:left;
  text-align:center;
  cursor:pointer;
  position:relative;
  box-sizing:border-box;
  overflow:hidden;
  margin:5px 0 0 10px;
  border-radius: 10px;
}
.funding-open-button a{
  margin-left:7px;
  font-family:arial;
  font-size:0.9rem;
  font-weight :bold;
  color:#66a3ff;
  text-decoration:none;
  line-height:10px;
  transition:all .5s ease;
  z-index:2;
  position:relative;
}
.eff-1{
  width:150px;
  height:45px;
  top:-2px;
  right:-160px;
  background:#66a3ff;
  position:absolute;
  transition:all .5s ease;
  z-index:1;
}
.funding-open-button:hover .eff-1{
  right:0;
}
.funding-open-button:hover a{
  color:#fff;
}

</style>
</head>
<body>
<div class="navbar">
	 <div class="company-name">
	 	<img src="${path}/images/logo3.jpg" class="logo"><span><a href="${path}">IF you</a></span>
		<div class="company-name invest"><a href="${path}/board/list.do">투자</a></div>
		<div class="company-name reward"><a href="#">리워드</a></div>
		<div class="menu">
   			<ul>
   					 <li class='sub'>
							<a href='#'>더보기</a>
							<ul>
								<li>
									<a href='#'>메뉴1</a>
								</li>
								<li class='last'>
									<a href='#'>메뉴2</a>
								</li>
								<li>
									<a href='#'>메뉴3</a>
								</li>
								<li>
									<a href='#'>메뉴4</a>
								</li>
								<li>
									<a href='#'>메뉴5</a>
								</li>
								<li>
									<a href='#'>메뉴6</a>
								</li>
							</ul>
						</li>
   			</ul>
		</div>
	 </div>
	 <div class="navbar-right-items">
	 	<span class="icon"><i class="fa fa-search"></i></span>
		<form name="search_form" method="get" action="${path}/board/search.do">
			<input class="nav-item" type="search" placeholder="Search" id="search" name="search">
		</form>  
		<c:choose>
			<c:when test="${sessionScope.userid == null }">
				<!-- 로그인하지 않은 상태 -->
				<div class="nav-item"><a href="${path}/user/login.do">로그인 </a></div>
				<div class="nav-item"><a href="${path}/user/join.do">회원가입</a></div>
			</c:when>
			<c:otherwise>
				<!-- 로그인한 상태 -->
				<div class="nav-item"><a href="${path}/user/logout.do">로그아웃 </a></div>
				<div class="nav-item"><a href="${path}/user/mypage.do">마이페이지</a></div>
			</c:otherwise>
		</c:choose>
	 	<div class="funding-open-button">
    		<div class="eff-1"></div>
    		<a href="${path}/board/write.do"> 펀딩오픈 신청하기 </a>
  	</div>
	</div> 	
 </div>
</body>
</html>