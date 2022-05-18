<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<script>

	$(function() {
		$('.gnb').on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
		});
		
		$('.searchSupport div').width($('.search').width() - 20);
		$(window).resize(function() {
			var windowWidth = $(window).width();
			if(windowWidth < 768) {
				$('.ct1').removeClass('container');
				$('.ct1').addClass('container-fluid');
			} else {
				$('.ct1').removeClass('container-fluid');
				$('.ct1').addClass('container');
			}
			$('.searchSupport div').width($('.search').width()-20);
			if(windowWidth > 575) {
				$('#ggnd').hide();
				$(".mo").hide();
			} else {
				$(".mo").show();
				$('#ggnd').hide();
			}
		});
			
		// $("#ggnd").hide();
			
		$('.hamber').click(function(){
			$("#ggnd").toggle();
			$(".mo").toggle();
		});
		$('.exit-btn').click(function() {
			$("#ggnd").toggle();
			$(".mo").toggle();
		});
			
		$('.st1').keyup(function() {
			$('.st2').val($('.st1').val());
		});
		$('.st2').keyup(function() {
			$('.st1').val($('.st2').val());
		});
		
		$('.Searchtext').keyup(function(event) {
			var existSearchResult = $('.searchSupport div').text();
			console.log('hello : ' + existSearchResult.toString());
			console.log('bye : ' + existSearchResult[0]);
			var exceptionKey = [9, 16, 17, 18, 19, 20, 27, 33, 34, 35, 36, 37, 38, 39, 40, 45, 91, 93, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 144, 145];
			if(exceptionKey.indexOf(event.keyCode) < 0) {
				console.log(event.which);
				$('.searchSupport').empty();
				var searchKeyword = $('.st1').val();
				console.log(typeof searchKeyword + ", " + searchKeyword);
				$.ajax({
					async: true,
		        	type: 'POST',
		        	data: searchKeyword,
		        	url: '/getSearchResult',
		        	dataType: 'json',
		        	contentType: 'application/json; charset=UTF-8',
		        	success: function(data) {
		        		if(data.length > 0) {
							$('.searchSupport').show();
			        		$(data).each(function(idx, val) {
			        			console.log(val);
				        		$('.searchSupport').append('<div class="searchResult">' + val + '</div>');
			        		});
		        		} else {
		        			$('.searchSupport').hide();
		        		}
		        	},
		        	error : function() {
	        			$('.searchSupport').hide();
		        		console.log('error');
		        	}
				});
			}
		});
		$('html').click(function(e) {
			if(!$(e.target).hasClass('searchSupport')) {
				$('.searchSupport').hide();
			}
		});
		
		$(document).on('click', '.searchSupport div', function() {
			$('.search').submit();
		});
		$(document).on('mouseover', '.searchResult', function() {
			$('.Searchtext').val($(this).text());
			console.log($('.Searchtext').val());
		});
	});
</script>
<header>
	<%
		// 로그인이 되었을때 안되었을때 다르게 보이게 하기
		// 세션 체크
		
		String userId = null;
	
		if(session.getAttribute("userId") != null){
			userId = (String)session.getAttribute("userId");
		}
	%>
    <div class="container-fluid pc">
        <div class="container header-container">
            <div class="row">
                <a href="index" class="logo col-3 col-lg-4">
                    <img class="header-logo" src="${pageContext.request.contextPath}/resources/imgs/tripON_logo_black.png" alt="trip-on">
                </a>
                <ul class="sub-menu col-9 col-lg-8">
                	
                	<%
                		// 로그인 하지 않았을 때 보여지는 화면
                		if(userId == null){
                	%>
                
		                    <li class="col-5 signin-li">
		                        <a href="sign">회원가입</a>
		                    </li>
		                    <li class="col-4 col-sm-3">
		                        <a href="login">로그인</a>
		                    </li>
                    <% 
                    	// 로그인이 되어 있는 상태에서 보여주는 화면
                		} else {
                    
                    %>
                    		<li class="col-5 username-li">
								<div class="pc-username-div">
									<div class="pc-username">${userName}</div><span>&nbsp;님</span>
								</div>
								<div>&nbsp;환영합니다.</div>
		                    </li>
		                    <li class="col-4 col-sm-3">
		                        <a class="btn logout-btn main-logout" href="logout">로그아웃</a>
		                    </li>
                    
					<%
                		}
					
					%>
                    <li class="col-4">
                        <form action="getSearchResultList" class="search">
                            <button type="submit"></button>
                            <input class="Searchtext st1" type="text" placeholder="Search" name="searchKeyword" autocomplete="off">
	                        <div class="searchSupport"></div>
                        </form>
                    </li>
                </ul>
                <div class="line"></div>
            </div>
        </div>
    </div>
    <div class="between-div"></div>
    <div class="container pc">
        <ul class="main-menu">
            <li>
            <a href="user_categoryPage">여행상품</a>
            </li>
            <span>|</span>
            <li>
                <a href="goInfo_managementPage">마이페이지</a>
            </li>
            <span>|</span>
            <li>
                <a href="getUserNoticeList">공지사항</a>
            </li>
            <span>|</span>
            <li>
                <a href="getUserFaqList">자주 묻는 질문</a>
            </li>
            <span>|</span>
        </ul>
    </div>
    
    
    <!-- 모바일 일 때 -->
    <div class="container-fluid mo">
        <div class="container">
            <div class="header-up">
            	<div class="col-4 header-up-div">
		            <span class="material-icons hamber">
						menu
					</span>
            	</div>
            	<div class="col-4 header-up-div">
	                <a href="index" class="logo">
	                    <img class="header-logo mainlogo" src="${pageContext.request.contextPath}/resources/imgs/tripON_logo_black.png" alt="trip-on">
	                </a>
            	</div>
            	<div class="col-4 header-up-div">
            		<a href="goInfo_managementPage" class="logo">
						<img class="fit-picture mypage" src="${pageContext.request.contextPath}/resources/imgs/mypage_icon.png" alt="Mypage">
					</a>
            	</div>
            </div>
            <div class="header-down">
                <form action="getSearchResultList" class="search">
                    <button type="submit"></button>
                    <input class="Searchtext st2" type="text" placeholder="Search" name="searchKeyword" autocomplete="off">
                    <div class="searchSupport"></div>
                </form>
            </div>
<!--            <div class="linesun"></div> -->
        </div>
    </div>
    
    <%
		// 로그인이 되었을때 안되었을때 다르게 보이게 하기
		// 세션 체크
		if(session.getAttribute("userId") != null){
			userId = (String)session.getAttribute("userId");
		}
	%>
    
    <!-- 1-3. GNB 박스 -->
    <nav id="ggnd" class="gnb">
        <!-- nav도 블록태그 -->
        <ul class="ulc">
            <li>
            	<div class="gnbbg" style="display: flex; justify-content: space-between; align-items: center;">
            	    <%
                		// 로그인 하지 않았을 때 보여지는 화면
                		if(userId == null){
                	%>
            				<a class="tet" href="login"><span class="spt">로그인하기</span></a>
            				<div class="btn-set">
            		
            		<% 
                    	// 로그인이 되어 있는 상태에서 보여주는 화면
                		} else {
                    
                    %>
                    		<div class="tet logname" onclick="location.href='goInfo_managementPage'"><span class="un">${userName}</span><span class="spt">&nbsp;님</span></div>
                    		<div class="btn-set">
                    		<a class="btn logout-btn logout" href="logout">로그아웃</a>
                    <%
                		}
					
					%>
	            		<span class="material-icons exit-btn tet">
							close
						</span>
					</div>
                </div>
            </li>
            <li class="tct"> 
                <a class="tet txtt" href="user_categoryPage">여행상품</a>
            </li>
            <li>
                <a class="tet txtt" href="goInfo_managementPage">마이페이지</a>
            </li>
            <li>
                <a class="tet txtt" href="getUserNoticeList">공지사항</a>
            </li>
            <li>
                <a class="tet txtt" href="getUserFaqList">자주 묻는 질문</a>
            </li>
        </ul>
    </nav>
  
    
    
</header>