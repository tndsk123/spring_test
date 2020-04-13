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
function my_calc(item, item_count, item_sum, account, after){
    if(item_count.value=="")    var count = 0; 
    else                        var count = item_count.value; 

    item_sum.value = eval(item.value) * eval(count) ;
    after.value = eval(account.value) - eval(item_sum.value); 
    
} 
function okay(item, item_count, item_sum, min_fund, max_fund, account, limit, approve, progress){
	var unit=eval(min_fund.value) / eval(item.value);
	var unit2=(eval(max_fund.value) - eval(progress.value)) / eval(item.value);
	var grade=$("#grade").val();
	if(eval(item_count.value) * eval(item.value) < eval(min_fund.value)){
		alert("최소 구매 구좌는"+unit+"입니다.");
		return;
	}
	if(eval(item_count.value) * eval(item.value) > eval(limit.value)){
		alert(grade+"등급 한도는 "+limit.value+"원 미만입니다.");
		return;
	}	
	if(eval(item_count.value) * eval(item.value) > eval(account.value)){
		alert("계좌 금액이 부족합니다");
		return;
	}
	if(approve != 1){
		if(eval(item_sum.value)+eval(progress.value) > eval(max_fund.value)){
			Swal.fire({
				  icon: 'error',
				  title: '금액이 많아요',
				  text: '목표 투자액보다 금액이 많습니다.\n 최대 구매 구좌는'+unit2+'입니다.',
				})
			return;
		}
	}
}
$(function() {
	$("#btnBuy").click(function(){
		var now_fund = $("#now_fund").val();
		var account = $("#account").val();
		if(eval(now_fund) > eval(account)){
			Swal.fire("투자 금액이 계좌 금액보다 많습니다.");
			return;	
		}
		document.form1.action="${path}/board/buy_success/${list.bno}";
		document.form1.submit();
	});
});
</script>
</head>
<body>
<div class="site-wrap">
  <%@ include file="../include/frame/top.jsp" %> 
  <div class="bg-light py-3">
      <div class="container">
        <div class="row">
         	<div class="col-md-12 mb-0"><a href="${path}/">Home</a> <span class="mx-2 mb-0">/</span> <a href="${path}/board/list.do">투자</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">투자하기</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-12">
            <div class="border p-4 rounded" role="alert">
            	회원님의 등급은 <font style="color: red">${grade.name}</font> 이며
 							<font style="color: blue">${grade.grade_limit}원</font> 까지 투자 가능하십니다.
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 mb-5 mb-md-0">
           <form name="form1" method="post" action="">
            <h2 class="h3 mb-3 text-black">구매정보</h2>
            <div class="p-3 p-lg-5 border">
              <div class="form-group">
                <label for="title" class="text-black">프로젝트명</label>
                <input class="form-control" name="title" id="title" value="${list.title}" type="text" readonly>
              </div>
              <div class="form-group">
                <label for="company_name" class="text-black">기업명</label>
                <input type="text" class="form-control" id="company_name" name="company_name" value="${list.company_name}" readonly>
              </div>

              <div class="form-group row">
                <div class="col-md-12">
                  <label for="unit" class="text-black">주당가격<span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="unit" name="unit" value="${list.unit}">
                </div>
              </div>

              <div class="form-group row">
                <div class="col-md-12">
                  <label for="count" class="text-black">구매할 주수<span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="count" name="count" placeholder="구매할 주수 입력"
                  onkeyup="my_calc(this.form.unit, this.form.count, this.form.now_fund,this.form.account,this.form.after_buy)"
									onchange="okay(this.form.unit, this.form.count, this.form.now_fund, 
									this.form.min_fund, this.form.max_fund, this.form.account, this.form.grade_limit,
									this.form.limit, this.form.progress)">
									<input type="hidden" name="min_fund" id="min_fund" value="${list.min_fund}">
									<input type="hidden" name="max_fund" id="max_fund" value="${list.max_fund}">
									<input type="hidden" name="limit" id="limit" value="${list.limit}">
									<input type="hidden" name="progress" id="progress" value="${list.now_fund}">
									<input type="hidden" name="grade" id="grade" value="${user_info.grade}">
									<input type="hidden" name="grade_limit" id="grade_limit" value="${grade.grade_limit}">
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-12">
              		<label for="count" class="text-black">총 금액<span class="text-danger">*</span></label>
                	<input type="text" class="form-control" name="now_fund" id="now_fund" readonly>
                </div>
              </div>
							
							
							<div class="form-group row">
                <div class="col-md-12">
              		<label for="account" class="text-black">계좌잔액<span class="text-danger">*</span></label>
                	<input type="text" class="form-control" name="account" id="account" value="${user_info.account}" readonly>
                </div>
              </div>
              
              <div class="form-group row">
                <div class="col-md-12">
              		<label for="count" class="text-black">구매후 잔액<span class="text-danger">*</span></label>
                	<input type="text" class="form-control" name="after_buy" id="after_buy" readonly>
                </div>
              </div>
              <div class="form-group">
                <label for="c_create_account" class="text-black" data-toggle="collapse" href="#create_an_account" role="button" aria-expanded="false" aria-controls="create_an_account"><input type="checkbox" value="1" id="c_create_account">개인정보 이용 동의</label>
                <div class="collapse" id="create_an_account">
                  <div class="py-2">
                    <p class="mb-3">프로젝트 투자 시 회사 및 증권거래소의 개인정보가 이용될 수 있습니다.</p>
                  </div>
                </div>
              </div>
             </form>
            </div>
          </div>
          <div class="col-md-6">
            <div class="row mb-5">
              <div class="col-md-12">
                <h2 class="h3 mb-3 text-black">쿠폰 등록</h2>
                <div class="p-3 p-lg-5 border">
                  
                  <label for="c_code" class="text-black mb-3">Enter your coupon code if you have one</label>
                  <div class="input-group w-75">
                    <input type="text" class="form-control" id="c_code" placeholder="Coupon Code" aria-label="Coupon Code" aria-describedby="button-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary btn-sm px-4" type="button" id="button-addon2">Apply</button>
                    </div>
                  </div>

                </div>
              </div>
            </div>
            
            <div class="row mb-5">
              <div class="col-md-12">
                <h2 class="h3 mb-3 text-black">주문확인</h2>
                <div class="p-3 p-lg-5 border">
                  <table class="table site-block-order-table mb-5">
                    <thead>
                      <th>Product</th>
                      <th>Total</th>
                    </thead>
                    <tbody>
                      <tr>
                        <td>Top Up T-Shirt <strong class="mx-2">x</strong> 1</td>
                        <td>$250.00</td>
                      </tr>
                      <tr>
                        <td>Polo Shirt <strong class="mx-2">x</strong>   1</td>
                        <td>$100.00</td>
                      </tr>
                      <tr>
                        <td class="text-black font-weight-bold"><strong>Cart Subtotal</strong></td>
                        <td class="text-black">$350.00</td>
                      </tr>
                      <tr>
                        <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
                        <td class="text-black font-weight-bold"><strong>$350.00</strong></td>
                      </tr>
                    </tbody>
                  </table>

                  <div class="border p-3 mb-3">
                    <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsebank" role="button" aria-expanded="false" aria-controls="collapsebank">Direct Bank Transfer</a></h3>

                    <div class="collapse" id="collapsebank">
                      <div class="py-2">
                        <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
                      </div>
                    </div>
                  </div>

                  <div class="border p-3 mb-3">
                    <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsecheque" role="button" aria-expanded="false" aria-controls="collapsecheque">Cheque Payment</a></h3>

                    <div class="collapse" id="collapsecheque">
                      <div class="py-2">
                        <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
                      </div>
                    </div>
                  </div>

                  <div class="border p-3 mb-5">
                    <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsepaypal" role="button" aria-expanded="false" aria-controls="collapsepaypal">Paypal</a></h3>

                    <div class="collapse" id="collapsepaypal">
                      <div class="py-2">
                        <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
                      </div>
                    </div>
                  </div>

                  <div class="form-group">
                    <button class="btn btn-primary btn-lg btn-block" id="btnBuy">Order</button>
                  </div>

                </div>
              </div>
            </div>

          </div>
        </div>
        <!-- </form> -->
      </div>
    </div>
<%-- <form name="form1" method="post" action="">
<table border="1">
	<tr>
		<td>타이틀</td>
		<td>${list.title}</td>
		<td><input name="title" value="${list.title}" type="hidden"></td>
	</tr>
	<tr>
		<td>회사명</td>
		<td>${list.company_name}</td>
		<td><input name="company_name" value="${list.company_name}" type="hidden"></td>
	</tr>
	<tr>
		<td>한 주당 가격</td>
		<td>${list.unit}</td>
		<td><input type="text" name="unit" type="hidden" value="${list.unit}"></td>
	</tr>
	<tr>
		<td>구매할 주수</td>
		<td><input type="text" name="count" 
		onkeyup="my_calc(this.form.unit, this.form.count, this.form.now_fund)"
		onchange="okay(this.form.unit, this.form.count, this.form.now_fund, 
		this.form.min_fund, this.form.max_fund, this.form.account, this.form.grade_limit)" value="5" min="5"></td>
		<td><input type="hidden" name="min_fund" id="min_fund" value="${list.min_fund}"></td>
	</tr>
	<tr>
		<td>총 금액</td>
		<td><input type="text" name="now_fund" id="now_fund" value="0" readonly></td>
		<td><input type="hidden" name="max_fund" id="max_fund" value="${list.max_fund}"></td>
	</tr>
	<tr>
		<td>현재 보유액</td>
		<td><input type="number" name="account" id="account" value="${user_info.account}"></td>
		<td><input type="hidden" name="grade" value="${user_info.grade}"></td>
	</tr>
	<tr align="center">
		<td colspan="2">
			<input type="button" value="투자" id="btnBuy">
			<input type="button" value="취소" id="btnCansel">
		</td>
	</tr>
</table>
<span>회원님의 등급은 <font style="color: red">${grade.name}</font> 이며
 <font style="color: blue">${grade.grade_limit}원</font> 까지 투자 가능하십니다.</span>
 <input type="hidden" name="grade_limit" id="grade_limit" value="${grade.grade_limit}">
 <input type="hidden" name="grade" id="grade" value="${grade.name}">
</form> --%>
<%@ include file="../include/frame/bottom.jsp" %>  
</div>
</body>
</html>