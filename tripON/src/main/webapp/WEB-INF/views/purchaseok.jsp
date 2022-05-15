<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/purchaseok.css">
</head>
<body>
<%@ include file="./template/header.jsp" %>
     <div class="container" id="body">
        <div>
            <img id="done" src="${pageContext.request.contextPath}/resources/imgs/done.svg" alt="완료">
        </div>
        <div id="thankyou">
            <p>결제가 완료되었습니다.</p>
            <p>이용해 주셔서 감사합니다.</p>
        </div><br><br>
        <div id="link">
            <a href="getReservationList">예약내역으로</a>
            <a href="index">메인페이지로</a>
        </div>
    </div>
<%@ include file="./template/footer.jsp" %>
</body>
</html>




