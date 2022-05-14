<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- main-footer -->
<footer class="main-footer">
    <div class="container-fluid">
        <div class="container">
            <div class="main-footer-logo col-4">
                <a href="./">
                    <img src="${pageContext.request.contextPath}/resources/imgs/tripON_logo_white.png" alt="trip-on" width="150">
                </a>
            </div>
            <div class="main-footer-text col-8">
                <div class="main-footer-text-1 col-12"><strong>트립온</strong><br>이 페이지는 교육용으로 만들어진 페이지입니다. 실제 사용하실 수 없는 페이지입니다.</div>
                <div class="main-footer-line col-12"></div>
                <div class="main-footer-text-2 col-12"><b>일공일공&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;팀장 : 김예찬,&nbsp;&nbsp;&nbsp;부팀장 : 권소현<br></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;강민서, 김경민, 박종휘, 오송희, 홍은지, 홍진한</div>
            </div>
        </div>
    </div>
</footer>
<footer class="main-footer-mobile">
        <div class="container main-footer-mobile-container">
        	<% if(session.getAttribute("userId") == null) {%>
	        	<div class="main-footer-mobile-login-btn">
	        		<a href="login">로그인</a>
	        	</div>
	        <% } else if(session.getAttribute("userId") != null) {%>
	        	<div class="main-footer-mobile-logout-btn">
	        		<a href="logout">로그아웃</a>
	        	</div>
	        <% } %>
            <div class="main-footer-mobile-logo">
                <a href="./">
                    <img src="${pageContext.request.contextPath}/resources/imgs/tripON_logo_white.png" alt="trip-on" width="140">
                </a>
            </div>
            <div class="main-footer-mobile-text">
                <div class="main-footer-mobile-text-1">이 페이지는 교육용으로 만들어진 페이지입니다.<br>실제 사용하실 수 없는 페이지입니다.</div>
                <div class="main-footer-mobile-line"></div>
                <div class="main-footer-mobile-text-2">일공일공</div>
                <div class="main-footer-mobile-text-3">팀장 : 김예찬,&nbsp;&nbsp;부팀장 : 권소현</div>
                <div class="main-footer-mobile-text-4">강민서, 김경민, 박종휘, 오송희, 홍은지, 홍진한</div>
            </div>
        </div>
</footer>
<script type="text/javascript">
	$(function() {
		$(window).scroll(function() {
			var here = $('html, body').offset().top;
			var scrollLocation = $(document).scrollTop();
			if(here == scrollLocation) {
				$('.up-button').css('right', '-51px');
			} else {
				$('.up-button').css('right', '20px');
			}
		});
		$('.up-button').click(function() {
			$('html, body').stop().animate({scrollTop: 0}, 500);
		});
	});
</script>
<div class="up-button">
	<div class="material-icons up-button-icons">arrow_forward_ios</div>
	<div class="up-button-text">TOP</div>
</div>