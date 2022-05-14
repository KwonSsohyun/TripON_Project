<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header start -->

<script>
 	$(document).ready(function(){
		if("${userId}"==null || "${userId}"== ''){
			location.href="/login";
		}
	}); 
 	function changeMenuItemImg() {
 		if($('.user-management-menu img').attr('src').includes('black') && $('.user-management-menu').css('border-color').includes('rgb(86, 34, 173)') && !($('.user-management-menu-1 a').css('color').includes('rgb(86, 34, 173)') || $('.user-management-menu-2 a').css('color').includes('rgb(86, 34, 173)'))) {
 			$('.user-management-menu img').attr('src', '/resources/imgs/user_management_gray.png');
 			$('.user-management-menu').css('border-color', '#ffffff');
 		} else {
 			$('.user-management-menu img').attr('src', '/resources/imgs/user_management_black.png');
 			$('.user-management-menu').css('border-color', 'rgb(86, 34, 173)');
 		}
 	}
 	$(function() {
 		$('#mobile-menu-icon-1').click(function() {
 			$('#side-menubar-mobile').toggle();
 		});
 		$('#mobile-menu-icon-2').click(function() {
 			$('#side-menubar-mobile').toggle();
 		});
 		
 		$(window).resize(function() {
			var windowWidth = $(window).width();
			if(windowWidth > 991) {
				$('#side-menubar-mobile').hide();
			}
 		});
 	});
</script>

<div id="section">

  <div id="side-menubar">
    <div id="side-menubar-logo">
      <a href="/index" class="">
        <img src="${pageContext.request.contextPath}/resources/imgs/logo.png" alt="tripeON_logo" width="200">
      </a>
    </div>
    <div id="menu-list-div">
      <ul class="menu-list">
        <li class="menu-item-1 user-management-menu">
          <div class="menu-item-group-1">
            <div class="menu-item-1-div">
              <img src="${pageContext.request.contextPath}/resources/imgs/user_management_gray.png" alt="img">
              <script>
                $(function() {
                  $('.menu-item-text-1').click(function() {
                	changeMenuItemImg();
                	$(this).toggleClass('user-management-menu-active');
                    $('.menu-item-3').toggle();
                    $('.extend-btn-1').toggle();
                    $('.extend-btn-2').toggle();
                	$('.extend-btn-2').toggleClass('user-management-menu-active');
                  });
                });
              </script>
              <a href="/admin/userList" class="menu-item-text-1">유저관리</a>
            </div>
            <script>
              $(function() {
                $('.extend-btn-1').click(function() {
                  changeMenuItemImg();
                  $('.menu-item-text-1').toggleClass('user-management-menu-active');
               	  $('.menu-item-3').toggle();
                  $('.extend-btn-1').toggle();
                  $('.extend-btn-2').toggle();
                  $('.extend-btn-2').toggleClass('user-management-menu-active');
                });
              });
            </script>
            <span class="material-icons extend-btn-1">
              expand_more
            </span>
            <script>
              $(function() {
                $('.extend-btn-2').click(function() {
                  changeMenuItemImg();
                  $('.menu-item-text-1').toggleClass('user-management-menu-active');
                  $('.menu-item-3').toggle();
                  $('.extend-btn-1').toggle();
                  $('.extend-btn-2').toggle();
                  $('.extend-btn-2').toggleClass('user-management-menu-active');
                });
              });
            </script>
            <span class="material-icons extend-btn-2">
              expand_less
            </span>
          </div>
        </li>
        <li class="menu-item-3">
          <div class="menu-item-3-1 user-management-menu-1"><a href="/admin/userList" class="menu-item-text">사용자</a></div>
          <div class="menu-item-3-2 user-management-menu-2"><a href="/admin/adminList" class="menu-item-text">관리자</a></div>
        </li>
        <li class="menu-item-2 package-management-menu">
          <div class="menu-item-group-2">
            <img src="${pageContext.request.contextPath}/resources/imgs/package_management_gray.png" alt="img">
            <a href="/admin/admin_getActivityList" class="menu-item-text">상품관리</a>
          </div>
        </li>
        <li class="menu-item-2 purchase-management-menu">
          <div class="menu-item-group-2">
            <img src="${pageContext.request.contextPath}/resources/imgs/purchase_management_gray.png" alt="img">
            <a href="/admin/purchase_manager" class="menu-item-text">결제 내역관리</a>
          </div>
        </li>
        <li class="menu-item-2 faq-management-menu">
          <div class="menu-item-group-2">
            <img src="${pageContext.request.contextPath}/resources/imgs/FAQ_management_gray.png" alt="img">
            <a href="/admin/getFaqList" class="menu-item-text">FAQ</a>
          </div>
        </li>
        <li class="menu-item-2 notice-management-menu">
          <div class="menu-item-group-2">
            <img src="${pageContext.request.contextPath}/resources/imgs/notice_management_gray.png" alt="img">
            <a href="/admin/getNoticeList" class="menu-item-text">공지사항</a>
          </div>
        </li>
      </ul>
    </div>
  </div>
  
  <div id="side-menubar-mobile">
    <div id="menu-list-div">
      <ul class="menu-list">
        <li class="menu-item-1 user-management-menu">
          <div class="menu-item-group-1">
            <div class="menu-item-1-div">
              <img src="${pageContext.request.contextPath}/resources/imgs/user_management_gray.png" alt="img">
              <script>
                $(function() {
                  $('.menu-item-text-1-mobile').click(function() {
                	changeMenuItemImg();
                	$(this).toggleClass('user-management-menu-active');
                    $('.menu-item-3-mobile').toggle();
                    $('.extend-btn-1-mobile').toggle();
                    $('.extend-btn-2-mobile').toggle();
                	$('.extend-btn-2-mobile').toggleClass('user-management-menu-active');
                  });
                });
              </script>
              <a href="/admin/userList" class="menu-item-text-1-mobile">유저관리</a>
            </div>
            <script>
              $(function() {
                $('.extend-btn-1-mobile').click(function() {
                  changeMenuItemImg();
                  $('.menu-item-text-1-mobile').toggleClass('user-management-menu-active');
               	  $('.menu-item-3-mobile').toggle();
                  $('.extend-btn-1-mobile').toggle();
                  $('.extend-btn-2-mobile').toggle();
                  $('.extend-btn-2-mobile').toggleClass('user-management-menu-active');
                });
              });
            </script>
            <span class="material-icons extend-btn-1-mobile">
              expand_more
            </span>
            <script>
              $(function() {
                $('.extend-btn-2-mobile').click(function() {
                  changeMenuItemImg();
                  $('.menu-item-text-1-mobile').toggleClass('user-management-menu-active');
                  $('.menu-item-3-mobile').toggle();
                  $('.extend-btn-1-mobile').toggle();
                  $('.extend-btn-2-mobile').toggle();
                  $('.extend-btn-2-mobile').toggleClass('user-management-menu-active');
                });
              });
            </script>
            <span class="material-icons extend-btn-2-mobile">
              expand_less
            </span>
          </div>
        </li>
        <li class="menu-item-3-mobile">
          <div class="menu-item-3-1 user-management-menu-1"><a href="/admin/userList" class="menu-item-text">사용자</a></div>
          <div class="menu-item-3-2 user-management-menu-2"><a href="/admin/adminList" class="menu-item-text">관리자</a></div>
        </li>
        <li class="menu-item-2 package-management-menu">
          <div class="menu-item-group-2">
            <img src="${pageContext.request.contextPath}/resources/imgs/package_management_gray.png" alt="img">
            <a href="/admin/admin_getActivityList" class="menu-item-text">상품관리</a>
          </div>
        </li>
        <li class="menu-item-2 purchase-management-menu">
          <div class="menu-item-group-2">
            <img src="${pageContext.request.contextPath}/resources/imgs/purchase_management_gray.png" alt="img">
            <a href="/admin/purchase_manager" class="menu-item-text">결제 내역관리</a>
          </div>
        </li>
        <li class="menu-item-2 faq-management-menu">
          <div class="menu-item-group-2">
            <img src="${pageContext.request.contextPath}/resources/imgs/FAQ_management_gray.png" alt="img">
            <a href="/admin/getFaqList" class="menu-item-text">FAQ</a>
          </div>
        </li>
        <li class="menu-item-2 notice-management-menu">
          <div class="menu-item-group-2">
            <img src="${pageContext.request.contextPath}/resources/imgs/notice_management_gray.png" alt="img">
            <a href="/admin/getNoticeList" class="menu-item-text">공지사항</a>
          </div>
        </li>
      </ul>
    </div>
  </div>

  <div id="mainPage">
    <div id="main-banner">
      <div class="comment"><span>${userName}</span>&nbsp;&nbsp;님 안녕하세요.</div>
      <a href="/logout" class="logout-btn">로그아웃</a>
    </div>
    <div id="main-banner-mobile-lg">
      <div id="side-menubar-logo-mobile-lg">
      	<span class="material-icons" id="mobile-menu-icon-1">
		  menu
		</span>
	 	<a href="/index" class="">
	  	  <img src="${pageContext.request.contextPath}/resources/imgs/logo.png" alt="tripeON_logo" width="100">
	    </a>
	  </div>
	  <div class="main-banner-mobile-div-lg">
        <div class="comment"><div class="comment-name">${userName}</div>&nbsp;님 안녕하세요.</strong></div>
        <a href="/logout" class="logout-btn">로그아웃</a>
	  </div>
    </div>
    <div id="main-banner-mobile">
      <div id="side-menubar-logo-mobile">
	 	<a href="/index" class="">
	  	  <img src="${pageContext.request.contextPath}/resources/imgs/logo.png" alt="tripeON_logo" width="130">
	    </a>
      	<span class="material-icons" id="mobile-menu-icon-2">
		  menu
		</span>
	  </div>
	  <div class="main-banner-mobile-div">
        <div class="comment"><div class="comment-name">${userName}</div>&nbsp;님<strong class="disappear-span"> 안녕하세요.</strong></div>
        <a href="/logout" class="logout-btn">로그아웃</a>
	  </div>
    </div>
    <div id="main-content">
<!-- header end -->