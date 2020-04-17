<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IFYOU &mdash; 누구나 쉽게하는 투자</title>
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path}/include/css/search.css">
</head>
<body>
<div class="site-wrap">
  <%@ include file="../include/frame/top.jsp" %> 
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
        <div class="row">
          <div class="title-section mb-5 col-12">
            <h2 class="text-uppercase">${keyword} 검색결과</h2>
          </div>
        </div>
        <div class="row">
        	<c:forEach var="row" items="${list}">
          <div class="col-lg-4 col-md-6 item-entry mb-4">
            <a href="${path}/board/view/${row.bno}" class="product-item md-height bg-gray d-block">
              <img src="${path}/img/${row.title_img}" alt="Image" class="img-fluid">
            </a>
            <h2 class="item-title"><a href="${path}/board/view/${row.bno}">${row.title}</a></h2>
            <strong class="item-price"><fmt:formatNumber value="${row.now_fund}" groupingUsed="true"/></strong>
            <div class="star-rating">
              <span class="icon-star2 text-warning"></span>
              <span class="icon-star2 text-warning"></span>
              <span class="icon-star2 text-warning"></span>
              <span class="icon-star2 text-warning"></span>
              <span class="icon-star2 text-warning"></span>
            </div>
          </div>
          </c:forEach>
        </div>
      </div>
    </div>
<%-- <h1>${keyword} 검색결과</h1>
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
		<td>${row.good}</td>
	</tr>
</c:forEach>
</table> --%>
</div>
<%@ include file="../include/frame/bottom.jsp" %>
</body>
</html>