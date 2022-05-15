<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../template/head.jsp" %>
<% pageContext.setAttribute("ln", "\n"); %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_noticedetail.css">
<script>
	$(function() {
		var isSuper = '${isSuper}';
		if(isSuper != 'Y') {
			alert('잘못된 접근입니다.');
			history.back();
		}
		
		$('.notice-management-menu img').attr('src', '/resources/imgs/notice_management_black.png');
		$('.notice-management-menu a').css('color', '#000000');
		$('.notice-management-menu').css('border-color', '#5622ad');
		
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
			<h2>공지사항 상세 보기 </h2>
		</div>
		<div class="newntcbtn">
			<button type="button" class="btn btn-secondary" onclick="javascript:location.href='/admin/getNoticeList?pageNum=${param.pageNum}'">목록</button>
		</div> 
		<div class="backcol" style="display:block;">
			<div class="ntcmng">
					<div class="menu_flex">  
						<h2>${notice.ntc_title}</h2>
					</div>
			</div>
			<div class="sub_tab">
				<div class="tab_mem_id">작성자 : ${notice.ntc_mem_id}<span>|</span></div><div class="tab_regdate">작성일 : ${notice.ntc_regdate}<span>|</span></div><div class="tab_count">조회수 : ${notice.ntc_count}<span>|</span></div><div class="tab_target">공지대상 : ${notice.ntc_target}</div>
			</div>
		
			<c:if test="${notice.ntc_filename ne '파일 없음'}">
				<div class="attachments_link">
					<div class="attachments_link_title">첨부파일 :</div>
					<div class="attachments_link_content">
						<c:forEach items="${fn:split(notice.ntc_filename, ',')}" var="filename">
							<div class="attachments_link_content_inner">
								<a class="a1" href="${pageContext.request.contextPath}/resources/attachments/${filename}" target="_blank">${filename}</a><a class="a2" href="${pageContext.request.contextPath}/resources/attachments/${filename}" download="${filename}">[파일 다운로드]</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:if>
			<div class="ntc_content-div"><c:out value="${fn:replace(notice.ntc_content, ln, '<br>')}" escapeXml="false"/></div>
		</div>
		<div class="updatebtn">
			<form action="/admin/admin_noticeUpdate" method="post">
				<input type="hidden" name="ntc_seq" value="${notice.ntc_seq}">
				<input type="hidden" name="ntc_title" value="${notice.ntc_title}">
				<input type="hidden" name="ntc_content" value="${notice.ntc_content}">
				<input type="hidden" name="ntc_target" value="${notice.ntc_target}">
				<input type="hidden" name="ntc_filename" value="${notice.ntc_filename}">
				<input type="hidden" name="pageNum" value="${param.pageNum}">
					<button type="submit" class="btn btn-secondary"> 글 수정</button>
			</form>
			<form id="delete-form" action="/admin/deleteNotice" method="post">
				<input type="hidden" name="deleteSeq" value="${notice.ntc_seq}">
				<input type="hidden" name="pageNum" value="${param.pageNum}">
					<button type="button" class="btn btn-danger delete-btn" style="margin-left: 10px;">삭제</button>
			</form>
		</div>

<%@ include file="../template/manager_footer.jsp" %>
</body>
</html>