<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="./template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservation_detailPage.css">
<script type="text/javascript">
	$(function() {
		$('.detail-div-button-cancel').click(function() {
			var val = $(this).prev().val();
// 			var con_test = confirm("정말 취소하시겠습니까?");
// 			if(con_test==true) {
// 				$.ajax({
// 					url : "/admin/purchase_manager/purchase_cancel", //컨트롤러 호출하는 로직
// 					data : {"mid": val},
// 					method : "POST",
// 					success : function(request){
// 						console.log(request);
// 						if(request==1){ 
// 							alert("취소 완료");
// 							payCanFnc(val);//취소 완료 DB테이블 업데이트
// 							location.href='getReservationList';
// 						}else{
// 							alert("취소 실패");
// 						}
// 					},
// 					error : function(request, status){
// 						console.log(url);
// 						alert("취소 실패");
// 					}
// 				});
// 			}
			var con_test = confirm("정말 취소하시겠습니까?");
			if(con_test==true) {
				$.ajax({
					url : "/admin/purchase_cancel", 
					data : {"mid": val},
					async : true,
					cache: false,
					type : "GET",
					success : function(res){
						alert("성공");
						location.href='getReservationList';
					},
					error : function(request, status){
						alert("취소가 실패하였습니다.");
					}
				});
			}
		});
	});
// 	function payCanFnc(val){
// 		$.ajax({
// 			url : "/admin/purchase_manager/updateState", //컨트롤러 호출하는 로직
// 			data : {"pur_merchantid": val},
// 			method : "POST",
// 			success : function(request){
// 				console.log(request);
// 				if(request>=0){ 
// 					alert("예약 내역 페이지로 돌아갑니다.");
// 				}else{
// 					alert("취소 실패");
// 				}
// 			},
// 			error : function(request, status){
// 				console.log(url);
// 				alert("취소 실패");
// 			}
// 		});
// 	}
</script>
</head>
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
       
    <div id="rsv-detail-div">
        <div id="detail-div-title">
        	<c:if test="${param.status eq '예약확정'}">
	            <div class="card-body-status-1">
	                <span>${param.status}</span>
	            </div>
        	</c:if>
        	<c:if test="${param.status ne '예약확정'}">
	            <div class="card-body-status-2">
	                <span>${param.status}</span>
	            </div>
        	</c:if>
            <div class="card-body-title">${param.pur_act_title}</div>
            <div class="card-body-content">${param.pur_bookingdate }</div>
        </div>
        <div id="detail-div-content">
            <div class="detail-div-content-1">
                <div>옵션목록</div>
                <div>
	                <c:if test="${param.pur_opt_name_1 ne null}">
	               		${param.pur_opt_name_1}<span>${param.pur_opt_count_1}개</span><br>
	                </c:if>
	                <c:if test="${param.pur_opt_name_2 ne null}">
	               		${param.pur_opt_name_2}<span>${param.pur_opt_count_2}개</span><br>
	                </c:if>
	                <c:if test="${param.pur_opt_name_3 ne null}">
	               		${param.pur_opt_name_3}<span>${param.pur_opt_count_3}개</span><br>
	                </c:if>
	                <c:if test="${param.pur_opt_name_4 ne null}">
	               		${param.pur_opt_name_4}<span>${param.pur_opt_count_4}개</span><br>
	                </c:if>
                </div>
            </div>
            <div class="detail-div-content-2">
                <div>예약번호</div>
                <div>${fn:split(param.pur_impid, '_')[1]}</div>
            </div>
            <div class="detail-div-content-3">
                <div>예약자 이름</div>
                <div>${userName}</div>
            </div>
            <div class="detail-div-content-4">
                <div>예약자 휴대폰 번호</div>
                <div>${param.mem_phone}</div>
            </div>
        </div>
        <div id="detail-div-price">
            <div class="detail-div-price-1">
                <div>결제정보</div>
            </div>
            <div class="detail-div-price-2">
                <div>총 결제금액</div>
                <div><fmt:formatNumber value="${param.pur_price}" pattern="#,###"/>원</div>
            </div>
        </div>
        <c:if test="${param.status eq '예약확정'}">
	        <div id="detail-div-button">
	        	<form action="/updatePurchase" method="post">
	        		<input type="hidden" id="pur_merchantId" value="${param.pur_merchantid}"/>
		            <button type="button" class="detail-div-button-cancel">예약 취소</button>
	        	</form>
	        </div>
        </c:if>
    </div>
</div>

<%@ include file="./template/footer.jsp" %>
</body>
</html>