<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../template/head.jsp" %>

<c:set var="msg1" value=""/>
<c:set var="msg2" value=""/>
<c:if test="${param.ntc_target eq '사용자'}">
	<c:set var="msg1" value="selected"/>
</c:if>
<c:if test="${param.ntc_target eq '관리자'}">
	<c:set var="msg2" value="selected"/>
</c:if>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_noticeUpdate.css">
<script type="text/javascript">
	window.onpageshow = function() {
// 		if($('.title-input').val() == 'Insert Success Message - 10265199' && $('.content-input').val() == 'Insert Success Message - 56013413') {
		if($('.content-input').val() == 'Insert Success Message - 56013413') {
			alert('잘못된 접근입니다.');
			history.go(1);
		}
	}
	$(function() {		var isSuper = '${isSuper}';
	if(isSuper != 'Y') {
		alert('잘못된 접근입니다.');
		history.back();
	}
		
		$('.notice-management-menu img').attr('src', '/resources/imgs/notice_management_black.png');
		$('.notice-management-menu a').css('color', '#000000');
		$('.notice-management-menu').css('border-color', '#5622ad');
		$('.update-btn').click(function(){
			var ti_iv = $('.title-input').val().trim();
			var ct_iv = $('.content-input').val().trim();
			var sl_ov = $('#target-select').val();
			if(ti_iv == '') {
				alert('제목을 입력해주세요.');
			} else if(ct_iv == '') {
				alert('내용을 입력해주세요.');
			} else if(ti_iv.length > 50) {
				alert('제목을 50자 이내로 입력해주세요.\n현재 입력 글자 : ' + ti_iv.length + '자')
			} else if(ct_iv.length > 2000) {
				alert('내용을 2000자 이내로 입력해주세요.\n현재 입력 글자 : ' + ct_iv.length + '자')
			} else {
				var result = confirm('확인 버튼을 누르면 등록이 완료됩니다.');
				if(result == true){
					$('.filename-input').val(filenames.toString());
					$('#update-form').submit();
// 					$('.title-input').val('Insert Success Message - 10265199');
					$('.content-input').val('Insert Success Message - 56013413');
				}
			}
		});
		
		var filenames = '${param.ntc_filename}'.split(',');
		console.log(filenames.toString());
		
		$('.file-delete-btn').click(function() {
			console.log($(this).prev().text());
			var filename = $(this).prev().text();
			console.log(filenames.indexOf(filename));
			var index = filenames.indexOf(filename);
			filenames.splice(index, 1);
			console.log(filenames);
			$(this).parent().hide();
		});
		
		 $("#fileInput").on('change', function(){ 
		        
            // 값이 변경되면      
            var filename = $(this)[0].files;  // [806.png]-[20220112_105104.png]
            if(filename.length > 3 - filenames.length){
                alert("파일은 최대 3개까지만 선택 가능합니다.");
                return false;
            }

            var str ='';
            $(filename).each(function(index, item){  //0: [806.png]- 1:[20220112_105104.png]
                if(filename.length-1 <= index) str += item.name;
                else str += item.name+', ';
            });

            // 추출한 파일명 삽입 
            $("#userfile").val(str); 
        }); 
	});
	
	$(document).ready(function(){ 
       
    });
	
</script>
</head>
<body>
<%@ include file="../template/manager_header.jsp" %>
	<div class="ntcmng">
		<div class="menu_flex">  
			<h2>공지사항 수정</h2>
		</div>
		<div class="newntcbtn">
			<button type="button" class="btn btn-secondary" onclick="javascript:location.href='/admin/getNoticeList'">목록</button>
		</div> 
 	</div>		
	<form id="update-form" action="/admin/updateNotice" method="post" enctype="multipart/form-data">
		<input type="hidden" name="ntc_seq" value="${param.ntc_seq}">
		<input type="hidden" name="pageNum" value="${param.pageNum}">
		<div class="insertList">
			<div class="container-fluid">
				<table>
					<tr>
						<td>제목</td>
						<td colspan="3"> 
							<div class="form-group">
								<textarea class="form-control title-input" rows="1" name="ntc_title" autocomplete="off">${param.ntc_title}</textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="3">
							<div class="form-group">
								<textarea class="form-control content-input" rows="15" id="comment" name="ntc_content" autocomplete="off">${param.ntc_content}</textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td>공지대상</td>
						<td>
							<div class="form-group">
								<select id="target-select" name="ntc_target">
									<option value="choice">선택</option>
									<option value="사용자" ${msg1}>사용자</option>
									<option value="관리자" ${msg2}>관리자</option>
								</select>
							</div>
						</td>
						<td>첨부파일</td>
						<td>
							<div class="form-group">
<!-- 						        <label for="InputSubject1"></label> -->
								<input class="filename-input" type="hidden" name="ntc_filename">
						        <input id="fileInput" type="file" class="form-control" name="uploadFile" style="position: absolute; clip: rect(0px 0px 0px 0px);" multiple="multiple">
						        <div class="bootstrap-filestyle input-group">
						            <input type="text" id="userfile" class="form-control" name="userfile" disabled>
						            <span class="group-span-filestyle input-group-btn" tabindex="0">
						                <label for="fileInput" class="btn btn-default"><span class="fa fa-upload"></span></label>
						            </span>
						        </div>
						    </div>
						</td>
					</tr>
					<tr>
						<td>기존파일</td>
						<td colspan="3">
							<c:if test="${param.ntc_filename ne '파일 없음'}">
								<c:forEach items="${fn:split(param.ntc_filename, ',')}" var="filename">
									<div>
										<a href="${pageContext.request.contextPath}/resources/attachments/${filename}" target="_blank">${filename}</a>
										<button class="file-delete-btn" type="button">&times;</button>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${param.ntc_filename eq '파일 없음'}">
								<div class="origin-file-none">※ 기존 파일 없음 ※</div>
							</c:if>
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