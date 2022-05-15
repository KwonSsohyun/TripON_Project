<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../template/head.jsp" %>


<c:set var="msg1" value=""/>
<c:set var="msg2" value=""/>
<c:set var="msg3" value=""/>
<c:set var="msg4" value=""/>
<c:set var="msg5" value=""/>
<c:set var="msg6" value=""/>
<c:if test="${param.faq_category eq 'TOP7'}">
	<c:set var="msg1" value="checked"/>
</c:if>
<c:if test="${param.faq_category eq '이용문의'}">
	<c:set var="msg2" value="checked"/>
</c:if>
<c:if test="${param.faq_category eq '예약문의'}">
	<c:set var="msg3" value="checked"/>
</c:if>
<c:if test="${param.faq_category eq '예약취소'}">
	<c:set var="msg4" value="checked"/>
</c:if>
<c:if test="${param.faq_category eq '결제/영수증' or param.faq_category eq '결제/영수증 '}">
	<c:set var="msg5" value="checked"/>
</c:if>
<c:if test="${param.faq_category eq '기타'}">
	<c:set var="msg6" value="checked"/>
</c:if>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_faqUpdate.css">
<script type="text/javascript">
	window.onpageshow = function() {
// 		if($('.title-input').val() == 'Insert Success Message - 10265199' && $('.content-input').val() == 'Insert Success Message - 56013413') {
		if($('.content-input').val() == 'Insert Success Message - 56013413') {
			alert('잘못된 접근입니다.');
			history.go(1);
		}
	}
	$(function(){var isSuper = '${isSuper}';
	if(isSuper != 'Y') {
		alert('잘못된 접근입니다.');
		history.back();
	}

		$('.faq-management-menu img').attr('src', '/resources/imgs/FAQ_management_black.png');
		$('.faq-management-menu a').css('color', '#000000');
		$('.faq-management-menu').css('border-color', '#5622ad');
		
		$('.update-btn').click(function(){
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
				 var result = confirm('수정하시겠습니까?');
				 if(result == true){
					 $('#update-form').submit();
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
	<div class="faqmng">
		<div class="menu_flex">
			<h2>자주 묻는 질문 수정</h2>
		</div>
		<div class="newfaqbtn">
				<button type="button" class="btn btn-secondary" onclick="javascript:location.href='/admin/getFaqList'">목록</button>
		</div>
	</div>
	<form id="update-form" action="/admin/updateFaq" method="post">
		<input type="hidden" name="faq_seq" value="${param.faq_seq}">
		<input type="hidden" name="pageNum" value="${param.pageNum}">
		<div class="insertList">
			<div class="container-fluid">
				<table>
					<tr>
						<td>제목</td>
						<td colspan="2">
							<div class="form-group">
								<textarea class="form-control title-input" rows="1" name="faq_title" autocomplete="off">${param.faq_title}</textarea>
						    </div>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2">
			      			<div class="form-group">
								<textarea class="form-control content-input" rows="5" id="comment" name="faq_content" style="resize: none;" autocomplete="off">${param.faq_content}</textarea>
					    	</div>
						</td>
					</tr>
					<tr>
						<td class="ctg">카테고리</td>
						<td>
								<input type="radio" name="faq_category" value="TOP7" ${msg1}>TOP7
								<input type="radio" name="faq_category" value="이용문의" ${msg2}>이용문의
								<input type="radio" name="faq_category" value="예약문의" ${msg3}>예약문의 
								<input type="radio" name="faq_category" value="예약취소" ${msg4}>예약취소 
								<input type="radio" name="faq_category" value="결제/영수증 " ${msg5}>결제/영수증 
								<input type="radio" name="faq_category" value="기타" ${msg6}>기타
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="savebtn">
			<button type="button" class="btn btn-success update-btn">저장</button>
		</div> 
	</form>
	
<%@ include file="../template/manager_footer.jsp" %>
</body>
</html>