<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign3.css">
</head>
<body>
<%@ include file="./template/header.jsp" %>

<div class="container">
<form action="/login">
	<div class="sign">
		<h2>회원가입</h2>
		<br><br>
	
		<h1 class="ht"><span class="un">${user.mem_username}</span>&nbsp;님 환영합니다.</h1>
		<h1 class="ht">서비스 이용을 위해</h1><h1 class="ht">다시 로그인을 해주세요.</h1>

		<br><br>
		
		<div class="submit">
			<input type="submit" value="로그인 하기">
		</div>
		
		
	</div>
</form>
</div>
</body>
<%@ include file="./template/login_footer.jsp" %>
</html>
	