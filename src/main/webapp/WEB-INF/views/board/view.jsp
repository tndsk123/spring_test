<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <title>IFYOU &mdash; 누구나 쉽게하는 투자</title>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="${path}/include/css/view_css.css">
<script type="text/javascript">
function company(){
	var company_name=$("#company_name").val();
	$.ajax({
		url:'${path}/company/view.do?company_name='+company_name,
    type:'get',
    error:function(){
       alert('등록된 기업정보가 없습니다.');
    },
    success:function(data){
         if(data != null){
           $('#m_company_name').html(data.company_name);
           $('#m_ceo').html(data.ceo);
           $('#m_count_member').html(data.count_member+"명");
           $('#m_found_date').html(data.found_date);
           $('#m_greeting').html(data.greeting);
           $("#company_modal").get(0).click();
        }else{
            alert("등록된 기업정보가 없습니다.");
        }
     }
	});
}
function end(){
	alert("목표 금액 달성으로 투자가 불가한 상품입니다.");
}
</script>
</head>
<body>
 <div class="site-wrap">
  <%@ include file="../include/frame/top.jsp" %> 
  	<div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="${path}/">Home</a> <span class="mx-2 mb-0">/</span> <a href="${path}/board/list.do">투자</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">${list.title}</strong></div>
        </div>
      </div>
    </div>  

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div class="item-entry">
              <a href="#" class="product-item md-height bg-gray d-block">
                <img src="${path}/img/${list.title_img}" alt="Image" class="img-fluid">
              </a>
              
            </div>

          </div>
          <div class="col-md-6">
            <h2 class="text-black">${list.title}</h2>
            <p><span><strong><fmt:formatNumber value="${list.now_fund}" groupingUsed="true"/>원 달성</strong>
						목표금액 <fmt:formatNumber value="${list.max_fund}" groupingUsed="true"/> ${list.progress}%</span></p>
            <p class="mb-4">${list.now_date}일 남음 ${list.end_date}마감</p>
            <p><strong class="text-primary h4">1주 : <fmt:formatNumber value="${list.unit}" groupingUsed="true"/></strong></p>
           
            <div class="mb-5">
              <c:choose>
              	<c:when test="${list.limit == 1}">
              		<p>모집상황에 따라 목표금액 이상 투자가 가능한 상품입니다.</p>
              	</c:when>
              	<c:otherwise>
              		<p>목표금액 이상 투자가 불가능한 상품입니다.</p>
              	</c:otherwise>
              </c:choose>
            </div>
            <p>
            	<c:choose>
            		<c:when test="${list.progress >= 100 && list.limit != 1}">
            			<button class="buy-now btn btn-sm height-auto px-4 py-3 btn-primary" onclick="end()">구매종료</button>
            		</c:when>
            		<c:otherwise>         	
            			<a href="${path}/board/buy/${list.bno}" class="buy-now btn btn-sm height-auto px-4 py-3 btn-primary">Buy Now</a>
            		</c:otherwise>
            	</c:choose>
            	<a href="${path}/board/good.do?bno=${list.bno}" class="height-auto px-4 py-3 ml-3"><img src="${path}/images/good.jpg" width="50px" height="50px"></a>${list.good}
            </p>
           </div>

          </div>
        </div>
      </div>
      <div class="site-section block-3 site-blocks-2">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-8 site-section-heading text-center pt-4">
           	<div style="font-size: 13px; margin-bottom: 30px;">
    			<strong>! 투자 위험 고지</strong> 비성장기업 투자는 원금 손실의 가능성이 크니 <a href="#">투자 위험 안내</a>를 꼭 확인하세요.
           	</div>  
           </div>
       </div> 
    </div>
    <input id="bno" type="hidden" value="${list.bno}">
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>
	//구글 차트 라이브러리 로딩
	google.load("visualization","1", {
		"packages":["corechart"]
	});
	//라이브러리 로딩이 완료되면 drawChart 함수 호출, ()는 안씀
	google.setOnLoadCallback(drawChart);
	function drawChart(){
		var bno=$("#bno").val();
		//차트 그리기에 필요한 json 데이터 로딩
		var jsonData=$.ajax({
			url: "${path}/chart/cart_money_list.do?bno="+bno,
			dataType: "json",
			async: false //동기식처리(순차적 처리:데이터를 다부른 후 챠트출력하기 위해)
		}).responseText;
		console.log(jsonData);//콘솔에도 출력해봄
		//json => 데이터테이블
		var data=new google.visualization.DataTable(jsonData);
		console.log("데이터 테이블:"+data);
 		var chart=new google.visualization.PieChart(
				document.getElementById("chart_div")); 
		chart.draw(data, {
			title: "등급별 구매",
			//curveType: "function", //곡선 처리		
			width: 500,
			height: 220,
			pieHole: 0.4
		});
		var chart2=new google.visualization.PieChart(
				document.getElementById("chart_div2")); 
		chart2.draw(data, {
			//curveType: "function", //곡선 처리		
			width: 800,
			height: 550,
			pieHole: 0.5,
			pieSliceTextStyle: {
	            color: 'black',
	          },
	          legend: 'none'
		});
	}
</script>
	<div class="container pt-3">
		<div class="row">
			<div class="col-sm-6" id="chart_div"></div>
		</div>
	</div>        	        	


     
       
       
	<div class="container pt-3">
		<p style="color: rgba(0,0,0,.87); font-size: 19px; font-weight: 700; margin-top: 30px;">증권 발행 조건</p>
	<div>
	<div class="row" style="margin-bottom: 50px;">
			<div class="col-sm-6" style="color: #90949c; font-size: 13px; font-weight: 400;" >기업가치</div>
			<div class="col-sm-6" style="color: #90949c; font-size: 13px; font-weight: 400;">종류</div>
			<div class="col-sm-6" style="color: #00b2b2; font-size: 28px; font-weight: 700;">약 ${company.c_value}억</div>
			<div class="col-sm-6" style="color: #1d2129; font-size: 17px; font-weight: 700;">${list.s_division}</div>
	</div>
	<div class="row" style="margin-bottom: 50px;">
		<div class="col-sm-2" style="color: #1d2129;">주당 가격</div>
		<div class="col-sm-2"><fmt:formatNumber value="${list.unit}" groupingUsed="true"/>원</div>
		<div class="col-sm-2" style="color: #1d2129;">투자 가능 금액</div>
		<div class="col-sm-2">최소 
			<fmt:formatNumber value="${list.min_fund}" groupingUsed="true"/>원
			(<fmt:formatNumber value="${list.min_fund / list.unit}" groupingUsed="true"/>주)
		</div>
	</div>
    </div>
    </div>

<section id="tabs">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 ">
				<nav>
					<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
						<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">프로젝트소개</a>
						<a class="nav-item nav-link" id="nav-company-tab" data-toggle="tab" href="#nav-company" role="tab" aria-controls="nav-company" aria-selected="false">기업소개</a>
						<a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">투자위험</a>
						<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">게시판</a>
						<a class="nav-item nav-link" id="nav-about-tab" data-toggle="tab" href="#nav-about" role="tab" aria-controls="nav-about" aria-selected="false">투자자</a>
					</div>
				</nav>
				<div class="tab-content py-3 px-3 px-sm-3" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
					
					</div>
					<div class="tab-pane fade" id="nav-company" role="tabpanel" aria-labelledby="nav-company-tab">
					
					</div>
					<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
						
					</div>
					<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
						<div>
							<div>
								게시판에서 교환되는 의견은 참고자료일 뿐, 이곳에서 논의되는 내용 자체가 손실보전이나 원금보장을 담보하지 않습니다. 투자설명서가 피드백 내용보다 우선하므로, 반드시 핵심정보와 투자설명서를 바탕으로 투자 의사결정을 내리시기 바랍니다. 와디즈에서 발행되는 모든 증권에는 원금손실의 위험이 있음에 유의하시기 바랍니다.
							</div>
							<div>
							 <c:choose>
								<c:when test="${comment == null || comment == ''}">
									<div>
										<strong style="color: blue">아직 등록된 의견이 없습니다.</strong>
										<button class="btn btn-primary">의견남기기</button>
									</div>
								</c:when>
								<c:otherwise>
									<div>
										의견 <strong style="color: blue">${count}</strong>
										<button class="btn btn-primary">의견남기기</button>
									</div>
									<div>
										<c:forEach var="var" items="${comment}">
											<span>${var.title}</span>
											<span><fmt:formatDate value="${var.write_date}" pattern="yyyy-MM-dd"/></span>
											<br>
											<span>${var.writer}</span>
											<i class="fa fa-thumbs-up"><a href="#"></a></i>${var.good}
											<i class="fa fa-thumbs-down"><a href="#"></a></i>${var.hate}<hr>
										</c:forEach>
									</div>
								</c:otherwise>
							 </c:choose>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
						<div>
							<div>투자자</div>
							<div id="chart_div2"></div>
							<div>
								<span>${list.support}명의 투자자가 있습니다.</span><br>
								<c:forEach var="var" items="${grade}" varStatus="i">
									${var.name} 등급님이 <fmt:formatNumber value="${var.now_fund}" groupingUsed="true"/>
									원을 투자하셨습니다.(<fmt:formatDate value="${var.buy_date}" pattern="yyyy-MM-dd"/>)<hr>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			
			</div>
		</div>
	</div>
</section> 	    
    
    </div>
  
  
<%--   
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
				<a href="javascript:company()">${company.company_name}</a>
				<input type="hidden" id="company_name" value="${company.company_name}">
				<a id="company_modal" href="#company_info" rel="modal:open"></a>
				</p>
				<p>
				${company.greeting}
				</p>
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
<div class="modal" id="company_info" role="dialog">
   <div class="modal-dialog">
     <div class="modal-content">
       <div class="modal-header">
					<h4 class="modal-title" id="title">기업정보</h4>
       </div>
       <div class="modal-body">
         <p id="m_company_name"></p>
         <p id="m_ceo"></p>
         <p id="m_count_member"></p>
         <p id="m_found_date"></p>
         <p id="m_greeting"></p>
       </div>
    </div>
  </div>
</div> --%>
<%@ include file="../include/frame/bottom.jsp" %>  
</div>
</body>
</html>