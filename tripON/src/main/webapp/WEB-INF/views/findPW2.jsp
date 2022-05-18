<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findPW2.css">

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
	var boo = false;
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
	
   if (!boo && regPhone.test(m1+"-"+m2+"-"+m3) === false) {
		alert('휴대전화 형식에 맞게 입력해주세요.');
		boo = false;
		return false;
    }
	
	
	var select = $('.select-valid-check');
	if(!boo && $(select).val() == 'select'){
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
			boo = true;
		} else{
			$(".point").text("* 인증번호가 일치하지 않습니다.");
			$(".point").css("color", "#FF6500");
			boo = false;
			return false;
		}
	  
	if(boo) { // 회원가입 3단계 페이지 이동
			document.frm.action = "/findPW3";  //  ./findPW3.jsp
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
//            			alert(code2);
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
<div class="findPW">
<h2>비밀번호 찾기</h2>
<br><br>
<h1>등록하신 회원정보로 <span class="br-span"><br></span> 인증번호가 발송됩니다.<br>본인인증 후 비밀번호를 <span class="br-span"><br></span> 변경하세요.</h1>
<br><br><br>

<form name="frm" novalidate>

	<h3>인증정보 입력</h3>
	<div class="subject_underline"></div>

		<div class="phonenumber sign-inner-div sm-display-block-div" style="display: flex;">
			<label class="la col-sm-3" for="phone">휴대폰 번호</label>
			<div class="col-9 inner-div-col">
				<div class="row phone-group">
					<div class="col-3 inner-div-col">
						<select name="mem_phone_01" id="phone" class="select-valid-check">
							<option value="010" selected="selected">010</option>
							
						</select>
					</div>
					<div class="col-3 inner-div-col phone-group-input">
						<div>&nbsp;-&nbsp;</div>
						<input type="tel" name="mem_phone_02" class="valid-check" value="${user.mem_phone_02}" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" readonly>
					</div>
					<div class="col-3 inner-div-col phone-group-input">
						<div>&nbsp;-&nbsp;</div>
						<input type="tel" name="mem_phone_03" class="valid-check" value="${user.mem_phone_03}" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" readonly>
					</div>
					<div class="col-3 inner-div-col phone-group-input">
						<div>&nbsp;&nbsp;&nbsp;</div>
						<button type="button" id="smsBtn">인증 요청</button>
					</div>
				</div>	
			</div>
		</div>  
		
		
		<div class="subject_underline2"></div>
	
		<div class="number sign-inner-div sm-display-block-div" style="display: flex;">
			<label class="la col-3" for="num">인증번호</label>
			<div class="col-12 col-sm-9 inner-div-col row">
				<input type="text" maxlength="4" class="valid-check" id="num" >	
				<span class="point successPhoneChk">* 인증번호를 입력해주세요.</span>
			</div>	
	
		</div>
	
		<div class="subject_underline2"></div>
		
		<input type="hidden" name="mem_id" value="${user.mem_id}">
	
	<div class="submit">
		<!-- <input type="reset" value="취소">	 -->
		<input type="button" value="취소" onClick="self.location='login';" style="background-color: #000000; margin-right: 10px;">
		<input type="button" value="다음" onclick="checkAll()">
	</div>

</form>
</div>
</div>
</body>
<%@ include file="./template/footer.jsp" %>
</html>