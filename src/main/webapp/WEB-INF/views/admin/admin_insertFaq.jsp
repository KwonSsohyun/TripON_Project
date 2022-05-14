<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_insertFaq.css">
<script type="text/javascript">
	window.onpageshow = function() {
// 		if($('.title-input').val() == 'Insert Success Message - 10265199' && $('.content-input').val() == 'Insert Success Message - 56013413') {
		if($('.content-input').val() == 'Insert Success Message - 56013413') {
			alert('잘못된 접근입니다.');
			history.go(1);
		}
	}
	$(function() {var isSuper = '${isSuper}';
	if(isSuper != 'Y') {
		alert('잘못된 접근입니다.');
		history.back();
	}

		$('.faq-management-menu img').attr('src', '/resources/imgs/FAQ_management_black.png');
		$('.faq-management-menu a').css('color', '#000000');
		$('.faq-management-menu').css('border-color', '#5622ad');
		
		 $('.insert-btn').click(function(){
			 var ti_iv = $('.title-input').val().trim();
			 var ct_iv = $('.content-input').val().trim();
			 if(ti_iv == '') {
				 alert('제목을 입력해주세요.');
			 } else if(ct_iv == '') {
				 alert('내용을 입력해주세요.');
			 } else if(ti_iv.length > 50) {
					alert('제목을 50자 이내로 입력해주세요.\n현재 입력 글자 : ' + ti_iv.length + '자')
			 } else if(ct_iv.length > 1800) {
					alert('내용을 1800자 이내로 입력해주세요.\n현재 입력 글자 : ' + ct_iv.length + '자')
			 } else {
				 var result = confirm('확인 버튼을 누르면 등록이 완료됩니다.');
				 if(result == true){
					 $('#insert-form').submit();
// 					 $('.title-input').val('Insert Success Message - 10265199');
					 $('.content-input').val('Insert Success Message - 56013413');
				 }
			 }
		 });
	});
</script>
</head>
<body>
<%@ include file="../template/manager_header.jsp" %>
	<div class="menu_flex">
		<h2>자주 묻는 질문 작성 </h2>
	</div>
	<div class="faqlistbtn">
		<button type="button" class="btn btn-secondary" onclick="javascript:location.href='/admin/getFaqList'">목록</button>
	</div>
	<form id="insert-form" action="/admin/insertFaq" method="post">
		<input type="hidden" name="faq_mem_id" value="${userId}">
		<input type="hidden" name="pageNum" value="${param.pageNum}">
		<div class="insertList">
			<table>
				<tr>
					<td>제목</td>
					<td>
						<div class="form-group">
							<input type="text" class="form-control title-input" name="faq_title" autocomplete="off">
						</div>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<div class="form-group">
							<textarea class="form-control content-input" rows="15" id="comment" name="faq_content" autocomplete="off"></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<td class="ctg">카테고리</td>
					<td>
						<div class="radio-group-div">
							<input id="radio-1" type="radio" name="faq_category" value="TOP7">
							<label for="radio-1" class="radio-label">TOP7</label>
							
							<input id="radio-2" type="radio" name="faq_category" value="이용문의">
							<label for="radio-2" class="radio-label">이용문의</label>
							
							<input id="radio-3" type="radio" name="faq_category" value="예약문의">
							<label for="radio-3" class="radio-label">예약문의</label>
							
							<input id="radio-4" type="radio" name="faq_category" value="예약취소"> 
							<label for="radio-4" class="radio-label">예약취소</label>
							
							<input id="radio-5" type="radio" name="faq_category" value="결제/영수증">
							<label for="radio-5" class="radio-label">결제/영수증 </label>
							
							<input id="radio-6" type="radio" name="faq_category" value="기타" checked>
							<label for="radio-6" class="radio-label">기타</label>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="savebtn">
			<button type="button" class="btn btn-success insert-btn">등록</button>
		</div> 
	</form>
<%@ include file="../template/manager_footer.jsp" %>
</body>
</html>