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
	margin-left: 10%;
	margin-top: 9%;
	margin-right: 10%;
}

.routeok {
	width: 150px;
	height: 40px;
	background-color: #f8585b;
	text-align: center;
	border-radius: 10px;
	margin-top: 3%;
	margin-left: 55%;
	color:white;
}
.placebutton{
	width: 150px;
	height: 40px;
	background-color: #b2ddef;
	border: none;
	color: black;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin-right: 2%;
	margin-bottom: 2%;
	margin-top:5%;
	cursor: pointer;
	border-radius: 10px;
}
.bestsa{

width:100%;
height:250px;
margin-top: 1%;
float: left;

}


.bestbutton {
	width: 200px;
	height: 40px;
	background-color: #4b9ae4;
	text-align: center;
	border-radius: 10px;
	margin-right: 1%;
	margin-left: 1%;
	margin-bottom: 1%;
	color:white;
}

.routesa {
	width: 210px;
	height: 180px;
	margin-top: 1%;
	margin-right: 1%;
	margin-bottom: 2%; border-radius : 10px;
	float: reft;
	border-radius: 10px;
}



.routebutton {
	width: 100px;
	height: 40px;
	background-color: #f8585b;
	border: none;
	color: #fff;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin-right: 2%;
	margin-bottom: 3%;
	cursor: pointer;
	border-radius: 10px;
}
.bestsatext{
font-size:16px;
position: absolute;
weight:bold;
float:left;
margin-left: 3%;
padding-top: 5%;
color:red;

}
.shadow1 {
  color: #fff;
  font-family: Arvo;
  font-weight: bold;
 
  line-height: 0.8em;
  letter-spacing: 0.1em;
  transform: scaleY(0.7);
  -webkit-transform: scaleY(0.7);
  -moz-transform: scaleY(0.7);
 margin-left: 5%;
 padding-top: 4%;
font-size:25px;
position: absolute;
weight:bold;
float:left;

}

input {
	border: 1px solid red;
	border-radius: 5px;
	height: 40px;
	width: 400px;
}
</style>
<body>
	<div class="row">
		<div class="col-md-12"
			style="background-color: #fbceb1; padding-top: 5%; padding-left: 7%; padding-bottom: 3%;">
			<div class="col-md-4">
				<p style="font-size: 30px; weight: bold">픽 로드</p>
				<a class="btn btn-block btn-primary btn-lgg" 
					href="<c:url value='/creroute/route_create.pic'/>">+ 루트 생성</a>
				<br />
				<p style="font-size: 23px">사진 명소를 위한 루트를 만들어 보세요!</p>
				<br />
				<button class="routebutton">장소</button>
				<button class="routebutton">필터</button>
				<button class="routebutton">루트</button>
				<input type="text">
				<button class="routeok">검색</button>
			</div>
			<div class="md-8">
				<button class="bestbutton">주간 베스트 루트</button>
				<button class="bestbutton">떠오르는 루트</button>
				<br />
				<div class="col-offset-md-4 col-md-2">
					<img src="<c:url value='/resources/images/route4.jpg'/>"
						class="routesa">
				</div>
				<div class="col-md-2">
					<img src="<c:url value='/resources/images/route5.jpg'/>"
						class="routesa">
				</div>
				<div class="col-md-4">
					<img src="<c:url value='/resources/images/route6.jpg'/>"
						class="routesa">
				</div>

			</div>

			<div class="col-offset-md-4 col-md-2">
				<img src="<c:url value='/resources/images/route7.jpg'/>"
					class="routesa">
			</div>
			<div class=" col-md-2">
				<img src="<c:url value='/resources/images/route8.jpg'/>"
					class="routesa">
			</div>
			<div class=" col-md-2">
				<img src="<c:url value='/resources/images/route6.jpg'/>"
					class="routesa">
			</div>
		</div>
	</div>
<!--  -->
<div class="row">

<div class=" col-md-12" style="margin-bottom: 1%">
<button class="placebutton">터키일주</button><button class="placebutton">터키일주2</button><button class="placebutton">터키일주3</button><button class="placebutton">터키일주4</button>
<button class="placebutton">터키일주5</button><button class="placebutton">터키일주6</button><button class="placebutton">터키일주7</button>
</div>
</div>
<div class="row">
<div class="col-md-12">
<div class="col-md-10">총 게시물 10</div>
<div class="col-md-1">인기 순 </div>
<div class="col-md-1">최신 순 </div>
</div>
</div>
<div class="row"">
<div class="col-md-12" style="position:relative;" >
<img src="<c:url value='/resources/images/gren3.jpg'/>" class="bestsa">
<div class="shadow1"><p>타이틀</p>
<br/>
<p>♥ 갯수</p>
<br/>
<p>루트경로</p>
<br/>
<p>필터</p>
</div>
</div>

<div class="col-md-12">
<img src="<c:url value='/resources/images/gren4.jpg'/>" class="bestsa">
<div class="shadow1"><p>타이틀</p>
<br/>
<p>♥ 갯수</p>
<br/>
<p>루트경로</p>
<br/>
<p>필터</p>
</div>
</div>
<div class="col-md-12">
<img src="<c:url value='/resources/images/gren6.jpg'/>"class="bestsa" >
<div class="shadow1"><p>타이틀</p>
<br/>
<p>♥ 갯수</p>
<br/>
<p>루트경로</p>
<br/>
<p>필터</p>
</div>
</div>


</div>






</body>







