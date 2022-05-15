<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../template/head.jsp"%>
<% pageContext.setAttribute("ln","\n"); %>
<link rel="stylesheet" href="/resources/css/admin_faqdetail.css">
<script>
	$(function(){
		var isSuper = '${isSuper}';
		if(isSuper != 'Y') {
			alert('잘못된 접근입니다.');
			history.back();
		}
	
		
		$('.faq-management-menu img').attr('src', '/resources/imgs/FAQ_management_black.png');
		$('.faq-management-menu a').css('color', '#000000');
		$('.faq-management-menu').css('border-color', '#5622ad');
		
		$('.delete-btn').click(function(){
			var result = confirm("삭제하시겠습니까?");
			if(result == true) {
				$('#delete-form').submit();
			}
		});
	});
</script>
</head>
<body>
<%@ include file="../template/manager_header.jsp" %>
	<div class="menu-flex">
		<h2>자주 묻는 질문 상세 보기 </h2>
	</div>
	<div class="newfaqbtn">
		<button type="button" class="btn btn-secondary" onclick="javascript:location.href='/admin/getFaqList'">목록</button>
	</div>
	<div class="backcol" style=display:block;>
		<div class="faqmng">
			<div class="menu_flex">
				<h2>${faq.faq_title}</h2>
			</div>
		</div>
		<div class="sub_tab">
			<div class="tab_mem_id">작성자 : ${faq.faq_mem_id}<span>|</span></div><div class="tab_regdate">작성일 : ${faq.faq_regdate}<span>|</span></div><div class="tab_count">조회수 : ${faq.faq_count}<span>|</span></div><div class="tab_category">카테고리 : ${faq.faq_category}</div>
		</div>
		<div class="faq_content_div"><c:out value="${fn:replace(faq.faq_content, ln ,'<br>')}" escapeXml="false"></c:out></div>
	</div>
	
	<div class="updatebtn">
		<form action="/admin/admin_faqUpdate" method="post">
			<input type="hidden" name="faq_seq" value="${faq.faq_seq}">
			<input type="hidden" name="faq_title" value="${faq.faq_title}">
			<input type="hidden" name="faq_content" value="${faq.faq_content}">
			<input type="hidden" name="faq_category" value="${faq.faq_category}">
			<input type="hidden" name="pageNum" value="${param.pageNum}">
				<button type="submit" class="btn btn-secondary">글 수정</button>
		</form>
		<form id="delete-form" action="/admin/deleteFaq" method="post">
			<input type="hidden" name="deleteSeq" value="${faq.faq_seq}">
			<input type="hidden" name="pageNum" value="${param.pageNum}">
				<button type="button" class="btn btn-danger delete-btn" style="margin-left: 10px;">삭제</button>
		</form>
	</div>

<%@ include file="../template/manager_footer.jsp" %>
</body>
</html>