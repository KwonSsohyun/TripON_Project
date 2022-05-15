<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="rt" value="${faqTotal}"/>
<c:set var="lc" value="${faqList[0].listCnt}"/>
<c:set var="pageTotal" value="1"/>
<c:if test="${faqTotal ne 0 || faqList[0] ne null}">
	<c:choose>
	<c:when test="${rt % lc eq 0}">
		<c:set var="pageTotal" value="${rt / lc}"/>
	</c:when>
	<c:otherwise>
		<c:set var="pageTotal" value="${rt / lc +1}"/>
	</c:otherwise>
	</c:choose>
</c:if>
<c:set var="pageNum" value="${param.pageNum}"/>
<c:if test="${param.pageNum eq null || param.pageNum eq 1}">
	<c:set var="pageNum" value="1"/>
</c:if>
<c:if test="${param.pageNum > pageTotal}">
	<c:set var="pageNum" value="${pageTotal}"/>
</c:if>
<c:set var="msg1" value=""/>
<c:set var="msg2" value=""/>
<c:if test="${pageNum <= 1}">
	<c:set var="msg1" value=" disabled"/>
</c:if>
<c:if test="${pageNum + 1 > pageTotal}">
	<c:set var="msg2" value=" disabled"/>
</c:if>
<c:set var="pageCount" value="5"/>
<fmt:parseNumber var="intPageCal" value="${((pageNum - 1) / pageCount)}" integerOnly="true"/>
<c:set var="startPageNum" value="${intPageCal * pageCount + 1}"/>
<c:set var="endPageNum" value="${startPageNum + (pageCount - 1)}"/>
<c:if test="${endPageNum > pageTotal}">
	<c:set var="endPageNum" value="${pageTotal}"/>
</c:if>

<%@ include file="../template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_faqList.css">
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
		
		
		$('.faq-management-menu img').attr('src', '/resources/imgs/FAQ_management_black.png');
		$('.faq-management-menu a').css('color', '#000000');
		$('.faq-management-menu').css('border-color', '#5622ad');
		
		$('.delete-btn').click(function(){
			var checked = $('input[type="checkbox"]:checked').length;
			if(checked == 0) {
				alert('항목을 선택해주세요.');
			} else {
				var result = confirm(checked + '개 항목이 선택되었습니다. 삭제하시겠습니까?');
				console.log(result);
				if(result == true) {
					$('#delete-form').submit();
				}
			}	
		});
	});
</script>
	<div class="faqmng">
          <h2>자주 묻는 질문 관리</h2>
          	<div class="top-tap-div">
          		<form action="/admin/getFaqList" method="get">
	          		<div class="form-group-1">
	          			<div class="form-group-2">
		          			<select class="form-control" id="sel1" name="searchCondition">
						        <c:forEach items="${conditionMap}" var="option">
						        	<c:if test="${option.value eq 'FAQ_TITLE'}">
						        		<option value="${option.value}" selected>${option.key}</option>
						        	</c:if>
						        	<c:if test="${option.value ne 'FAQ_TITLE'}">
						        		<option value="${option.value}">${option.key}</option>
						        	</c:if>
						        </c:forEach>
							</select>
	          				<div class="input-group-append">
					    		<input type="text" class="form-control" placeholder="Search" name="searchKeyword">
					      			<button class="search-1 btn btn-success" type="submit">검색</button>  
				    		</div>
				    	</div>
			    		<div class="rgtbtn-div">
		           			<button class="btn btn-secondary" id="rgtbtn" type="button" onclick="javascript:location.href='admin_insertFaq?pageNum=${pageNum}'">글등록</button>
			    		</div>
		          	</div>
				</form>
		    </div>
	</div>
	<form id="delete-form" action="/admin/deleteFaq" method="post">
		<input type="hidden" name="pageNum" value="${pageNum}"/>
		<div class="container-fluid">
			<div class="faqList">
				<table class="table" style="width:100%">
					<thead>
						<tr>
				            <th class="th1">삭제</th>
				            <th class="th2">제목</th>
				            <th class="th3 bye-td3">작성자</th>
				            <th class="th4 bye-td4">작성일</th>
				            <th class="th5 bye-td5">조회수</th>
				            <th class="th6">카테고리</th>
		          		</tr>
			    	</thead>
			    	<tbody>
				    	<c:choose>
				    		<c:when test="${faqList.size() < 1}">
				    			<tr>
				    				<td style="padding-top: 80px !important;" colspan="6">검색 결과가 없습니다.</td>
				    			</tr>
				    		</c:when>
				    		<c:otherwise>
				    			<c:forEach items="${faqList}" var="faq">
				    				<tr class="tr-hover">
				    					<td><div class="td-div"><input type="checkbox" name="deleteSeq" class="td_all_chk" value="${faq.faq_seq}"></div></td>
				    					<td class="cursor-div" onclick="location.href='/admin/getFaq?pageNum=${pageNum}&faq_seq=${faq.faq_seq}';" title="${faq.faq_title}"><div class="td-div"><span class="td-div-span1">${faq.faq_title}</span></div></td>
				    					<td class="cursor-div bye-td3" onclick="location.href='/admin/getFaq?pageNum=${pageNum}&faq_seq=${faq.faq_seq}';"><div class="td-div"><span class="td-div-span2">${faq.faq_mem_id}</span></div></td>
				    					<td class="cursor-div bye-td4" onclick="location.href='/admin/getFaq?pageNum=${pageNum}&faq_seq=${faq.faq_seq}';"><div class="td-div">${faq.faq_regdate}</div></td>
				    					<td class="cursor-div bye-td5" onclick="location.href='/admin/getFaq?pageNum=${pageNum}&faq_seq=${faq.faq_seq}';"><div class="td-div">${faq.faq_count}</div></td>
				    					<td class="cursor-div" onclick="location.href='/admin/getFaq?pageNum=${pageNum}&faq_seq=${faq.faq_seq}';"><div class="td-div">${faq.faq_category}</div></td>
				    				</tr>
				    			</c:forEach>
				    		</c:otherwise>
				    	</c:choose>
					</tbody>
				</table>
			</div>
		    <div class="bottombtn"> 
		    	<button type="button" class="btn btn-danger delete-btn">글 삭제</button>
		    </div>
		</div>
	</form>
	<div>
	  <ul class="pagination">
	    <li class="page-item${msg1}"><a class="page-link" href="/admin/getFaqList?pageNum=${pageNum - 1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">Previous</a></li>
	    <c:forEach var="i" begin="${startPageNum}" end="${endPageNum}" step="1"> 
	    	<c:choose>
	    		<c:when test="${i eq pageNum}">
				    <li class="page-item active"><a class="page-link">${i}</a></li>
	    		</c:when>
	    		<c:otherwise>
	    			<li class="page-item"><a class="page-link" href="/admin/getFaqList?pageNum=${i}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${i}</a></li>
	    		</c:otherwise>
	    	</c:choose>
	    </c:forEach>
	    <li class="page-item${msg2}"><a class="page-link" href="/admin/getFaqList?pageNum=${pageNum + 1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">Next</a></li>
	  </ul>
	</div>
<%@ include file="../template/manager_footer.jsp" %>
</body>
</html>