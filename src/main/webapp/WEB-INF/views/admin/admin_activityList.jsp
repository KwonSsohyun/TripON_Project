<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ include file="../template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_activityList.css">
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

<!-- Section Start -->
<h2>상품 관리 페이지</h2>
<div class="container" id="searchContainer">
    <form action="/admin/admin_getActivityList" method="post" name="fm">
        <div class="input-group col-mb-3">
            <select class="custom-select col-2" name="searchCondition">
            	<c:forEach items="${conditionMap}" var="option">
                	<option value="${option.value}" <c:if test="${activityVO.searchCondition eq option.value}">selected</c:if>>${option.key}</option>
                </c:forEach>
            </select>
            <input type="hidden" name="nowPage">
            <input type="text" class="form-control" name="searchKeyword" value="${activityVO.searchKeyword}" placeholder="search here" aria-label="Recipient's username" aria-describedby="button-addon2">
            <div class="input-group-append">
                <button type="submit" class="btn btn-outline-secondary" onclick="pageFnc(0)">검색</button>
            </div>
        </div>
    </form>
</div>
<div class="container-fluid" id="admin_activityList">
    <table>
        <thead>
            <tr>
                <th>상품번호</th>
                <th>카테고리명</th>
                <th>상품명</th>
                <th>작성자</th>
                <th>등록일</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${activityList}" var="activity">
	            <tr onclick="location.href='/admin/admin_getActivity?act_num=${activity.act_num}'">
	                <td>${activity.act_num}</td>
	                <td>${activity.categoryCheck}</td>
	                <td>${activity.act_mainTitle}</td>
	                <td>${activity.act_writer}</td>
	                <td>${activity.act_regdate}</td>
	                <td><button type="button" class="btn btn-danger btn-sm" id="del_btn"><a href="/admin/deleteActivity?act_num=${activity.act_num}">삭제</a></button></td>
	            </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="row justify-content-md-center" id="table_footer">
        <ul class="pagination">
            <li class="page-item <c:if test="${paging.nowPage <= 1}">disabled</c:if>"><a class="page-link" href="javascript:pageFnc(${paging.nowPage - 1})">Previous</a></li>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage}">
						<li class="page-item active"><a class="page-link">${p}</a></li>
					</c:when>
					<c:when test="${p != paging.nowPage}">
						<li class="page-item"><a class="page-link" href="javascript:pageFnc(${p})">${p}</a></li>
					</c:when>
				</c:choose>
			</c:forEach>
           	<li class="page-item <c:if test="${paging.nowPage >= paging.lastPage}">disabled</c:if>"><a class="page-link" href="javascript:pageFnc(${paging.nowPage + 1})">Next</a></li>
        </ul>
        <div class="insert_btn">
            <a href="/admin/admin_insertActivity" class="btn btn-primary pull-right">상품등록</a>
        </div>
    </div>
</div>
<!-- Section End-->
<script type="text/javascript">
	function pageFnc(np) {
		let frm = document.fm;
		frm.nowPage.value = np;
		frm.action = "/admin/admin_getActivityList";
		frm.method = "post";
		frm.submit();
	}
</script>

<%@ include file="../template/manager_footer.jsp" %>
</body>
</html>
