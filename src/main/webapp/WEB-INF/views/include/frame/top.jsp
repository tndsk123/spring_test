<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="site-navbar bg-white py-2">

      <div class="search-wrap">
        <div class="container">
          <a href="#" class="search-close js-search-close"><span class="icon-close2"></span></a>
          <form name="search_form" method="get" action="${path}/board/search.do">
            <input type="text" class="form-control" id="search" name="keyword" placeholder="Search keyword and hit enter...">
          </form>  
        </div>
      </div>

      <div class="container">
        <div class="d-flex align-items-center justify-content-between">
          <div class="logo">
            <div class="site-logo">
              <a href="${path}/" class="js-logo-clone">IF YOU</a>
            </div>
          </div>
          <div class="main-nav d-none d-lg-block">
            <nav class="site-navigation text-right text-md-center" role="navigation">
              <ul class="site-menu js-clone-nav d-none d-lg-block">
                <li class="has-children active">
                  <a href="${path}/">Home</a>
                  <ul class="dropdown">
                    <li><a href="#">Menu One</a></li>
                    <li><a href="#">Menu Two</a></li>
                    <li><a href="#">Menu Three</a></li>
                    <li class="has-children">
                      <a href="#">Sub Menu</a>
                      <ul class="dropdown">
                        <li><a href="#">Menu One</a></li>
                        <li><a href="#">Menu Two</a></li>
                        <li><a href="#">Menu Three</a></li>
                      </ul>
                    </li>
                  </ul>
                </li>
                
                <li><a href="${path}/board/list.do">투자</a></li>
                <li><a href="#">리워드</a></li>
                <li><a href="#">게시판</a></li>
                <li><a href="contact.html">문의하기</a></li>
              </ul>
            </nav>
          </div>
          <div class="icons">
            <a href="#" class="icons-btn d-inline-block js-search-open"><span class="icon-search"></span></a>
            	<c:choose>
								<c:when test="${sessionScope.userid == null }">
									 <a href="${path}/user/login.do" class="icons-btn d-inline-block"><span class="icon-heart-o"></span></a>
            			 <a href="${path}/user/join.do" class="icons-btn d-inline-block bag">
            			 	  <span class="icon-shopping-bag"></span>
              				<span class="number">2</span>
            			 </a>
								</c:when>
								<c:otherwise>
										<a href="${path}/user/logout.do" class="icons-btn d-inline-block"><span class="icon-heart-o"></span></a>
           					<a href="${path}/user/mypage.do" class="icons-btn d-inline-block bag">
           						 <span class="icon-shopping-bag"></span>
              				 <span class="number">2</span>
           					</a>
								</c:otherwise>
							</c:choose>
            <a href="#" class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none"><span class="icon-menu"></span></a>
          </div>
        </div>
      </div>
    </div>
</body>
</html>