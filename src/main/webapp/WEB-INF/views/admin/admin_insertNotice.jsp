<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../template/head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_insertNotice.css">
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

		$('.notice-management-menu img').attr('src', '/resources/imgs/notice_management_black.png');
		$('.notice-management-menu a').css('color', '#000000');
		$('.notice-management-menu').css('border-color', '#5622ad');
		$('.insert-btn').click(function(){
			var ti_iv = $('.title-input').val().trim();
			var ct_iv = $('.content-input').val().trim();
			var sl_ov = $('#target-select').val();
			if(ti_iv == '') {
				alert('제목을 입력해주세요.');
			} else if(ct_iv == '') {
				alert('내용을 입력해주세요.');
			} else if(sl_ov == 'choice') {
				alert('공지대상을 선택해주세요.');
			} else if(ti_iv.length > 50) {
				alert('제목을 50자 이내로 입력해주세요.\n현재 입력 글자 : ' + ti_iv.length + '자')
			} else if(ct_iv.length > 1800) {
				alert('내용을 1800자 이내로 입력해주세요.\n현재 입력 글자 : ' + ct_iv.length + '자')
			} else {
				var result = confirm('확인 버튼을 누르면 등록이 완료됩니다.');
				if(result == true){
					$('#insert-form').submit();
// 					$('.title-input').val('Insert Success Message - 10265199');
					$('.content-input').val('Insert Success Message - 56013413');
				}
			}
		});
		$("#fileInput").on('change', function(){ 
	        
            // 값이 변경되면      
            var filename = $(this)[0].files;  // [806.png]-[20220112_105104.png]
            if(filename.length > 3){
                alert("파일은 최대 3개까지만 선택 가능합니다.");
                return false;
            }

            var str ='';
            $(filename).each(function(index, item){  //0: [806.png]- 1:[20220112_105104.png]
                if(filename.length-1 <= index) str += item.name;
                else str += item.name+',';
            });

            // 추출한 파일명 삽입 
            $("#userfile").val(str); 
        }); 
	});
</script>
</head>
<body>
<%@ include file="../template/manager_header.jsp" %>
	<div class="menu_flex"> 
		<h2>공지사항 작성</h2>
	</div>
	<div class="ntclistbtn">
		<button type="button" class="btn btn-secondary" onclick="javascript:location.href='/admin/getNoticeList'">목록</button>
	</div> 
	
	<form id="insert-form" action="/admin/insertNotice" method="post" enctype="multipart/form-data">
		<input type="hidden" name="ntc_mem_id" value="${userId}">
		<input type="hidden" name="pageNum" value="${param.pageNum}">
		<div class="insertList">
			<div class="container-fluid">
				<table>
					<tr>
						<th>제목</th>
						<td colspan="3"> 
							<div class="form-group">
								<input type="text" class="form-control title-input" id="usr" name="ntc_title" autocomplete="off">
							</div>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">
							<div class="form-group">
								<textarea class="form-control content-input" rows="15" id="comment" name="ntc_content" autocomplete="off"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th>공지대상</th>
						<td>
							<div class="form-group">
<!-- 								<input type="text" class="form-control target-input" id="usr" name="ntc_target"> -->
									<select id="target-select" name="ntc_target">
										<option value="choice" selected>선택</option>
										<option value="관리자">관리자</option>
										<option value="사용자">사용자</option>
									</select>
							</div>
						</td>
						<th>첨부파일</th>
						<td>
							<div class="form-group">
						        <input id="fileInput" type="file" class="form-control" name="uploadFile" style="position: absolute; clip: rect(0px 0px 0px 0px);" multiple="multiple">
						        <div class="bootstrap-filestyle input-group">
						            <input type="text" id="userfile" class="form-control" disabled>
						            <span class="group-span-filestyle input-group-btn" tabindex="0">
						                <label for="fileInput" class="btn btn-default"><span class="fa fa-upload"></span></label>
						            </span>
						        </div>
						    </div>
						</td>
					</tr>
				</table>
			</div>
		</div>
     <!-- <div class="attachement">
         <table style="width:100%">
             <div class="form-group"> 
                 <label for="InputSubject1">파일첨부</label> 
                 <input id="fileInput" filestyle="" type="file" data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);"> 
                 <div class="bootstrap-filestyle input-group"> 
                     <input type="text" id="userfile" class="form-control" name="userfile" disabled=""> 
                     <span class="group-span-filestyle input-group-btn" tabindex="0"> 
                         <label for="fileInput" class="btn btn-default"> 
                             <span class="glyphicon fa fa-upload"></span> 
                         </label> 
                     </span> 
                 </div> 
             </div>
         </table>
     </div> -->
		<div class="savebtn">
			<button type="button" class="btn btn-success insert-btn">등록</button>
		</div> 
	</form>

<%@ include file="../template/manager_footer.jsp" %>
</body>
</html>