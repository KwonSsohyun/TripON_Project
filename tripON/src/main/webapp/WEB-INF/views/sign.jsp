<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">
<style>
	.check-label {
		display: inline-flex;
		align-items: center;
		justify-content: left;
	}
</style>
<script>
	// 전역변수 - code2
    var code2 = "";

	function selectAll(selectAll)  {
		  const checkboxes = document.getElementsByName('agree');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  });
	}
	
	function checkAll(){
	 
		// 휴대번호 정규표현식
	    var m1 = document.getElementsByName('mem_phone_01')[0].value;
	    var m2 = document.getElementsByName('mem_phone_02')[0].value;
	    var m3 = document.getElementsByName('mem_phone_03')[0].value;
	    var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	    
		
		var inputArray = $('.valid-check');
		let flag = false;
		var boo = true;
		for(var i = 0; i < inputArray.length; i++) {
			if(inputArray[i].value == '') {
				if($(inputArray[i]).attr('name') == 'mem_phone_02' || $(inputArray[i]).attr('name') == 'mem_phone_03') {
					var text = $(inputArray[i]).parent().parent().parent().parent().children('label').text();
					alert(text.substring(0) + '를 입력해주세요.');
					boo = false;
					return false;
				} else {
					var text = $(inputArray[i]).parent().parent().children('label').text();
					alert(text.substring(0) + '를 입력해주세요.');
					boo = false;
					return false;
				}
			}
		}
		
	   if (boo && regPhone.test(m1+"-"+m2+"-"+m3) === false) {
			alert('휴대전화 형식에 맞게 입력해주세요.');
			boo = false;
			return false;
	    }
		
		
		var select = $('.select-valid-check');
		if(boo && $(select).val() == 'select'){
			alert('번호를 입력해주세요.');
			boo = false;
			return false;
		}	
		
		
		
		// 휴대폰 번호 인증 ********************************************	  
   	    var num = $('#num').val();
   	  
   		if(num != '' && num != null && num == code2){
   			// alert(code2);
   			$(".point").text("* 인증번호가 일치합니다.");
   			$(".point").css("color", "green");
   			
   		} else{
   			$(".point").text("* 인증번호가 일치하지 않습니다.");
   			$(".point").css("color", "#FF6500");
   			return false;
   		}
   	  
		
		
		
		
		if($("#agree_all").is(":checked") == false){
				alert("모두 동의해주세요.");
				return false;
				
		} else{ // 회원가입 2단계 페이지 이동
				document.frm.action = "/sign2";  //  ./sign2.jsp
				document.frm.method = "post";
				document.frm.submit(); 

		}
		
		
		
		
		
	}
	
	
	$(document).ready(function(){
		$(".agree").on("click",function(){
			const checkboxes = document.getElementsByName('agree');
			var i = 0;
			checkboxes.forEach((checkbox) => {
			    if(checkbox.checked == true) i++;
			});
			if(i>=4) $("#agree_all").prop("checked", true);
			else  $("#agree_all").prop("checked", false);
		});
		
		
		
		
		// ********************* coolsms 문자 인증 *********************
	      
		$("#smsBtn").click(function(){
			// alert("인증요청 버튼 클릭!");
			alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
	         
			var ph01 = $("select[name=mem_phone_01]").val();
			var ph02 = $("input[name=mem_phone_02]").val();
			var ph03 = $("input[name=mem_phone_03]").val();
	         
			// 전체 휴대번호
			var phone = ph01 + ph02 + ph03;
	         
			$.ajax({
	            type:"GET",
	            url : "/phoneCheck?phone=" + phone,
	           	cache : false,
	           	success : function(data){
	           		
	           		if(data == "error"){
	           			alert("휴대폰 번호가 올바르지 않습니다.");
	           		
	           		} else {
	           			code2 = data;
	           			alert(code2);
	           		}
	           	}
			});
		});
	      
	});
</script>
</head>
<body>
<%@ include file="./template/header.jsp" %>


<div class="container">
<div class="sign">
	<h2>회원가입</h2>
	<br><br>
	<h1>회원가입을 위해</h1><h1>휴대폰 본인 인증해주세요.</h1>
	<br><br>
	
	<form name="frm" novalidate>
		<div class="subject_underline"></div>
		
		<div class="row">
			<label class="check-label col-12" for="agree_all">
				<input type="checkbox" class="valid-check" id="agree_all" onclick='selectAll(this)'>
				<span class="bol">&nbsp;&nbsp;&nbsp;휴대폰 본인확인 전체동의</span>
			</label>
		</div>
		
		<div class="subject_underline2"></div>
		
		<div class="row check-row">
			<label class="cd check-label valid-check col-sm-6" for="agree1">
				<input type="checkbox" class="agree" name="agree" id="agree1">
				<span class="ct">&nbsp;&nbsp;&nbsp;개인정보 이용 동의 (필수)</span>
			</label>
			<div class="subject_underline5"></div>
			<label class="check-label col-sm-6" for="agree2">
				<input type="checkbox" class="agree" name="agree" id="agree2">
				<span class="ct">&nbsp;&nbsp;&nbsp;고유식별 정보 처리 동의 (필수)</span>
			</label>
		</div>
		
		<div class="subject_underline2"></div>
		
		<div class="row check-row">
			<label class="cd check-label col-sm-6" for="agree3">
				<input type="checkbox" class="agree" name="agree" id="agree3">
				<span class="ct">&nbsp;&nbsp;&nbsp;서비스 이용약관 동의 (필수)</span>
			</label>
			<div class="subject_underline5"></div>
			<label class="check-label col-sm-6" for="agree4">
				<input type="checkbox" class="agree" name="agree" id="agree4">
				<span class="ct">&nbsp;&nbsp;&nbsp;통신사 이용약관 동의 (필수)</span>
			</label>
		</div>
		
		<div class="subject_underline2"></div>
	
		<h3>인증정보 입력</h3>
		<div class="subject_underline3"></div>
		<div class="phonenumber sign-inner-div sm-display-block-div" style="display: flex;">
			<label class="la col-sm-3" for="phone">휴대폰 번호</label>
			<div class="col-9 inner-div-col">
				<div class="row phone-group">
					<div class="col-3 inner-div-col">
						<select name="mem_phone_01" id="phone" class="select-valid-check">
							<option value="010" selected="selected">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
					</div>
					<div class="col-3 inner-div-col phone-group-input">
						<div>&nbsp;-&nbsp;</div>
						<input type="tel" name="mem_phone_02" class="valid-check" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
					</div>
					<div class="col-3 inner-div-col phone-group-input">
						<div>&nbsp;-&nbsp;</div>
						<input type="tel" name="mem_phone_03" class="valid-check" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
					</div>
					<div class="col-3 inner-div-col phone-group-input">
						<div>&nbsp;&nbsp;&nbsp;</div>
						<button type="button" id="smsBtn">인증 요청</button>
					</div>
				</div>	
			</div>
		</div>  
		
		
		<div class="subject_underline4"></div>
	
		<div class="number sign-inner-div sm-display-block-div" style="display: flex;">
			<label class="la col-3" for="num">인증번호</label>
			<div class="col-12 col-sm-9 inner-div-col row">
				<input type="text" maxlength="4" class="valid-check" id="num" >	
				<span class="point successPhoneChk">* 인증번호를 입력해주세요.</span>
			</div>	
	
		</div>
	
		<div class="subject_underline4"></div>
		
		<div class="submit">
			<!-- <input type="reset" value="취소" style="background-color: #000000;"> -->
			<input type="button" value="취소" onclick="history.go(-1);" style="background-color: #000000; margin-right: 10px;">
			<input type="button" value="다음" onclick="checkAll()">
		</div>
	</form>
</div>
</div>


</body>
<%@ include file="./template/login_footer.jsp" %>
</html>