<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<style>
.header_top {
	background: white !important;
	opacity: 1;
	background: white;
	border-bottom: 1px #ccc solid;
}

.menu_wrap a {
	color: #5a5a5a !important;
	font-weight: normal !important;
	font-size: 1.1em !important;
}

.ul_submenu li a {
	color: #5a5a5a !important;
	font-weight: normal !important;
	font-size: .9em !important;
}

.login_wrap ul li a {
	color: #00AEEA !important;
}

.login_wrap ul li a span {
	background: #00AEEA !important;
}

.nav_wrap_top_position {
	opacity: 1;
	background: white;
	border-bottom: 1px #ccc solid;
}

.text1 {
	font-size: 40px;
	color: #00ffff;
}

#app1 {
	font-size: 25px;
	color: white;
	font-weight: bold;
	padding-top: 1%;
}

.appbutton {
	margin-right: 2%;
}

/* 메인 페이지 이외에 페이지에서 넣어야 하는 속성 */
</style>

<body style="background-color: #f3f2f0">
	<div class="row"
		style="margin-top: 5%; margin-left: 20%; margin-right: 20%">
		<div class="col-md-12"
			style="padding-left: 7%; padding-top: 7%; padding-right: 20%">
			<div class="col-md-7" style="padding-top: 8%;">
				<p style="font-size: 40px;">썸이 끝났다</p>
				<p class="text1">싸움의 시작, 피크픽</p>
				<p style="font-size: 20px;">
					지금 사진 혼자 찍고 계신가요? <br /> 피크픽을 시작하세요!<br /> 피크픽은 연인과 더 사직을 찍을 수 있고 <br />
					손쉽게 저장할수 있는 어플이다.
				</p>

			</div>
			<div class="col-md-5">
				<img src="<c:url value='/resources/images/down1.JPG'/> ">

			</div>


		</div>
	</div>
	<div class="col-md-12"
		style="background-color: #00ffff; padding: 1%; padding-left: 30%">
		<div class="col-md-2" id="app1">피크픽 시작하기</div>
		<div class="col-md-10">
			<button class="appbutton">
				<img src="<c:url value='/resources/images/app1.jpg'/>"
					style="border-radius: 20px;">
			</button>
			<button class="appbutton">
				<img src="<c:url value='/resources/images/app2.jpg'/>"
					style="border-radius: 20px;">
			</button>
			<button class="appbutton">
				<img src="<c:url value='/resources/images/app3.jpg'/>"
					style="border-radius: 20px;">
			</button>
			<button class="appbutton">
				<img src="<c:url value='/resources/images/app4.jpg'/>"
					style="border-radius: 20px;">
			</button>
		</div>

	</div>

</body>












