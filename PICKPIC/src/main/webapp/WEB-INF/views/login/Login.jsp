<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
 <link href="<c:url value='/css/Login.css' />" rel="stylesheet">  
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> 
<script src="<c:url value='/js/Login.js'/>"></script>

 <section class="l_login_all_wrap">
 	
 	<div class="l_login_wrap">
 		
 		<div class="l_login_p_wrap">
 			<div><h2>로그인</h2></div>
 			<div><p>피크픽 커뮤니티에 로그인 하신 후 다양한 정보와 많은 혜택을 누리세요.</p></div>
 		</div>
 	
 	
	 	<div class="l_login_bottom_wrap">
	 	<div class="l_login_background"></div>
	 		<div class="l_login_left_wrap">
	 			
		 			<div class="l_login_left_text">
		 				<div><h2>피크픽 로그인</h2></div>
	 					<div><p>피크픽 커뮤니티에 오신것을 환영합니다.</p></div>
		 			</div>
		 			
		 			<div class="l_login_left_form_wrap">
		 				<form action="<c:url value='/user/loginProcess.pic'/>"  method="post">
		 				<c:if test="${! empty sessionScope.ppu_id }" var="isLogin">
								<div class="alert alert-success col-md-12">${sessionScope.ppu_id}님
									환영합니다
								</div>
							</c:if>	
							<c:if test="${not isLogin }">
		 				<div>
		 						
		 					
		 					<input type="text" id="id" name="ppu_id"   value="" placeholder="아이디" >
		 					<input type="password" id="pwd" name="ppu_password" value="" placeholder="비밀번호">
		 				
		 				</div>
		 				
		 				
		 				<div>
		 					<input type="submit" value="로그인" class="btn btn-info">
		 				</div>
		 					</c:if>
		 				
		 				
		 				
		 				</form>
		 			</div>
		 			
		 			<div class="l_login_left_bottom">
		 				<ul>
		 					<li><a href="#">아이디</a><span></span></li>
		 					<li><a href="#">비밀번호 찾기</a><span></span></li>
		 					<li><a href="#">회원가입</a><span></span></li>
		 				
		 				</ul>
		 			</div>
	 			
	 		</div><!-- l_login_left_wrap -->
	 		
	 		<div class="l_login_right_wrap">
	 			<div class="l_login_right_text">
	 				<div><h2>SNS 로그인</h2></div>
 					<div><p>피크픽에서는 SNS로 로그인하여 간편하게 서비스를 이용하실 수 있습니다.</p></div>
		 		</div>
	 		
	 		
	 			<div class="l_login_right_form_wrap">
	 				<form action="">
						<ul>												
							<li><a href="#"></a><input type="image" src="<c:url value='/resources/images/login/facebook_login.png'/>"  ></a></li>
							<li><a id="kakao-login-btn"></a><a href="http://developers.kakao.com/logout"></a></li>
							<li><a href="#"><input type="image" src="<c:url value='/resources/images/login/naver_login.png'/>"  ></a></li>
							<li><a href="#"><input type="image" src="<c:url value='/resources/images/login/google_login.png'/>"  ></a></li>
						</ul>
					</form>
	 			</div>
	 		
	 		
	 		</div>
	 		
	
	 		<!-- <img id="kakao-login-btn" src="<c:url value='/resources/images/kakao_login.png' />" /> -->
	 		
	 		
	 	</div>
 	</div><!-- l_login_wrap -->
 </section>
 
<script type='text/javascript'>
  	//<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('19a015941c45856ff5af9bbf40617161');
    // 카카오 로그인 버튼을 생성합니다.
    
    Kakao.Auth.createLoginButton({
    	container: '#kakao-login-btn',
      success: function(authObj) {
        alert(JSON.stringify(authObj));
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
    
    /* Kakao.Auth.createLoginButton({
    	container: '#kakao-login-btn',
      success: function(authObj) {
    	 
    	  
    	  Kakao.API.request({
              url: '/v2/user/me',
              success: function(res) {
                alert(JSON.stringify(res));
              },
              fail: function(error) {
                alert(JSON.stringify(error));
              }
            });
    	  
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    }); */
    
    
   
    
    
   /*  function loginWithKakao() {
        // 로그인 창을 띄웁니다.
        Kakao.Auth.login({
          success: function(authObj) {
        	  console.log("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
        	  console.log(JSON.stringify(authObj));
        	  console.log("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
        	  
            
          },
          fail: function(err) {
            alert(JSON.stringify(err));
          }
        });
      }; */
    
  //]]>
</script>