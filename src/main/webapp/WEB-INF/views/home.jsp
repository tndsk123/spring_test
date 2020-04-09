<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<%@ include file="include/header.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="${path}/include/home_css.css">
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
	$("#search").keydown(function(key){
		if(key.keyCode == 13){
				document.search_from.submit();
			}
	});				
});
</script>

</head>
<body>
<%-- <c:choose>
		<c:when test="${sessionScope.userid == 'tndsk123' }">
			<%@ include file="include/admin_menu.jsp"%>
		</c:when>
		<c:otherwise>
			<%@ include file="include/menu.jsp"%>
		</c:otherwise>
</c:choose>
 --%>
<div class="navbar">
	 <div class="company-name">
	 	<img src="${path}/images/logo3.jpg" class="logo"><span>IF you</span>
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
 	
<section class="slide">
	<div class="bg1">
	</div>
	<div class="bg2">
	</div>
	<div class="bg3">
	</div>
	<div class="bg4">
	</div>
</section>	
<script type="text/javascript">
	$('.slide').slick();
	autoplay: true
</script>
<div class="flex contents-wrap">

<div class="flex hot">
	<div>
		<h1 class="hotmain">Hot Project(조회순)</h1>
	</div>
	<div class="flex item">
		<c:forEach var="row" items="${cnt_list}" begin="0" end="0">
		<div>
			<a href="${path}/board/view/${row.bno}">
				<img src="${path}/img/${row.title_img}">
			</a>
			<span>${row.title}</span>
		</div>
		</c:forEach>
		<div>
			<c:forEach var="row" items="${cnt_list}" begin="1" end="3">
				<div>
					<a href="${path}/board/view/${row.bno}">
						<img src="${path}/img/${row.title_img}">
					</a>
					<span>${row.title}</span>
				</div>
			</c:forEach>
		</div>
	</div>
		<div class="startup">
			<h1>startup(좋아요순)</h1>	
		</div>
		<div class="flex bottom">
			<c:forEach var="row" items="${good_list}" begin="0" end="2">
				<div>
					<a href="${path}/board/view/${row.bno}">
						<img src="${path}/img/${row.title_img}">
					</a>
					<span>${row.title}</span>
				</div>
			</c:forEach>
		</div>
		<div class="ct">
			<h1>Culture(진행률순)</h1>	
		</div>
		<div class="flex culture">
			<c:forEach var="row" items="${progress_list}" begin="0" end="2">
				<div>
					<a href="${path}/board/view/${row.bno}">
						<img src="${path}/img/${row.title_img}">
					</a>
					<span>${row.title}</span>
				</div>
			</c:forEach>
		</div>
		<div class="bd">
			<h1>support(서포트 순)</h1>	
		</div>
		<div class="flex bond">
			<c:forEach var="row" items="${support_list}" begin="0" end="2">
				<div>
					<a href="${path}/board/view/${row.bno}">
						<img src="${path}/img/${row.title_img}">
					</a>
					<span>${row.title}</span>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<%@include file="include/footer.jsp" %>
<%-- <h1>조회수 Best 5</h1>
<table border="1">
	<tr>
		<th>구분</th>
		<th>주식구분</th>
		<th>제목</th>
		<th>현재금액</th>
		<th>목표금액</th>
		<th>진행률</th>
		<th>시작일자</th>
		<th>종료일자</th>
		<th>남은일자</th>
		<th>회사명</th>
		<th>주당가격</th>
		<th>최소투자액</th>
		<th>서폿터수</th>
		<th>조회수</th>
		<th>좋아요수</th>
	</tr>
<c:forEach var="row" items="${cnt_list}">
	<tr>
		<td>${row.p_division}</td>
		<td>${row.s_division}</td>
		<td><a href="${path}/board/view/${row.bno}">${row.title}</a></td>
		<td>${row.now_fund}</td>
		<td>${row.max_fund}</td>
		<td>${row.progress}%</td>
		<td>${row.start_date}</td>
		<td>${row.end_date}</td>
		<td>${row.now_date}일</td>
		<td>${row.company_name}</td>
		<td>${row.unit}</td>
		<td>${row.min_fund}</td>
		<td>${row.support}</td>
		<td>${row.viewcnt}</td>
		<td>${row.good}</td>
	</tr>
</c:forEach>
</table>
<h1>좋아요수 Best 5</h1>
<table border="1">
	<tr>
		<th>구분</th>
		<th>주식구분</th>
		<th>제목</th>
		<th>현재금액</th>
		<th>목표금액</th>
		<th>진행률</th>
		<th>시작일자</th>
		<th>종료일자</th>
		<th>남은일자</th>
		<th>회사명</th>
		<th>주당가격</th>
		<th>최소투자액</th>
		<th>서폿터수</th>
		<th>조회수</th>
		<th>좋아요수</th>
	</tr>
<c:forEach var="row" items="${good_list}">
	<tr>
		<td>${row.p_division}</td>
		<td>${row.s_division}</td>
		<td><a href="${path}/board/view/${row.bno}">${row.title}</a></td>
		<td>${row.now_fund}</td>
		<td>${row.max_fund}</td>
		<td>${row.progress}%</td>
		<td>${row.start_date}</td>
		<td>${row.end_date}</td>
		<td>${row.now_date}일</td>
		<td>${row.company_name}</td>
		<td>${row.unit}</td>
		<td>${row.min_fund}</td>
		<td>${row.support}</td>
		<td>${row.viewcnt}</td>
		<td>${row.good}</td>
	</tr>
</c:forEach>
</table>
<h1>투자자수 Best 5</h1>
<table border="1">
	<tr>
		<th>구분</th>
		<th>주식구분</th>
		<th>제목</th>
		<th>현재금액</th>
		<th>목표금액</th>
		<th>진행률</th>
		<th>시작일자</th>
		<th>종료일자</th>
		<th>남은일자</th>
		<th>회사명</th>
		<th>주당가격</th>
		<th>최소투자액</th>
		<th>서폿터수</th>
		<th>조회수</th>
		<th>좋아요수</th>
	</tr>
<c:forEach var="row" items="${support_list}">
	<tr>
		<td>${row.p_division}</td>
		<td>${row.s_division}</td>
		<td><a href="${path}/board/view/${row.bno}">${row.title}</a></td>
		<td>${row.now_fund}</td>
		<td>${row.max_fund}</td>
		<td>${row.progress}%</td>
		<td>${row.start_date}</td>
		<td>${row.end_date}</td>
		<td>${row.now_date}일</td>
		<td>${row.company_name}</td>
		<td>${row.unit}</td>
		<td>${row.min_fund}</td>
		<td>${row.support}</td>
		<td>${row.viewcnt}</td>
		<td>${row.good}</td>
	</tr>
</c:forEach>
</table>
<h1>마감임박 Best 5</h1>
<table border="1">
	<tr>
		<th>구분</th>
		<th>주식구분</th>
		<th>제목</th>
		<th>현재금액</th>
		<th>목표금액</th>
		<th>진행률</th>
		<th>시작일자</th>
		<th>종료일자</th>
		<th>남은일자</th>
		<th>회사명</th>
		<th>주당가격</th>
		<th>최소투자액</th>
		<th>서폿터수</th>
		<th>조회수</th>
		<th>좋아요수</th>
	</tr>
<c:forEach var="row" items="${progress_list}">
	<tr>
		<td>${row.p_division}</td>
		<td>${row.s_division}</td>
		<td><a href="${path}/board/view/${row.bno}">${row.title}</a></td>
		<td>${row.now_fund}</td>
		<td>${row.max_fund}</td>
		<td>${row.progress}%</td>
		<td>${row.start_date}</td>
		<td>${row.end_date}</td>
		<td>${row.now_date}일</td>
		<td>${row.company_name}</td>
		<td>${row.unit}</td>
		<td>${row.min_fund}</td>
		<td>${row.support}</td>
		<td>${row.viewcnt}</td>
		<td>${row.good}</td>
	</tr>
</c:forEach>
</table>
<h1>오늘오픈 Best 5</h1>
<table border="1">
	<tr>
		<th>구분</th>
		<th>주식구분</th>
		<th>제목</th>
		<th>현재금액</th>
		<th>목표금액</th>
		<th>진행률</th>
		<th>시작일자</th>
		<th>종료일자</th>
		<th>남은일자</th>
		<th>회사명</th>
		<th>주당가격</th>
		<th>최소투자액</th>
		<th>서폿터수</th>
		<th>조회수</th>
		<th>좋아요수</th>
	</tr>
<c:forEach var="row" items="${today_list}">
	<tr>
		<td>${row.p_division}</td>
		<td>${row.s_division}</td>
		<td><a href="${path}/board/view/${row.bno}">${row.title}</a></td>
		<td>${row.now_fund}</td>
		<td>${row.max_fund}</td>
		<td>${row.progress}%</td>
		<td>${row.start_date}</td>
		<td>${row.end_date}</td>
		<td>${row.now_date}일</td>
		<td>${row.company_name}</td>
		<td>${row.unit}</td>
		<td>${row.min_fund}</td>
		<td>${row.support}</td>
		<td>${row.viewcnt}</td>
		<td>${row.good}</td>
	</tr>
</c:forEach>
</table> --%>
</body>
</html>
