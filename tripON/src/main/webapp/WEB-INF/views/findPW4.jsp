<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findPW4.css">
</head>
<body>
<%@ include file="./template/header.jsp" %>

<div class="container">
<form action="/login">
	<div class="findPW">
		<h2>비밀번호 찾기</h2>
		<br><br>
	
		<h1 class="ht"><span class="un">${user.mem_username}</span>&nbsp;님</h1>
		<h1 class="ht">새로운 비밀번호로</h1><h1 class="ht">변경 완료되었습니다.</h1>
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
	