<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${path}/include/view_css.css">
<script type="text/javascript">
function buy(){
	location.href="${path}/board/buy/${list.bno}"
}
</script>
</head>
<body>
<%@include file="../include/header_bar.jsp" %>
<c:choose>
		<c:when test="${sessionScope.userid == 'tndsk123' }">
			<%@ include file="../include/admin_menu.jsp"%>
		</c:when>
</c:choose>
		<div id="wrap">
		<div class="article">
			<div>
				<img src="${path}/img/${list.title_img}" align="left">
			</div>
			<div class="funding-money">	
					<p>
					<span><strong><fmt:formatNumber value="${list.now_fund}" groupingUsed="true"/>원 달성</strong>
					목표금액 <fmt:formatNumber value="${list.max_fund}" groupingUsed="true"/> ${list.progress}%</span>
					<p>
					<span>${list.now_date}일 남음 ${list.end_date}마감</span>
					<p>
					<button type="button" onclick="buy()">구매하기</button>
					<a href="${path}/board/good.do?bno=${list.bno}">
					<img src="${path}/images/good.jpg" width="50px" height="50px"></a>${list.good} 
					</p>						
			</div>
		</div>
		<hr>
		
		<div class="section">
			<!-- 기업소개 -->
			<div class="funding-company">
				<div class="funding-company intro">
				<p>
				(주)마로산업테크
				</p>
				<p>
				연구개발특구진흥재단 파트너와 함께합니다.
				</p>
				#로봇 #물류로봇 #아마존
				</div>
			<div class="funding-company participation">
			 <div class="funding-company participation support">
				<p>
				${list.support}명이 확산에 참여중입니다.
				</p>
				<p>
				와디즈 지지서명을 통해 메이커의 멋진 이야기가
				</p>
				<p>
				세상에 알려질 수 있도록 페이스북에 공유해주세요.
				</p>
				참여시 최대 1,100포인트를 적립해 드립니다.
				<button>지지서명하기</button>
			 </div>	
			</div>
		  </div>
		<hr>
		  <!-- 투자자현황,매력도평가  -->
		<div class="funding-company allinvestros">
		  <div class="funding-company investorstatus">
		  	<p>
		  	매력도 평가?
		  	</p>
		  	<p>
		  	250개
		  	</p>
		  	<p>
		  	★4.0
		  	매력도 평점
		  	</p>
		  </div>
		  <div class="funding-company investorstatus">
		  <p>
		   투자자 현황
		  </p>
		  ${list.support}
		  </div>
		  <div class="funding-company investorstatus">
		  <p>
		  투자에는 이프유 계좌가 필수!
		  </p>
		 <a href="#"> 이프유 계좌 개설 방법 보러가기 -> </a>
		  </div>
		</div>
	</div>
	<div class="funding-lisk">
	<strong>!투자 위험 고지</strong> <span>상장기업 투자는 원금 손실의 가능성이 크니 투자 위험 안내를 꼭 확인하세요.</span>
	</div>
	<div class="funding-explanation tabcontainer">
	<div class="funding-explanation tab">
	<ul>
		<li><a href="#" class="funding-explanation link">핵심정보</a></li>
		<li><a href="#" class="funding-explanation link">투자위험</a></li>
		<li><a href="#" class="funding-explanation link">투자설명서</a></li>
		<li><a href="#" class="funding-explanation link">새소식</a></li>
		<li><a href="#" class="funding-explanation link">피드백</a></li>
		<li><a href="#" class="funding-explanation link">투자자</a></li>
	</ul>
	</div>
	</div>
	<div class="funding-explanation tabtab">
	<ul>
		<li><a href="#" class="funding-explanation link">증권발행조건</a></li>
		<li><a href="#" class="funding-explanation link">기업소개</a></li>
		<li><a href="#" class="funding-explanation link">핵심포인트</a></li>
		<li><a href="#" class="funding-explanation link">비즈니스 전략</a></li>
		<li><a href="#" class="funding-explanation link">상세내용</a></li>
		<li><a href="#" class="funding-explanation link">주요멤버</a></li>
		<li><a href="#" class="funding-explanation link">추천사</a></li>
		<li><a href="#" class="funding-explanation link">인터뷰</a></li>
		<li><a href="#" class="funding-explanation link">참고자료</a></li>
		<li><a href="#" class="funding-explanation link">뉴스</a></li>
	</ul>
	</div>
	<div class="funding-campainmain-container">
	<div class="funding-campainmain-content">
	<div id="equity-campaign-info" class="funding-container-campainmain infotab">
	<div class="funding-updatenews">
	<a href="#" class="funding-updatenewslink">
		<div class="funding-newstitle">
			<p><span>new 새소식 2020.04.06</span></p>
			<span>벤처기업 인증서가 나왔습니다(소득공제) > </span>
		</div>
	</a>
	</div>
	<section id="securt">
		<div>
			<div class="campaingsection-section">
				<div class="campaingsection-sectiontitle">
					<p>증권 발행 조건</p>
				</div>
			<div class="section-container info">
				<div class="securtsummary-summary">
					<ul>
						<li>
						<strong>기업가치</strong>
						<em>약 50억</em>
						</li>
						<li>
						<strong>${list.s_division}</strong>
						<span>상환전환우선주</span>
						</li>
					</ul>
				</div>
			<ul class="securtinfo-securtinfo-info">
				<li>
					<span class="securtinfo-securtinfo-lavel">
						<strong>
						주당가격
						</strong>
					</span>
					<span>
						<fmt:formatNumber value="${list.unit}" groupingUsed="true"/>
					</span>
				</li>
				<li>
				<span class="securtinfo-securtinfo-lavel">
						<strong>투자 가능 금액</strong>			
				</span>
				<span>
					최소&nbsp;
					<span>
					<fmt:formatNumber value="${list.min_fund}" groupingUsed="true"/>
					원
					</span>
					&nbsp;(
					<span>
					<fmt:formatNumber value="${list.min_fund / list.unit}" groupingUsed="true"/>			
					주
					</span>
					)
					</span>
				</li>
			</ul>
			
	</div>				
	</div>			
	</div>
	</section>
	</div>
	</div>
<%-- <button type="button" onclick="buy()">구매하기</button>
<h2>${list.title}</h2>
<table border="1">
	<tr>
		<th>구분</th>
		<th>이미지</th>
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
	</tr>
	<tr>
		<td>${list.p_division}</td>
		<td><img src="${path}/img/${list.title_img}"></td>
		<td>${list.s_division}</td>
		<td>${list.title}</td>
		<td>${list.now_fund}</td>
		<td>${list.max_fund}</td>
		<td>${list.progress}%</td>
		<td>${list.start_date}</td>
		<td>${list.end_date}</td>
		<td>${list.now_date}일</td>
		<td>${list.company_name}</td>
		<td>${list.unit}</td>
		<td>${list.min_fund}</td>
		<td>${list.support}</td>
		<td>${list.viewcnt}</td>
	</tr>
</table>
<a href="${path}/board/good.do?bno=${list.bno}"><img src="${path}/images/good.jpg"></a>${list.good} --%>
</body>
</html>