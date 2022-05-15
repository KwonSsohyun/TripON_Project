<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${userNoticeTotal.total ne 0 or userNoticeList[0].listCnt ne null}">
	<c:set var="rt" value="${userNoticeTotal.total}"/>
	<c:set var="lc" value="${userNoticeList[0].listCnt}"/>
	<c:set var="pageTotal" value="1"/>
	<c:choose>
		<c:when test="${rt % lc eq 0}">
			<c:set var="pageTotal" value="${rt / lc}"/>
		</c:when>
		<c:otherwise>
			<c:set var="pageTotal" value="${rt / lc + 1}"/>
		</c:otherwise>
	</c:choose>
	<c:set var="pageNum" value="${param.pageNum}"/>
	<c:if test="${pageNum eq null || pageNum eq 1}">
		<c:set var="pageNum" value="1"/>
	</c:if>
	<c:if test="${param.pageNum > pageTotal}">
		<c:set var="pageNum" value="${pageTotal}"/>
	</c:if>
	<c:set var="msg7" value=""/>
	<c:set var="msg8" value=""/>
	<c:if test="${pageNum <= 1}">
		<c:set var="msg7" value=" disabled"/>
	</c:if>
	<c:if test="${pageNum + 1 > pageTotal}">
		<c:set var="msg8" value=" disabled"/>
	</c:if>
	<c:set var="pageCount" value="5"/>
	<fmt:parseNumber var="intPageCal" value="${((pageNum - 1) / pageCount)}" integerOnly="true"/>
	<c:set var="startPageNum" value="${intPageCal * pageCount + 1}"/>
	<c:set var="endPageNum" value="${startPageNum + (pageCount - 1)}"/>
	<c:if test="${endPageNum > pageTotal}">
		<c:set var="endPageNum" value="${pageTotal}"/>
	</c:if>
</c:if>

<%@ include file="./template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/noticePage.css">
</head>
<script>
$(document).ready(function(){
	$('li').click(function() {
        var id_check = $(this).attr('id'); //우리가 클릭한 요소의 id가져오기.
        $('li#'+id_check).children().last().toggle(); //<div class="panel"><p>예약 취소는 마이페이지 > 예약내역에서 직접 가능합니다.</p></div>
        if($('li#'+id_check+' .fa').hasClass('fa-angle-down') == true) {
	        $('li#'+id_check+' .fa').removeClass('fa-angle-down');
	        $('li#'+id_check+' .fa').addClass('fa-angle-up');
        } else if($('li#'+id_check+' .fa').hasClass('fa-angle-up') == true) {
	        $('li#'+id_check+' .fa').removeClass('fa-angle-up');
	        $('li#'+id_check+' .fa').addClass('fa-angle-down');
        }
        $('li#'+id_check).siblings("li").children('div.panel').hide();
        $('li#'+id_check).siblings("li").children('div.questlist').children('div.arrow').children('span.fa').removeClass('fa-angle-up');
        $('li#'+id_check).siblings("li").children('div.questlist').children('div.arrow').children('span.fa').addClass('fa-angle-down');
	});
});
</script>
<body>
<%@ include file="./template/header.jsp" %>

<div class="container" id="faq-page">
     <div id="menu-bar">
         <ul class="menu-list">
             <li>
                 <a href="/getUserNoticeList" id="menu-item-1">공지사항</a>
             </li>
             <li>
                 <a href="/getUserFaqList" id="menu-item-2">자주 묻는 질문</a>
             </li>
         </ul>
     </div>
     <div id="faq-list-div">
         <div class="faq_list">
             <ul class="top_link">
                 <li>
                     <a href="javascript:void(0)" class="top on">공지사항</a>
                 </li>
                 
             </ul>
             <div class="line-group">
                 <div class="title-main-line"></div>
                 <div class="title-sub-line"></div>
             </div>
             <div class="container">
                 <ul class="list-group list-group-flush">
                 	<c:if test="${userNoticeTotal.total ne 0 or userNoticeList[0].listCnt ne null}">
	                     <c:forEach items="${userNoticeList}" var="notice">
		                     <li class="list-group-item" id="q${notice.ntc_seq}">
		                         <div class="questlist">
		                             <p>${notice.ntc_title}</p>
		                             <div class="arrow">
		                                 <span class="fa fa-angle-down"></span>
		                             </div>
		                         </div>
		                         <div class="panel">
		                             <p>${notice.ntc_content}</p>
		                         </div>
		                     </li>
		                 </c:forEach>
	                 </c:if>
                 	 <c:if test="${userNoticeTotal.total eq 0 or userNoticeList[0].listCnt eq null}">
                 	 	<div class="none-message">등록된 게시글이 존재하지 않습니다.</div>
                 	 </c:if>
                     
                 </ul>
             </div>
             <c:if test="${userNoticeTotal.total ne 0 or userNoticeList[0].listCnt ne null}">
				<form action="/getUserNoticeList">
					<div class="input-group search-group">
						<select class="search-select" name="searchCondition">
							<option value="NTC_TITLE">제목</option>
							<option value="NTC_CONTENT">내용</option>
						</select>
						<input type="text" class="form-control col-4 search-input" placeholder="Search" name="searchKeyword">
						<button class="search-btn btn" type="submit">검색</button>  
					</div>
				</form>
	            <div class="paging-group">
					<ul class="pagination">
					
						<li class="page-item${msg7}"><a class="page-link" href="/getUserNoticeList?pageNum=${pageNum - 1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">Previous</a></li>
						
						<c:forEach var="i" begin="${startPageNum}" end="${endPageNum}" step="1">
							<c:if test="${pageNum eq i}">
								<li class="page-item active"><a class="page-link" href="/getUserNoticeList?pageNum=${i}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${i}</a></li>
							</c:if>
							<c:if test="${pageNum ne i}">
								<li class="page-item"><a class="page-link" href="/getUserNoticeList?pageNum=${i}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${i}</a></li>
							</c:if>
						</c:forEach>
						
						<li class="page-item${msg8}"><a class="page-link" href="/getUserNoticeList?pageNum=${pageNum + 1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">Next</a></li>
					</ul>
				</div>
			</c:if>
         </div>
     </div>
 </div>

<%@ include file="./template/footer.jsp" %>
</body>
</html>