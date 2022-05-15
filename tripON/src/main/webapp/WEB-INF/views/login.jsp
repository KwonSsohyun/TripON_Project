<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./template/head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
<meta http-equiv="Expires" content="Mon, 06 Jan 1990 00:00:01 GMT"> 
<!-- # 위의 명시된 날짜 이후가 되면 페이지가 캐싱되지 않습니다. (따라서 위와 같은 날짜로 지정할 경우 페이지는 지속적으로 캐싱되지 않습니다.)  -->
<meta http-equiv="Expires" content="-1">
<!--  # 캐시된 페이지가 만료되어 삭제되는 시간을 정의합니다. 특별한 경우가 아니면 -1로 설정합니다.  -->
 <meta http-equiv="Pragma" content="no-cache">
<!--   # 페이지 로드시마다 페이지를 캐싱하지 않습니다. (HTTP 1.0)  -->
 <meta http-equiv="Cache-Control" content="no-cache">
<!--   # 페이지 로드시마다 페이지를 캐싱하지 않습니다. (HTTP 1.1) -->
<!-- 네이버 스크립트 -->

<!-- <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script> -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<script>

   window.onload = function(){
   //    alert("111");
      if("${userId}"==null || "${userId}"== ''){
   //       alert("222");   
         $("#uid").val("");
         $("#upw").val("");
      }
   };

   window.onpageshow = function(event) {
       if ( event.persisted ) {
         //뒤로가기
   //       alert("뒤로가기");
         $("#uid").val("");
         $("#upw").val("");
       } else {
   //       alert("앞으로 가기");
         let addr = location.href;
         if( addr.indexOf('/login') >= 0){
            $("#uid").val("");
            $("#upw").val("");
         }else if("${userId}" == null){
            $("#uid").val("");
            $("#upw").val("");
         }else {
            $("#uid").val("");
            $("#upw").val("");
         }
         
       }
   }
</script>
 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        // ***********************  ▼ 카카오 로그인  API  ***********************
        function socialLogin(kakao_mem_id, kakao_mem_nicknam, kakao_mem_email) {
           
           // alert("소셜 로그인");
           console.log(kakao_mem_id);
           console.log(kakao_mem_nicknam);
           console.log(kakao_mem_email);

            
           var form = document.createElement("form");
           form.setAttribute("charset", "UTF-8");
            form.setAttribute("method", "Post");  // Post 방식
            form.setAttribute("action", "/kakaoLogin"); // 요청 보낼 주소
            
            // ▶ 아이디
            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden"); // hidden
            hiddenField.setAttribute("name", "kakao_mem_id");
            hiddenField.setAttribute("value", kakao_mem_id);
            form.appendChild(hiddenField);

            
            // ▶ 비번
            hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", "kakao_mem_pw");
            hiddenField.setAttribute("value", kakao_mem_id);
            form.appendChild(hiddenField);
            
            
            // ▶ 닉네임
            hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", "kakao_mem_nickname");
            hiddenField.setAttribute("value", kakao_mem_nicknam);
            form.appendChild(hiddenField);
            
            
            // ▶ 메일
            hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", "kakao_mem_email");
            hiddenField.setAttribute("value", kakao_mem_email);
            form.appendChild(hiddenField);
            
            document.body.appendChild(form);
            form.submit();
        }
        
        function saveToDos(token) { //item을 localStorage에 저장합니다. 
            typeof(Storage) !== 'undefined' && sessionStorage.setItem('AccessKEY', JSON.stringify(token)); 
        };

        window.Kakao.init('27c1f07d1eed7bb62a6d4f6843516007'); //    '본인 JAVASCRIPT API 키'
        
        function kakaoLogin() {
           console.log('test');
            window.Kakao.Auth.login({
                scope: 'profile_nickname, account_email', // 동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    saveToDos(response.access_token)  // 로그인 성공하면 사용자 엑세스 토큰 sessionStorage에 저장
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/v2/user/me',
                        success: (res) => {
                            const kakao_account = res.kakao_account;   
                            console.log("[데이터] : ",res);
                            console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
                            
                            console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
                            console.log(res.properties.nickname);

                            console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 
                            
                            // alert("로그인");
                            
                            socialLogin(res.id, res.properties.nickname, res.kaccount_email); // form 태그에 정보 넘김
                            // window.location.href='http://localhost:8090'
                        }
                    });
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        };

        const login = document.querySelector('#kakaoLogin');
        

    </script>
   
<body>
<%@ include file="./template/header.jsp" %>

   <div class="login col-12">
   <form action="/loginIndex" method="post" class="needs-validation" novalidate>
   	  <h2>로그인</h2>
      <div class="login_id">
         <input type="text" maxlength="10" id="uid" class="form-control" name="mem_id" placeholder="아이디" required>
         <div class="invalid-feedback">아이디를 입력해주세요</div>
      </div>
      
      <div class="login_pw">
         <input type="password" maxlength="15" id="upw" class="form-control" name="mem_pw" placeholder="비밀번호(8~15자리 숫자, 영문자, 특수문자)" required>
         <div class="invalid-feedback">비밀번호를 입력해주세요</div>
      </div>
      
      <c:if test="${error ne null}">
         <% 
              /* request.getParameter("error") */
         
            out.println("<div class='alert alert-danger' style='margin-top: 30px; background-color: #FEEACF; border-color: #FF6500; font-weight:bold;'>");
            out.println("아이디와 비밀번호를 확인해 주세요.");
            out.println("</div>");
      
         %>
      </c:if>
       
       <div class="submit">
                <input type="submit" value="로그인">
         </div>
         <div class="sign">
            <ul>
             <a href="/findID">아이디 찾기</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
             <a href="/findPW">비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
             <a href="/sign">회원가입</a>
         </ul>   
      </div>

       <div class="social-icons">     
          <!-- ▼ 카카오 로그인  API -->
         <a href="#" id="kakaoLogin" onclick="kakaoLogin()"><img class="kakao" src="${pageContext.request.contextPath}/resources/imgs/kakao.png" width="50"/></a>&nbsp;&nbsp;
         <!-- ▼ 네이버 로그인  API -->
        <a id="naverLogin" href="#"><img class="naver" src="${pageContext.request.contextPath}/resources/imgs/naver.png" width="50" /></a>
         <div id="naver_id_login" style="display: none;"></div>
         <!-- style="display: none;" -->
       </div>
       
       
   </form>
   
  
      </div>
      <br>
      
<script>

	$(document).on("click", "#naverLogin", function(){ 
	    var btnNaverLogin = document.getElementById("naver_id_login").firstChild;
	    btnNaverLogin.click();
	});
	
	// var naver_id_login = new naver_id_login("yLiP7rk8beYAINhMBUmy", "http://localhost:8090/naverLogin");
	var naver_id_login = new naver_id_login("yLiP7rk8beYAINhMBUmy", "http://www.tripon.cf/naverLogin");
	
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 2,40);
	// naver_id_login.setDomain("http://localhost:8090/");
	naver_id_login.setDomain("http://www.tripon.cf/"); 
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	
	naver_id_login.init_naver_id_login(); //initialize Naver Login Button

</script>


<script>
// Disable form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Get the forms we want to add validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>

</body>
<%@ include file="./template/login_footer.jsp" %>
</html>