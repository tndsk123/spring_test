<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <title>IFYOU &mdash; 누구나 쉽게하는 투자</title>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="${path}/include/css/search.css">
<script>
$(function(){
	$("#btnWrite").click(function(){
		location.href="${path}/board/write.do";
	});
});
function list(page){
		var keyword=$("#s_keyword").val();
		if(keyword==null){
		location.href="${path}/board/list.do?curPage="+page;
		}else{
			location.href="${path}/board/list.do?curPage="+page+"&keyword="+keyword;
		}
}
</script>
<c:if test="${message != '' && message != null }">
				<script type="text/javascript">
					alert("글 작성이 완료되었습니다. 승인 후 게시될 예정입니다.");
				</script>
</c:if>
</head>
<body>
<div class="site-wrap">
	<%@ include file="../include/frame/top.jsp" %>
	<div class="site-blocks-cover inner-page" data-aos="fade">
      <div class="container">
        <div class="row">
          <div class="col-md-6 ml-auto order-md-2 align-self-start">
            <div class="site-block-cover-content">
            <h2 class="sub-title">#크라우드 펀딩으로 부자되기</h2>
            <h1>IFYOU로 시작하세요</h1>
            <p><a href="#" class="btn btn-black rounded-0">투자시작</a></p>
            </div>
          </div>
          <div class="col-md-6 order-1 align-self-end">
            <img src="${path}/images/investment.jpg" alt="Image" class="img-fluid">
          </div>
        </div>
      </div>
    </div>

    <div class="custom-border-bottom py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="${path}/">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">투자</strong></div>
        </div>
      </div>
    </div>
		
		<div class="s007">
      <form action="${path}/board/searchdetail.do">
        <div class="inner-form">
          <div class="basic-search">
            <div class="input-field">
              <div class="icon-wrap">
                <!-- 돋보기 아이콘 -->
                <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20">
                  <path d="M18.869 19.162l-5.943-6.484c1.339-1.401 2.075-3.233 2.075-5.178 0-2.003-0.78-3.887-2.197-5.303s-3.3-2.197-5.303-2.197-3.887 0.78-5.303 2.197-2.197 3.3-2.197 5.303 0.78 3.887 2.197 5.303 3.3 2.197 5.303 2.197c1.726 0 3.362-0.579 4.688-1.645l5.943 6.483c0.099 0.108 0.233 0.162 0.369 0.162 0.121 0 0.242-0.043 0.338-0.131 0.204-0.187 0.217-0.503 0.031-0.706zM1 7.5c0-3.584 2.916-6.5 6.5-6.5s6.5 2.916 6.5 6.5-2.916 6.5-6.5 6.5-6.5-2.916-6.5-6.5z"></path>
                </svg>
              </div>
              <input id="search" type="text" value="${keyword}"/>
              <div class="result-count">
                <span>${search_count}</span>results</div>
            </div>
          </div>
          <div class="advance-search">
            <span class="desc">Advanced Search</span>
            <div class="row">
              <div class="input-field">
                <div class="input-select">
                  <select data-trigger="" name="division">
                    <option placeholder="" value="">프로젝트</option>
                    <option value="a">투자</option>
                    <option value="b">펀딩</option>
                  </select>
                </div>
              </div>
              <div class="input-field">
                <div class="input-select">
                  <select data-trigger="" name="progress">
                    <option placeholder="" value="">달성률</option>
                    <option value="a">0~25</option>
                    <option value="b">25~50</option>
                    <option value="c">50~75</option>
                    <option value="d">75~100</option>
                    <option value="d">100이상</option>
                  </select>
                </div>
              </div>
              <div class="input-field">
                <div class="input-select">
                  <select data-trigger="" name="max_fund">
                    <option placeholder="" value="">달성금액</option>
                    <option value="a">100만 원 미만</option>
                    <option value="b">100만 원 ~ 500만 원</option>
                    <option value="c">500만 원 ~ 1,000만 원</option>
                    <option value="d">1,000만 원 ~ 5,000만 원</option>
                    <option value="e">5,000만 원 이상</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="row second">
              <div class="input-field">
                <div class="input-select">
                  <select data-trigger="" name="min_fund">
                    <option placeholder="" value="">최소투자액</option>
                    <option value="a">10만 원 미만</option>
                    <option value="b">10만 원 ~ 50만 원</option>
                    <option value="c">50만 원 ~ 100만 원</option>
                    <option value="d">100만 원 ~ 500만 원</option>
                    <option value="e">500만 원 ~ 1,000만 원</option>
                    <option value="f">1,000만 원 이상</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="row third">
              <div class="input-field">
                <button class="btn-search">Search</button>
                <button class="btn-delete" id="delete">Delete</button>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
    <script src="${path}/include/js/choices.js"></script>
    <script>
      const customSelects = document.querySelectorAll("select");
      const deleteBtn = document.getElementById('delete')
      const choices = new Choices('select',
      {
        searchEnabled: false,
        removeItemButton: true,
        itemSelectText: '',
      });
      for (let i = 0; i < customSelects.length; i++)
      {
        customSelects[i].addEventListener('addItem', function(event)
        {
          if (event.detail.value)
          {
            let parent = this.parentNode.parentNode
            parent.classList.add('valid')
            parent.classList.remove('invalid')
          }
          else
          {
            let parent = this.parentNode.parentNode
            parent.classList.add('invalid')
            parent.classList.remove('valid')
          }
        }, false);
      }
      deleteBtn.addEventListener("click", function(e)
      {
        e.preventDefault()
        const deleteAll = document.querySelectorAll('.choices__button')
        for (let i = 0; i < deleteAll.length; i++)
        {
          deleteAll[i].click();
        }
      });

    </script>
		
    <div class="site-section">
      <div class="container">

        <div class="row mb-5">
          <div class="col-md-9 order-1">
            <div class="row align">
              <div class="col-md-12 mb-5">
                <div class="float-md-left"><h2 class="text-black h5">Shop All</h2></div>
                <div class="d-flex">
                  <div class="dropdown mr-1 ml-md-auto" id="stock">
                    <button type="button" class="btn btn-white btn-sm dropdown-toggle px-4" id="dropdownMenuOffset" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      	<span class="caret" id="s_division_search">
                      		<c:choose>
                      			<c:when test="${param.keyword == null}">
                      				주식구분
                      			</c:when>
                      			<c:otherwise>
                      				${param.keyword}
                      				<input type="hidden" id="s_keyword" value="${keyword}">
                      			</c:otherwise>
                      		</c:choose>
                      	</span>
                    </button>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="javascript:void(0)">주식</a></li>
                      <li><a class="dropdown-item" href="javascript:void(0)">채권</a></li>
                    </ul>
                  </div>
                  <script type="text/javascript">
                  $('#stock .dropdown-menu li > a').bind('click',function (e) {
                	    var html = $(this).html();
                	    location.href="${path}/board/list.do?keyword="+html;
                	});
                  </script>
                  <!-- <div class="btn-group" id="d_stock">
                    <button type="button" class="btn btn-white btn-sm dropdown-toggle px-4" id="dropdownMenuReference" data-toggle="dropdown">
                      	<span class="caret" id="sd_division_search">주식구분</span>	
                    </button>
                    
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuReference">
                      <a class="dropdown-item" href="#">Relevance</a>
                      <a class="dropdown-item" href="#">Name, A to Z</a>
                      <a class="dropdown-item" href="#">Name, Z to A</a>
                      <a class="dropdown-item" href="#">Price, low to high</a>
                      <a class="dropdown-item" href="#">Price, high to low</a>
                    </div>
                  </div> -->
                </div>
              </div>
            </div>
            <div class="row mb-5">
            <c:forEach var="row" items="${list}" begin="">
              <div class="col-lg-6 col-md-6 item-entry mb-4">
                <a href="${path}/board/view/${row.bno}" class="product-item md-height bg-gray d-block">
                  <img src="${path}/img/${row.title_img}" alt="Image" class="img-fluid">
                </a>
                <h2 class="item-title"><a href="${path}/board/view/${row.bno}">${row.title}</a></h2>
                <p class="">${row.s_division}</p>
                <strong class="item-price">${row.now_fund}</strong>
              </div>
            </c:forEach>
            </div>
            <div class="row">
              <div class="col-md-12 text-center">
                <div class="site-block-27">
                  <ul>
                    <li>
                    	<c:if test="${pager.curBlock > 1}">
												<a href="#" onclick="list('${pager.prevPage}')">
													&lt;
												</a>
											</c:if>
										</li>
										<c:forEach var="num" begin="${pager.blockBegin}" end="${pager.blockEnd}">
											<c:choose>
												<c:when test="${num == map.pager.curPage}">
													<li class="active"><span>${num}</span></li>
												</c:when>
												<c:otherwise>
													<li><a href="#" onclick="list('${num}')">${num}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${map.pager.curBlock < map.pager.totBlock}">
											<li><a href="#" onclick="list('${map.pager.nextPage}')">&gt;</a></li>
										</c:if>
                  </ul>
                </div>
              </div>
            </div>
          </div>

          <div class="col-md-3 order-2 mb-5 mb-md-0">
            <div class="border p-4 rounded mb-4">
              <h3 class="mb-3 h6 text-uppercase text-black d-block">Categories</h3>
              <ul class="list-unstyled mb-0">
              	<c:forEach var="var" items="${categories}">
              		<li class="mb-1"><a href="#" class="d-flex"><span>${var.p_division}</span></a></li>	
              	</c:forEach>
              </ul>
            </div>

            <div class="border p-4 rounded mb-4">
              <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Filter by Price</h3>
                <div id="slider-range" class="border-primary"></div>
                <input type="text" name="text" id="amount" class="form-control border-0 pl-0 bg-white" disabled="" />
              </div>

              <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Size</h3>
                <label for="s_sm" class="d-flex">
                  <input type="checkbox" id="s_sm" class="mr-2 mt-1"> <span class="text-black">Small (2,319)</span>
                </label>
                <label for="s_md" class="d-flex">
                  <input type="checkbox" id="s_md" class="mr-2 mt-1"> <span class="text-black">Medium (1,282)</span>
                </label>
                <label for="s_lg" class="d-flex">
                  <input type="checkbox" id="s_lg" class="mr-2 mt-1"> <span class="text-black">Large (1,392)</span>
                </label>
              </div>

              <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Color</h3>
                <a href="#" class="d-flex color-item align-items-center" >
                  <span class="bg-danger color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Red (2,429)</span>
                </a>
                <a href="#" class="d-flex color-item align-items-center" >
                  <span class="bg-success color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Green (2,298)</span>
                </a>
                <a href="#" class="d-flex color-item align-items-center" >
                  <span class="bg-info color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Blue (1,075)</span>
                </a>
                <a href="#" class="d-flex color-item align-items-center" >
                  <span class="bg-primary color d-inline-block rounded-circle mr-2"></span> <span class="text-black">Purple (1,075)</span>
                </a>
              </div>

            </div>
          </div>
        </div>

      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="title-section mb-5">
          <h2 class="text-uppercase"><span class="d-block">Discover</span> The Collections</h2>
        </div>
        <div class="row align-items-stretch">
          <div class="col-lg-8">
            <div class="product-item sm-height full-height bg-gray">
              <a href="#" class="product-category">Women <span>25 items</span></a>
              <img src="images/model_4.png" alt="Image" class="img-fluid">
            </div>
          </div>
          <div class="col-lg-4">
            <div class="product-item sm-height bg-gray mb-4">
              <a href="#" class="product-category">Men <span>25 items</span></a>
              <img src="images/model_5.png" alt="Image" class="img-fluid">
            </div>

            <div class="product-item sm-height bg-gray">
              <a href="#" class="product-category">Shoes <span>25 items</span></a>
              <img src="images/model_6.png" alt="Image" class="img-fluid">
            </div>
          </div>
        </div>
      </div>
    </div>
<%-- <h2>fund</h2>
<button type="button" id="btnWrite">글쓰기</button>
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
	</tr>
<c:forEach var="row" items="${list}">
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
	</tr>
</c:forEach>
</table> --%>
	<%@ include file="../include/frame/bottom.jsp" %> 
</div>
</body>
</html>