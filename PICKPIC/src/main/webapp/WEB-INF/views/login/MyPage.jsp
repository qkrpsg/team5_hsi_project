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

body {
	padding-top: 7%;
	padding-left: 15%;
}

.routeimg {
	float: left;
	margin-bottom: 4%;
	width: 230px;
	height: 230px;
}

.routeimg1 {
	float: left;
	width: 760px;
	height: 500px;
}

.routeimg3 {
	margin-top: 10%;
	margin-left: 10%;
	float: left;
}

.routetext {
	margin-top: 6%;
}

.routetext2 {
	margin-top: 8%;
}

.routetext3 {
	margin-left: 10%;
	margin-top: 3%;
}

button {
	width: 100px;
	background-color: #f8585b;
	border: none;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin-bottom: 2%;
	cursor: pointer;
	border-radius: 10px;
}

.button:hover {
	background-color: black;
}
</style>


<body>
	<div class="row">
		<p style="font-size: 25px">
			<span style="font-size: 30px; weight: bold">아이디</span>님의 <span
				style="font-size: 30px; weight: bold">루트명</span>일주
		</p>
		<p style="font-size: 25px">♥ 갯수</p>
	</div>
	<button>이스탄불2</button>
	<button>카파도피아4</button>
	<button>안탈리아</button>
	<button>파묵자</button>
	<button>셀축</button>
	<div class="row">
		<div class="col-md-12">
			<div class=" col-md-6">
				<img src="<c:url value='/resources/images/route1.jpg'/> "
					class="routeimg1">

			</div>
			<div class="col-md-2">
				<img src="<c:url value='/resources/images/route2.jpg'/>"
					class="routeimg">
			</div>
			<div class=" col-md-3">
				<img src="<c:url value='/resources/images/route2.jpg'/>"
					class="routeimg">
			</div>
			<div class=" col-md-2">
				<img src="<c:url value='/resources/images/route2.jpg'/>"
					class="routeimg">

			</div>
			<div class="col-md-2">
				<img src="<c:url value='/resources/images/route2.jpg'/>"
					class="routeimg">
			</div>
		</div>

	</div>
	
 <!--사용자 화면  -->
	<div class="col-md-10"
		style="background-color: #fbceb1; margin-top: 3%">
		<div class="col-md-7">
			<img src="<c:url value='/resources/images/route3.jpg'/>"
				class="routeimg3">
		</div>
		<div class="routetext">
			<div class="col-md-5">
				<p style="font-size: 30px">제목(title)</p>
				<p style="font-size: 24px">♥ 갯수(???)</p>
				<p style="font-size: 24px">날짜/시간(date)</p>
			</div>
		</div>
		<div class="col-offset-md-7 col-md-5">
			<div class="routetext2">
				<p style="font-size: 20px; weight: bold">
					사용자 <span style="font-size: 16px"> user</span>
				</p>
				<p style="font-size: 20px; weight: bold">
					필터 <span style="font-size: 16px"> filter</span>
				</p>
				<p style="font-size: 20px; weight: bold">
					위치 <span style="font-size: 16px"> 위치???</span>
				</p>
				<p style="font-size: 20px; weight: bold">
					루트 <span style="font-size: 16px"> route </span>
				</p>
			</div>
		</div>
		<div class="  col-md-8">
			<div class="routetext3">
				<p style="font-size: 20px">서귀포 해안가 모닝가페. 창으로 들어오는 빛이 예쁜 곳이에요(context)</p>
			</div>
		</div>
	</div>
<!-- 사용자 화면 끝 -->





</body>














