<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>


<link href="<c:url value='/css/Login.css' />" rel="stylesheet">
<link href="<c:url value='/css/test/main.css' />" rel="stylesheet">
	
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="<c:url value='/js/Login.js'/>"></script>

	<script src="<c:url value='/js/test/main.js'/>"></script>

<div class="limiter">
		<div class="container-login100" style="background-image: url('/pickpic/resources/images/login_background.jpg');">
			<div class="wrap-login100">
				<form class="login100-form validate-form">
					<span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span>

					<span class="login100-form-title p-b-34 p-t-27">
						로그인
					</span>

				<div class="wrap-input100 validate-input" data-validate = "Enter username"> 
						 <input class="input100" type="text" name="username" placeholder="아이디">
					 </div> 

				 <div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="pass" placeholder="비밀번호">
					</div>

					

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							시작하기
						</button>
					</div>

				
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>


	


<script type='text/javascript'>
	//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('19a015941c45856ff5af9bbf40617161');
	// 카카오 로그인 버튼을 생성합니다.

	Kakao.Auth.createLoginButton({
		container : '#kakao-login-btn',
		success : function(authObj) {
			alert(JSON.stringify(authObj));
		},
		fail : function(err) {
			alert(JSON.stringify(err));
		}
	});

</script>
