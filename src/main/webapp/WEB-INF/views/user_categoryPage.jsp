<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<%@ include file="./template/head.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user_categoryPage.css">
<script src="${pageContext.request.contextPath}/resources/js/user_detailsPage.js"></script>
</head>
<body>
<%@ include file="./template/header.jsp"%>
<!-- header -->

<section>
    <div class="jumbotron jumbotron-fluid" id="jumbotron">
	    <div class="container">
	        <h1 class="display-4"><i>카테고리</i></h1>
	    </div>
	</div>
    <div class="content-body">
        <div class= "container">
            <div class="content-body row justify-content-md-center">
                <c:forEach items="${categoryList}" var="category">
	                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12"><!-- .wholeCard  -->
	                    <a href="user_activityListPage?category_name=${category.category_name}" title="${category.category_name}">
		                    <div class="card item" id="card">
		                    	<img class="card-img-top" src="${pageContext.request.contextPath}/resources/imgs/${category.category_imgName}" alt="Card image cap" />
						      	<div class="card-body">
						        <p class="card-text"><strong>${category.category_name}</strong></p>
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