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
body{
margin-top:7%;
margin-left:20% ;
margin-right:20%;

}
.profile{
width:120px;
height:40px;
background-color:#de5151;
color:white;
margin-left: 1%;
margin-bottom: 2%;
border-radius: 20px;

}
.prosa{
width:200px;
height:200px;
border-radius: 100px;
margin-top: 2%;
margin-left: 5%;


}
.protext1{
font-size: 40px;
font-weight:bold;
}

.probutton{
width:100px;
height:40px;
background-color: #4b9ae4;
margin-right: 1%;
border-radius: 20px;

}
.routeimg3 {
	margin-top: 10%;
	margin-left: 10%;
	float: left;
	margin-right: 4%;
}

.routetext {
	margin-top: 10%;
}

.routetext2 {
	margin-top: 8%;
}

.routetext3 {
	margin-left: 10%;
	margin-top: 3%;
}
@media screen and (max-width:1000px) and (min-width:0px) {
.routeimg3{
width:80%;
}
.protext1{
margin-top: 5%;
}

}
</style>

<body>
	<div class="row" style="margin-top: 4%">
		<div class="col-md-12"
			style="background-color: #4aa8d8; padding-top: 7%;">
			<div class="col-md-7" style="padding-top: 5%; padding-left: 15%;">
				<p class="protext1">${sessionScope.ppu_id}</p>
				<p style="font-size: 20px;">누적픽 : 30개</p>
				<p style="font-size: 20px;">게시글 : 49개</p>
			</div>
			<div class="col-md-5">
				<button class="profile">프로필 수정</button>
				<button class="profile">옵션</button>
				<br /> <img src="<c:url value='/resources/images/pro.jpg'/>"
					class="prosa">

			</div>

			<div class="col-md-12" style="margin-bottom: 1%;">
				<button class="probutton">픽보관함</button>
				<button class="probutton">게시글</button>
				<button class="probutton">루트</button>
				<button class="probutton">필터</button>

			</div>

		</div>
		<div class="col-md-12"
			style="background-color: #fbceb1; margin-top: 3%; padding-bottom: 3%">
			<div class="col-md-8">
				<img src="<c:url value='/resources/images/route3.jpg'/>"
					class="routeimg3">
			</div>
			<div class="routetext">
				<div class="col-md-4">
					<p style="font-size: 30px">서귀포</p>
					<p style="font-size: 24px">pick : 3</p>
					<p style="font-size: 24px">2019/04/26 19:55</p>
				</div>
			</div>
			<div class="col-offset-md-8 col-md-4">
				<div class="routetext2">
					<p style="font-size: 20px; weight: bold">
						게시자 :  <span style="font-size: 16px"> audqja</span>
					</p>
					<p style="font-size: 20px; weight: bold">
						사용 필터 :  <span style="font-size: 16px"> 솜사탕</span>
					</p>
					<p style="font-size: 20px; weight: bold">
						위치 : <span style="font-size: 16px"> 제주도 서귀포시</span>
					</p>
				</div>
			</div>
			<div class="  col-md-8">
				<div class="routetext3">
					<p style="font-size: 20px">서귀포 해안가 모닝가페. 창으로 들어오는 빛이 예쁜 곳이에요</p>
				</div>
			</div>
		</div>
		<!-- 사용자 화면 끝 -->
	</div>
</body>
