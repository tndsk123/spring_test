<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.slide').slick({
	autoplay:true,
	autoplaySpeed: 2000
	});
	$('.play').on('click',function(){
	$('slide').slick('slickplay')
		});
	$('.pause').on('click',function(){
		$('slide').slick('slickpause')
	});				
});
</script>
<style type="text/css">
* {
	margin:0;
	padding:0;
	box-sizing: border-box;
}
/* 슬라이드 */
.slide {position: relative;}
.slide button {position: absolute; z-index: 10; top: 50%; transform:translateY(-50%);
width: 71px; height: 71px; border-radius: 100%; background: rgba(0,0,0,0.5); border: none; outline: 0;}
.slide button:before{ font-family: 'xeicon'; color: #fff; font-size: 45px;}
.slide button.slick-prev { left:50px; font-size: 0; color: transparent;}
.slide button.slick-prev:before { content: "\e93d";}
.slide button.slick-next { right: 50px; font-size: 0; color: transparent;}
.slide button.slick-next:before { content: "\e940";}

/* 슬라이드 애니메이션 */
.slide .bg1{height:500px; background: url(../images/cock.jpg) no-repeat center / cover;}
.slide .bg1 h2{font-size: 50px; text-align: center; color: #ffa31a; opacity: 0; padding-top:100px;}
.slide .bg1 .txt1{font-size: 20px; text-align: center; color: white; opacity : 0;}
.slide .bg1 .txt2{font-size: 20px; text-align: center; color: white; opacity : 0;}
.slide .bg1.slick-active h2{ animation : ani 1 .5s .5s both;}
.slide .bg1.slick-active .txt1{ animation : ani 1 .5s .7s both;}
.slide .bg1.slick-active .txt2{ animation : ani 1 .5s .9s both;}

/* 슬라이드 애니메이션 */
.slide .bg2{height:500px; background: url(../images/imjm.jpg) no-repeat center / cover;}
.slide .bg2 h2{font-size: 50px; text-align: center; color: #ffa31a; opacity: 0; padding-top:100px;}
.slide .bg2 .txt1{font-size: 20px; text-align: center; color: white; opacity : 0;}
.slide .bg2 .txt2{font-size: 20px; text-align: center; color: white; opacity : 0;}
.slide .bg2.slick-active h2{ animation : ani 1 .5s .5s both;}
.slide .bg2.slick-active .txt1{ animation : ani 1 .5s .7s both;}
.slide .bg2.slick-active .txt2{ animation : ani 1 .5s .9s both;}

/* 슬라이드 애니메이션 */
.slide .bg3{height:500px; background: url(../images/yura.jpg) no-repeat center / cover;}
.slide .bg3 h2{font-size: 50px; text-align: center; color: #ffa31a; opacity: 0; padding-top:100px;}
.slide .bg3 .txt1{font-size: 20px; text-align: center; color: white; opacity : 0;}
.slide .bg3 .txt2{font-size: 20px; text-align: center; color: white; opacity : 0;}
.slide .bg3.slick-active h2{ animation : ani 1 .5s .5s both;}
.slide .bg3.slick-active .txt1{ animation : ani 1 .5s .7s both;}
.slide .bg3.slick-active .txt2{ animation : ani 1 .5s .9s both;}

/* 슬라이드 애니메이션 */
.slide .bg3{height:500px; background: url(../images/yura.jpg) no-repeat center / cover;}
.slide .bg3 h2{font-size: 50px; text-align: center; color: #ffa31a; opacity: 0; padding-top:100px;}
.slide .bg3 .txt1{font-size: 20px; text-align: center; color: white; opacity : 0;}
.slide .bg3 .txt2{font-size: 20px; text-align: center; color: white; opacity : 0;}
.slide .bg3.slick-active h2{ animation : ani 1 .5s .5s both;}
.slide .bg3.slick-active .txt1{ animation : ani 1 .5s .7s both;}
.slide .bg3.slick-active .txt2{ animation : ani 1 .5s .9s both;}

/* 슬라이드 애니메이션 */
.slide .bg4{height:500px; background: url(../images/blue.jpg) no-repeat center / cover;}
.slide .bg4 h2{font-size: 50px; text-align: center; color: #ffa31a; opacity: 0; padding-top:100px;}
.slide .bg4 .txt1{font-size: 20px; text-align: center; color: white; opacity : 0;}
.slide .bg4 .txt2{font-size: 20px; text-align: center; color: white; opacity : 0;}
.slide .bg4.slick-active h2{ animation : ani 1 .5s .5s both;}
.slide .bg4.slick-active .txt1{ animation : ani 1 .5s .7s both;}
.slide .bg4.slick-active .txt2{ animation : ani 1 .5s .9s both;}

@keyframes ani{
	0% { opacity : 0;}
	100% { opacity : 1;}
}

</style>
</head>
<body>
<section class="slide">
	<div class="bg1">
	<h2>Company</h2>
	<p class="txt1">CSS is a language that describes the style of an HTML document.</p>
	<p class="txt2">CSS describes how HTML elements should be displayed.
	This tutorial will teach you CSS from basic to advanced.</p>
	</div>
	<div class="bg2">
	<h2>Company</h2>
	<p class="txt1">CSS is a language that describes the style of an HTML document.</p>
	<p class="txt2">CSS describes how HTML elements should be displayed.
	This tutorial will teach you CSS from basic to advanced.</p>
	</div>
	<div class="bg3">
	<h2>Company</h2>
	<p class="txt1">CSS is a language that describes the style of an HTML document.</p>
	<p class="txt2">CSS describes how HTML elements should be displayed.
	This tutorial will teach you CSS from basic to advanced.</p>
	</div>
	<div class="bg4">
	<h2>Company</h2>
	<p class="txt1">CSS is a language that describes the style of an HTML document.</p>
	<p class="txt2">CSS describes how HTML elements should be displayed.
	This tutorial will teach you CSS from basic to advanced.</p>
	</div>
</section>	
<script type="text/javascript">
	$('.slide').slick();
	autoplay: true,
</script>
</body>
</html>