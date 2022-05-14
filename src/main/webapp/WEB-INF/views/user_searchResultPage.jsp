<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		    <c:if test="${categoryList ne null}">
		        <h1 class="display-4"><i>검색 결과</i></h1>
		    </c:if>
		    <c:if test="${categoryList eq null}">
		        <h1 class="display-4"><i>상품 더 보기</i></h1>
		    </c:if>
	    </div>
	</div>
    <div class="content-body">
        <div class= "container">
        	<c:if test="${categoryList ne null}">
	        	<div class="searchResult-title">카테고리 검색 결과</div>
	        	<c:if test="${categoryList.size() > 0}">
		            <div class="content-body row justify-content-md-center">
		                <c:forEach items="${categoryList}" var="category">
			                <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12"><!-- .wholeCard  -->
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
	            </c:if>
	            <c:if test="${categoryList.size() < 1}">
	            	<div class="searchResult-message">검색 결과가 없습니다.</div>
	            </c:if>
            </c:if>
        </div>      <!-- container -->
	</div>      <!-- content-body -->
	<div class="content-body">
        <div class= "container">
        	<c:if test="${categoryList ne null}">
        		<div class="searchResult-title">상품 검색 결과</div>
        	</c:if>
        	<c:if test="${activityList.size() > 0}">
	            <div class="content-body row justify-content-md-center">
	                <c:forEach items="${activityList}" var="activity">
		                <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12">
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
            </c:if>
            <c:if test="${activityList.size() < 1}">
            	<div class="searchResult-message">검색 결과가 없습니다.</div>
            </c:if>
        </div>      <!-- container -->
	</div>      <!-- content-body -->
</section>


<%@ include file="./template/footer.jsp" %>
</body>
</html>