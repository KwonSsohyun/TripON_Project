<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminList.css">
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
<h2>관리자 리스트</h2>
<br><br>
<div class="container-fluid">

<!-- 검색 시작 -->
<nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
  <form class="form-inline" name="fm" action="adminList" method="post">
  	<select class="form-control" id="sel1" name="searchCondition" style="display:inline-block!important;">
		<c:forEach items="${conditionMap}" var="option">
			<option value="${option.value}" <c:if test="${userVO.searchCondition eq option.value}">selected</c:if>>${option.key}</option>
		</c:forEach>
    </select>
    <input class="form-control mr-sm-2" type="text" name="searchKeyword" value="${userVO.searchKeyword}" placeholder="검색어를 입력하세요.">
	<input type="hidden" name="nowPage" value="${paging.nowPage }">
    <button type="submit" class="btn btn-search">검색</button>
  
  </form>
</nav>
<!-- 검색 종료 -->

<div class="adminList">

 <table class="table col-12">
    <thead>
      <tr>
        <th style="width: 12%;">번호</th>
        <th style="width: 20%;">아이디</th>
        <th style="width: 20%;">닉네임</th>
        <th style="width: 28%;">가입일</th>
        <th style="width: 20%;">관리</th>
      </tr>
    </thead>
    <tbody>
    
    <c:forEach items="${adminList }" var="user">
      <tr>
        <td><div class="td-div">${user.mem_seq}</div></td>
        <td><div class="td-div">${user.mem_id}</div></td>
        <td><div class="td-div">${user.mem_nickname}</div></td>
        <td><div class="td-div">${user.mem_registdate}</div></td>
        <td>
        	<div class="td-btn-div">
        		<div class="col-12 col-xl-7">
		        	<button type="button" class="btn btn-primary btn-sm" onclick="location.href = '/admin/adminUpdate?mem_seq=${user.mem_seq}';">정보 수정</button>
        		</div>
        		<div class="col-12 col-xl-5">
	        		<button type="button" class="btn btn-danger btn-sm" onclick="location.href = '/admin/deleteAdmin?mem_id=${user.mem_id}';">삭제</button>
        		</div>
        	</div>
        </td>
      </tr>
      
     </c:forEach>
      
    </tbody>
  </table>

</div>
	<br>
	<div class="submit" style="float: right;" onclick="location.href = '/admin/adminInsert';">
		<input type="submit" value="관리자 신규 등록">
	</div>

	<br><br><br><br>
	
	<div>
		<ul class="pagination justify-content-center">
			<li class='page-item <c:if test="${paging.nowPage <= 1 }">disabled</c:if>'><a class="page-link" href="/admin/adminList?nowPage=${paging.nowPage - 1 }" style="color: #8b8b8d;">Previous</a></li>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<li class="page-item active"><a class="page-link">${p }</a></li>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<li class="page-item"><a class="page-link" href="/admin/adminList?nowPage=${p }">${p }</a></li>
					</c:when>
				</c:choose>
			</c:forEach>
			<li class='page-item <c:if test="${paging.nowPage >= paging.endPage }">disabled</c:if>'><a class="page-link" href="/admin/adminList?nowPage=${paging.nowPage+1}" style="color: #8b8b8d;">Next</a></li>
		</ul>				
	</div>
					
</div>
</body>
<%@ include file="../template/manager_footer.jsp" %>
</html>