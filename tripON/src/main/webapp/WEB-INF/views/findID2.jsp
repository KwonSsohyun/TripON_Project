<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="./template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findID2.css">
</head>
<body>
<%@ include file="./template/header.jsp" %>

<div class="container">
<div class="findID">
<h2>아이디 찾기</h2>
<br><br>
<h1>입력하신 정보와<br>일치하는 아이디 입니다.</h1>
<br><br>

<form action="/login">
	
	<h3>아이디 찾기 결과</h3>
	<div class="subject_underline"></div>
	<br>
	<h4 class="hc">tripON ID</h4>

	<h5><c:if test="${user.mem_id ne null && user.mem_id!=''}">${fn:substring(user.mem_id,0,fn:length(user.mem_id)-2)}**</c:if></h5>
	<div class="subject_underline2"></div>
		
	<div class="submit">
		<input type="submit" value="확인">
   	</div>

</form>
</div>
</div>
</body>
<%@ include file="./template/footer.jsp" %>
</html>