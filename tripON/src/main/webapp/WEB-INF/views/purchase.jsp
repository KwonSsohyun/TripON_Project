<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.tripon.biz.purchase.PurchaseVO" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./template/head.jsp" %>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script><!-- jQuery CDN --->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

var chk = false;

    $(document).ready(function(){
    	
    	var IMP = window.IMP;
    	IMP.init('${impKey}');
    	
    	var windowWidth = $(window).width();
    	var emailall = '${userinfo[0].mem_email}';
    	var emailafter = (emailall.split("@"))[0];
    	var emailbefore = (emailall.split("@"))[1];
    	if(emailbefore != null) {
    		if(windowWidth > 575) {
    			$("#beforeEmail").val(emailafter);
    			if(emailbefore == 'naver.com' || emailbefore == 'kakao.com' || emailbefore == 'gmail.com' || emailbefore == 'hotmail.com'){
        			$("#emailSelect").val(emailbefore).prop("selected", true);	
        			$("#afterEmail").val(emailbefore);
    	            $("#afterEmail").attr("readonly", true);
        		} else {
        			$("#emailSelect option:eq(5)").prop("selected",true);
        			$("#afterEmail").val(emailbefore);
        			$("#afterEmail").attr("readonly", false);
        		}
    		} else {
    			$("#beforeEmail").val(emailall);
    		}
    	}
    	
    	
    	if($('#productOption02').text().length >= 8) {
    		$('#productDetailLine02').css('display', 'block');
    	}
    	if($('#productOption03').text().length >= 8) {
    		$('#productDetailLine03').css('display', 'block');
    	}
    	if($('#productOption04').text().length >= 8) {
    		$('#productDetailLine04').css('display', 'block');
    	}
    	
	    $("#checkBoxId").change(function(){
	        if($("#checkBoxId").is(":checked")){
	            $('#purchaseFormButton').css('background-color', '#5F04F9')
	        }else{
	            $('#purchaseFormButton').css('background-color', 'gray')
	        }
	    });
	    
	    $("#emailSelect").change(function() {
	        var select = $('#emailSelect').val();
	        if(select == "") {
	            $("#afterEmail").val("");
	            $("#afterEmail").attr("readonly", false);
	        } else {
	            $("#afterEmail").val(select);
	            $("#afterEmail").attr("readonly", true);
	        }
	    });
	
	    $("#purchaseFormButton").on('click', function(){
	        var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	        var getName= RegExp(/^[가-힣]+$/);
	        var getNum = /^[0-9]*$/;
	
	        var status = 1;
	
	        if($("#inputName").val().length < 1) {
	            $('#errorName').css('visibility', 'visible');
	            $('#errorName').text("이름을 입력해주세요.");
	            status = 0;
	        } else if(!getName.test($("#inputName").val())) {
	            $('#errorName').css('visibility', 'visible');
	            $('#errorName').text("한글만 입력해주세요");
	            status = 0;
	        } else if($("#inputName").val().length > 30) {
	        	$('#errorName').css('visibility', 'visible');
	            $('#errorName').text("30자를 넘길 수 없습니다.");
	        } else {
	            $('#errorName').css('visibility', 'hidden');
	        }
	
	        if($("#inputPhone").val().length < 1) {
	            $('#errorPhone').css('visibility', 'visible');
	            $('#errorPhone').text("전화번호를 입력해주세요.");
	            status = 0;
	        } else if(!($.isNumeric($('#inputPhone').val()))) {
	            $('#errorPhone').css('visibility', 'visible');
	            $('#errorPhone').text("숫자만 입력하세요.");
	            status = 0;
	        } else if($("#inputPhone").val().length != 11) {
	        	$('#errorPhone').css('visibility', 'visible');
	            $('#errorPhone').text("11자리 숫자를 입력하세요.");
	            status = 0;
	        } else {
	            $('#errorPhone').css('visibility', 'hidden');
	        }
	        
	        var umail = $("#beforeEmail").val() + "@" +  $("#afterEmail").val();
	
	        if($("#beforeEmail").val().length < 1 || !getMail.test(umail)) {
	            $('#errorEmail').css('visibility', 'visible');
	            status = 0;
	        } else {
	            $('#errorEmail').css('visibility', 'hidden');
	            $('#umail').val(umail);
	        }
	
	        if($('#checkBoxId').is(':checked') == false && status == 1) {
                alert("약관에 동의해주셔야 결제가 진행됩니다.");
                status = 0;
	        } 
	        
	        
	        
	        if(status == 0) {
	            return false;
	        } else {
	        	$('#pur_user_name').val($('#inputName').val());
		        $('#pur_act_title').val($('#productName').text());
		        $('#pur_price').val(parseInt($("#finalprice").text()));
		        $('#pur_purchaseDate').val('<%= new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm").format(new Date()) %>');
		        
		        var qmsg = 'http://www.tripon.cf/purchaseMobile?';
		        qmsg += 'pur_user_id=${userId}';
		        qmsg += '&pur_user_name='+$('#inputName').val();
		        qmsg += '&pur_act_title='+$('#productName').text();
		        qmsg += '&pur_price='+parseInt($("#finalprice").text());
		        qmsg += '&pur_purchaseDate='+'<%= new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm").format(new Date()) %>';
		        qmsg += '&pur_opt_name_1=${detail.productOption01}';
		        qmsg += '&pur_opt_name_2=${detail.productOption02}';
		        qmsg += '&pur_opt_name_3=${detail.productOption03}';
		        qmsg += '&pur_opt_name_4=${detail.productOption04}';
		        qmsg += '&pur_opt_count_1=${detail.optionCount01}';
		        qmsg += '&pur_opt_count_2=${detail.optionCount01}';
		        qmsg += '&pur_opt_count_3=${detail.optionCount01}';
		        qmsg += '&pur_opt_count_4=${detail.optionCount01}';
		        qmsg += '&pur_statenum=1';
		        qmsg += '&pur_bookingDate=${detail.productDate}';
		        qmsg += '&act_num=${detail.act_num}';
		        
	        	IMP.request_pay({
	    			pg: 'inicis', // 자신이 설정한 pg사 설정
	    			pay_method: 'card',
	    			merchant_uid: 'merchant_' + new Date().getTime(),
	    			name: $('#productName').text(),
	    			amount: parseInt($("#finalprice").text()),
	    			buyer_email: umail ,
	    			buyer_name: $("#inputName").val() ,
	    			buyer_tel: $("#inputPhone").val() ,
 	    			m_redirect_url: qmsg
	    			}, function (rsp) {
	    				console.log(rsp);
	    				if (rsp.success) {
	    					$("#imp_uid").val(rsp.imp_uid);
	    					$("#merchant_uid").val(rsp.merchant_uid);
	    					chk = true;
	    				} else {
	    					var msg = '결제에 실패하였습니다.';
	    					msg += '\n에러내용 : ' + rsp.error_msg;
	    					alert(msg);
	    				}
	    				if(chk==true) {
	    					$('#pur_impId').val(rsp.imp_uid);
	    			        $('#pur_merchantId').val(rsp.merchant_uid);
	    					orderList();
	    				}
	    		});
	        }
	   	});
	});
    
    function orderList(){
    	let fm = document.fm;
    	fm.action ="purchaseok";
    	fm.method="post";
    	fm.submit();
    }
    </script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/purchase.css">
</head>
<body>
<%@ include file="./template/header.jsp" %>
    <form name="fm">
    <div class="container" id="body">
        <div id="purchaseTitle" >
            <p>주문결제</p>
        </div>
        <div class="product">
            <div class="col-8 con con1"><p>주문 상품</p></div>
            <div class="col-4 con con2"><p>가격</p></div>
        </div>
        <br>
        <div class="row productContext">
            <div class="col-lg-8 col-sm-8 productCon">
                <div>
                    <div id="productNameLine"><b>상품이름 :&nbsp;</b><b id="productName">${detail.productName }</b></div>
                    	<p id="productDate">예약일자 : ${detail.productDate }</p>
                    <div id="productDetailLine">
                    <table>
                    <tr id="productDetailLine01" >
                    	<td class="productsize"><p id="productOption01">상품옵션 : ${detail.productOption01 }</p></td>
                    	<td class="productCount"><p id="productCount01">&nbsp;&nbsp;&nbsp;&nbsp;${detail.optionCount01 }개</p></td>
                    </tr>
                    <tr id="productDetailLine02" style="display: none;">
                    	<td class="productsize"><p id="productOption02">상품옵션 : ${detail.productOption02 }</p></td>
                    	<td class="productCount"><p id="productCount02">&nbsp;&nbsp;&nbsp;&nbsp;${detail.optionCount02 }개</p></td>
                    </tr>
                    <tr id="productDetailLine03" style="display: none;">
                    	<td class="productsize"><p id="productOption03">상품옵션 : ${detail.productOption03 }</p></td>
                    	<td class="productCount"><p id="productCount03">&nbsp;&nbsp;&nbsp;&nbsp;${detail.optionCount03 }개</p></td>
                    </tr>
                    <tr id="productDetailLine04" style="display: none;">
                    	<td class="productsize"><p id="productOption04">상품옵션 : ${detail.productOption04 }</p></td>
                    	<td class="productCount"><p id="productCount04">&nbsp;&nbsp;&nbsp;&nbsp;${detail.optionCount04 }개</p></td>
                    </tr>
                    </table>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-4 productPrice">
                <br><br><br>
                <p>${detail.priceint }원</p>
                <br><br>
            </div>
        </div>
        <hr>
        <br>
        <div id="secondBox">
            <div class="col-lg-7 col-sm-12 secondBoxUser">
                <div class="con conUser">
                    <p>주문자 정보</p>
                </div>
                <br>
                <div id="userinput">
                    <ul class="user">
                        <li>이름</li>
                        <li>전화번호</li>
                        <li>이메일</li>
                    </ul>
                    <div class="inputText">
                        <input name="unm" type="text" class="form-control" id="inputName" value="${userinfo[0].mem_username }" required>
                        <p class="errormessage" id="errorName">이름을 올바르게 입력해주세요.</p>
                        <input name="utel" type="text" class="form-control" id="inputPhone" value="${userinfo[0].mem_phone }" required>
                        <p class="errormessage" id="errorPhone">올바르게 입력해주세요.</p>
                        <div class="email-input-group">
                            <input type="text" class="form-control" id="beforeEmail" value="" required><span>&nbsp;@&nbsp;</span>
                            <input id="afterEmail" type="text" value="" class="form-control" readonly="readonly" required>
                            <select id="emailSelect">
                                <option value=" ">선택하세요</option>
                                <option value="naver.com">naver.com</option>
                                <option value="kakao.com">kakao.com</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="hotmail.com">hotmail.com</option>
                                <option value="">직접 입력</option>
                            </select>
                            <input id="umail" name="umail" type="hidden" value="">
                        </div>
                        <p class="errormessage" id="errorEmail">이메일을 올바르게 입력해주세요.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-1 blankbox">&nbsp;</div>
            <div class="col-lg-4 col-sm-12" id="purchaseBox">
                <div id="finalPurchase">
                    <p>최종 결제 금액</p>
                    <hr>
                    <div><p id="finalprice">${detail.priceint }원</p></div>
                    <div id="purchaseCheck">
                        <input class="checkbox" id="checkBoxId" type="checkbox">
                        <label for="checkBoxId"></label>
                        <label id="checklabel" for="checkBoxId">구매하실 상품의 판매조건을 명확히 확인하였으며,<span><br></span> 이에 동의합니다. (전자상거래법 제8조 2항)</label>
                    </div>
                </div>
                <div id="purchaseButton">
                    <a id="purchaseFormButton">결제하기</a><br>
                    <a href="javascript:window.history.back();">결제취소</a>
                </div>
            </div>
        </div>
        <br>
        <hr>
    </div>
    <input type="hidden" id="pur_impId" name="pur_impId" value="">
    <input type="hidden" id="pur_merchantId" name="pur_merchantId" value="">
    <input type="hidden" id="pur_user_id" name="pur_user_id" value="<%= (String)session.getAttribute("userId") %>">
    <input type="hidden" id="pur_user_name" name="pur_user_name" value="">
    <input type="hidden" id="pur_act_title" name="pur_act_title" value="">
    <input type="hidden" id="pur_price" name="pur_price" value="${detail.priceint }">
    <input type="hidden" id="pur_opt_name_1" name="pur_opt_name_1" value="${detail.productOption01 }">
    <input type="hidden" id="pur_opt_name_2" name="pur_opt_name_2" value="${detail.productOption02 }">
    <input type="hidden" id="pur_opt_name_3" name="pur_opt_name_3" value="${detail.productOption03 }">
    <input type="hidden" id="pur_opt_name_4" name="pur_opt_name_4" value="${detail.productOption04 }">
    <input type="hidden" id="pur_opt_count_1" name="pur_opt_count_1" value="${detail.optionCount01 }">
    <input type="hidden" id="pur_opt_count_2" name="pur_opt_count_2" value="${detail.optionCount02 }">
    <input type="hidden" id="pur_opt_count_3" name="pur_opt_count_3" value="${detail.optionCount03 }">
    <input type="hidden" id="pur_opt_count_4" name="pur_opt_count_4" value="${detail.optionCount04 }">
    <input type="hidden" id="pur_statenum" name="pur_statenum" value="1">
    <input type="hidden" id="pur_purchaseDate" name="pur_purchaseDate" value="">
    <input type="hidden" id="pur_bookingDate" name="pur_bookingDate" value="${detail.productDate }">
</form>
<%@ include file="./template/footer.jsp" %>
</body>
</html>




