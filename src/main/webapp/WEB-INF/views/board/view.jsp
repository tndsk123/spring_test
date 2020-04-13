<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <title>IFYOU &mdash; 누구나 쉽게하는 투자</title>
<%@ include file="../include/header.jsp"%>
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