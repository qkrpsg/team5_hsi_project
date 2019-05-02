<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- css&js -->
<link href="<c:url value='/css/Pkp.css' />" rel="stylesheet">
<link href="<c:url value='/css/DownButton.css' />" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/css/animate.css'/>">
<link rel="stylesheet" href="<c:url value='/css/Modal.css'/>">


<!-- body -->

<div id="intro">
	<div class="landing-text animated bounceInDown">
		<h1>앨범다운</h1>
		<a class="btn btn-info btn-lg" role="button" id="option_btn">사진 옵션
			선택하기</a>
		</p>
		<h3>
			내 픽크픽 사진들을 한꺼번에 파일로 저장하세요. <br>또 다른 사진에 내가 가지고 있는 필터를 적용해보세요.
		</h3>
	</div>
</div>


<!-- Modal -->
<div class="modal" id="option_modal">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<h3 class="modal-title" id="option_title">원하는 사진이 있는 곳을 선택하세요.</h3>
		</div>
		<div class="modal-body">
			<div class="row text-center">

				<div class="col-xs-3 btn ">
					<img class="img-circle img_100"
						src="<c:url value='/resources/images/sns/M.PNG'/>" alt="image">
					<h5>내 픽보관함</h5>
				</div>

				<div class="col-xs-3 btn btn-file">
					<img class="img-circle img_100"
						src="<c:url value='/resources/images/sns/P.png'/>" alt="image">
					<h5>
						<a href="<c:url value='/friends/albumEditor.pic'/>">내 PC</a>
						<!-- <input type="file" name="attachedFile1" > -->
					</h5>
				</div>

				<div class="col-xs-3 btn">
					<img class="img-circle img_100"
						src="<c:url value='/resources/images/sns/I.PNG'/>" alt="image">
					<h5>인스타그램</h5>
				</div>
				<div class="col-xs-3 btn ">
					<img class="img-circle img_100"
						src="<c:url value='/resources/images/sns/F.png'/>" alt="image">
					<h5>페이스북</h5>
				</div>

			</div>

		</div>
	</div>

</div>

<script>
	//Get the modal
	var modal = document.getElementById('option_modal');

	// Get the button that opens the modal
	var btn = document.getElementById("option_btn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks on the button, open the modal 
	btn.onclick = function() {
		modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
		modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
</script>
