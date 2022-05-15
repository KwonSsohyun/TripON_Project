<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/info_managementPage.css">
</head>
</head>
<script>
    $(function() {
		var nicknameCheckBoo = false;
		var phonenumCheckBoo = false;
		var passwordCheckBoo = false;
		var nickname, phoneNumber, authenticationNumber;
		var ni_icf = $('#nickname-input + .invalid-check-feedback');
		var pi_icf_1 = $('#phonenum-input-1 + .invalid-check-feedback');
		var pi_icf_2 = $('#phonenum-input-2 + .invalid-check-feedback');
		var pwi_icf_1 = $('#password-input-1 + .invalid-check-feedback');
		var pwi_icf_2 = $('#password-input-2 + .invalid-check-feedback');
		var pwi_icf_3 = $('#password-input-3 + .invalid-check-feedback');
		
    	$('.invalid-check-feedback').hide();
    	$('.certification-group-2').hide();
    	
    	// '수정' 버튼 클릭 시 input 요소 나타내고, '수정 취소' 버튼 클릭 시 input 요소 사라지게 하기
        $('.update-btn').click(function() {
            var id = $(this).attr("id");
            $('button#' + id + '+ div.update-group').toggle();
            $(this).toggle();
            var passwordInputWidth = $('#password-input-1').width();
        	console.log(passwordInputWidth);
        	$('#password-input-2').width(passwordInputWidth);
        	$('#password-input-3').width(passwordInputWidth);
        });
        $('.cancel-btn').click(function() {
            $(this).parent().prev().toggle();
            $(this).parent().toggle();
            var parent_id = $(this).parent().attr('id');
            $('#' + parent_id + ' input').val('');
            $('#' + parent_id + ' .invalid-check-feedback').text('');
        });
        
        $('.nicknameCheck-btn').click(function() {
	        nickname = $('#nickname-input').val().trim().replace(' ', '');
	        if(nickname == "${info_member.mem_nickname}") {
	        	$(ni_icf).text('* 기존 닉네임과 동일합니다.');
    			$(ni_icf).css('color', '#ff6500');
    			$(ni_icf).show();
    			nicknameCheckBoo = false;
	        } else if(nickname == '') {
	        	$(ni_icf).text('* 닉네임을 입력해주세요.');
        		$(ni_icf).show();
        		$(ni_icf).css('color', '#ff6500');
        		nicknameCheckBoo = false;
	        } else if(nickname.length > 10) {
	        	$(ni_icf).text('* 10자 이내로 입력해주세요.');
        		$(ni_icf).show();
        		$(ni_icf).css('color', '#ff6500');
        		nicknameCheckBoo = false;
	        } else {
		        $.ajax({
		        	async: true,
		        	type: 'POST',
		        	data: nickname,
		        	url: 'nicknameCheck',
		        	dataType: 'json',
		        	contentType: 'application/json; charset=UTF-8',
		        	success: function(data) {
		        		if(data > 0) {
		        			$(ni_icf).text('* 이미 사용 중인 닉네임입니다.');
		        			$(ni_icf).css('color', '#ff6500');
		        			$(ni_icf).show();
			        		nicknameCheckBoo = false;
		        		} else {
		        			$(ni_icf).text('* 사용 가능한 닉네임입니다.');
		        			$(ni_icf).css('color', '#5f04f9');
		        			$(ni_icf).show();
			        		nicknameCheckBoo = true;
		        		}
		        	},
		        	error : function() {
		        		console.log('error');
		        	}
		        });
	        }
        });
        
        // '닉네임 변경 input 요소에 포커싱 시 '중복확인' 버튼 활성화, 다른 곳에 포커싱이 옮겨졌을 시 '중복확인' 버튼 비활성화
        
        // form 태그의 기본 서브밋을 조건처리 하기 위한 함수
        var nicknameFormBoo = false;
        $('#nickname-form').submit(function() {
        	return nicknameFormBoo;
        });
        
        // '수정완료' 버튼을 클릭 시 입력받은 값의 유효성 검사를 실시하고 form 태그의 submit을 호출
        $('.nickname-submit-btn').click(function() {
        	if($('#nickname-input').val() == '' && nicknameCheckBoo == false) {
        		$(ni_icf).text('* 닉네임을 입력해주세요.');
        		$(ni_icf).css('color', '#ff6500');
        		$(ni_icf).show();
        		return false;
        	} else if(nicknameCheckBoo == false) {
        		$(ni_icf).text('* 중복확인을 해주세요.');
        		$(ni_icf).css('color', '#ff6500');
        		$(ni_icf).show();
        		return false;
        	} else if($('#nickname-input').val() != nickname) {
        		$(ni_icf).text('* 중복확인을 해주세요.');
        		$(ni_icf).css('color', '#ff6500');
        		$(ni_icf).show();
        		return false;
        	} else {
        		nicknameFormBoo = true;
        	}
        	$('#nickname-form').submit();
        	$('#nickname-input').val('');
        });
        $('.nickname-cancel-btn').click(function() {
        	nicknameCheckBoo = false
        });
        
        
        
        var phonenumFirstCheckBoo = false;
        var phonenumSecondCheckBoo = false;
        $('.certification-btn-1').click(function() {
        	phoneNumber = $('#phonenum-input-1').val();
        	var phoneNumberRegEx = /^01([0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$/;
        	if(!phoneNumberRegEx.test(phoneNumber)) {
        		$(pi_icf_1).text('* 전화번호 형식에 맞게 입력해주세요.');
        		$(pi_icf_1).show();
        		$(pi_icf_1).css('color', '#ff6500');
        		phonenumCheckBoo = false;
        		phonenumFirstCheckBoo = false;
        	} else if(phoneNumber == '${info_member.mem_phone}') {
        		$(pi_icf_1).text('* 기존 휴대폰 번호와 동일합니다.');
        		$(pi_icf_1).show();
        		$(pi_icf_1).css('color', '#ff6500');
        		phonenumCheckBoo = false;
        		phonenumFirstCheckBoo = false;
        	} else {
	        	$.ajax({
	        		async: true,
	        		type: 'POST',
	        		data: phoneNumber,
	        		url: 'AuthenticatePhoneNumber',
	        		dataType: 'json',
	        		contentType: 'application/json; charset=UTF-8',
	        		success: function(data) {
	        			authenticationNumber = data;
	        			alert(authenticationNumber);
	        			$('.certification-group-2').show();
	        			$('.certification-group-1').hide();
	        			$(pi_icf_2).text('* 인증번호가 전송되었습니다.');
		        		$(pi_icf_2).show();
		        		$(pi_icf_2).css('color', '#5f04f9');
		        		phonenumFirstCheckBoo = true;
	        		},
	        		error: function() {
	        			console.log('error');
	        			$(pi_icf_1).text('* 휴대폰 번호를 입력해주세요.');
		        		$(pi_icf_1).show();
		        		$(pi_icf_1).css('color', '#ff6500');
		        		phonenumFirstCheckBoo = false;
	        		}
	        	});
        	}
        });
        
        $('.certification-btn-2').click(function() {
       	var inputNumber = $('#phonenum-input-2').val();
        	if(inputNumber == authenticationNumber) {
        		$('#phonenum-input-2').attr('disabled', 'disabled');
        		$('.certification-btn-2').attr('disabled', 'disabled');
        		$(pi_icf_2).text('* 인증 성공!');
        		$(pi_icf_2).show();
        		$(pi_icf_2).css('color', '#5f04f9');
        		phonenumCheckBoo = true;
        		phonenumSecondCheckBoo = true;
        	} else if(inputNumber == '') {
        		$(pi_icf_2).text('* 인증번호를 입력해주세요.');
        		$(pi_icf_2).show();
        		$(pi_icf_2).css('color', '#ff6500');
        		phonenumCheckBoo = false;
        		phonenumSecondCheckBoo = false;
        	} else if(inputNumber != authenticationNumber) {
        		$(pi_icf_2).text('* 인증번호가 일치하지 않습니다.');
        		$(pi_icf_2).show();
        		$(pi_icf_2).css('color', '#ff6500');
        		phonenumCheckBoo = false;
        		phonenumSecondCheckBoo = false;
        	}
        });
        
        $('.phonenum-submit-btn').click(function() {
        	if(phonenumCheckBoo) {
        		$('#phonenumber-form').submit();
        		$('#phonenum-input-1').val('');
        		$('#phonenum-input-2').val('');
        	} else if(!phonenumCheckBoo && !phonenumFirstCheckBoo) {
        		$(pi_icf_1).text('* 휴대폰 인증을 완료해주세요.');
        		$(pi_icf_1).show();
        		$(pi_icf_1).css('color', '#ff6500');
        	} else if(!phonenumCheckBoo && !phonenumSecondCheckBoo) {
        		$(pi_icf_2).text('* 휴대폰 인증을 완료해주세요.');
        		$(pi_icf_2).show();
        		$(pi_icf_2).css('color', '#ff6500');
        	}
        });
        
        $('.phonenum-cancel-btn').click(function() {
        	$('#phonenum-input-2').removeAttr('disabled');
        	$('.certification-btn-2').removeAttr('disabled');
        	$('.certification-group-1').show();
			$('.certification-group-2').hide();
			phonenumCheckBoo = false;
			phonenumFirstCheckBoo = false;
			phonenumSecondCheckBoo = false;
        });
        
        var originalPhoneNumber = '${info_member.mem_phone}';
        if(originalPhoneNumber != null) {
        	var msg1 = originalPhoneNumber.substring(3, 7);
        	originalPhoneNumber = originalPhoneNumber.replace(msg1, '****');
        	$('#phonenumber-form .form-group .text-group span:last-child').text(originalPhoneNumber);
        }
        
        var passwordFirstCheckBoo = false;
        var passwordSecondCheckBoo = false;
        var passwordThirdCheckBoo = false;
       	var pw;
        $('#password-input-2').attr('disabled', 'disabled');
        $('#password-input-3').attr('disabled', 'disabled');
        $('.password-check-btn').click(function() {
        	pw = $('#password-input-1').val();
        	if($('#password-input-1').val() == '') {
        		$(pwi_icf_1).text('* 비밀번호를 입력해주세요');
        		$(pwi_icf_1).show();
        		$(pwi_icf_1).css('color', '#ff6500');
        		passwordCheckBoo = false;
        		passwordFirstCheckBoo = false;
        	} else {
        		$.ajax({
            		async: true,
            		type: 'POST',
            		data: pw,
            		url: 'info_checkPw',
            		dataType: 'json',
            		contentType: 'application/json; charset=UTF-8',
            		success: function(data) {
            			console.log(data);
            			if(data) {
            				$('#password-input-1').attr('disabled', 'disabled');
                    		$('.password-check-btn').attr('disabled', 'disabled');
                    		$('#password-input-2').removeAttr('disabled');
                    		$(pwi_icf_1).text('* 비밀번호가 확인되었습니다.');
                    		$(pwi_icf_1).show();
                    		$(pwi_icf_1).css('color', '#5f04f9');
                    		passwordFirstCheckBoo = true;
            			} else {
            				$(pwi_icf_1).text('* 비밀번호가 일치하지 않습니다.');
                    		$(pwi_icf_1).show();
                    		$(pwi_icf_1).css('color', '#ff6500');
                    		passwordCheckBoo = false;
                    		passwordFirstCheckBoo = false;
            			}
            		},
            		error: function() {
            			console.log('error');
            		}
            	});
        	}
        });
        
        $('#password-input-2').keyup(function() {
        	var pwRegEx = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/;
        	if($('#password-input-2').val() == '' || !pwRegEx.test($('#password-input-2').val())) {
        		$(pwi_icf_2).text('* 8~15자리의 영문/숫자/특수문자를 함께 입력해주세요.');
        		$(pwi_icf_2).show();
        		$(pwi_icf_2).css('color', '#ff6500');
        		$('#password-input-3').attr('disabled', 'disabled');
        		$('#password-input-3').val('');
        		passwordCheckBoo = false;
        		passwordSecondCheckBoo = false;
        	} else if($('#password-input-2').val() == pw) {
        		$(pwi_icf_2).text('* 기존 비밀번호와 동일합니다.');
        		$(pwi_icf_2).show();
        		$(pwi_icf_2).css('color', '#ff6500');
        		$('#password-input-3').attr('disabled', 'disabled');
        		$('#password-input-3').val('');
        		passwordCheckBoo = false;
        		passwordSecondCheckBoo = false;
        	} else if($('#password-input-3').val() != '' && $('#password-input-3').val() != $('#password-input-2').val()) {
        		$(pwi_icf_3).text('* 비밀번호가 일치하지 않습니다.');
        		$(pwi_icf_3).show();
        		$(pwi_icf_3).css('color', '#ff6500');
        		passwordCheckBoo = false;
        		passwordSecondCheckBoo = false;
        	} else {
        		$(pwi_icf_2).text('* 적합한 비밀번호입니다.');
        		$(pwi_icf_2).show();
        		$(pwi_icf_2).css('color', '#5f04f9');
        		$('#password-input-3').removeAttr('disabled');
        		passwordSecondCheckBoo = true;
        	}
        });
        
        $('#password-input-3').keyup(function() {
        	if($('#password-input-3').val() == $('#password-input-2').val()) {
        		$(pwi_icf_3).text('* 비밀번호가 일치합니다.');
        		$(pwi_icf_3).show();
        		$(pwi_icf_3).css('color', '#5f04f9');
        		passwordCheckBoo = true;
        		passwordThirdCheckBoo = true;
        	} else {
        		$(pwi_icf_3).text('* 비밀번호가 일치하지 않습니다.');
        		$(pwi_icf_3).show();
        		$(pwi_icf_3).css('color', '#ff6500');
        		passwordCheckBoo = false;
        		passwordThirdCheckBoo = false;
        	}
        });
        
        $('.password-submit-btn').click(function() {
        	if(passwordCheckBoo) {
        		$('#password-form').submit();
        		$('#password-input-1').val('');
        		$('#password-input-2').val('');
        		$('#password-input-3').val('');
        		$('#password-input-1').removeAttr('disabled');
        		$('.password-check-btn').removeAttr('disabled');
        		$('#password-input-2').attr('disabled', 'disabled');
                $('#password-input-3').attr('disabled', 'disabled');
        	} else if(!passwordCheckBoo && !passwordFirstCheckBoo) {
        		$(pwi_icf_1).text('* 기존 비밀번호를 확인해주세요.');
        		$(pwi_icf_1).show();
        		$(pwi_icf_1).css('color', '#ff6500');
        	} else if(!passwordCheckBoo && !passwordSecondCheckBoo) {
        		$(pwi_icf_2).text('* 새로운 비밀번호를 확인해주세요.');
        		$(pwi_icf_2).show();
        		$(pwi_icf_2).css('color', '#ff6500');
        	} else if(!passwordCheckBoo && !passwordThirdCheckBoo) {
        		$(pwi_icf_3).text('* 비밀번호 일치여부를 확인해주세요.');
        		$(pwi_icf_3).show();
        		$(pwi_icf_3).css('color', '#ff6500');
        	}
        });
        
        $('.password-cancel-btn').click(function() {
        	$('#password-input-1').removeAttr('disabled');
    		$('.password-check-btn').removeAttr('disabled');
    		$('#password-input-2').attr('disabled', 'disabled');
            $('#password-input-3').attr('disabled', 'disabled');
        	passwordCheckBoo = false;
    		passwordFirstCheckBoo = false;
    		passwordSecondCheckBoo = false;
    		passwordThirdCheckBoo = false;
        });
        
        $(window).resize(function() {
        	var passwordInputWidth = $('#password-input-1').width();
        	console.log(passwordInputWidth);
        	$('#password-input-2').width(passwordInputWidth);
        	$('#password-input-3').width(passwordInputWidth);
        });
        
    });
</script>
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
     <div id="info-mng-div">
         <div class="info-main">
             <p>내 정보 수정</p>
         </div>
         <div class="information-update-input-group">

             <form action="/info_updateNickname" id="nickname-form" method="post">
             	 <input type="hidden" name="mem_id" value="${userId}">
                 <div class="form-group">
                     <div class="text-group">
                         <span>닉네임</span>
                         <span>${info_member.mem_nickname}</span>
                     </div>
                     <button type="button" class="btn update-btn" id="update-btn1">수정</button>
                     <div class="update-group" id="ug1">
                   		 <div class="nicknameCheck-group">
	                   		 <div class="nickname-input-group">
			                     <input id="nickname-input" type="text" class="form-control" placeholder="체크인시 필요한 정보입니다." name="mem_nickname" required>
			                     <div class="invalid-check-feedback"></div>
	                   		 </div>
                             <button type="button" class="btn nicknameCheck-btn">중복확인</button>
                   		 </div>
	                     <button type="button" class="btn submit-btn nickname-submit-btn">수정 완료</button>
	                     <button type="button" class="btn nickname-cancel-btn cancel-btn">수정 취소</button>
                     </div>
                 </div>
             </form>
             <form action="/info_updatePhone" id="phonenumber-form" method="post">
             	 <input type="hidden" name="mem_id" value="${userId}">
                 <div class="form-group">
                     <div class="text-group">
                         <span>휴대폰 번호</span>
                         <span></span>
                     </div>
                     <button type="button" class="btn update-btn" id="update-btn3">수정</button>
                     <div class="update-group" id="ug3">
                         <div class="certification-group-1">
                             <div class="phonenum-input-group">
                                 <input id="phonenum-input-1" type="text" class="form-control" placeholder="'-'를 뺀 새 번호를 입력하세요." name="mem_phone" required>
                                 <div class="invalid-check-feedback"></div>
                             </div>
                             <button type="button" class="btn certification-btn-1">인증번호 요청</button>
                         </div>
                         <div class="certification-group-2">
                             <div class="phonenum-input-group">
                                 <input id="phonenum-input-2" type="text" class="form-control" placeholder="인증번호를 입력하세요." required>
                                 <div class="invalid-check-feedback"></div>
                             </div>
                             <button type="button" class="btn certification-btn-2">인증번호 확인</button>
                         </div>
                         <button type="button" class="btn submit-btn phonenum-submit-btn">수정 완료</button>
                         <button type="button" class="btn cancel-btn phonenum-cancel-btn">수정 취소</button>
                     </div>
                 </div>
             </form>
             <form action="/info_updatePw" id="password-form" method="post">
             	 <input type="hidden" name="mem_id" value="${userId}">
                 <div class="form-group">
                     <div class="text-group">
                         <span>비밀번호 변경</span>
                         <span></span>
                     </div>
                     <button type="button" class="btn update-btn" id="update-btn4">수정</button>
                     <div class="update-group password-group" id="ug4">
                         <div class="form-group">
                             <label>기존 비밀번호</label>
                             <div class="password-gourp-1">
	                             <div class="password-input-group">
		                             <input id="password-input-1" type="password" class="form-control" placeholder="기존 비밀번호를 입력해 주세요." required>
		                             <div class="invalid-check-feedback"></div>
	                             </div>
	                             <button type="button" class="btn password-check-btn">비밀번호 확인</button>
                             </div>
                         </div>
                         <div class="form-group">
                             <label>새 비밀번호</label>
                             <input id="password-input-2" type="password" class="form-control" placeholder="영문/숫자/특수 포함 8~15자" name="mem_pw" required>
                             <div class="invalid-check-feedback"></div>
                         </div>
                         <div class="form-group">
                             <label>새 비밀번호 확인</label>
                             <input id="password-input-3" type="password" class="form-control" placeholder="새 비밀번호를 재입력해주세요." required>
                             <div class="invalid-check-feedback"></div>
                         </div>
                         <button type="button" class="btn submit-btn password-submit-btn">수정 완료</button>
                         <button type="button" class="btn cancel-btn password-cancel-btn">수정 취소</button>
                     </div>
                 </div>
             </form>

         </div>
     </div>
 </div>

<%@ include file="./template/footer.jsp" %>
</body>
</html>