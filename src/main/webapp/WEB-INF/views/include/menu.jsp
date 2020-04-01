<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- views/include/menu.jsp -->
<%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#search").keydown(function(key){
			if(key.keyCode == 13){
					document.search_from.submit();
				}
		});
});
</script>
<a href="${path}">IF you</a> |
<a href="${path}/board/list.do">투자</a> | 
<a href="${path}/board/address.do">리워드</a> | 
<a href="${path}/board/address.do">드랍다운</a> |
<div style="text-align:right;">
		<form name="search_form" method="get" action="${path}/board/search.do">
			<input type="search" name="keyword" autocomplete="off" placeholder="어떤 펀드상품을 찾으시나요?" value="" id="search" >
		</form>
	<c:choose>
		<c:when test="${sessionScope.userid == null }">
			<!-- 로그인하지 않은 상태 -->
			<a href="${path}/user/login.do">로그인</a>
			<a href="${path}/user/join.do">회원가입</a> |	
		</c:when>
		<c:otherwise>
			<!-- 로그인한 상태 -->
			${sessionScope.userid}님이 로그인중입니다.
			<a href="${path}/user/logout.do">로그아웃</a>
			<a href="${path}/user/mypage.do">마이페이지</a> |	
		</c:otherwise>
	</c:choose>
	<a href="${path}/board/write.do">펀딩오픈신청하기</a> 	
</div>
<hr>  