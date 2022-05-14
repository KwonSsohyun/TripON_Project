<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ include file="../template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/purchase_manager.css">
</head>
<body>
<%@ include file="../template/manager_header.jsp" %>
<script type="text/javascript">
	$(function() {		var isSuper = '${isSuper}';
	if(isSuper != 'Y') {
		alert('잘못된 접근입니다.');
		history.back();
	}
		$('.purchase-management-menu img').attr('src', '/resources/imgs/purchase_management_black.png');
		$('.purchase-management-menu a').css('color', '#000000');
		$('.purchase-management-menu').css('border-color', '#5622ad');
	});
		
	// 결제 취소
	function cancel_module(val){
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
					location.reload();//새로 고침
				},
				error : function(request, status){
					alert("취소가 실패하였습니다.");
				}
			});
		}
	}

</script>
<!-- html 시작 -->
	<!-- 관리자 결제 페이지 TITLE -->
	<div class="container-fluid">
		<div class="purchase-title">관리자 - 결제 페이지</div>
	</div>
	<div class="container-fluid">
		<div class="purchase-title-contents">
			결제 내역 목록을 확인하고 결제 상태를 취소할 수 있습니다.<br>
			결제 상태와 예약 날짜에 따라 결제 취소 버튼의 활성화 상태가 변경됩니다.
		</div>
	</div>
	<br>
	
	<!-- Mobile : small menu -->
	<div id="small-menu">
		<!-- 관리자 결제 페이지 BODY start-->
		<div class="purchase-body">
		<!-- 관리자 결제 페이지 BODY HEADER -->
		<div class="purchase-body-header"></div>

		<!-- 관리자 결제 페이지 TOP_MENU -->
		<div class="container-fluid">
			<div class="purchase-top-menu list-group-item">
			<div class="row purchase-list-line">
				<div class="col-2">번호</div>
				<div class="col-6">정보</div>
				<div class="col-4">관리</div>
			</div>
			</div>
		</div>

	<!-- 관리자 결제 페이지 LIST -->
	<c:set var="num" target="${paging}" value="${paging.total - ((paging.nowPage-1) * paging.cntPerPage)}"/>
	<c:forEach items="${puchaselist}" var="purchase">
	<c:set var="today" value="<%=new java.util.Date()%>"/>
      
	<div class="container-fluid">
		<div class="purchase-list list-group-item">
		<div class="row purchase-list-line">
			<div class="col-2">${paging.total-num+1}</div>
			<div class="col-6"><a class="purchase-view" id="viewbtn-mo${purchase.pur_num}">${purchase.pur_user_id}<br>${purchase.pur_act_title}</a></div>
			<!-- 결제 상태 출력 -->
			<!-- 0=결제 취소, 1=결제 완료, (그 외)=이용 완료 -->
			<div class="col-4">
				<c:choose>
				<c:when test="${purchase.pur_statenum == 0}">
					<div class="canceltext">
					취소 완료
					</div>
				</c:when>
				<c:when test="${purchase.pur_statenum == 1 && purchase.bookingdate > today}">
					<button class="purchase-Order-Cancel-btn btn btn-danger btn-sm" onclick="cancel_module('${purchase.pur_merchantid}')">
					결제 취소
					</button>
				</c:when>
				<c:otherwise>
					이용 완료
				</c:otherwise>
				</c:choose>
			</div>

		</div>
		</div>
	</div>

	<!-- 관리자 결제 페이지 LIST-VIEW [상세보기]-->
	<div class="container-fluid">
		<div class="purchase-list-view list-group-item" id="view-mo${purchase.pur_num}">
		<div class="row purchase-list-view-line">

			<div class="col-2"></div>
			<div class="col-10">결제 번호 : ${merchant_uid}</div>
                  
			<div class="col-2"></div>
			<div class="col-10">유저 ID : ${purchase.pur_user_id}</div>
                  
			<div class="col-2"></div>
			<div class="col-10">유저 이름 : ${purchase.pur_user_name}</div>
                  
			<div class="col-2"></div>
			<div class="col-10">결제 고유 ID : ${purchase.pur_impid}</div>
                  
			<div class="col-2"></div>
			<div class="col-10">결제 상태 :    
				<c:choose>
				<c:when test="${purchase.pur_statenum == 0}" >
					취소 완료
				</c:when>
				<c:when test="${purchase.pur_statenum == 1 && purchase.bookingdate > today}">
					결제 완료
				</c:when>
				<c:otherwise>
					 이용 완료
				</c:otherwise>
				</c:choose>
			</div>

			<div class="col-2"></div>
			<div class="col-10">결제 날짜 : ${purchase.pur_purchasedate}"</div>

			<div class="col-2"></div>
			<div class="col-10">예약 날짜 : ${purchase.pur_bookingdate}"</div>

			<div class="col-2"></div>
			<div class="col-10">상품 이름 : ${purchase.pur_act_title}</div>

			<div class="col-2"></div>
			<div class="col-10">상품 가격 : ${purchase.pur_price}</div>
         
			<!-- 수량이 0인 옵션 항목은 생략됨 -->
         	<c:choose>
				<c:when test="${purchase.pur_opt_count_1 == 0}"></c:when>
				<c:otherwise>
				<div class="col-2"></div>
				<div class="col-10">패키지 옵션 1(수량): ${purchase.pur_opt_name_1}(${purchase.pur_opt_count_1})</div>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${purchase.pur_opt_count_2 == 0}"></c:when>
				<c:otherwise>
				<div class="col-2"></div>
				<div class="col-10">패키지 옵션 2(수량): ${purchase.pur_opt_name_2}(${purchase.pur_opt_count_2})</div>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${purchase.pur_opt_count_3 == 0}"></c:when>
				<c:otherwise>
				<div class="col-2"></div>
				<div class="col-10">패키지 옵션 3(수량): ${purchase.pur_opt_name_3}(${purchase.pur_opt_count_3})</div>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${purchase.pur_opt_count_4 == 0}"></c:when>
				<c:otherwise>
				<div class="col-2"></div>
				<div class="col-10">패키지 옵션 4(수량): ${purchase.pur_opt_name_4}(${purchase.pur_opt_count_4})</div>
				</c:otherwise>
			</c:choose>
		</div>
		</div>
	</div>
	<c:set var="num" value="${num-1}"></c:set>
	</c:forEach>
      
	<!-- 관리자 결제 페이지 BODY FOOTER -->
	<div class="container-fluid"><div class="purchase-body-footer"></div></div>
	<!-- 관리자 결제 페이지 BODY end.-->
	</div>
	<br>

	<!-- 관리자 pagination -->
	<div>
		<ul class="pagination justify-content-center">
		<li class='page-item <c:if test="${paging.nowPage <= 1}">disabled</c:if>'><a class="page-link" href="/admin/purchase_manager?nowPage=${paging.nowPage - 1 }" style="color: #8b8b8d;">Previous</a></li>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
			<c:when test="${p == paging.nowPage}">
				<li class="page-item active"><a class="page-link">${p}</a></li>
			</c:when>
				<c:when test="${p != paging.nowPage}">
				<li class="page-item"><a class="page-link" href="/admin/purchase_manager?nowPage=${p}">${p}</a></li>
				</c:when>
			</c:choose>
			</c:forEach>
		<li class='page-item <c:if test="${paging.nowPage >= paging.endPage}">disabled</c:if>'><a class="page-link" href="/admin/purchase_manager?nowPage=${paging.nowPage+1}" style="color: #8b8b8d;">Next</a></li>
		</ul>            
	</div>
	</div>
	<!-- Mobile : small menu end.-->
   
	<!-- PC :large menu -->
	<br>
	<br>
	<div id="large-menu">
	<!-- 관리자 결제 페이지 BODY start-->
	<div class="purchase-body">
	<!-- 관리자 결제 페이지 BODY HEADER -->
	<div class="purchase-body-header"></div>

	<!-- 관리자 결제 페이지 TOP_MENU -->
	<div class="container-fluid">
		<div class="purchase-top-menu list-group-item">
		<div class="row">
			<div class="col-2">번호</div>
			<div class="col-2">사용자 정보</div>
			<div class="col-6">구입 상품</div>
			<div class="col">관리</div>
		</div>
		</div>
	</div>

	<!-- 관리자 결제 페이지 LIST -->
	<c:set var="num" target="${paging}" value="${paging.total - ((paging.nowPage-1) * paging.cntPerPage)}"/>
	<c:forEach items="${puchaselist}" var="purchase">
	<c:set var="today" value="<%=new java.util.Date()%>"/>

	<div class="container-fluid">
		<div class="purchase-list list-group-item">
		<div class="row purchase-list-line">
			<div class="col-2">${paging.total-num+1}</div>
			<div class="col-2">${purchase.pur_user_id}</div>
			<div class="col-6">${purchase.pur_act_title}</div>
			<div class="col">
				<button class="purchase-view btn btn-primary btn-sm" id="viewbtn-pc${purchase.pur_num}"><span>상세 보기</span></button>
			</div>
		</div>
		</div>
	</div>

	<!-- 관리자 결제 페이지 LIST-VIEW [상세보기]-->
	<div class="container-fluid">
		<div class="purchase-list-view list-group-item" id="view-pc${purchase.pur_num}">
		<div class="row purchase-list-view-line">
			<div class="col-2"></div>
			<div class="col-8">결제 번호 : ${merchant_uid} ${purchase.pur_merchantid}</div>
			<!-- 결제 상태 출력-->
			<!-- 0=결제 취소, 1=결제 완료, (그 외)=이용 완료 -->
			<div class="col">
				<c:choose>
				<c:when test="${purchase.pur_statenum == 0}">
					<div class="canceltext">
					취소 완료
					</div>
				</c:when>
				<c:when test="${purchase.pur_statenum == 1 && purchase.bookingdate > today}">
					<form name="fm">
					<button type="button" class="purchase-Order-Cancel-btn btn btn-danger btn-sm" onclick="cancel_module('${purchase.pur_merchantid}')">
					결제 취소
					</button>
					</form>
				</c:when>
				<c:otherwise>
					이용 완료
				</c:otherwise>
				</c:choose>
			</div>
			<div class="col-2"></div> 
			<div class="col-4">유저 ID : ${purchase.pur_user_id}</div>
			<div class="col-4">유저 이름 : ${purchase.pur_user_name}</div>
			<div class="col"></div>

			<div class="col-2"></div> 
			<div class="col-4">결제 고유 ID : ${purchase.pur_impid}</div>
			<div class="col-4">결제 상태 :    
				<c:choose>
				<c:when test="${purchase.pur_statenum == 0}">
					취소 완료
				</c:when>
				<c:when test="${purchase.pur_statenum == 1 && purchase.bookingdate > today}">
					결제 완료
				</c:when>
				<c:otherwise>
					이용 완료
				</c:otherwise>
				</c:choose>
			</div>
			<div class="col"></div>
			
			<div class="col-2"></div> 
			<div class="col-4">결제 날짜 : ${purchase.pur_purchasedate}</div>
			<div class="col-4">예약 날짜 : ${purchase.pur_bookingdate}</div>
			<div class="col"></div>
			
			<div class="col-2"></div>
			<div class="col-4">상품 이름 : ${purchase.pur_act_title}</div>
			<div class="col-4">상품 가격 : ${purchase.pur_price}</div>
			<div class="col"></div>
			
			<c:choose>
				<c:when test="${purchase.pur_opt_count_1 == 0}"></c:when>
				<c:otherwise>
				<div class="col-2"></div>
				<div class="col-4">패키지 옵션 1 : ${purchase.pur_opt_name_1}</div>
				<div class="col-4">패키지 옵션 1 수량 : ${purchase.pur_opt_count_1}</div>
				<div class="col"></div>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${purchase.pur_opt_count_2 == 0}"></c:when>
				<c:otherwise>
				<div class="col-2"></div>
			<div class="col-4">패키지 옵션 2 : ${purchase.pur_opt_name_2}</div>
			<div class="col-4">패키지 옵션 2 수량 : ${purchase.pur_opt_count_2}</div>
			<div class="col"></div>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${purchase.pur_opt_count_3 == 0}"></c:when>
				<c:otherwise>
				<div class="col-2"></div>
				<div class="col-4">패키지 옵션 3 : ${purchase.pur_opt_name_3}</div>
				<div class="col-4">패키지 옵션 3 수량 : ${purchase.pur_opt_count_3}</div>
				<div class="col"></div>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${purchase.pur_opt_count_4 == 0}"></c:when>
				<c:otherwise>
				<div class="col-2"></div>
				<div class="col-4">패키지 옵션 4 : ${purchase.pur_opt_name_4}</div>
				<div class="col-4">패키지 옵션 4 수량 : ${purchase.pur_opt_count_4}</div>
				<div class="col"></div>
				</c:otherwise>
			</c:choose>
		</div>
		</div>
	</div>
	<c:set var="num" value="${num-1}"></c:set>
	</c:forEach>

	<!-- 관리자 결제 페이지 BODY FOOTER -->
	<div class="container-fluid"><div class="purchase-body-footer"></div></div>

	<!-- 관리자 결제 페이지 BODY end.-->
	</div>
	<br>
	<br>

	<!-- 관리자 pagination -->
	<div>
		<ul class="pagination justify-content-center">
		<li class='page-item <c:if test="${paging.nowPage <= 1}">disabled</c:if>'><a class="page-link" href="/admin/purchase_manager?nowPage=${paging.nowPage - 1 }" style="color: #8b8b8d;">Previous</a></li>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
			<c:when test="${p == paging.nowPage}">
				<li class="page-item active"><a class="page-link">${p}</a></li>
			</c:when>
			<c:when test="${p != paging.nowPage}">
				<li class="page-item"><a class="page-link" href="/admin/purchase_manager?nowPage=${p}">${p}</a></li>
			</c:when>
			</c:choose>
			</c:forEach>
		<li class='page-item <c:if test="${paging.nowPage >= paging.endPage}">disabled</c:if>'><a class="page-link" href="/admin/purchase_manager?nowPage=${paging.nowPage+1}" style="color: #8b8b8d;">Next</a></li>
		</ul>            
	</div>
	</div>
	<!-- PC :large menu end.-->

	<!-- 관리자 페이지 LIST VIEW JSP-->
	<script>
	//관리자 결제 페이지 LIST_VIEW 상세보기 버튼
	const items = document.querySelectorAll('.purchase-view');
   
	function openClose() {
		const viewerId = this.id.replace('viewbtn', 'view');
	
		if(document.getElementById(viewerId).style.display === 'block') {
		document.getElementById(viewerId).style.display = 'none';
		} else {
		document.getElementById(viewerId).style.display = 'block';
		}
	} 

	items.forEach(item => item.addEventListener('click', openClose));
	</script>

	<%@ include file="../template/manager_footer.jsp" %>
</body>
</html>