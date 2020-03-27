<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
// 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=addr1]").val(data.zonecode);
           $("[name=addr2]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
$(function(){
	$("#userid").blur(function(){
		var userid=$("#userid").val();
		$.ajax({
			url : "${path}/user/id_chk?userid="+userid,
			type : "get",
			success : function(data){
					if(data == 1){
						$("#id_check").text("사용중인 아이디입니다.");
						$("#id_check").css("color", "red");
					}else if(data == 0 && userid != "") {					
						$('#id_check').text("사용 가능한 아이디 입니다");
						$('#id_check').css('color', 'blue');
					}else if(userid == ""){			
						$('#id_check').text('아이디를 입력해주세요 :)');
						$('#id_check').css('color', 'red');				
					} 
				}
		});
	});

	 $('#view').on('click',function(){
	        $('#passwd').toggleClass('active');
	        if($('#passwd').hasClass('active')){
	            $(this).attr('class',"fa fa-eye-slash fa-lg")
	            .prev('#passwd').attr('type',"text");
	        }else{
	            $(this).attr('class',"fa fa-eye fa-lg")
	            .prev('#passwd').attr('type','password');
	        }
	    });
});
function password_checking() {
	var passwd=$("#passwd").val();
	var passwd_chk=$("#passwd_chk").val();
	if(passwd != passwd_chk){
		$("#passwd_check").text("비밀번호가 틀립니다.");
		$("#passwd_check").css("color", "red");		
	}else{
		$("#passwd_check").text("비밀번호가 같습니다.");
		$("#passwd_check").css("color", "blue");
	}
}

function check() {
	//아이디 체크
	var userid = document.getElementById("userid");
	if (userid.value == "") {
		alert("아이디는 필수 입력입니다.");
		userid.focus();
		return;
	}
	//비밀번호 체크
	var passwd = document.getElementById("passwd");
	if (passwd.value == "") {
		alert("비밀번호는 필수 입력입니다.");
		passwd.focus();
		return;
	}
	document.form1.submit();
}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>회원등록</h2>
<form name="form1" method="post"
	action="${path}/user/insert.do">
<div class="form-group">
아이디
    <input class="form-control" placeholder="아이디" 
    name="userid" id="userid" type="text" required="required"/>
</div>
<div class="form-group">
	<div class="check_font" id="id_check"></div>
</div>

<div class="form-group">
비밀번호
    <input class="form-control" placeholder="비밀번호" 
    name="passwd" id="passwd" type="password"/>
    <i class="fa fa-eye fa-lg" id="view"></i>
</div>
<div class="form-group">
비밀번호 재확인
    <input class="form-control" placeholder="비밀번호 재입력"  onkeyup="password_checking()"
    name="passwd_chk" id="passwd_chk" type="password" />
</div>
<div class="form-group">
<div class="check_font" id="passwd_check"></div>
</div>
<div class="form-group">
이름
    <input class="form-control" placeholder="이름" 
    name="name" id="name" type="text" />
</div>

<div class="form-group">
이메일
    <input class="form-control" placeholder="이메일" 
    name="email" id="email" type="text"/> @ 
    <select name="selectEmail" id="selectEmail"> <option value="1">직접입력</option> <option value="naver.com" selected>naver.com</option> <option value="hanmail.net">hanmail.net</option> <option value="hotmail.com">hotmail.com</option> <option value="nate.com">nate.com</option> <option value="yahoo.co.kr">yahoo.co.kr</option> <option value="empas.com">empas.com</option> <option value="dreamwiz.com">dreamwiz.com</option> <option value="freechal.com">freechal.com</option> <option value="lycos.co.kr">lycos.co.kr</option> <option value="korea.com">korea.com</option> <option value="gmail.com">gmail.com</option> <option value="hanmir.com">hanmir.com</option> <option value="paran.com">paran.com</option> </select>
</div>
<div class="form-group">
성별
    <input class="form-control"  
    name="gender" id="male" type="radio"  value="남성"/>
    <input class="form-control"  
    name="gender" id="female" type="radio"  value="여성"/>
</div>
<div class="form-group">
생년월일
    <input class="form-control"  
    name="gender" id="male" type="radio"  value="남성"/>
    <input class="form-control"  
    name="gender" id="female" type="radio"  value="여성"/>
</div>
<div class="form-group">
주소<br>
    <input class="form-control" style="width: 40%; display: inline;" 
    placeholder="우편번호" name="addr1" id="addr1" type="text" 
    readonly="readonly" >
    <button type="button" class="btn btn-default" 
    onclick="execPostCode();">
    <i class="fa fa-search"></i> 우편번호 찾기</button>                               
</div>
<div class="form-group">
    <input class="form-control" style="top: 5px;" 
    placeholder="도로명 주소" name="addr2" id="addr2" type="text" 
    readonly="readonly"/>
</div>
<div class="form-group">
    <input class="form-control" placeholder="상세주소" 
    name="addr3" id="addr3" type="text"  />
</div>

<div>	
<input type="button" class="btn btn-lg btn-success btn-block" onclick="check()" value="확인">
</div>
</form>
</body>
</html>