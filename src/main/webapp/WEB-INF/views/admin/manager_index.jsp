<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ include file="../template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/manager_index.css">
<script type="text/javascript">
	$(function() {
		var isSuper = '${isSuper}';
		if(isSuper != 'Y') {
			alert('잘못된 접근입니다.');
			history.back();
		}
		var windowWidth = $(window).width();
		if(windowWidth > 1200) {
			$('.person-list').removeClass('row');
			$('.person-list').removeClass('col-12');
			$('.person-group-li').removeClass('col-8');
			$('.person-group-li').removeClass('col-sm-6');
			$('.person-group-li').removeClass('col-md-4');
		} else {
			$('.person-list').addClass('row');
			$('.person-list').addClass('col-12');
			$('.person-group-li').addClass('col-8');
			$('.person-group-li').addClass('col-sm-6');
			$('.person-group-li').addClass('col-md-4');
		}
		$(window).resize(function() {
			var windowWidth = $(window).width();
			if(windowWidth > 1200) {
				$('.person-list').removeClass('row');
				$('.person-list').removeClass('col-12');
				$('.person-group-li').removeClass('col-8');
				$('.person-group-li').removeClass('col-sm-6');
				$('.person-group-li').removeClass('col-md-4');
			} else {
				$('.person-list').addClass('row');
				$('.person-list').addClass('col-12');
				$('.person-group-li').addClass('col-8');
				$('.person-group-li').addClass('col-sm-6');
				$('.person-group-li').addClass('col-md-4');
			}
		});
	});
</script>
</head>
<body>
<%@ include file="../template/manager_header.jsp" %>

	<h2 class="page-title">
		Our Team
	</h2>
	<div class="person-list-div">
		<ul class="person-list row col-12">
			<li class="person-group-li col-8 col-sm-6 col-md-4">
				<div class="person-group">
				<div class="img-div"><img src="${pageContext.request.contextPath}/resources/imgs/KYC.png" alt="김예찬" class="person-img"></div>
					<p class="person-name">김예찬</p>
					<p class="person-role">팀장</p>
					<p class="person-dash">
						<span class="material-icons minimize">
							remove
						</span>
					</p>
					<p class="person-dept">마이페이지 / 공지사항<br>담당</p>
				</div>
			</li>
			<li class="person-group-li col-8 col-sm-6 col-md-4">
				<div class="person-group">
					<div class="img-div"><img src="${pageContext.request.contextPath}/resources/imgs/KSH.png" alt="권소현" class="person-img"></div>
					<p class="person-name">권소현</p>
					<p class="person-role">부팀장</p>
					<p class="person-dash">
						<span class="material-icons minimize">
							remove
						</span>
					</p>
					<p class="person-dept">회원가입 / 로그인<br>담당</p>
				</div>
			</li>
		</ul>
		<ul class="person-list row col-12">
			<li class="person-group-li col-8 col-sm-6 col-md-4">
				<div class="person-group">
					<div class="img-div"><img src="${pageContext.request.contextPath}/resources/imgs/KMS.png" alt="강민서" class="person-img"></div>
					<p class="person-name">강민서</p>
					<p class="person-role">팀원</p>
					<p class="person-dash">
						<span class="material-icons minimize">
							remove
						</span>
					</p>
					<p class="person-dept">회원가입 / 로그인<br>담당</p>
				</div>
			</li>
			<li class="person-group-li col-8 col-sm-6 col-md-4">
				<div class="person-group">
					<div class="img-div"><img src="${pageContext.request.contextPath}/resources/imgs/KKM.png" alt="김경민" class="person-img"></div>
					<p class="person-name">김경민</p>
					<p class="person-role">팀원</p>
					<p class="person-dash">
						<span class="material-icons minimize">
							remove
						</span>
					</p>
					<p class="person-dept">상품 패키지<br>담당</p>
				</div>
			</li>
			<li class="person-group-li col-8 col-sm-6 col-md-4">
				<div class="person-group">
					<div class="img-div"><img src="${pageContext.request.contextPath}/resources/imgs/PJH.png" alt="박종휘" class="person-img"></div>
					<p class="person-name">박종휘</p>
					<p class="person-role">팀원</p>
					<p class="person-dash">
						<span class="material-icons minimize">
							remove
						</span>
					</p>
					<p class="person-dept">상품 패키지<br>담당</p>
				</div>
			</li>
			<li class="person-group-li sub-person-group-li col-8 col-sm-6 col-md-4">
				<div class="person-group">
					<div class="img-div"><img src="${pageContext.request.contextPath}/resources/imgs/OSH.png" alt="오송희" class="person-img"></div>
					<p class="person-name">오송희</p>
					<p class="person-role">팀원</p>
					<p class="person-dash">
						<span class="material-icons minimize">
							remove
						</span>
					</p>
					<p class="person-dept">상품 결제<br>담당</p>
				</div>
			</li>
			<li class="person-group-li sub-person-group-li col-8 col-sm-6 col-md-4">
				<div class="person-group">
					<div class="img-div"><img src="${pageContext.request.contextPath}/resources/imgs/HEJ.png" alt="홍은지" class="person-img"></div>
					<p class="person-name">홍은지</p>
					<p class="person-role">팀원</p>
					<p class="person-dash">
						<span class="material-icons minimize">
							remove
						</span>
					</p>
					<p class="person-dept">마이페이지 / 공지사항<br>담당</p>
				</div>
			</li>
			<li class="person-group-li sub-person-group-li col-8 col-sm-6 col-md-4">
				<div class="person-group">
					<div class="img-div"><img src="${pageContext.request.contextPath}/resources/imgs/HJH.png" alt="홍진한" class="person-img"></div>
					<p class="person-name">홍진한</p>
					<p class="person-role">팀원</p>
					<p class="person-dash">
						<span class="material-icons minimize">
							remove
						</span>
					</p>
					<p class="person-dept">상품 결제<br>담당</p>
				</div>
			</li>
		</ul>
		<ul id="sub-person-list" class="person-list">
			<li class="person-group-li">
				<div class="person-group">
					<div class="img-div"><img src="${pageContext.request.contextPath}/resources/imgs/OSH.png" alt="오송희" class="person-img"></div>
					<p class="person-name">오송희</p>
					<p class="person-role">팀원</p>
					<p class="person-dash">
						<span class="material-icons minimize">
							remove
						</span>
					</p>
					<p class="person-dept">상품 결제<br>담당</p>
				</div>
			</li>
			<li class="person-group-li">
				<div class="person-group">
					<div class="img-div"><img src="${pageContext.request.contextPath}/resources/imgs/HEJ.png" alt="홍은지" class="person-img"></div>
					<p class="person-name">홍은지</p>
					<p class="person-role">팀원</p>
					<p class="person-dash">
						<span class="material-icons minimize">
							remove
						</span>
					</p>
					<p class="person-dept">마이페이지 / 공지사항<br>담당</p>
				</div>
			</li>
			<li class="person-group-li">
				<div class="person-group">
					<div class="img-div"><img src="${pageContext.request.contextPath}/resources/imgs/HJH.png" alt="홍진한" class="person-img"></div>
					<p class="person-name">홍진한</p>
					<p class="person-role">팀원</p>
					<p class="person-dash">
						<span class="material-icons minimize">
							remove
						</span>
					</p>
					<p class="person-dept">상품 결제<br>담당</p>
				</div>
			</li>
		</ul>
	</div>

<%@ include file="../template/manager_footer.jsp" %>
</body>
</html>