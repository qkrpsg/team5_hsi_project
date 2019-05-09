<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link href="<c:url value='/css/Sign_Up.css' />" rel="stylesheet">
<script src="<c:url value='/js_api/jquery.form-validator.js'/>"></script>

<script>
	$(document).ready(
			function() {
				var fileTarget = $('.filebox .upload-hidden');
				fileTarget.on('change', function() { // 값이 변경되면 
					if (window.FileReader) { // modern browser 
						var filename = $(this)[0].files[0].name;
					} else { // old IE 
						var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
					} // 추출한 파일명 삽입
					$(this).siblings('.upload-name').val(filename);
				});
			});

	$(document).ready(function() {
		var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
		//console.log(re);
		var email = document.getElementById("ppa_email");
		var pwd = document.getElementById("ppa_password");
		var pwdChk = document.getElementById("ppa_passwordCheck");
		var nickname = document.getElementById("ppa_nickname");
		var profile = document.getElementById("ppa_profile_path");
		var agree = document.getElementById("ppa_agree");

		var jo = document.getElementById("join-submit");

		$('.email_check').click(function() {
			$.ajax({
				url : '<c:url value="/validator/signUpEmailCheck.do"/>',
				dataType : 'json',
				data : {
					ppa_email : $('#ppa_email').val()
				},
				success : function(data) {
					$('#hi').html(data['error']);
				},
				error : function(request, error) {
					console.log('상태코드111:', request.status);
					console.log('서버로부터 받은 HTML데이타 222:', request.responseText);
					console.log('에러333:', error);
				}
			}); //ajax 끝	
		});

		$(function() {
			// setup validate
			$.validate();
		});
		jo.onclick = function() {
			if (pwd.value != pwdChk.value) {
				alert('비밀번호를 확인해주세요');
				pwdChk.focus();
				return false;
			}
			if ($('#hi').html() != "사용 가능한 이메일 입니다.") {
				alert('이메일 중복체크를 해주세요');
				email.focus();
				return false;
			}

		}//onclick	

	});

	$(function() {
		/* $('#ppu_tetephone').keypress(function(evt){

		    var code = evt.which?evt.whichl:event.keyCode;
		    var code2 =  evt.keyCode;
		   	
		    if(code2 < 48 || code2 > 57){
		       return false;
		    }
		}); */
	});
</script>
<style>
</style>

<div class="l_pkp_all_wrap">
	<div class="l_pkp_sub_wrap">
		<div class="row text-center">
			<div class="section-header col-md-12">
				<!--  -->
				<h2>회원가입</h2>
				<span>아래 폼을 작성하세요.</span>
			</div>
			<!-- /.section-header -->
		</div>

		<!-- /.row -->

		<!-- <div class="l_help_list_wrap"> -->
		<div class="row">
			<!--  -->
			<form role="form" action='<c:url value="/user/sign_process.pic"/>' method="POST">
				<div class="form-group">
					<label for="ppa_email">이메일</label> 
					<input type="text" class="form-control" name="ppa_email" id="ppa_email" placeholder="이메일을 입력해 주세요" data-validation="required">
					<a class="email_check btn btn-info" style="margin-top: 10px;">중복체크</a>		
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />			
					<span id="hi" style="color: red;"></span>
				</div>
				<div class="form-group">
					<label for="ppa_password">비밀번호</label> 
					<input type="password" class="form-control" name="ppa_password" id="ppa_password" placeholder="비밀번호를 입력해주세요" data-validation="required">
				</div>
				<div class="form-group">
					<label for="ppa_passwordCheck">비밀번호 확인</label> 
					<input type="password" class="form-control" name="ppa_passwordCheck" id="ppa_passwordCheck" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요" data-validation="required">
				</div>
				<div class="form-group">
					<label for="ppa_nickname">닉네임</label> 
					<input type="text" class="form-control" name="ppa_nickname" id="ppa_nickname" placeholder="닉네임을 입력해 주세요" data-validation="required">
				</div>
				<div class="filebox">
					<input class="upload-name  btn-default" value="프로필 사진을 올려주세요" disabled="disabled"> 
					<label for="ppa_profile_path" class="btn btn-warning" name="ppu_profile_path">업로드</label> 
					<input type="file" id="ppa_profile_path" class="upload-hidden" name="ppa_profile_path" data-validation="required">
				</div>
				<div class="form-group" style="overflow: hidden;">
					<input type="checkbox" name="ppa_agree" value="이용약관" data-validation="required" id="ppa_agree" value="ok" style="float: left; margin-right: 10px;" />
					<p style="float: left;">이용약관에 동의합니다.</p>
				</div>
				
				<div class="form-group text-center">
					<button type="submit" id="join-submit" class="btn btn-primary">
						회원가입<i class="fa fa-check spaceLeft"></i>
					</button>

					<button type="submit" class="btn btn-warning">
						가입취소<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</form>
		</div>
		<!-- </div> -->
	</div>
</div>