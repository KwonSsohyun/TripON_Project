<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 3자리 콤마 찍기  -->
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <!-- newLine기능 -->
<% pageContext.setAttribute("replaceChar","\n"); %><!-- newLine기능  -->
<%@ include file="./template/head.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user_detailsPage.css">
<script src="${pageContext.request.contextPath}/resources/js/user_detailsPage.js"></script>
<script type="text/javascript">
	let price1 = ${activity.act_optPrice1};
	let price2 = ${activity.act_optPrice2};
	let price3 = ${activity.act_optPrice3};
	let price4 = ${activity.act_optPrice4};
	
	$(function() {
		$(".price > input").on('click', function(){
            var price = $("#totalPrice").text();
            $('#priceint').val(parseInt(price.replace(',', '')));
            
            $('#productName').val($("#payMent > h2").text());
            
            $('#productDate').val($('#innerDate01').text());
            $('#productOption01').val($('#inner01').text());
            $('#optionCount01').val($('#quantity01').text());
            
            $('#productOption02').val($('#inner02').text());
            $('#optionCount02').val($('#quantity02').text());
            
            $('#productOption03').val($('#inner03').text());
            $('#optionCount03').val($('#quantity03').text());
            
            $('#productOption04').val($('#inner04').text());
            $('#optionCount04').val($('#quantity04').text());
        });
		
		$('#review_insert_btn').click(function() {
			$.ajax({
				async : true,
				type : 'POST',
				data : '${activity.act_mainTitle}',
				url : "/getPurchaseInformation", 
				dataType: 'json',
	        	contentType: 'application/json; charset=UTF-8',
				success : function(data){
					if(data.length > 0){
						var date = new Date();
						$(data).each(function(idx, val) {
							var str = val.pur_bookingdate.split(' ');
							var nowYear = date.getFullYear();
							var dataYear = str[0].substring(0, 4);
							var nowMonth = date.getMonth() + 1;
							var dataMonth = str[1].substring(0, 2);
							if(str[1].substring(0, 2) < 10) {dataMonth = str[1].substring(1, 2);}
							var nowDate = date.getDate();
							var dataDate = str[2].substring(0, 2);
							if(str[2].substring(0, 2) < 10) {dataDate = str[2].substring(1, 2);}
							console.log('str : ' + str);
							console.log('nowYear : ' + nowYear);
							console.log('dataYear : ' + dataYear);
							console.log('nowMonth : ' + nowMonth);
							console.log('dataMonth : ' + dataMonth);
							console.log('nowDate : ' + nowDate);
							console.log('dataDate : ' + dataDate);
							if((dataYear > nowYear) || (dataYear == nowYear && dataMonth > nowMonth) || (dataYear == nowYear && dataMonth == nowMonth && dataDate < nowDate)) {
								$('#reviewForm').submit();
							} else {
								alert('이용한 상품에만 리뷰를 남길 수 있습니다.');
								return false;
							}
						});
					} else {
						alert('이용한 상품에만 리뷰를 남길 수 있습니다.');
						return false;
					}
				},
				error : function(request, status){
					alert('이용한 상품에만 리뷰를 남길 수 있습니다.');
				}
			});
		});
	});
</script>
</head>
<body>

<%	String idCheck = ""; %>
<%	String loginCheck = ""; %>

<%@ include file="./template/header.jsp" %>
<!-- header -->

<section>
	<div class="container">
	    <div class="row justify-content-md-center">
	        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12">
				<div class="productImg">
					<img src="${pageContext.request.contextPath}/resources/imgs/${activity.act_mainPictureName}" class="d-block w-100" alt="${activity.act_mainPictureName}">
				</div>
	        </div>
	        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12">
	            <form action="purchase" method="post" id="payMent" name="payMent">
	                <h2>${activity.act_mainTitle}</h2>
                    <h3>${activity.act_subTitle}</h3><hr>
					<select class="custom-select" id="dateScroll" name="dateScroll" onchange="dateOnChange(this)">
						<option selected hidden>날짜 선택</option>
						<%
							int x = 86400000;
							
							for (int i = 0; i <= 6; i++) {
								Date nowTime = new Date(new Date().getTime() + i * x);
								SimpleDateFormat sf = new SimpleDateFormat("YYYY년 MM월 dd일");
						%>
						<option value="date<%= (i+1) %>"><%= sf.format(nowTime) %></option>
						<% } %>
					</select>
	                <select class="custom-select" id="optionScroll" name="optionScroll" onchange="selectOnChange(this)">
						<option value="상품선택" selected hidden>상품 선택</option>
	                    <option value="Option1" <c:if test="${activity.act_optPrice1==0}">hidden</c:if>>${activity.act_optName1}-상품가격: ₩<fmt:formatNumber value="${activity.act_optPrice1}" pattern="#,###"/> </option>
	                    <option value="Option2" <c:if test="${activity.act_optPrice2==0}">hidden</c:if>>${activity.act_optName2}-상품가격: ₩<fmt:formatNumber value="${activity.act_optPrice2}" pattern="#,###"/></option>
	                    <option value="Option3" <c:if test="${activity.act_optPrice3==0}">hidden</c:if>>${activity.act_optName3}-상품가격: ₩<fmt:formatNumber value="${activity.act_optPrice3}" pattern="#,###"/></option>
	                    <option value="Option4" <c:if test="${activity.act_optPrice4==0}">hidden</c:if>>${activity.act_optName4}-상품가격: ₩<fmt:formatNumber value="${activity.act_optPrice4}" pattern="#,###"/></option>
	                </select>
					<div id="option_box01">
							<label id="innerDate01"></label>&nbsp;&nbsp;
						<div id="optionInner">
							<label id="inner01"></label>&nbsp;
							<br>
							<input type="button" id="decrease01" onclick="count01('decrease')" value="-" disabled>
							<label id="quantity01">1</label>
							<input type="button" id="increase01" onclick="count01('increase')" value="+">
							<input type="button" id="delOption01" onclick="delOption('delOption01', 1)" value="x">
						</div><hr>
					</div>
					<div id="option_box02">
						<div id="optionInner">
							<label id="inner02"></label>&nbsp;
							<br>
							<input type="button" id="decrease02" onclick="count02('decrease')" value="-" disabled>
							<label id="quantity02">1</label>
							<input type="button" id="increase02" onclick="count02('increase')" value="+">
							<input type="button" id="delOption02" onclick="delOption('delOption02', 2)" value="x">
						</div><hr>
					</div>
					<div id="option_box03">
						<div id="optionInner">
							<label id="inner03"></label>&nbsp;
							<br>
							<input type="button" id="decrease03" onclick="count03('decrease')" value="-" disabled>
							<label id="quantity03">1</label>
							<input type="button" id="increase03" onclick="count03('increase')" value="+">
							<input type="button" id="delOption03" onclick="delOption('delOption03', 3)" value="x">
						</div><hr>
					</div>
					<div id="option_box04">
						<div id="optionInner">
							<label id="inner04"></label>&nbsp;
							<br>
							<input type="button" id="decrease04" onclick="count04('decrease')" value="-" disabled>
							<label id="quantity04">1</label>
							<input type="button" id="increase04" onclick="count04('increase')" value="+">
							<input type="button" id="delOption04" onclick="delOption('delOption04', 4)" value="x">
						</div><hr>
					</div>
	                <div class="price">
	                    <h4>총 상품 금액</h4>
	                    <h5>￦<h5 id="totalPrice">0</h5>원</h5><hr>
	                    <input type="submit" id="purchase_button" class="btn btn-primary" value="바로구매" disabled>
	                </div>
	                <input name="act_num" id="act_num" type="hidden" value="<%= request.getParameter("act_num") %>">
                    <input name="priceint" id="priceint" type="hidden" value="">
	                <input name="productName" id="productName" type="hidden" value="" >
	                <input name="productDate" id="productDate" type="hidden" value="">
	                <input name="productOption01" id="productOption01" type="hidden" value="">
	                <input name="optionCount01" id="optionCount01" type="hidden" value="">
	                <input name="productOption02" id="productOption02" type="hidden" value="">
	                <input name="optionCount02" id="optionCount02" type="hidden" value="">
	                <input name="productOption03" id="productOption03" type="hidden" value="">
	                <input name="optionCount03" id="optionCount03" type="hidden" value="">
	                <input name="productOption04" id="productOption04" type="hidden" value="">
	                <input name="optionCount04" id="optionCount04" type="hidden" value="">
	            </form>
	        </div>
	    </div>      <!-- Row -->
	</div>      <!-- Container -->
	
	<div class="container">
	    <div class="row justify-content-md-center">
	        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
	            <div id="tabMenu">
	                <ul class="tab sticky">
	                    <li class="sticky"><a href="#tab1" class="selected">상품정보</a></li>
	                    <li class="sticky"><a href="#tab2">공지사항</a></li>
	                    <li class="sticky"><a href="#tab3">FAQ</a></li>
                        <li class="sticky"><a href="#tab4">리뷰</a></li>
	                </ul>
	                <ul class="panel">
	                    <li id="tab1">
							<h5 class="section-title left-align tab-title">상품정보</h5>
								<p class="left-align">${fn:replace(activity.act_content, replaceChar, "<br/>")}</p>
							<div>
							<img src="${pageContext.request.contextPath}/resources/imgs/${activity.act_inforImgName}" class="d-block w-100" alt="${activity.act_mainPicture}">
							</div>   	
							<hr>
							
							<p class="left-align">찾아가는 길 : ${fn:replace(activity.act_address, replaceChar, "<br/>")}</p>
							<hr>
	                    </li>
	                    
	                    
	                    <li id="tab2">
	                        <h5 class="left-align tab-title">공지사항</h5>									
							<p class="left-align">${fn:replace(activity.act_announcement, replaceChar, "<br/>")}</p>
							<hr>
	                    </li>
	                    
	                    
	                    <li id="tab3">
							
							<h5 class="left-align tab-title">자주 묻는 질문</h5>
							<p class="left-align" >${fn:replace(activity.act_faq, replaceChar, "<br/>")}</p>
					    	<hr>
	                    </li>
	                    
	                   <hr>
	                    <!-- ==============================리뷰등록============================= -->
                        <li id="tab4">
	                       	<div class="container review_container">
						    	<h5 class="left-align tab-title">리뷰</h5>
										<form action="insertReview" method="post" id="reviewForm" name="reviewForm">
									<div class="form-floating review_input">
										<c:choose>
										   <c:when test="${userId eq null }"><% loginCheck = "hidden";%></c:when>
										   <c:when test="${userId ne null }"><% loginCheck = "";%></c:when>
										</c:choose>
									    	<textarea class="form-control valid-check insert-inner-input" placeholder="이 상품에 대해 리뷰를 작성해 주세요." name="review_content" maxlength="500" <%=loginCheck %> required></textarea>
									    	<input type="hidden" name="review_writer" value="${userId}"> 
											<input type="hidden" name="act_num" value="${activity.act_num}">
									</div>
									<button type="button" class="btn review_button btn-sm" id="review_insert_btn" value="리뷰등록" <%=loginCheck %>>리뷰 등록</button>
									    </form>
									
									<br <%=loginCheck %>>
									<br <%=loginCheck %>>
								
								<!-- =====================리뷰 리스트===================== -->
							    <c:if test="${paging.total==0}"><p>등록된 리뷰가 없습니다.</p></c:if>
							    <c:forEach items="${reviewList}" var="review">
									<form action="deleteReview" method="post">
										<input type="hidden" name="review_num" value="${review.review_num}"> 
										<input type="hidden" name="act_num" value="${activity.act_num}"> 
										<c:choose>
										        <c:when test="${userId ne review.review_writer }"><% idCheck = "hidden";%></c:when>
									            <c:when test="${userId eq review.review_writer }"><% idCheck = "";%></c:when>
								        </c:choose>
								    	<div class="review" style="padding:10px 0; border-bottom: 1px rgb(235, 235, 235) solid; overflow: auto;" <c:if test="${paging.total==0}"> hidden </c:if>>
									        <div >
									        	<span class="review_writer" style="float:left"><Strong>${review.review_writer}</Strong></span><span class="review_writer" style="float:right">${review.review_date}</span>
									        </div>
									        <br>
									    <input type="hidden" name="act_num" value="${activity.act_num}">
									    <input type="hidden" name="review_num" value="${review.review_num}">
								        <div class="bottom-line">
									        <span class="review_content" style="float:left; text-align: left;">${review.review_content}</span>			        
										    <button style="float: right;" type="submit" class="btn btn-danger btn-sm" id="del_btn" <%=idCheck %>>삭제</button>
									    </div>
									    
									</div>
								</form>
							  </c:forEach>
							    </div>
						        <!-- ==========================리뷰 페이징 처리======================= -->
							    <div class="row justify-content-md-center" id="table_footer">
							        <div class="pagination">
							            <div class="page-item <c:if test="${paging.nowPage <= 1}">disabled</c:if>"><a class="page-link" href="getUser_detailsPage?act_num=${activity.act_num}&nowPage=${paging.nowPage - 1}">Previous</a></div>
										
										<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
											<c:choose>
												<c:when test="${p == paging.nowPage}">
													<div class="page-item active"><a class="page-link">${p}</a></div>
												</c:when>
												<c:when test="${p != paging.nowPage}">
													<div class="page-item"><a class="page-link" href="getUser_detailsPage?act_num=${activity.act_num}&nowPage=${p}">${p}</a></div>
												</c:when>
											</c:choose>
										</c:forEach>
										
							            <div class="page-item <c:if test="${paging.nowPage >= paging.lastPage}">disabled</c:if>"><a class="page-link" href="getUser_detailsPage?nowPage=${paging.nowPage + 1}">Next</a></div>
							        </div>
							    </div>
							</div>		<!-- review_container -->
	                    </li>		<!-- li-4 -->
	                </ul>		<!-- Panel -->
	            </div>      <!-- TabMenu -->
			</div>     <!-- Col -->
		</div>      <!-- Row -->
	</div>      <!-- Container -->
</section>

<%@ include file="./template/footer.jsp" %>
</body>
</html>