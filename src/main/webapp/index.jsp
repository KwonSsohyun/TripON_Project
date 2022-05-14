<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="WEB-INF/views/template/head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
<script>
	if (self.name != 'reload') {
		self.name = 'reload';
		self.location.reload(true);
	}
	else self.name = ''; 

	$(function() {
		var demoSize = $('#demo').width();
		var halfDemoSize = demoSize / 2;
		var carouselInnerSize = $('.carousel-inner').width();
		var halfCarouselInnerSize = carouselInnerSize / 2;
		var moveMargin = halfCarouselInnerSize - halfDemoSize;
		var minusMoveMargin = 0 - moveMargin;
		$('.carousel-inner').css('margin-left', minusMoveMargin);
		
		$(window).resize(function() {
			var demoSize = $('#demo').width();
			var halfDemoSize = demoSize / 2;
			var carouselInnerSize = $('.carousel-inner').width();
			var halfCarouselInnerSize = carouselInnerSize / 2;
			var moveMargin = halfCarouselInnerSize - halfDemoSize;
			var minusMoveMargin = 0 - moveMargin;
			$('.carousel-inner').css('margin-left', minusMoveMargin);
		});
		$.ajax({
			async: true,
			type: 'POST',
			url: 'getPopularCategory',
			dataType: 'json',
			contentType: 'application/json; charset=UTF-8',
			success: function(data) {
				$(data).each(function(idx, val) {
					var category = '<li class="col-12 col-sm-6 col-md-4 col-lg-3"><a href="user_activityListPage?category_name=' + val.category_name + '"><div id="ct' + idx + '" class="category"><img src="${pageContext.request.contextPath}/resources/imgs/' + val.category_imgName + '"><div class="category-name">' + val.category_name + '</div></div></a></li>';
// 					var category = '<li class="col-12 col-sm-6 col-md-4 col-lg-3"><a href="user_activityListPage?category_name=' + val.category_name + '"><div id="ct' + idx + '" class="category"><img src="${pageContext.request.contextPath}/resources/imgs/' + val.category_imgName + '"></div></a></li>';
					$('.category-list').append(category);
				});
			},
			error: function() {
				console.log('error');
			}
		});
		$.ajax({
			async: true,
			type: 'POST',
			url: 'getPopularActivity',
			dataType: 'json',
			contentType: 'application/json; charset=UTF-8',
			success: function(data) {
				$(data).each(function(idx, val){
					var originalPrice1 = val.act_optPrice1;
					var fomattingPrice1 = originalPrice1.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					var originalPrice2 = '' + val.act_optPrice1 * 2;
					var fomattingPrice2 = originalPrice2.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					var activity = '<li class="col-12 col-sm-6 col-md-4 col-lg-3"><a href="getUser_detailsPage?act_num=' + val.act_num + '"><div class="activity"><div class="activity-img"><img src="${pageContext.request.contextPath}/resources/imgs/' + val.act_thumbImgName + '"></div><div class="activity-desc"><p class="activity-desc-p1">' + val.act_mainTitle + '</p><p class="activity-desc-p2">' + val.act_subTitle + '</p><p class="activity-desc-p3">&#8361;&nbsp;<del>' + fomattingPrice2 + '</del></p><p class="activity-desc-p4">&#8361;&nbsp;' + fomattingPrice1 + '</p></div></div></a></li>';
					$('.activity-list').append(activity);
				});
			},
			error: function() {
				console.log('error');
			}
		});
		$.ajax({
			async: true,
			type: 'POST',
			url: 'getIndexNoticeList',
			dataType: 'json',
			contentType: 'application/json; charset=UTF-8',
			success: function(data) {
				$(data).each(function(idx, val){
					var notice = '<li><a href="/getUserNotice?ntc_seq=' + val.ntc_seq + '"><div class="notice"><div class="notice-title">' + val.ntc_title + '</div><div class="notice-date">' + val.ntc_regdateFormat + '</div></div><div class="notice-line"></div></a></li>';
					$('.notice-list').append(notice);
				});
			},
			error: function() {
				console.log('error');
			}
		});
	});
</script>
</head>
<body>
<%@ include file="WEB-INF/views/template/header.jsp" %>

<!-- section -->
    <section>
        <div id="content" class="container-fluid">
           <div class="demo-div container-fluid">
                <div id="demo" class="carousel slide container" data-ride="carousel">
                    <ul class="carousel-indicators">
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <li data-target="#demo" data-slide-to="1"></li>
                        <li data-target="#demo" data-slide-to="2"></li>
                    </ul>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="${pageContext.request.contextPath}/resources/imgs/testImg_seoul.jpg" alt="seoul" onclick="location.href='user_activityListPage?category_name=서울'">
                            <div class="carousel-caption">
                                <h3>서울</h3>
                                <p>최다 구매 상품 최대 50% 할인 중</p>
                            </div>   
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/resources/imgs/testImg_busan.jpg" alt="busan" onclick="location.href='user_activityListPage?category_name=부산'">
                            <div class="carousel-caption">
                                <h3>부산</h3>
                                <p>인기 여행지 최대 30% 할인 중</p>
                            </div>   
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/resources/imgs/testImg_gangwon.jpg" alt="gyeonggi" onclick="location.href='user_activityListPage?category_name=경기'">
                            <div class="carousel-caption">
                                <h3>경기도</h3>
                                <p>최신 여행지 최대 45% 할인 중</p>
                            </div>   
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>
                </div>
            </div>
            <div id="popularCategory" class="container">
                <h2>인기 카테고리</h2>
                <div class="container">
                    <div class="category-group">
                        <ul class="category-list col-12 row">
                        </ul>
                    </div>
                    <div>
                        <button type="button" class="btn col-8" onclick="location.href='user_categoryPage'">전체보기</button>
                    </div>
                </div>
            </div>
            <div id="popularActivity" class="container">
                <h2>인기 상품</h2>
                <div class="container">
                    <div class="activity-group">
                        <ul class="activity-list col-12 row">
                        </ul>
                    </div>
                    <div>
                        <button type="button" class="btn col-8" onclick="location.href='getAllActivityList?searchKeyword='">더 보기</button>
                    </div>
                </div>
            </div>
            <div id="notice" class="container">
<!--                 <h2>공지사항</h2> -->
                <h2>공지사항</h2>
                <div class="container">
                    <div class="notice-group row">
                        <ul class="notice-list col-12">
                            <li>
                                <div id="notice-title">
                                    <div class="notice-tab1">공지사항 내역</div>
                                    <div class="notice-tab2" onclick="location.href='/getUserNoticeList'">+ 더 보기</div>
                                </div>
                                <div class="notice-line-group col-12">
                                    <div class="notice-line-1"></div>
                                    <div class="notice-line-2 col-12"></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

<%@ include file="WEB-INF/views/template/footer.jsp" %>
</body>
</html>