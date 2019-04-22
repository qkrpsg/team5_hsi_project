<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
		<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> 		
<a id="kakao-login-btn" style="display: block; width:2000px; height: 1000px; background:yellow;text-align: center;"></a>
	<a href="http://developers.kakao.com/logout">
</a>
		 		
	<!--  -->	 		
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
    
    
    function loginWithKakao() {
        // 로그인 창을 띄웁니다.
        Kakao.Auth.login({
          success: function(authObj) {
            alert(JSON.stringify(authObj));
          },
          fail: function(err) {
            alert(JSON.stringify(err));
          }
        });
      };
    

</script>		