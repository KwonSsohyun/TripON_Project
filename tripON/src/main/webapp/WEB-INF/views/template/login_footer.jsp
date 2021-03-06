<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- login-footer -->
<footer class="login-footer">
    <div class="container-fluid">
        <div class="container">
            <div class="login-footer-logo col-4">
                <a href="./">
                    <img src="${pageContext.request.contextPath}/resources/imgs/tripON_logo_gray.png" alt="trip-on" width="150">
                </a>
            </div>
            <div class="login-footer-text col-8">
                <div class="login-footer-text-1 col-12"><strong>트립온</strong><br>이 페이지는 교육용으로 만들어진 페이지입니다. 실제 사용하실 수 없는 페이지입니다.</div>
                <div class="login-footer-line col-12"></div>
                <div class="login-footer-text-2 col-12"><b>일공일공&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;팀장 : 김예찬,&nbsp;&nbsp;&nbsp;부팀장 : 권소현<br></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;강민서, 김경민, 박종휘, 오송희, 홍은지, 홍진한</div>
            </div>
        </div>
    </div>
</footer>

<footer class="login-footer-mobile">
        <div class="container login-footer-mobile-container">
<%--         	<% if(session.getAttribute("userId") == null) {%> --%>
<!-- 	        	<div class="login-footer-mobile-logout-btn"> -->
<!-- 	        		<a href="login">로그인</a> -->
<!-- 	        	</div> -->
<%-- 	        <% } else if(session.getAttribute("userId") != null) {%> --%>
<!-- 	        	<div class="login-footer-mobile-logout-btn"> -->
<!-- 	        		<a href="logout">로그아웃</a> -->
<!-- 	        	</div> -->
<%-- 	        <% } %> --%>
            <div class="login-footer-mobile-logo">
                <a href="./">
                    <img src="${pageContext.request.contextPath}/resources/imgs/tripON_logo_gray.png" alt="trip-on" width="140">
                </a>
            </div>
            <div class="login-footer-mobile-text">
                <div class="login-footer-mobile-text-1">이 페이지는 교육용으로 만들어진 페이지입니다.<br>실제 사용하실 수 없는 페이지입니다.</div>
                <div class="login-footer-mobile-line"></div>
                <div class="login-footer-mobile-text-2">일공일공</div>
                <div class="login-footer-mobile-text-3">팀장 : 김예찬,&nbsp;&nbsp;부팀장 : 권소현</div>
                <div class="login-footer-mobile-text-4">강민서, 김경민, 박종휘, 오송희, 홍은지, 홍진한</div>
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
				$('.admin-button').css('right', '-51px');
			} else {
				$('.up-button').css('right', '20px');
				$('.admin-button').css('right', '20px');
			}
		});
		$('.up-button').click(function() {
			$('html, body').stop().animate({scrollTop: 0}, 500);
		});
	});
</script>
<% if(session.getAttribute("isSuper") != null && session.getAttribute("isSuper").equals("Y")) { %>
<div class="admin-button" onclick="location.href='admin/manager_index'">
	<div class="material-icons admin-button-icons">home</div>
	<div class="admin-button-text">ADM</div>
</div>
<% } %>
<div class="up-button">
	<div class="material-icons up-button-icons">arrow_forward_ios</div>
	<div class="up-button-text">TOP</div>
</div>