<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0"/>

    <!--   캐쉬 삭제하기 -->
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <meta http-equiv="Pragma" content="no-cache"/>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/manager_common.css">
    <link rel="icon" type="image/x-icon" sizes="16x16" href="${pageContext.request.contextPath}/resources/imgs/tripON_favicon02.ico">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>TripON</title>
    <style type="text/css">
    	html, body {
    		padding: 0px;
    		margin: 0px;
    		width: 100%;
    		height: 100%;
    	}
    	p {
    		margin: 0px;
    	}
    	#big-div {
    		width: 100%;
    		height: 100%;
    		display: flex;
    		flex-direction: column;
    		justify-content: center;
    		align-items: center;
    	}
    	#first-div {
    		display: flex;
    		flex-direction: column;
    		justify-content: center;
    		align-items: center;
    		margin: 0px;
    		font-family: 'Noto Sans KR', sans-serif;
			font-size: 16px;
			font-weight: normal;
			color: #000000;
    	}
    	#first-div img {
    		width: 300px;
    		margin: 5px 0px;
    	}
    	#first-div p {
    		font-size: 56px;
			font-weight: bold;
			margin: 5px 0px;
    	}
    	#second-div {
    		display: flex;
    		flex-direction: column;
    		justify-content: center;
    		align-items: center;
    		margin: 30px 0px;
    		font-family: 'Noto Sans KR', sans-serif;
			font-size: 16px;
			font-weight: normal;
			color: #000000;
    	}
    	#second-div p:first-child {
    		color: #ff6500;
    		font-size: 20px;
    		font-weight: bold;
    		margin: 5px 0px;
    	}
    	#second-div p:last-child {
    		margin: 5px 0px;
    	}
    	#third-div {
    		display: flex;
    		justify-content: center;
    		align-items: center;
    		margin: 0px;
    		font-family: 'Noto Sans KR', sans-serif;
			font-size: 16px;
			font-weight: normal;
			color: #000000;
    	}
    	#third-div .goBack-btn {
    		background-color: #999999;
    		color: #ffffff;
    		margin: 0px 15px;
    	}
    	#third-div .goBack-btn:focus,  #third-div .goBack-btn:active{
    		box-shadow: none;
    	}
    	#third-div .goIndex-btn {
    		background-color: #5622ad;
    		color: #ffffff;
    		margin: 0px 15px;
    	}
    	#third-div .goIndex-btn:focus,  #third-div .goIndex-btn:active{
    		box-shadow: none;
    	}
    	.br1, .br2 {
   			display: none;
   		}
    	@media screen and (max-width:575px) {
    		.br2 {
    			display: inline;
    		}
    	}
    	@media screen and (max-width:359px) {
    		.br1 {
    			display: inline;
    		}
    		#second-div {
	    		align-items: flex-start;
	    	}
    	}
    </style>
</head>
<body>
	<div id="big-div">
		<div id="first-div">
			<img src="${pageContext.request.contextPath}/resources/imgs/tripON_logo_da.png" alt="로고">
			<p>죄송합니다.</p>
		</div>
		<div id="second-div">
			<p>페이지가 없거나 <br class=br1>오류가 발생하였습니다.</p>
			<p>현재 페이지가 존재하지 않거나, <br class=br2>현재 이용할 수 없는 페이지 입니다.</p>
		</div>
		<div id="third-div">
			<button class="btn goBack-btn" onclick="history.back();">뒤로 가기</button>
			<button class="btn goIndex-btn" onclick="location.href='/index'">메인페이지</button>
		</div>
	</div>
</body>
</html>