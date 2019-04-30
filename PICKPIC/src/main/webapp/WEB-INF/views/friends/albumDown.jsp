<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- css&js -->
<link href="<c:url value='/css/Pkp.css' />" rel="stylesheet">
<link href="<c:url value='/css/The_Modal.css' />" rel="stylesheet">
<%-- <script src="<c:url value='/js/The_Modal.js'/>"></script> --%>

<!-- CSS Bootstrap & Custom -->
<link rel="stylesheet" href="<c:url value='/css/templatemo-misc.css'/>">
<link rel="stylesheet" href="<c:url value='/css/animate.css'/>">
<link rel="stylesheet" href="<c:url value='/css/templatemo-main.css'/>">



<div style="height: 80px"></div>
<!-- /#home -->

<div id="intro">
	<div class="landing-text">
		<h1>앨범다운</h1>
			<a class="btn btn-info btn-lg" role="button">사진 옵션 선택하기</a>
		</p>
		<h3>
			내 픽크픽 사진들을 한꺼번에 파일로 저장하세요. <br>또 다른 사진에 내가 가지고 있는 필터를 적용해보세요.
		</h3>
	</div>
</div>


<div class="row">
	<!-- Modal -->
	<div class="modal fade" id="ModalCenter" tabindex="-1" role="dialog"
		aria-labelledby="ModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="ModalLongTitle">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
</div>
