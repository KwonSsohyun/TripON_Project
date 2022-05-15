<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findPW.css">
</head>
<body>
<%@ include file="./template/header.jsp" %>

<div class="container">
<div class="findPW">
<h2>비밀번호 찾기</h2>
<br><br>
<h1>아이디 확인 후 <br>비밀번호를 다시 <span class="br-span"><br></span> 설정하실 수 있습니다</h1>
<br><br><br>

<form action="/findPW2" method="post" onsubmit="return checkForm();">

	<div class="subject_underline"></div>
	
	<div class="information">
	
		<div class="userid find-inner-div" style="display: flex;">
			<label for="id" class="col-3 inner-div-col">아이디</label>
			<div class="col-7 inner-div-col">						
				<input type="text" maxlength="10" class="find-inner-input" name="mem_id" id="id" placeholder="아이디를 입력해주세요.">
			</div>			
		</div> 

	</div>
	
	<div class="subject_underline2"></div>
	
	<div class="submit">
		<!-- <input type="reset" value="취소">	 -->
		<input type="button" value="취소" onClick="self.location='login';" style="background-color: #000000; margin-right: 10px;">
		<input type="submit" value="다음">
	</div>


</form>
</div>
</div>



<script>
	
	// 자바스크립트 submit 전에 유효성 체크
	function checkForm() {
		
		var id = $('#id').val();
		
		if (id == '' || id == null) {
	          alert('아이디를 입력해주세요.');
	          boo = false;
	          return false;
	    } 
		
		
	}

</script>



</body>
<%@ include file="./template/footer.jsp" %>
</html>