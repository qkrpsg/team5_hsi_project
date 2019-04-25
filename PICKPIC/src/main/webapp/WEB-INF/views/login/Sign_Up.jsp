<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="<c:url value='/css/Login.css' />" rel="stylesheet">  

<script>
$(document).ready(function(){
	var fileTarget = $('.filebox .upload-hidden'); 
fileTarget.on('change', function(){ // 값이 변경되면 
	if(window.FileReader){ // modern browser 
		var filename = $(this)[0].files[0].name; } else { // old IE 
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			} // 추출한 파일명 삽입
			$(this).siblings('.upload-name').val(filename); }); }); 

		
   
    $(document).ready(function(){
    		var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
    		//console.log(re);
    		var id = document.getElementById("ppu_id");
    	    var pwd = document.getElementById("ppu_password");
    	    var pwdChk = document.getElementById("ppu_passwordCheck");
    	    var name = document.getElementById("ppu_name");
    	    var nickname = document.getElementById("ppu_nickname");
    	    
    	  //  var phone = document.getElementById("ppu_tetephone");
    	   // var address = document.getElementById("ppu_address");
    	   // var age = document.getElementById("ppu_age");
    	    var gender = document.getElementById("ppu_gender");
    	    var profile = document.getElementById("ppu_profile_path");
    	    var agree = document.getElementById("ppu_agree");
    	
    	
    	var jo = document.getElementById("join-submit");
        
    	
    	jo.onclick = function() {
        	if(id.value == ''){
        		alert('아이디를 입력하세요');
        		id.focus();
                return false;
       		}
        	if(pwd.value == ''){
        		alert('비밀번호를 입력하세요');
        		pwd.focus();
                return false;
       		}
        	
        	if(pwdChk.value == ''){
        		alert('비밀번호를 확인해주세요');
        		pwdChk.focus();
                return false;
       		}else if(pwd.value != pwdChk.value){
       			alert('비밀번호를 확인해주세요');
       			pwdChk.focus();
                return false;
       		}
        	
        	if(name.value == ''){
        		alert('이름을 입력하세요');
        		name.focus();
                return false;
       		}
        	
        	if(nickname.value == ''){
        		alert('닉네임을 입력하세요');
        		nickname.focus();
                return false;
       		}
        	
        	
        	if(profile.value == ''){
        		alert('사진을 업로드 해주세요');
        		profile.focus();
                return false;
       		}
        	if(!agree.checked){
        		alert('이용약관에 동의 해주세요');
        		agree.focus();
                return false;
       		}
        	
        	
        	
        	
        }//onclick	
    	
    });
    

   
 
$(document).ready(function(){
	
});

$(function(){
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
.filebox input[type="file"] 
{
position: absolute; 
width: 1px; 
height: 1px; 
padding: 0; 
margin: -1px; 
overflow: hidden; clip:rect(0,0,0,0); border: 0; } 


   
   .filebox .upload-name { 
   display: inline-block; padding: .5em .75em; /* label의 패딩값과 일치 */ 
   font-size: inherit; font-family: inherit; 
   line-height: normal;
   border-radius: .25em;  vertical-align: middle; 
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2; 
     }
 

</style>
<article class="container" style="margin-top:100px;">
		<div class="page-header">
				<div class="col-md-6 col-md-offset-3">
				<h3>회원가입 Form</h3>
				</div>
		</div>
		
		<div class="col-sm-6 col-md-offset-3" style="boder:1px red solid;">
				<form role="form" action='<c:url value="/user/sign_process.pic"/>' method="POST">
						
						
						<div class="form-group">
								<label for="ppu_id">아이디</label>
								<input type="text" class="form-control" name="ppu_id" id="ppu_id" placeholder="아이디를 입력해 주세요">
						</div>
						
						<div class="form-group">
								<label for="ppu_password">비밀번호</label>
								<input type="password" class="form-control" name="ppu_password" id="ppu_password" placeholder="비밀번호를 입력해주세요">
						</div>
						<div class="form-group">
								<label for="ppu_passwordCheck">비밀번호 확인</label>
								<input type="password" class="form-control" name="ppu_passwordCheck" id="ppu_passwordCheck" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
						</div>
						<div class="form-group">
								<label for="ppu_name">이름</label>
								<input type="text" class="form-control" name="ppu_name" id="ppu_name" placeholder="이름 입력해 주세요">
						</div>
						
						
						<div class="form-group">
								<label for="ppu_nickname">닉네임</label>
								<input type="text" class="form-control" name="ppu_nickname" id="ppu_nickname" placeholder="닉네임을 입력해 주세요">
						</div>
						
						
						
						
						
						
						
						
						<div class="form-group">
								<label for="ppu_gender" >성별</label>
								
								<input type="radio" style="margin-left:10px;" name="ppu_gender" id="ppu_gender" class="ppu_gender" value="m" checked />남자
								<input type="radio"  name="ppu_gender"  class="ppu_gender" value="f" />여자
						</div>
						
						
						
						
						
						<div class="filebox"> 
							<input class="upload-name  btn-default" value="프로필 사진을 올려주세요" disabled="disabled">
							<label for="ppu_profile_path" class="btn btn-warning" name="ppu_profile_path">업로드</label> 
							<input type="file" id="ppu_profile_path" class="upload-hidden" name="ppu_profile_path"> 
						</div>

						
						
						
						<div class="form-group" style="overflow: hidden;">
							<input  type="checkbox" name="ppu_agree" value="이용약관" id="ppu_agree"  value="ok" style="float: left;margin-right:10px;" /><p style="float: left;">이용약관에 동의합니다.</p>
						</div>

<!-- 
						<div class="form-group">
						<label>약관 동의</label>
						<div data-toggle="buttons">
						<label class="btn btn-primary active" for="inputAgree">
							이용야야양
						<span class="fa fa-check">ds</span> autocomplete="on" checked
							
						</label> 
						
						<input  type="checkbox" name="inputAgree" value="이용약관" id="inputAgree" /><p>이용약관에 동의합니다.</p>
						
						</div>
						</div>
-->
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

</article>