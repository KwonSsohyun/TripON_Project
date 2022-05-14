<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="./template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservationPage.css">
<script type="text/javascript">
	$(function() {
		$('.delete-btn').click(function() {
			var check = confirm('내역삭제\n\n삭제된 내역은 복구할 수 없습니다.\n정말 삭제하시겠습니까?');
			if(check == true) {
				$(this).parent().submit();
			}
		});
	});
</script>
</head>
<c:set var="now" value="<%=new java.util.Date()%>"/>
<c:set var="nowYear"><fmt:formatDate value="${now}" pattern="yyyy"/></c:set>
<c:set var="nowMonth"><fmt:formatDate value="${now}" pattern="MM"/></c:set>
<c:set var="nowDay"><fmt:formatDate value="${now}" pattern="dd"/></c:set>
<body>
<%@ include file="./template/header.jsp" %>

<div class="container" id="faq-page">
    <div id="menu-bar">
        <ul class="menu-list">
            <li>
                <a href="/goInfo_managementPage">내 정보 관리</a>
            </li>
            <li>
                <a href="/getReservationList">예약 내역</a>
            </li>
        </ul>
    </div>
       
    <div id="rsv-div">

        <div id="reserved-div">
            <div class="reserved-title">예약 내역</div>
            <div class="list_wrap row">
              	<c:set var="test" value="0"/>
               	<c:forEach items="${reservationList}" var="reservation">
               		
               	
               		<c:set var="bookingdateYearOrigin" value="${fn:split(reservation.pur_bookingdate, ' ')[0]}"/>
               		<c:set var="bookingdateYear" value="${fn:substring(bookingdateYearOrigin, 0, 4)}"/>
               		<c:set var="bookingdateMonthOrigin" value="${fn:split(reservation.pur_bookingdate, ' ')[1]}"/>
               		<c:set var="bookingdateMonth" value="${fn:substring(bookingdateMonthOrigin, 0, 2)}"/>
               		<c:set var="bookingdateDayOrigin" value="${fn:split(reservation.pur_bookingdate, ' ')[2]}"/>
               		<c:set var="bookingdateDay" value="${fn:substring(bookingdateDayOrigin, 0, 2)}"/>
               		
               		<c:if test="${(reservation.pur_statenum eq 1 && bookingdateYear >= nowYear and bookingdateMonth > nowMonth) || (reservation.pur_statenum eq 1 && bookingdateYear >= nowYear and bookingdateMonth == nowMonth and bookingdateDay >= nowDay)}">
               			<c:set var="test" value="1"/>
               			<script>
	               		 	var act_title = '${reservation.pur_act_title}';
		               		$.ajax({
		    		        	async: true,
		    		        	type: 'POST',
		    		        	data: act_title,
		    		        	url: 'getActivityInformation',
		    		        	dataType: 'json',
		    		        	contentType: 'application/json; charset=UTF-8',
		    		        	success: function(data) {
		    		        		$('#card${reservation.pur_num} img').attr('src', '${pageContext.request.contextPath}/resources/imgs/' + data.act_mainPictureName);
		    		        		$('#card${reservation.pur_num} img').attr('onclick', "location.href='getUser_detailsPage?act_num=" + data.act_num + "'");
		    		        	},
		    		        	error : function() {
		    		        		console.log('error');
		    		        	}
		    		        });
	               		</script>
		                <div class="rsv-detail col-12 col-lg-6">
		                    <div class="card" id="card${reservation.pur_num}">
		                        <img src="https://dummyimage.com/350x180/666/fff" alt="Card image">
		                        <form id="reserved-form-${reservation.pur_num}" action="/reservation_detailPage" method="post">
		                        	<c:if test="${reservation.pur_opt_name_1 ne null and fn:trim(reservation.pur_opt_name_1) ne ''}">
				               			<input type="hidden" name="pur_opt_name_1" value="${reservation.pur_opt_name_1}"/>
				               			<input type="hidden" name="pur_opt_count_1" value="${reservation.pur_opt_count_1}"/>
				               		</c:if>
				               		<c:if test="${reservation.pur_opt_name_2 ne null and fn:trim(reservation.pur_opt_name_2) ne ''}">
				               			<input type="hidden" name="pur_opt_name_2" value="${reservation.pur_opt_name_2}"/>
				               			<input type="hidden" name="pur_opt_count_2" value="${reservation.pur_opt_count_2}"/>
				               		</c:if>
				               		<c:if test="${reservation.pur_opt_name_3 ne null and fn:trim(reservation.pur_opt_name_3) ne ''}">
				               			<input type="hidden" name="pur_opt_name_3" value="${reservation.pur_opt_name_3}"/>
				               			<input type="hidden" name="pur_opt_count_3" value="${reservation.pur_opt_count_3}"/>
				               		</c:if>
				               		<c:if test="${reservation.pur_opt_name_4 ne null and fn:trim(reservation.pur_opt_name_4) ne ''}">
				               			<input type="hidden" name="pur_opt_name_4" value="${reservation.pur_opt_name_4}"/>
				               			<input type="hidden" name="pur_opt_count_4" value="${reservation.pur_opt_count_4}"/>
				               		</c:if>
				               		<input type="hidden" name="pur_num" value="${reservation.pur_num}"/>
				               		<input type="hidden" name="pur_impid" value="${reservation.pur_impid}"/>
				               		<input type="hidden" name="pur_merchantid" value="${reservation.pur_merchantid}"/>
				               		<input type="hidden" name="pur_act_title" value="${reservation.pur_act_title}"/>
				               		<input type="hidden" name="pur_bookingdate" value="${reservation.pur_bookingdate}"/>
				               		<input type="hidden" name="pur_price" value="${reservation.pur_price}"/>
				               		<input type="hidden" name="mem_phone" value="${phonenum}"/>
				               		<input type="hidden" name="status" value="예약확정"/>
		                        </form>
		                        <div class="card-body" onclick="$('#reserved-form-${reservation.pur_num}').submit();">
		                            <div class="card-body-status-1">
		                                <span>예약확정</span>
		                            </div>
		                            <div class="card-body-title">${reservation.pur_act_title}</div>
		                            <div class="card-body-content">${reservation.pur_bookingdate}</div>
		                        </div>
		                    </div>
		                </div>
	                
               		</c:if>
               	</c:forEach>
           		<c:if test="${test eq 0}">
           			<div class="none-message">예약 내역이 없습니다.</div>
           		</c:if>
            </div>
        </div>

        <div id="used-div">
            <div class="used-title">이용 내역</div>
            <div class="list_wrap row">
            	<c:set var="test" value="0"/>
               	<c:forEach items="${reservationList}" var="reservation">
               		<c:set var="bookingdateYearOrigin" value="${fn:split(reservation.pur_bookingdate, ' ')[0]}"/>
               		<c:set var="bookingdateYear" value="${fn:substring(bookingdateYearOrigin, 0, 4)}"/>
               		<c:set var="bookingdateMonthOrigin" value="${fn:split(reservation.pur_bookingdate, ' ')[1]}"/>
               		<c:set var="bookingdateMonth" value="${fn:substring(bookingdateMonthOrigin, 0, 2)}"/>
               		<c:set var="bookingdateDayOrigin" value="${fn:split(reservation.pur_bookingdate, ' ')[2]}"/>
               		<c:set var="bookingdateDay" value="${fn:substring(bookingdateDayOrigin, 0, 2)}"/>
               		
               		<c:if test="${(reservation.pur_statenum eq 1 && bookingdateYear <= nowYear and bookingdateMonth < nowMonth) || (reservation.pur_statenum eq 1 && bookingdateYear <= nowYear and bookingdateMonth == nowMonth and bookingdateDay < nowDay)}">
	               		<c:set var="test" value="1"/>
	            		<script>
	               		 	var act_title = '${reservation.pur_act_title}';
		               		$.ajax({
		    		        	async: true,
		    		        	type: 'POST',
		    		        	data: act_title,
		    		        	url: 'getActivityInformation',
		    		        	dataType: 'json',
		    		        	contentType: 'application/json; charset=UTF-8',
		    		        	success: function(data) {
		    		        		$('#card${reservation.pur_num} img').attr('src', '${pageContext.request.contextPath}/resources/imgs/' + data.act_mainPictureName);
		    		        		$('#card${reservation.pur_num} img').attr('onclick', "location.href='getUser_detailsPage?act_num=" + data.act_num + "'");
		    		        	},
		    		        	error : function() {
		    		        		console.log('error');
		    		        	}
		    		        });
	               		</script>
		                <div class="rsv-detail col-12 col-lg-6">
		                	<div class="card" id="card${reservation.pur_num}">
		                		<img class="choonsik" src="https://dummyimage.com/350x180/666/fff" alt="Card image">
		                        <form class="close" action="/deletePurchase" method="post">
		                        	<input type="hidden" name="pur_num" value="${reservation.pur_num}"/>
		                            <button class="delete-btn" type="button">&times;</button>
		                        </form>
		                        <form id="used-form-${reservation.pur_num}" action="/reservation_detailPage" method="post">
		                        	<c:if test="${reservation.pur_opt_name_1 ne null and fn:trim(reservation.pur_opt_name_1) ne ''}">
				               			<input type="hidden" name="pur_opt_name_1" value="${reservation.pur_opt_name_1}"/>
				               			<input type="hidden" name="pur_opt_count_1" value="${reservation.pur_opt_count_1}"/>
				               		</c:if>
				               		<c:if test="${reservation.pur_opt_name_2 ne null and fn:trim(reservation.pur_opt_name_2) ne ''}">
				               			<input type="hidden" name="pur_opt_name_2" value="${reservation.pur_opt_name_2}"/>
				               			<input type="hidden" name="pur_opt_count_2" value="${reservation.pur_opt_count_2}"/>
				               		</c:if>
				               		<c:if test="${reservation.pur_opt_name_3 ne null and fn:trim(reservation.pur_opt_name_3) ne ''}">
				               			<input type="hidden" name="pur_opt_name_3" value="${reservation.pur_opt_name_3}"/>
				               			<input type="hidden" name="pur_opt_count_3" value="${reservation.pur_opt_count_3}"/>
				               		</c:if>
				               		<c:if test="${reservation.pur_opt_name_4 ne null and fn:trim(reservation.pur_opt_name_4) ne ''}">
				               			<input type="hidden" name="pur_opt_name_4" value="${reservation.pur_opt_name_4}"/>
				               			<input type="hidden" name="pur_opt_count_4" value="${reservation.pur_opt_count_4}"/>
				               		</c:if>
				               		<input type="hidden" name="pur_num" value="${reservation.pur_num}"/>
				               		<input type="hidden" name="pur_impid" value="${reservation.pur_impid}"/>
				               		<input type="hidden" name="pur_merchantid" value="${reservation.pur_merchantid}"/>
				               		<input type="hidden" name="pur_act_title" value="${reservation.pur_act_title}"/>
				               		<input type="hidden" name="pur_bookingdate" value="${reservation.pur_bookingdate}"/>
				               		<input type="hidden" name="pur_price" value="${reservation.pur_price}"/>
				               		<input type="hidden" name="mem_phone" value="${phonenum}"/>
				               		<input type="hidden" name="status" value="이용완료"/>
		                       	</form>
		                        <div class="card-body" onclick="$('#used-form-${reservation.pur_num}').submit();">
		                            <div class="card-body-status-2">
		                                <span>이용완료</span>
		                            </div>
		                            <div class="card-body-title">${reservation.pur_act_title}</div>
		                            <div class="card-body-content">${reservation.pur_bookingdate}</div>
		                            <a href="javascript:void(0)" class="btn btn-light card-body-btn">다시 예약</a>
		                        </div>
		                    </div>
		                 </div>
	            	</c:if>
	            </c:forEach>
	        	<c:if test="${test eq 0}">
	        		<div class="none-message">이용 내역이 없습니다.</div>
	        	</c:if>
            </div>
        </div>

        <div id="cencel-div">
            <div class="cancel-title">취소 내역</div>
            <div class="list_wrap row">
            	<c:set var="test" value="0"/>
               	<c:forEach items="${reservationList}" var="reservation">
               		<c:if test="${reservation.pur_statenum eq 0}">
	               		<c:set var="test" value="1"/>
               			<script>
	               		 	var act_title = '${reservation.pur_act_title}';
		               		$.ajax({
		    		        	async: true,
		    		        	type: 'POST',
		    		        	data: act_title,
		    		        	url: 'getActivityInformation',
		    		        	dataType: 'json',
		    		        	contentType: 'application/json; charset=UTF-8',
		    		        	success: function(data) {
		    		        		$('#card${reservation.pur_num} img').attr('src', '${pageContext.request.contextPath}/resources/imgs/' + data.act_mainPictureName);
		    		        		$('#card${reservation.pur_num} img').attr('onclick', "location.href='getUser_detailsPage?act_num=" + data.act_num + "'");
		    		        		$('#card-body-btn${reservation.pur_num}').attr('href', 'getUser_detailsPage?act_num='+ data.act_num);
		    		        	},
		    		        	error : function() {
		    		        		console.log('error');
		    		        	}
		    		        });
	               		</script>
		                <div class="rsv-detail col-12 col-lg-6">
		                    <div class="card" id="card${reservation.pur_num}">
		                        <img class="choonsik" src="https://dummyimage.com/350x180/666/fff" alt="Card image">
		                        <form class="close" action="/deletePurchase" method="post">
		                        	<input type="hidden" name="pur_num" value="${reservation.pur_num}"/>
		                            <button class="delete-btn" type="button">&times;</button>
		                        </form>
		                        <form id="cancel-form-${reservation.pur_num}" action="/reservation_detailPage" method="post">
		                        	<c:if test="${reservation.pur_opt_name_1 ne null and fn:trim(reservation.pur_opt_name_1) ne ''}">
				               			<input type="hidden" name="pur_opt_name_1" value="${reservation.pur_opt_name_1}"/>
				               			<input type="hidden" name="pur_opt_count_1" value="${reservation.pur_opt_count_1}"/>
				               		</c:if>
				               		<c:if test="${reservation.pur_opt_name_2 ne null and fn:trim(reservation.pur_opt_name_2) ne ''}">
				               			<input type="hidden" name="pur_opt_name_2" value="${reservation.pur_opt_name_2}"/>
				               			<input type="hidden" name="pur_opt_count_2" value="${reservation.pur_opt_count_2}"/>
				               		</c:if>
				               		<c:if test="${reservation.pur_opt_name_3 ne null and fn:trim(reservation.pur_opt_name_3) ne ''}">
				               			<input type="hidden" name="pur_opt_name_3" value="${reservation.pur_opt_name_3}"/>
				               			<input type="hidden" name="pur_opt_count_3" value="${reservation.pur_opt_count_3}"/>
				               		</c:if>
				               		<c:if test="${reservation.pur_opt_name_4 ne null and fn:trim(reservation.pur_opt_name_4) ne ''}">
				               			<input type="hidden" name="pur_opt_name_4" value="${reservation.pur_opt_name_4}"/>
				               			<input type="hidden" name="pur_opt_count_4" value="${reservation.pur_opt_count_4}"/>
				               		</c:if>
				               		<input type="hidden" name="pur_num" value="${reservation.pur_num}"/>
				               		<input type="hidden" name="pur_impid" value="${reservation.pur_impid}"/>
				               		<input type="hidden" name="pur_merchantid" value="${reservation.pur_merchantid}"/>
				               		<input type="hidden" name="pur_act_title" value="${reservation.pur_act_title}"/>
				               		<input type="hidden" name="pur_bookingdate" value="${reservation.pur_bookingdate}"/>
				               		<input type="hidden" name="pur_price" value="${reservation.pur_price}"/>
				               		<input type="hidden" name="mem_phone" value="${phonenum}"/>
				               		<input type="hidden" name="status" value="예약취소"/>
		                        </form>
		                        <div class="card-body" onclick="$('#cancel-form-${reservation.pur_num}').submit();">
		                            <div class="card-body-status-2">
		                                <span>예약취소</span>
		                            </div>
		                            <div class="card-body-title">${reservation.pur_act_title}</div>
		                            <div class="card-body-content">${reservation.pur_bookingdate}</div>
		                            <a href="javascript:void(0)" class="btn btn-light card-body-btn" id="card-body-btn${reservation.pur_num}">다시 예약</a>
		                        </div>
		                    </div>
		                </div>
					</c:if>
	            </c:forEach>
	        	<c:if test="${test eq 0}">
	        		<div class="none-message">취소 내역이 없습니다.</div>
	        	</c:if>
            </div>
        </div>
    </div>
</div>

<%@ include file="./template/footer.jsp" %>
</body>
</html>