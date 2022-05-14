<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ include file="../template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_insertActivity.css">
<script type="text/javascript">
    $(function() {
        $('.package-management-menu img').attr('src', '/resources/imgs/package_management_black.png');
        $('.package-management-menu a').css('color', '#000000');
        $('.package-management-menu').css('border-color', '#5622ad');
    });
</script>
<script type="text/javascript">
$(function() {
	var isSuper = '${isSuper}';
	if(isSuper != 'Y') {
		alert('잘못된 접근입니다.');
		history.back();
	}
	
});

	// 카테고리
	function categoryOnChange(event) {
		let idx = event.selectedIndex;
        let addCategory = document.getElementById('addCategory');
        
        if (idx !== 0) {
        	addCategory.disabled = true;
        	$('#categoryH2').hide();
    	    $('#category').hide();
    	    $('#mainCategory').hide();
    	    $('#category_name').val('');
        } else if (idx == 0) addCategory.disabled = false;
	}
	
	let chk = false;
	
	// 상품등록
	function insertController() {
		let form = document.insertForm;
		form.action = '/admin/insertActivity';
		form.enctype = "multipart/form-data";
		form.method = 'POST';
		form.submit();
	}
	
	// 카테고리목록 선택하지 않으면 true
	function check() {
		if ($("#categoryCheck").val() !== "") chk = true;
		return chk;
	}
	
	$(document).ready(function() {
		// 새로운 카테고리 추가
		$('#categoryH2').hide();
	    $('#category').hide();
	    $('#mainCategory').hide();
	    $('#addCategory').click(function() {
	    	$('#categoryH2').toggle();
	        $('#category').toggle();
	        $('#mainCategory').toggle();
	    });
	});
</script>
</head>
<body>
<%@ include file="../template/manager_header.jsp" %>
<!-- header -->

<section>
	<div class="container">
		<form name="insertForm">
            <!-- ============ 카테고리목록 ============ -->
            <h2>카테고리 목록</h2>
            <div id="selectCategory" class="input-group col-4 mb-3">
                <select class="custom-select" id="categoryCheck" name="categoryCheck" onchange="categoryOnChange(this)">
                	<option value="" selected>지역선택</option>
                	<c:forEach items="${categoryList}" var="category">
                    	<option value="${category.category_name}">${category.category_name}</option>
                    </c:forEach>
                </select>
            </div>
            <!-- ============ 카테고리명 ============ -->
            <button id="addCategory" type="button" class="btn btn-primary">새로운 카테고리 추가</button>
            <h2 id="categoryH2">카테고리 추가</h2>
			<div class="input-group mb-3" id="category">
			    <div class="input-group-prepend">
			        <span class="input-group-text">카테고리명</span>
			    </div>
			    <input maxlength="20" type="text" class="form-control" id="category_name" name="category_name" placeholder="카테고리명을 입력하세요.">
			</div>
            <!-- ============ 카테고리 썸네일 ============ -->
            <div class="input-group mb-3" id="mainCategory">
                <div class="input-group-prepend">
                    <span class="input-group-text">카테고리 썸네일</span>
                </div>
                <input type="file" class="form-control border" id="category_img" name="category_img">
            </div>
            <hr>
            <!-- ============ 분류카테고리 썸네일 ============ -->
            <h2>상품목록 썸네일</h2>
            <div class="input-group mb-3" id="subCategory">
                <div class="input-group-prepend">
                    <span class="input-group-text">상품 목록 썸네일</span>
                </div>
                <input type="file" class="form-control border" name="act_thumbImg">
            </div>
	        <hr>
            <!-- ============ 상품명 ============ -->
            <h2>상품명&작성자</h2>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">*상품명</span>
                </div>
                <input maxlength="100" type="text" class="form-control" name="act_mainTitle" placeholder="상품명을 입력하세요." required>
            </div>
            <!-- ============ 상품명 부가설명 ============ -->
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">*상품 부가설명</span>
                </div>
                <input maxlength="100" type="text" class="form-control" name="act_subTitle" placeholder="상품의 부가설명을 입력하세요" required>
            </div>
            <!-- ============ 작성자 ============ -->
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">*작성자</span>
                </div>
                <input maxlength="20" type="text" class="form-control" name="act_writer" required>
            </div>
            <hr>
            <!-- ============ 상품옵션&상품가격 ============ -->
            <h2>상품옵션 입력</h2>
            <div id="packagePlace">
                <div class="input-group mb-3" id="addOption01">
                    <div class="input-group-prepend">
                        <span class="input-group-text">상품옵션1</span>
                    </div>
                    <input maxlength="60" type="text" class="form-control" name="act_optName1">
                    <div class="input-group-prepend">
                        <span class="input-group-text">상품가격</span>
                    </div>
                    <input maxlength="8" type="number" class="form-control" name="act_optPrice1" value="0">
                </div>

                <div class="input-group mb-3" id="addOption02">
                    <div class="input-group-prepend">
                        <span class="input-group-text">상품옵션2</span>
                    </div>
                    <input maxlength="60" type="text" class="form-control" name="act_optName2">
                    <div class="input-group-prepend">
                        <span class="input-group-text">상품가격</span>
                    </div>
                    <input maxlength="8" type="number" class="form-control" name="act_optPrice2" value="0">
                </div>

                <div class="input-group mb-3" id="addOption03">
                    <div class="input-group-prepend">
                        <span class="input-group-text">상품옵션3</span>
                    </div>
                    <input maxlength="60" type="text" class="form-control" name="act_optName3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">상품가격</span>
                    </div>
                    <input maxlength="8" type="number" class="form-control" name="act_optPrice3" value="0">
                </div>

                <div class="input-group mb-3" id="addOption04">
                    <div class="input-group-prepend">
                        <span class="input-group-text">상품옵션4</span>
                    </div>
                    <input maxlength="60" type="text" class="form-control" name="act_optName4">
                    <div class="input-group-prepend">
                        <span class="input-group-text">상품가격</span>
                    </div>
                    <input maxlength="8" type="number" class="form-control" name="act_optPrice4" value="0">
                </div>
            </div>      <!-- PackagePlace -->
            <hr>
            <!-- ============ 상품이미지등록 ============ -->
            <h2>상품정보</h2>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">상품이미지(사이즈 550x500 권장)</span>
                </div>
                <input type="file" class="form-control border" name="act_mainPicture">
            </div>
            <!-- ============ 상품정보 ============ -->
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">상품정보</span>
                </div>
                <textarea maxlength="6000" class="form-control" rows="10" name="act_content"></textarea>
            </div>
             <!-- ============ 상품정보 이미지 ============ -->
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">상품이미지첨부</span>
                </div>
                <input type="file" class="form-control border" name="act_inforImg" multiple>
            </div>
            <hr>
            <!-- ============ 상품 공지사항 ============ -->
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">공지사항</span>
                </div>
                <textarea maxlength="6000" class="form-control" rows="5" name="act_announcement"></textarea>
            </div>
            <hr>
            <!-- ============ 위치 ============ -->
            <h2>위치</h2>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">위치</span>
                </div>
                <textarea maxlength="500" class="form-control" rows="2" name="act_address"></textarea>
            </div>
            <hr/>
            
            <!-- ==================FAQ 추가 ================ -->
            <h2>상품 FAQ</h2>
            
            <div class="FAQ_place">
				<div class="input-group mb-3">
	                <div class="input-group-prepend">
	                    <span class="input-group-text">FAQ</span>
	                </div>
	                <textarea maxlength="6000" class="form-control" rows="10" name="act_faq"></textarea>
	            </div>
	              
			</div>
           
            <br>
            
            <!-- ============ 등록&목록버튼 ============ -->
            <div class="inner_btn">
                <button type="button" onclick="insertController()" class="btn btn-primary">등록</button>
                <button type="reset" class="btn btn-primary"><a href="/admin/admin_getActivityList">목록</a></button>
            </div>
        </form>
    </div>      <!-- Container -->
</section>

<%@ include file="../template/manager_footer.jsp" %>
</body>
</html>
