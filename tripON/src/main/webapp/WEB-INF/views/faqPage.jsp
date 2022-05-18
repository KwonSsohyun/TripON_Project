<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% pageContext.setAttribute("ln","\n"); %>
<c:set var="msg1" value=""/>
<c:set var="msg2" value=""/>
<c:set var="msg3" value=""/>
<c:set var="msg4" value=""/>
<c:set var="msg5" value=""/>
<c:set var="msg6" value=""/>
<c:if test="${(param.faq_category eq 'TOP7' or userFaqList[0].faq_category eq 'TOP7') and searchCondition eq null}">
	<c:set var="msg1" value=" on"/>
</c:if>
<c:if test="${(param.faq_category eq '이용문의' or userFaqList[0].faq_category eq '이용문의') and searchCondition eq null}">
	<c:set var="msg2" value=" on"/>
</c:if>
<c:if test="${(param.faq_category eq '예약문의' or userFaqList[0].faq_category eq '예약문의') and searchCondition eq null}">
	<c:set var="msg3" value=" on"/>
</c:if>
<c:if test="${(param.faq_category eq '예약취소' or userFaqList[0].faq_category eq '예약취소') and searchCondition eq null}">
	<c:set var="msg4" value=" on"/>
</c:if>
<c:if test="${(param.faq_category eq '결제/영수증' or userFaqList[0].faq_category eq '결제/영수증') and searchCondition eq null}">
	<c:set var="msg5" value=" on"/>
</c:if>
<c:if test="${(param.faq_category eq '기타' or userFaqList[0].faq_category eq '기타') and searchCondition eq null}">
	<c:set var="msg6" value=" on"/>
</c:if>
<c:if test="${userFaqTotal ne 0 or userFaqList[0].listCnt ne null}">
	<c:set var="rt" value="${userFaqTotal}"/>
	<c:set var="lc" value="${userFaqList[0].listCnt}"/>
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
<link href="${pageContext.request.contextPath}/resources/css/faqPage.css" rel="stylesheet" type="text/css">
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
</head>
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
					<a href="/getUserFaqList?faq_category=TOP7" class="top${msg1}"><br class="top_link_br">TOP7</a>
 				</li>
				<li>
					<a href="/getUserFaqList?faq_category=이용문의" class="top${msg2}">이용<br class="top_link_br">문의</a>
 				</li>
				<li>
					<a href="/getUserFaqList?faq_category=예약문의" class="top${msg3}">예약<br class="top_link_br">문의</a>
 				</li>
				<li>
					<a href="/getUserFaqList?faq_category=예약취소" class="top${msg4}">예약<br class="top_link_br">취소</a>
 				</li>
				<li>
					<a href="/getUserFaqList?faq_category=결제/영수증" class="top${msg5}">결제/<br class="top_link_br">영수증</a>
 				</li>
				<li>
					<a href="/getUserFaqList?faq_category=기타" class="top${msg6}"><br class="top_link_br">기타</a>
 				</li>
            </ul>
            <div class="container">
                <ul class="list-group list-group-flush">
                	<c:if test="${userFaqTotal ne 0 or userFaqList[0].listCnt ne null}">
		                <c:forEach items="${userFaqList}" var="faq">
		                    <li class="list-group-item" id="q${faq.faq_seq}">
		                        <div class="questlist">
		                            <p>${faq.faq_title}</p>
		                            <div class="arrow">
		                                <span class="fa fa-angle-down"></span>
		                            </div>
		                        </div>
		                        <div class="panel">
		                            <p><c:out value="${fn:replace(faq.faq_content, ln ,'<br>')}" escapeXml="false"></c:out></p>
		                        </div>
		                    </li>
		                </c:forEach>
                	</c:if>
                	<c:if test="${userFaqTotal eq 0 or userFaqList[0].listCnt eq null}">
                		<div class="none-message">등록된 게시글이 존재하지 않습니다.</div>
                	</c:if>
                </ul>
            </div>
            <c:if test="${userFaqTotal ne 0 or userFaqList[0].listCnt ne null}">
				<form action="/getUserFaqSearchList">
					<div class="input-group search-group">
						<select class="search-select" name="searchCondition">
							<option value="FAQ_TITLE">제목</option>
							<option value="FAQ_CONTENT">내용</option>
						</select>
						<input type="text" class="form-control col-4 search-input" placeholder="Search" name="searchKeyword">
						<button class="search-btn btn" type="submit">검색</button>  
					</div>
				</form>
	            <div class="paging-group">
					<ul class="pagination">
					
						<c:if test="${searchCondition eq null}">
							<li class="page-item${msg7}"><a class="page-link" href="/getUserFaqList?pageNum=${pageNum - 1}&faq_category=${userFaqList[0].faq_category}">Previous</a></li>
						</c:if>
						<c:if test="${searchCondition ne null}">
							<li class="page-item${msg7}"><a class="page-link" href="/getUserFaqSearchList?pageNum=${pageNum - 1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">Previous</a></li>
						</c:if>
						
						<c:forEach var="i" begin="${startPageNum}" end="${endPageNum}" step="1">
							<c:if test="${searchCondition eq null}">
								<c:if test="${pageNum eq i}">
									<li class="page-item active"><a class="page-link" href="/getUserFaqList?pageNum=${i}&faq_category=${userFaqList[0].faq_category}">${i}</a></li>
								</c:if>
								<c:if test="${pageNum ne i}">
									<li class="page-item"><a class="page-link" href="/getUserFaqList?pageNum=${i}&faq_category=${userFaqList[0].faq_category}">${i}</a></li>
								</c:if>
							</c:if>
							<c:if test="${searchCondition ne null}">
								<c:if test="${pageNum eq i}">
									<li class="page-item active"><a class="page-link" href="/getUserFaqSearchList?pageNum=${i}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${i}</a></li>
								</c:if>
								<c:if test="${pageNum ne i}">
									<li class="page-item"><a class="page-link" href="/getUserFaqSearchList?pageNum=${i}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${i}</a></li>
								</c:if>
							</c:if>
						</c:forEach>
						
						<c:if test="${searchCondition eq null}">
							<li class="page-item${msg8}"><a class="page-link" href="/getUserFaqList?pageNum=${pageNum + 1}&faq_category=${userFaqList[0].faq_category}">Next</a></li>
						</c:if>
						<c:if test="${searchCondition ne null}">
							<li class="page-item${msg8}"><a class="page-link" href="/getUserFaqSearchList?pageNum=${pageNum + 1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">Next</a></li>
						</c:if>
					</ul>
				</div>
			</c:if>
        </div>
    </div>
</div>

<%@ include file="./template/footer.jsp" %>
</body>
</html>