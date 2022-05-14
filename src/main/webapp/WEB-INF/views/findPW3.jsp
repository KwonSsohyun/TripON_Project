<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findPW3.css">
</head>
<body>
<%@ include file="./template/header.jsp" %>

<div class="container">
<div class="findPW">
<h2>비밀번호 변경</h2>
<br><br>
<h1>개인정보 관련 <span class="br-span"><br></span> 숫자, 연속된 숫자와 같이 <br> 쉬운 비밀번호 사용은 <span class="br-span"><br></span> 유의해주세요.</h1>
<br><br><br>

<form action="/findPW4" class="needs-validation" method="post" novalidate>

	<div class="subject_underline"></div>
	
	<div class="information">
	
		<div class="userpw find-inner-div" style="display: flex;">
			<label for="pw" class="col-sm-3 inner-div-col">새 비밀번호</label>
			<div class="col-7 inner-div-col">						
				<input type="password" maxlength="15" class="valid-check find-inner-input" name="mem_pw" id="pw" placeholder="비밀번호를 입력해주세요.">
				<h4 class="description">8~15자리의 영문/숫자/특수문자를 <span class="br-span2"><br></span> 함께 입력해주세요.</h4>
			</div>			
		</div> 
		
		<input type="hidden" name="mem_id" value="${user.mem_id}">
		
	</div>
	
	<div class="subject_underline2"></div>
	
	<div class="submit">
		<!-- <input type="reset" value="취소">	 -->
		<input type="button" value="이전" onClick="self.location='findPW2';" style="background-color: #000000; margin-right: 10px;">
		<input type="submit" value="다음">
	</div>


</form>
</div>
</div>

<script>

(function() {
	'use strict';
	window.addEventListener('load', function() {
		var forms = document.getElementsByClassName('needs-validation');
		var validation = Array.prototype.filter.call(forms, function(form) {
			form.addEventListener('submit', function(event) {
				var inputArray = $('.valid-check');
				var boo = true;
				for(var i = 0; i < inputArray.length; i++) {
					if(inputArray[i].value == '') {
						if($(inputArray[i]).attr('name') == 'mem_phone_02' || $(inputArray[i]).attr('name') == 'mem_phone_03') {
							var text = $(inputArray[i]).parent().parent().parent().parent().children('label').text();
							alert(text.substring(1) + '를 입력해주세요.');
							boo = false;
							event.preventDefault();
							break;
						} else {
							var text = $(inputArray[i]).parent().parent().children('label').text();
							alert(text.substring(1) + '를 입력해주세요.');
							boo = false;
							event.preventDefault();
							break;
						}
					}
				}
				
			// 비밀번호 정규표현식
			var pw = document.getElementsByName('mem_pw')[0].value;
			
			var regPW = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,10}$/;
			if(boo && regPW.test(pw) === false){
				alert("비밀번호 8~15자리의 영문/숫자/특수문자를 함께 입력해주세요.")
				boo = false;
				event.preventDefault();
			}
			
			}, false);
		});
	}, false);
})();


</script>

</body>
<%@ include file="./template/footer.jsp" %>
</html>