<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminInsert.css">
</head>
<body>
<%@ include file="../template/manager_header.jsp" %>
<script type="text/javascript">
	$(function() {
		var isSuper = '${isSuper}';
		if(isSuper != 'Y') {
			alert('잘못된 접근입니다.');
			history.back();
		}
		
		$('.menu-item-text-1').click();
		$('.menu-item-text-1-mobile').click();
		$('.user-management-menu img').attr('src', '/resources/imgs/user_management_black.png');
		$('.user-management-menu a').css('color', '#000000');
		$('.user-management-menu-2 a').css('color', '#5622ad');
		$('.user-management-menu').css('border-color', '#5622ad');
		$('.extend-btn-1').css('color', '#000000');
		$('.extend-btn-2').css('color', '#000000');
		$('.extend-btn-1-mobile').css('color', '#000000');
		$('.extend-btn-2-mobile').css('color', '#000000');
	});
</script>
<h2>관리자 신규 등록</h2>
<br><br>
<div class="container-fluid">
<div class="adminInsert">
	
	<form action="/admin/adminInsert" class="needs-validation" novalidate method="POST">
	
	<div class="id insert-inner-div sm-display-block-div" style="display: flex;">
		<label for="userid" class="col-3 inner-div-col"><span>* </span>아이디</label>
		<div style="display: flex" class="col-9 inner-div-col">
			<input type="text" maxlength="10" class="valid-check insert-inner-input" name="mem_id" id="userid" placeholder="아이디를 입력해주세요.">
			<button type="button" id="id_request" value="중복확인" onclick="idCheck()">중복확인</button>
		</div>
	</div>
	
	<div class="subject_underline"></div>
	
	<div class="pw insert-inner-div sm-display-block-div" style="display: flex;">
		<label for="userpw"  class="col-3 inner-div-col"><span>* </span>비밀번호</label>
		<div class="col-9 inner-div-col">
			<input type="password" maxlength="15"  class="valid-check insert-inner-input" name="mem_pw" id="userpw" placeholder="비밀번호를 입력해주세요.">
		</div>
	</div>
	
	<div class="subject_underline"></div>
	
	<div class="name insert-inner-div sm-display-block-div" style="display: flex;">
		<label for="username" class="col-3 inner-div-col"><span>* </span>이름</label>
		<div class="col-9 inner-div-col">
			<input type="text" maxlength="10" class="valid-check insert-inner-input" name="mem_username" id="username" placeholder="이름을 입력해주세요.">
		</div>
	</div>
	
	<div class="subject_underline"></div>
	
	<div class="nickname insert-inner-div sm-display-block-div" style="display: flex;">
		<label for="usernickname" class="col-3 inner-div-col"><span>* </span>닉네임</label>
		<div class="col-9 inner-div-col">
			<input type="text" maxlength="10" class="valid-check insert-inner-input" name="mem_nickname" id="usernickname" placeholder="닉네임을 입력해주세요.">
		</div>
	</div>
	
	<div class="subject_underline"></div>
	
	<div class="phonenumber insert-inner-div sm-display-block-div" style="display:flex">
		<label for="phone" class="col-sm-3 inner-div-col"><span>* </span>휴대폰 번호</label>
		<div class="col-9 inner-div-col" style="margin-top: 10px;">
			<div class="row phone-group">	
				<div class="col-4 inner-div-col">
					<select name="mem_phone_01" id="phone" class="select-valid-check">
						<option value="010" selected="selected">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
				</div>		
				<div class="col-4 inner-div-col phone-group-input">
					<div>&nbsp;-&nbsp;</div>
					<input type="tel" name="mem_phone_02" class="valid-check" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
				</div>
				<div class="col-4 inner-div-col phone-group-input">
					<div>&nbsp;-&nbsp;</div>
					<input type="tel" name="mem_phone_03" class="valid-check" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
				</div>
			</div>		
		</div>	
	</div>     

	<div class="subject_underline"></div>

	<div class="email insert-inner-div sm-display-block-div" style="display: flex;">
		<label for="useremail" class="col-sm-3 inner-div-col"><span>* </span>이메일주소</label>
		<div class="col-9 inner-div-col">
			<input type="email" maxlength="50" class="valid-check insert-inner-input" name="mem_email" id="useremail" placeholder="이메일주소를 입력해주세요.">
		</div>
	</div>
	
	<div class="subject_underline"></div>
	
	<div class="permission insert-inner-div sm-display-block-div" style="display: flex;">
		<label for="admin" class="col-3 inner-div-col"><span>* </span>권한</label>
		<div class="col-9 inner-div-col">
			<input type="text" class="valid-check insert-inner-input" name="mem_is_super" id="admin" value="Y" placeholder="관리자" readonly>
		</div>
	</div>
	
	<div class="subject_underline"></div>
	
	<div class="address insert-inner-div sm-display-block-div" style="display: flex;">	
	    <label for="useraddress" class="col-3 inner-div-col">주소</label>
	    <div class="col-9 inner-div-col" style="width : 500px;">
			<div>
				<button type="button" value="우편번호" onclick="sample6_execDaumPostcode()">우편번호</button>
				<input type="text" name="mem_address_01" id="sample6_postcode" placeholder="우편번호" readonly style="margin-left: 5px; width: 120px;">
			</div>
			<div>
				<input type="text" class="col-12" name="mem_address_02" id="sample6_address" placeholder="우편번호주소" readonly>
				<input type="text" maxlength="50" class="col-12" name="mem_address_03" id="sample6_detailAddress" placeholder="상세주소">
			</div>
	    </div>
	</div>
		
	<div class="subject_underline"></div>

	<div class="submit">
		<a href="adminList"><input type="button" value="목록" style="background-color: #000000; margin-right: 5px;"></a>
		<input type="submit" value="등록완료" onclick="sum()">
	</div>
	</form>
</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
		
	var flg = false;
	
	
	// 아이디 중복 체크
	function idCheck(){
			
			var id = $("input[name=mem_id]").val();
			id.trim();
			
			// 공백 체크
			var str_space = /\s/;               
	        if(str_space.exec(id)) {    
	            alert("해당 항목에는 공백을 사용할 수 없습니다.\n공백 제거됩니다.");
	            document.getElementById('userid').focus();
	            $('#userid').val('');
	            return false;
	        }
	
			
			if(id == '' || id == null){
				alert('아이디 입력 해주세요.');
				document.getElementById('userid').focus();
				return false;
				
			}
		
			$.ajax({
				type : "post",
				url : "/idCheckServlet",
				data : {"mem_id" : id},
				success : function(data){
					// alert("ajax success");
					if(data <= 0){
						alert("아이디 사용하실 수 있습니다.");
						flg = true;
						$("#userid").attr("readonly",true);
						
					} else { 
						alert("아이디를 사용하실 수 없습니다.");
						flg = false;
					}
				},
				error : function(){
					alert("ajax error");
				}
			});
	}
		
		
		(function() {
			'use strict';
			window.addEventListener('load', function() {
				var forms = document.getElementsByClassName('needs-validation');
				var validation = Array.prototype.filter.call(forms, function(form) {
					form.addEventListener('submit', function(event) {
						var inputArray = $('.valid-check');
						var boo = true;
						for(var i = 0; i < inputArray.length; i++) {
							if(inputArray[i].value == '') {
								if($(inputArray[i]).attr('name') == 'mem_phone_02' || $(inputArray[i]).attr('name') == 'mem_phone_03') {
									var text = $(inputArray[i]).parent().parent().parent().parent().children('label').text();
									alert(text.substring(1) + '를 입력해주세요.');
									boo = false;
									event.preventDefault();
									break;
								} else {
									var text = $(inputArray[i]).parent().parent().children('label').text();
									alert(text.substring(1) + '를 입력해주세요.');
									boo = false;
									event.preventDefault();
									break;
								}
							}
						}
						var select = $('.select-valid-check');
						if(boo && $(select).val() == 'select'){
							alert('번호를 입력해주세요.');
							boo = false;
							event.preventDefault();
						}
						
						
						
						// 비밀번호 정규표현식
// 						var pw = document.getElementsByName('mem_pw')[0].value;
						
// 						var regPW = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,10}$/;
// 						if(boo && regPW.test(pw) === false){
// 							alert("비밀번호 8~15자리의 영문/숫자/특수문자를 함께 입력해주세요.")
// 							boo = false;
// 							event.preventDefault();
// 						}
						
						
						
						
						// 휴대번호 정규표현식
					    var m1 = document.getElementsByName('mem_phone_01')[0].value;
					    var m2 = document.getElementsByName('mem_phone_02')[0].value;
					    var m3 = document.getElementsByName('mem_phone_03')[0].value;

					    var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
					    if (boo && regPhone.test(m1+"-"+m2+"-"+m3) === false) {
					          alert('휴대전화 형식에 맞게 입력해주세요.');
					          boo = false;
					          event.preventDefault();
					          
					    }
						
					    
					    
					    // 이메일 정규표현식
					    var text = document.getElementsByName('mem_email')[0].value;

      					var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
      					if (boo && regEmail.test(text) === false) {
        					  alert('이메일 형식에 맞게 입력해주세요.');
        					  boo = false;
        					  event.preventDefault();
      					}
					    
					    
						if(boo && !$('input[type=email]').val().includes('@') && !$('input[type=email]').val().includes('.com')){
							alert('이메일 주소를 확인해주세요.');
							$('input[type=email]').val('');
							boo = false;
							event.preventDefault();
						}
						
					}, false);
				});
			}, false);
		})();
		
		function sum(){
			if(flg == false){
				alert("아이디 중복확인 부탁드립니다.");
				event.preventDefault();
			}
		}
		
		function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	            	
	            	// 처음에는 빈값 넣기
	            	$('#sample6_postcode').val('');
	            	$('#sample6_address').val('');
	            	$('#sample6_detailAddress').val('');
	            	
	            	
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    // document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } 
	                /* else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                } */

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
		
		
</script>
</body>
<%@ include file="../template/manager_footer.jsp" %>
</html>