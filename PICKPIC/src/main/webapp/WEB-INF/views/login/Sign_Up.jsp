<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link href="<c:url value='/css/Sign_Up.css' />" rel="stylesheet">
<script src="<c:url value='/js_api/jquery.form-validator.js'/>"></script>

<script>

/* var file = document.querySelector('#ppa_profile_path');
file.onchange = function() {
	var fileList = file.files;
	// 읽기
	var reader = new FileReader();
	var filename=fileList[0].name;
	reader.readAsDataURL(fileList[0]);
	//로드 한 후
	reader.onload = function() {
		var img = new Image();
		img.src= reader.result;
		img.onload = function(e) {
			$('.filebox .upload-hidden').siblings('.upload-name').val(filename);
		};
		
	};
};
 */

	/* $(document).ready(
		function() {
			var fileTarget = $('.filebox .upload-hidden');
			fileTarget.on('change', function() { // 값이 변경되면 
				if (window.FileReader) { // modern browser 
					console.log(this);
					var filename = $(this)[0].files[0].name;
					console.log(filename);
				} else { // old IE 
					var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
				} // 추출한 파일명 삽입
				$(this).siblings('.upload-name').val(filename);
			});
		}); 
	 */

	$(function() {
		// setup validate
		$.validate();
	});
	$(document).ready(function() {
		function ch() {
			alert('이메일 인증을 해주세요~');
		}

		$('.submit_hi').click(function() {
			if ($('#ppa_agree').filter(':checked').length == 1) {
				alert("이메일 인증을 확인 해주세요");
				$("#my_form").submit();
			}
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

		jo.onclick = function() {
			if ($('#hi').html() != "사용 가능한 이메일 입니다.") {
				alert('이메일 중복체크를 해주세요');
				email.focus();
				return false;
			}
			if (pwd.value != pwdChk.value) {
				alert('비밀번호가 일치하지 않습니다.');
				pwdChk.focus();
				return false;
			}
			if ($('#ppa_agree').filter(':checked').length == 0) {
				alert('이용약관에 동의 해주세요');
				agree.focus();
				return false;
			}
		}//onclick	

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
			<form role="form" action='<c:url value="/user/sign_process.pic"/>' method="POST" id="my_form">
				<div class="form-group">
					<label for="ppa_email">이메일</label> 
					<input type="text" class="form-control" name="ppa_email" id="ppa_email" placeholder="이메일을 입력해 주세요" data-validation="required length email" data-validation-length="5-30">
					<a class="email_check btn btn-info" style="margin-top: 10px;">중복체크</a>		
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />			
					<span id="hi" style="color: red;"></span>
				</div>
				<div class="form-group">
					<label for="ppa_password">비밀번호</label> 
					<input type="password" class="form-control" name="ppa_password" id="ppa_password" data-validation="required custom" data-validation-regexp="^(?=.*[0-9])(?=.*[a-zA-Z])(?=\w+\$)(?=\S+\$).{10,20}\$" placeholder="비밀번호를 입력해주세요">
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
					<input type="file" id="ppa_profile_path" class="upload-hidden" name="ppa_profile_path">
				</div>
				<div class="form-group" style="overflow: hidden;">
					<input type="checkbox" name="ppa_agree" value="이용약관" id="ppa_agree" value="ok" style="float: left; margin-right: 10px;" />
					<p style="float: left;">이용약관에 동의합니다.</p>
				</div>
				
				<div class="form-group text-center">
					<div id="join-submit" class="btn btn-primary submit_hi"  >
						회원가입<i class="fa fa-check spaceLeft"></i>
					</div>
					<div class="btn btn-warning">
						가입취소<i class="fa fa-times spaceLeft"></i>
					</div>
					
					<input type="hidden" name="ppa_type" value="pickpic" />
					
				</div>
			</form>
			
		</div>
		<!-- </div> -->
	</div>
</div>

<script>
/* 파일명/파일data 추출- 위로 올리지 말것!  */
var file = document.querySelector('#ppa_profile_path');
var img = new Image();
file.onchange = function() {
	var fileList = file.files;
	// 읽기
	var reader = new FileReader();
	var filename=fileList[0].name;
	reader.readAsDataURL(fileList[0]);
	//로드 한 후
	reader.onload = function() {	
		img.src= reader.result;
		img.onload = function(e) {
			$('.filebox .upload-hidden').siblings('.upload-name').val(filename);
		};
		console.log(img.src);
	};
};

</script>

