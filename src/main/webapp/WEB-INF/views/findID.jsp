<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findID.css">
</head>
<body>
<%@ include file="./template/header.jsp" %>


<div class="container">
<div class="findID">
<h2>아이디 찾기</h2>
<br><br>
<h1>등록된 회원정보로 <br>아이디를 찾으실 수 <span class="br-span"><br></span> 있습니다.</h1>
<br><br>
	<form action="/findID2" method="post" onsubmit="return checkForm();">
	
		<div class="subject_underline"></div>
	
		<div class="accordion ac1 find-inner-div">
			<input type="checkbox" name="radio" id="ra1">
			휴대폰 번호로 찾기
		</div>
	
		<div class="information">
		
			<div class="name sm-display-block-div" style="display: flex;">
			<label for="name1" class="col-3 inner-div-col">이름</label>
			<div class="col-12 col-sm-9 inner-div-col">
				<input type="text" maxlength="10" class="find-inner-input" name="mem_username" id="name1" placeholder="한글 또는 영문으로 입력해주세요.">
			</div>
			</div>
			
			<div class="phonenumber sm-display-block-div" style="display:flex">
				<label for="phone" class="col-sm-3 inner-div-col">휴대폰 번호</label>
				<div class="col-12 col-sm-9 inner-div-col">
					<div class="row phone-group">
						<div class="col-4 inner-div-col">
							<select name="mem_phone_01" id="phone">
				                <option value="010" selected="selected">010</option>
				                <option value="011">011</option>
				                <option value="016">016</option>
				                <option value="017">017</option>
				                <option value="018">018</option>
				                <option value="019">019</option>
	              			</select>
	              		</div>
	              		<div class="col-4 inner-div-col phone-group-input">
							<div>&nbsp;-&nbsp;</div>
							<input type="tel" name="mem_phone_02" class="valid-check" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
						</div>
						<div class="col-4 inner-div-col phone-group-input">
							<div>&nbsp;-&nbsp;</div>
							<input type="tel" name="mem_phone_03" class="valid-check" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
						</div>	              
					</div>
		         </div>
	         </div>     
		</div>
		
		<div class="accordion ac2 find-inner-div">
			<input type="checkbox" name="radio" id="ra2">
			이메일 주소로 찾기
		</div>
	
		<div class="information">
		
			<div class="name sm-display-block-div" style="display: flex;">
			<label for="name2" class="col-3 inner-div-col">이름</label>
			<div class="col-12 col-sm-9 inner-div-col">
				<input type="text" maxlength="10" class="find-inner-input" name="mem_username" id="name2" placeholder="한글 또는 영문으로 입력해주세요." >
			</div>
			</div>
			<div class="email sm-display-block-div" style="display: flex;">
			<label for="email" class="col-3 inner-div-col">이메일주소</label>
			<div class="col-12 col-sm-9 inner-div-col">
				<input type="text" maxlength="50" class="find-inner-input" name="mem_email" id="email" placeholder="이메일 주소를 입력해주세요.">
			</div>
			</div>
		</div>
	      
		<div class="submit">
			<!-- <input type="reset" value="취소" style="background-color: #000000;"> -->
			<input type="button" value="취소" onClick="self.location='login';" style="background-color: #000000; margin-right: 10px;">
			<input type="submit" value="다음">
		</div>
	</form>
	</div>
	</div>
<script>

	// 자바스크립트 submit 전에 유효성체크
	function checkForm() {
		

		var boo = true;
		
		// 제이쿼리 체크한 radio의 인덱스 번호 찾기
		var radioIdx = $('input[name="radio"]:checked').index('input[name="radio"]');

		// 휴대번호 정규표현식
	    var m1 = document.getElementsByName('mem_phone_01')[0].value;
	    var m2 = document.getElementsByName('mem_phone_02')[0].value;
	    var m3 = document.getElementsByName('mem_phone_03')[0].value;

	    var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	    
	    
	 	// 이메일 정규표현식
	    var text = document.getElementsByName('mem_email')[0].value;
	    var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	    
	    
	    if(radioIdx == 0){ // 휴대폰 번호로 찾기
	    	var name1 = $('#name1').val();
	    	$('#name2').val('');
	    	document.getElementsByName('mem_email')[0].value = '';
	    	
	    	if (name1 == '' || name1 == null) {
		          alert('이름을 입력해주세요.');
		          boo = false;
		          return false;
		    } 
	    	
	    	if (regPhone.test(m1+"-"+m2+"-"+m3) === false) {
		          alert('휴대전화 형식에 맞게 입력해주세요.');
		          boo = false;
		          return false;
		    } 




	    } else if(radioIdx == 1){ // 이메일 주소로 찾기
	    	var name2 = $('#name2').val();
	    	$('#name1').val('');
	    	document.getElementsByName('mem_phone_01')[0].value = '';
	    	document.getElementsByName('mem_phone_02')[0].value = '';
	    	document.getElementsByName('mem_phone_03')[0].value = '';
	    	
	    	if (name2 == '' || name2 == null) {
		          alert('이름을 입력해주세요.');
		          boo = false;
		          return false;
		    } 
	    	
	    	if (regEmail.test(text) === false) {
				  alert('이메일 형식에 맞게 입력해주세요.');
				  boo = false;
				  return false;
	    	}

	    	
	    	
	    } else {

			boo = true;
		}
	    return boo;
	}



	
	var checkbox1 = document.getElementById('ra1');
	$(checkbox1).click(function() {
		if($(this).is(':checked') == true) {
			$(this).prop('checked', false);
			$(this).blur();
		} else {
			$(this).prop('checked', true);
		 	$(this).focus();
		}
		if($(checkbox2).is(':checked') == true) {
			$(checkbox2).prop('checked', false);
			$(checkbox2).blur();
		}
	})
	var checkbox2 = document.getElementById('ra2');
	$(checkbox2).click(function() {
		if($(this).is(':checked') == true) {
			$(this).prop('checked', false);
			$(this).blur();
		} else {
			$(this).prop('checked', true);
		 	$(this).focus();
		}
		if($(checkbox1).is(':checked') == true) {
			$(checkbox1).prop('checked', false);
			$(checkbox1).blur();
		}
	})

	// 아코디언 선택
	var acc = document.getElementsByClassName("accordion");
	
	for (var i = 0; i < acc.length; i++) {

		  acc[i].onclick = function() {
			  
			  if($(this).hasClass('ac1')) {
				  var cb2 = $('.ac2').children().first();
				  if($(cb2).is(':checked') == true) {
					  $(cb2).prop('checked', false);
					  $(cb2).blur();
				  }
			  } else if($(this).hasClass('ac2')) {
				  var cb1 = $('.ac1').children().first();
				  if($(cb1).is(':checked') == true) {
					  $(cb1).prop('checked', false);
					  $(cb1).blur();
				  }
			  }
			  var checkbox = $(this).children().first();
			  if($(checkbox).is(':checked') == true) {
				  $(checkbox).prop('checked', false);
				  $(checkbox).blur();
			  } else {
				  $(checkbox).prop('checked', true);
				  $(checkbox).focus();
			  }
			  
             // 클릭이 일어났을 때 기존에 열려 있던 아코디언을 접는다. (1개의 아코디언만 열리게)
			 for (var j = 0; j<acc.length; j++){
                // 버튼 상태에 입혀진 active 라는 클래스를 지운다.
				 acc[j].classList.remove("active");
				 $(acc[j]).removeAttr("checked");
                // 버튼 다음에 있는 div 콘텐츠 높이를 0으로 만든다. == 아코디언을 접는다.
				 if (this!==acc[j]) {
					 acc[j].nextElementSibling.style.maxHeight = null;
				 }
			 }

			this.classList.toggle("active");
			var panel = this.nextElementSibling;
			if (panel.style.maxHeight){
				this.classList.remove("active");
				panel.style.maxHeight = null;
			} else {
				panel.style.maxHeight = panel.scrollHeight + "px";
			}
		  }
	}

	</script>
</body>
<%@ include file="./template/footer.jsp" %>
</html>