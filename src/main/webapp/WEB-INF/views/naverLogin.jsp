<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  // var naver_id_login = new naver_id_login("yLiP7rk8beYAINhMBUmy", "http://localhost:8090/naverLogin");
  
  var naver_id_login = new naver_id_login("yLiP7rk8beYAINhMBUmy", "http://www.tripon.cf/naverLogin");
  
  
  // 접근 토큰 값 출력
  // alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    // alert(naver_id_login.getProfileData('email'));
    // alert(naver_id_login.getProfileData('nickname'));
    // alert(naver_id_login.getProfileData('age'));
    
    $.ajax({
		type : "post",
		url : "/naverLoginData",
		data : {"naver_mem_username" : naver_id_login.getProfileData('name'),
			    "naver_mem_nickname" : naver_id_login.getProfileData('nickname'),
			    "naver_mem_email" : naver_id_login.getProfileData('email')
			},
		success : function(data){
			opener.document.location.href="/index";
			self.close();
		},
		error : function(){
			alert("다시 시도해주세요.");
		}
	});
    
  }
</script>
</body>
</html>