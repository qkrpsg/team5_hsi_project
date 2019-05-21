<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.text1 {
	font-size: 30px;
}

.dropdown-button {
	background-color: #87CEEB;
	padding: 8px;
	font-size: 15px;
	border: none;
	width: 100px;
	height: 40px;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #FFDAB9;
	min-width: 100%;
	padding: 5px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
}

.dropdown-content a {
	color: black;
	padding: 8px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #4169E1;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropdown-button {
	background-color: #00BFFF;
}

.search {
	width: 100px;
	height: 40px;
}

.sa {
	width: 300px;
	height: 280px;
	margin-bottom: 10px;
}

@media screen and (max-width:1000px) and (min-width:0px) {
	body {
	
		float: left;
	
	}
	.col-md-12{
	width: 100%;
	}
	.search {
	width: 60px;
	height: 30px;
}
	.dropdown-button {
	width: 80px;
	height: 30px;
}
.text1 {
	font-size: 15px;
}	
	
	
}
</style>
<body>
	<div class="row" style="background-color: #F5F5F5;">

		<div class="col-md-offset-4 col-md-8"
		    style="margin-top: 4%">
			<p class="text1">PICKPIC에 등록되어 있는 사진들(총 ****개)</p>
		</div>
		<div class="col-md-12">
			<hr style="border: solid 2px #708090" />
		</div>
		<div class="col-md-12 "
			 style="margin-top: 2%; margin-bottom: 2%;">
			<div class="col-md-offset-4 col-md-4" style="z-index: 3;padding-left: 5%; ">
				<div class="dropdown">
					<button class="dropdown-button">전체보기</button>
					<div class="dropdown-content">
						<a href="#">서울</a> <a href="#">경기도</a> <a href="#">부산</a> <a
							href="#">제주도</a>

					</div>
				</div>
				<button class="search">조회</button>
				<button class="search">조회순</button>
				<button class="search">제목순</button>

			</div>
			
			
			
		</div>
		<div class="col-md-12" style="margin-top: 2%">
			<div class="col-md-offset-3 col-md-2">
				<img src="<c:url value='/resources/images/1.jpg' />" class="sa">
				<p>
					<a href="<c:url value='/friends/search.pic'/>">제목~~~~~</a>
				</p>


				<hr style="border: solid 1px #708090" />
				<p>내용~~~~~~~~~</p>

			</div>
			.
			<div class="col-md-2">
				<img src="<c:url value='/resources/images/1.jpg' />" class="sa">
				<p>제목~~~~~</p>
				<hr style="border: solid 1px #708090" />
				<p>내용~~~~~~~~~</p>

			</div>
			<div class="col-md-2">
				<img src="<c:url value='/resources/images/1.jpg' />" class="sa">
				<p>제목~~~~~</p>
				<hr style="border: solid 1px #708090" />
				<p>내용~~~~~~~~~</p>

			</div>







		</div>
		<div class="col-md-12" style="margin-top: 3%">
			<div class="col-md-offset-3 col-md-2">
				<img src="<c:url value='/resources/images/1.jpg' />" class="sa">
				<p>제목~~~~~</p>
				<hr style="border: solid 1px #708090" />
				<p>내용~~~~~~~~~</p>

			</div>
			.
			<div class="col-md-2">
				<img src="<c:url value='/resources/images/1.jpg' />" class="sa">
				<p>제목~~~~~</p>
				<hr style="border: solid 1px #708090" />
				<p>내용~~~~~~~~~</p>

			</div>
			<div class="col-md-2">
				<img src="<c:url value='/resources/images/1.jpg' />" class="sa">
				<p>제목~~~~~</p>
				<hr style="border: solid 1px #708090" />
				<p>내용~~~~~~~~~</p>

			</div>

		</div>
	</div>
</body>
=======
>>>>>>> branch 'mbc' of https://github.com/qkrpsg/team5_hsi_project.git
