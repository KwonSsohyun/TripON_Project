<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar","\n"); %>
<%@ include file="../template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_activity.css">
<script type="text/javascript">

    $(function() {
    	var isSuper = '${isSuper}';
		if(isSuper != 'Y') {
			alert('잘못된 접근입니다.');
			history.back();
		}
	
		
        $('.package-management-menu img').attr('src', '/resources/imgs/package_management_black.png');
        $('.package-management-menu a').css('color', '#000000');
        $('.package-management-menu').css('border-color', '#5622ad');
    });
</script>
</head>
<body>
<%@ include file="../template/manager_header.jsp" %>
<!-- header -->

<section>
    <div class="container">
        <form action="/admin/updateActivity" method="post" enctype="multipart/form-data">
             <!-- ============ 카테고리명 ============ -->
			<div class="input-group mb-3" id="category">
			    <div class="input-group-prepend">
			        <span class="input-group-text">카테고리명</span>
			    </div>
			    <input maxlength="100" type="text" class="form-control" id="categoryCheck" name="categoryCheck" value="${activity.categoryCheck}" placeholder="카테고리명을 입력하세요." readonly>
			</div>
            <hr>
            <!-- ============ 분류카테고리 썸네일 ============ -->
            <h2>상품목록 썸네일</h2>
            <div class="input-group mb-3" id="subCategory">
                <div class="input-group-prepend">
                    <span class="input-group-text">상품목록 썸네일</span>
                </div>
                <input type="file" class="form-control border" name="act_thumbImg">
                <div class="input-group-prepend">
                	<span class="input-group-text"><a href="${pageContext.request.contextPath}/resources/imgs/${activity.act_thumbImgName}" target="_blank" style="color: #000;">적용된 이미지보기</a></span>
                </div>
            </div>
	        <hr>
            <!-- ============ 상품명 ============ -->
            <h2>상품명 & 작성자</h2>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">*상품명</span>
                </div>
                <input maxlength="100" type="text" class="form-control" name="act_mainTitle" value="${activity.act_mainTitle}" placeholder="상품명을 입력하세요." required>
            </div>
            <!-- ============ 상품명 부가설명 ============ -->
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">*상품 부가설명</span>
                </div>
                <input maxlength="100" type="text" class="form-control" name="act_subTitle" value="${activity.act_subTitle}" placeholder="상품의 부가설명을 입력하세요" required>
            </div>
            <!-- ============ 작성자 ============ -->
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">*작성자</span>
                </div>
                <input maxlength="20" type="text" class="form-control" name="act_writer" value="${activity.act_writer}" required>	<%-- value="${mem_username}" --%>
            </div>
            <hr>
            <!-- ============ 상품옵션&상품가격 ============ -->
            <h2>상품옵션 입력</h2>
            <div id="packagePlace">
                <div class="input-group mb-3" id="addOption01">
                    <div class="input-group-prepend">
                        <span class="input-group-text">상품옵션1</span>
                    </div>
                    <input maxlength="60" type="text" class="form-control" name="act_optName1" value="${activity.act_optName1}">
                    <div class="input-group-prepend">
                        <span class="input-group-text">상품가격</span>
                    </div>
                    <input maxlength="8" type="number" class="form-control" name="act_optPrice1" value="${activity.act_optPrice1}">
                </div>

                <div class="input-group mb-3" id="addOption02">
                    <div class="input-group-prepend">
                        <span class="input-group-text">상품옵션2</span>
                    </div>
                    <input maxlength="60" type="text" class="form-control" name="act_optName2" value="${activity.act_optName2}">
                    <div class="input-group-prepend">
                        <span class="input-group-text">상품가격</span>
                    </div>
                    <input maxlength="8" type="number" class="form-control" name="act_optPrice2" value="${activity.act_optPrice2}">
                </div>

                <div class="input-group mb-3" id="addOption03">
                    <div class="input-group-prepend">
                        <span class="input-group-text">상품옵션3</span>
                    </div>
                    <input maxlength="60" type="text" class="form-control" name="act_optName3" value="${activity.act_optName3}">
                    <div class="input-group-prepend">
                        <span class="input-group-text">상품가격</span>
                    </div>
                    <input maxlength="8" type="number" class="form-control" name="act_optPrice3" value="${activity.act_optPrice3}">
                </div>

                <div class="input-group mb-3" id="addOption04">
                    <div class="input-group-prepend">
                        <span class="input-group-text">상품옵션4</span>
                    </div>
                    <input maxlength="60" type="text" class="form-control" name="act_optName4" value="${activity.act_optName4}">
                    <div class="input-group-prepend">
                        <span class="input-group-text">상품가격</span>
                    </div>
                    <input maxlength="8" type="number" class="form-control" name="act_optPrice4" value="${activity.act_optPrice4}">
                </div>
            </div>      <!-- PackagePlace -->
            <hr>
            <!-- ============ 상품이미지등록 ============ -->
            <h2>상품정보</h2>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">상품이미지(사이즈 550x500 권장)</span>
                </div>
                <input type="file" class="form-control border" name="act_mainPicture" value="${activity.act_mainPictureName}">
            </div>
            <!-- ============ 상품정보 ============ -->
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">상품정보</span>
                </div>
                <textarea maxlength="6000" class="form-control" rows="10" name="act_content">${activity.act_content}</textarea>
            </div>
            <!-- ============ 상품정보 이미지 ============ -->
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">상품이미지첨부</span>
                </div>
                <input type="file" class="form-control border" name="act_inforImg" value="${activity.act_inforImgName}" multiple>
            </div>
            <hr>
            <!-- ============ 상품 공지사항 ============ -->
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">공지사항</span>
                </div>
                <textarea maxlength="6000" class="form-control" rows="5" name="act_announcement">${activity.act_announcement}</textarea>
            </div>
            <hr>
            <!-- ============ 위치 ============ -->
            <h2>위치</h2>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">위치</span>
                </div>
                <textarea maxlength="500" class="form-control" rows="2" name="act_address">${activity.act_address}</textarea>
            </div>
            
            <!-- ==================FAQ 추가 ================ -->
            <h2>상품 FAQ</h2>
            
            <div class="FAQ_place">
				<div class="input-group mb-3">
	                <div class="input-group-prepend">
	                    <span class="input-group-text">FAQ</span>
	                </div>
	                <textarea maxlength="6000" class="form-control" rows="10" name="act_faq">${activity.act_faq}</textarea>
	            </div>
	              
			</div>
            
            <!-- ============ 등록&목록버튼 ============ -->
            <div class="inner_btn">
                <button type="submit" class="btn btn-primary">수정</button>
                <button type="reset" class="btn btn-primary"><a href="/admin/admin_getActivityList">목록</a></button>
            </div>
        </form>
    </div>      <!-- Container -->
</section>

<%@ include file="../template/manager_footer.jsp" %>
</body>
</html>
