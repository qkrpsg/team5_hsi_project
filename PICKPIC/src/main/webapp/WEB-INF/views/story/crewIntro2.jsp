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



.crewsa {
	width: 300px;
	height: 300px;
	border-radius: 150px;
	float: left;
	margin-right: 4%;
	margin-bottom: 5%;
}

.text1 {
	margin-top: 5%; font-size : 20px;
	font-weight: bold;
	font-size: 20px;
}

.text2 {
	font-size: 18px;

}
@media screen and (max-width:1000px) and (min-width:0px) {

.crewsa{
width:100%;
height:200px;
}
}

/* 메인 페이지 이외에 페이지에서 넣어야 하는 속성 */
</style>
<body style="background-color: #fbceb1";>
	<div class="row" style="margin-top: 6%;margin-left: 20%;margin-right: 20%">
		<div class="col-md-12">
			<p style="font-size: 40px; weight: bold; color: #5c5ed3; margin-bottom: 7%; margin-left: 3%;">크루 소개</p>
		</div>
		<div class="col-md-12">
			<img src="<c:url value='/resources/images/crew1.jpg'/>"
				class="crewsa">
			<p class="text1">박슬기(25)</p>
			<p class="text2">팀장</p>
		</div>
		<div class="col-md-12">
			<div class="col-md-6"">
				<img src="<c:url value='/resources/images/crew7.jpg'/>"
					class="crewsa">
				<p class="text1">고우진(32)</p>
				<p class="text2">팀원</p>
			</div>
			<div class="col-md-6">
				<img src="<c:url value='/resources/images/crew3.jpg'/>"
					class="crewsa">
				<p class="text1">김용강(28)</p>
				<p class="text2">팀원</p>
				<p class="text2">adsasdsdadasd</p>
			</div>
		</div>
		<div class="col-md-12">
			<div class="col-md-6">
				<img src="<c:url value='/resources/images/crew4.jpg'/>"
					class="crewsa">
				<p class="text1">이용수(27)</p>
				<p class="text2">팀원</p>
			</div>
			<div class="col-md-6">
				<img src="<c:url value='/resources/images/crew5.jpg'/>"
					class="crewsa">
				<p class="text1">최명범(26)</p>
				<p class="text2">팀원</p>
			</div>
		</div>
		<div class="col-md-12">
			<div class="col-md-6">
				<img src="<c:url value='/resources/images/crew6.jpg'/>"
					class="crewsa">
				<p class="text1">한주영(26)</p>
				<p class="text2">팀원</p>
			</div>
			<div class="col-md-6">
				<img src="<c:url value='/resources/images/crew2.jpg'/>"
					class="crewsa">
				<p class="text1">정영욱(23)</p>
				<p class="text2">팀원</p>
			</div>
		</div>
	</div>


</body>
