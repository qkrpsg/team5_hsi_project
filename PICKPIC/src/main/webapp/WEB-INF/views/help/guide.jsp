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


.guidetitle {
	margin-top: 3%; color : white;
	font-weight: bold;
	font-size: 30px;
	text-align: center;
	color: white;
}

.guidetext1 {
	color: #ce6400;
	font-weight: bold;
	font-size: 40px;
	text-align: center;
}

.guidetext2 {
	color: #ce6400;
	font-weight: bold;
	font-size: 30px;
	text-align: center;
	margin-top: 13%;
}

.guidetext3 {
	font-weight: bold;
	font-size: 20px;
	text-align: left;
}

.guidetext4 {
	font-weight: bold;
	font-size: 15px;
	text-align: left;
}

.arrow {
	width: 80;
	height: 70px;
	float: center;
}

.arrowtext {
	font-size: 15px;
	font-weight: bold;
	margin-top: 3%;
	text-align: right;
}
.row{
margin-top: 7%;
	margin-left: 20%;
	margin-right: 20%;

}

/* 메인 페이지 이외에 페이지에서 넣어야 하는 속성 */
</style>

<div class="row" >
	<div class="col-md-12" style="background-color: #aad4b5">
		<p class="guidetitle">피크픽과 함께하는</p>
		<p class="guidetext1">피크픽 입문 1 to 4</p>
	</div>
	<div class="col-md-12"
		style="background-color: #7badbc; border-bottom: white solid 2px; border-top: white solid 2px">
		<div class="col-md-4">
			<p class="guidetext2">STEP 1</p>
		</div>
		<div class="col-md-7" style="margin: 3%;">
			<p class="guidetext3">어디서 찍어야 잘나올까?</p>
			<p class="guidetext4">
				더이상 어느 장소에서 찍어야 할지 고민하지 마세요.
				인생사진을 위한 사진 명소!
				피크픽에서 모두 알려드립니다
			</p>
		</div>
	</div>
	<div class="col-md-12"
		style="background-color: #7badbc; border-bottom: white solid 2px;">
		<div class="col-md-4">
			<p class="guidetext2">STEP 2</p>
		</div>
		<div class="col-md-7" style="margin: 3%;">
			<p class="guidetext3">무슨 필터를 적용해야 하지?</p>
			<p class="guidetext4">
				사진은 잘 찍었는데... 2% 부족한 느낌?
				이제는 피크픽만 믿으세요.
				장소, 시간에 알맞게 필터를 추천해드립니다.
			</p>
		</div>
	</div>
	<div class="col-md-12"
		style="background-color: #7badbc; border-bottom: white solid 2px;">
		<div class="col-md-4">
			<p class="guidetext2">STEP 3</p>
		</div>
		<div class="col-md-7" style="margin: 3%;">
			<p class="guidetext3">다른 사람들은 어떻게 찍었을까?</p>
			<p class="guidetext4">
				사진을 찍을 때 무슨 포즈를 취해야할지,
				어떤 표정을 지어야할지 고민이었다구요?
				지금 바로 피크픽에서 다른 사람들의 사진을 확인하세요!
			</p>
		</div>

	</div>
	<div class="col-md-12"
		style="background-color: #7badbc; border-bottom: white solid 2px;">
		<div class="col-md-4">
			<p class="guidetext2">STEP 4</p>
		</div>
		<div class="col-md-7" style="margin: 3%;">
			<p class="guidetext3">나만의 필터를 만들어서 저장하고싶어!</p>
			<p class="guidetext4">
				필터를 적용하는건 좋은데... 매번 귀찮으셨죠?
				나만의 필터를 만들어서 저장하세요.
				터치 한번으로 자주 사용하던 필터를 즉시 적용시킬 수 있습니다.
			</p>
		</div>

	</div>
	<div class="col-md-12">
		<div class="col-md-10">
			<p class="arrowtext">피크픽 하러가기!</p>
			<!-- 어플 다운로드로 이동  -->
		</div>
		<div clas="col-md-2">
			<img src="<c:url value='/resources/images/r3.jpg' />" class="arrow">
		</div>
	</div>
</div>
