<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>ShopMax &mdash; Colorlib e-Commerce Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	  <%@ include file="include/header.jsp"%>
  </head>
  <body>
  <div class="site-wrap">
  <%@ include file="include/frame/top.jsp" %> 
    <div class="site-blocks-cover" data-aos="fade">
      <div class="container">
        <div class="row">
          <c:forEach var="row" items="${cnt_list}" begin="0" end="0">
          <div class="col-md-6 ml-auto order-md-2 align-self-start">
            <div class="site-block-cover-content">
            <h2 class="sub-title">#오늘 가장 핫한 투자</h2>
            <h1>${row.title}</h1>
            <p><a href="${path}/board/view/${row.bno}" class="btn btn-black rounded-0">Shop Now</a></p>
            </div>
          </div>
          <div class="col-md-6 order-1 align-self-end">
            <img src="${path}/img/${row.title_img}" alt="Image" class="img-fluid">
          </div>        	
          </c:forEach>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="title-section mb-5">
          <h2 class="text-uppercase"><span class="d-block">Today</span> ViewCnt</h2>
        </div>
        <div class="row align-items-stretch">
        	<c:forEach var="row" items="${cnt_list}" begin="0" end="0">
          	<div class="col-lg-8">
            	<div class="product-item sm-height full-height bg-gray">
              	<a href="${path}/board/view/${row.bno}" class="product-category">${row.title}</a>
              	<img src="${path}/img/${row.title_img}" alt="Image" class="img-fluid">
            	</div>
          	</div>
        	</c:forEach>
          <div class="col-lg-4">
        	<c:forEach var="row" items="${cnt_list}" begin="1" end="1">
            <div class="product-item sm-height bg-gray mb-4">
              <a href="${path}/board/view/${row.bno}" class="product-category">${row.title}</a>
              <img src="${path}/img/${row.title_img}" alt="Image" class="img-fluid">
            </div>
        	</c:forEach>
					<c:forEach var="row" items="${cnt_list}" begin="2" end="2">
            <div class="product-item sm-height bg-gray">
              <a href="${path}/board/view/${row.bno}" class="product-category">${row.title}</a>
              <img src="${path}/img/${row.title_img}" alt="Image" class="img-fluid">
            </div>
          </c:forEach>
          </div>
        </div>
      </div>
    </div>


    
    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="title-section mb-5 col-12">
            <h2 class="text-uppercase">Like Products</h2>
          </div>
        </div>
        <div class="row">
        	<c:forEach var="row" items="${good_list}">
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

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="title-section text-center mb-5 col-12">
            <h2 class="text-uppercase">support</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 block-3">
            <div class="nonloop-block-3 owl-carousel">
            	<c:forEach var="row" items="${support_list}">
              <div class="item">
                <div class="item-entry">
                  <a href="${path}/board/view/${row.bno}" class="product-item md-height bg-gray d-block">
                    <img src="${path}/img/${row.title_img}" alt="Image" class="img-fluid">
                  </a>
                  <h2 class="item-title"><a href="#">${row.title}</a></h2>
                  <strong class="item-price">
                  	<fmt:formatNumber value="${row.now_fund}" groupingUsed="true"/>
                  </strong>
                  <div class="star-rating">
                    <span class="icon-star2 text-warning"></span>
                    <span class="icon-star2 text-warning"></span>
                    <span class="icon-star2 text-warning"></span>
                    <span class="icon-star2 text-warning"></span>
                    <span class="icon-star2 text-warning"></span>
                  </div>
                </div>
              </div>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </div>


    <div class="site-blocks-cover inner-page py-5" data-aos="fade">
      <div class="container">
        <div class="row">
          <div class="col-md-6 ml-auto order-md-2 align-self-start">
            <div class="site-block-cover-content">
            <h2 class="sub-title">#New Summer Collection 2019</h2>
            <h1>New Shoes</h1>
            <p><a href="#" class="btn btn-black rounded-0">Shop Now</a></p>
            </div>
          </div>
          <div class="col-md-6 order-1 align-self-end">
            <img src="${path}/images/model_6.png" alt="Image" class="img-fluid">
          </div>
        </div>
      </div>
    </div>
    <%@ include file="include/frame/bottom.jsp" %>
  </div>
		<script src="${path}/include/js/jquery-ui.js"></script>
  	<script src="${path}/include/js/popper.min.js"></script>
  	<script src="${path}/include/js/bootstrap.min.js"></script>
  	<script src="${path}/include/js/owl.carousel.min.js"></script>
  	<script src="${path}/include/js/jquery.magnific-popup.min.js"></script>
  	<script src="${path}/include/js/aos.js"></script>
  	<script src="${path}/include/js/main.js"></script>
</body>
</html>
