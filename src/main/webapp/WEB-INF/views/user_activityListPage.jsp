<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user_categoryPage.css">
<script src="${pageContext.request.contextPath}/resources/js/user_detailsPage.js"></script>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 3자리 콤마 찍기  -->

</head>
<body>
<%@ include file="./template/header.jsp" %>
<!-- header -->

<section>
    <div class="jumbotron jumbotron-fluid" id="jumbotron">
	    <div class="container">
	        <h1 class="display-4">${category.category_name}</h1>
	    </div>
	</div>
    <div class="content-body">
        <div class= "container">
            <div class="content-body row justify-content-md-center">
                <c:forEach items="${activityList}" var="activity">
	                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
	                    <a href="getUser_detailsPage?act_num=${activity.act_num}">
	                    	<div class="card item" id="card">
	                    		  <img alt="Card image cap" class="card-img-top img-fluid" src="${pageContext.request.contextPath}/resources/imgs/${activity.act_thumbImgName}" />
							      <div class="card-block">
								      <p class="card-text"><strong>${activity.act_mainTitle}</strong><br>
			                          <span class="subtitle">(${activity.act_subTitle})</span><br>
			                          <strong class="delPrice">&#8361;&nbsp;<del><fmt:formatNumber value="${activity.act_optPrice1*2}" pattern="#,###"/> </del></strong><br>
			                           &#8361;&nbsp;<fmt:formatNumber value="${activity.act_optPrice1}" pattern="#,###"/>부터
								  </div>
						    </div>
	                    </a>
	                 </div>
                </c:forEach>             
            </div>      <!-- content-body row -->
        </div>      <!-- container -->
	</div>      <!-- content-body -->
</section>


<%@ include file="./template/footer.jsp" %>
</body>
</html>