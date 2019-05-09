<%@page import="org.springframework.web.multipart.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- css&js -->
<link href="<c:url value='/css/Navbar.css' />" rel="stylesheet">
<link href="<c:url value='/css/Modal.css'/>" rel="stylesheet">
<link href="<c:url value='/css/Preview.css'/>" rel="stylesheet">


<!-- albumEditor.jsp -->

<!-- 모달 창 시작-->
<div class="modal" id="option_modal">
	<div class="modal-content">

		<!-- 모달 헤더 시작-->
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<h3 class="modal-title" id="option_title">원하는 사진이 있는 곳을 선택하세요.</h3>
		</div>
		<!-- 모달 헤더 끝-->

		<!-- 모달 바디 시작-->
		<div class="modal-body">
			<div class="row text-center">

				<div class="col-xs-3 btn ">
					<img class="img-circle img_100"
						src="<c:url value='/resources/images/sns/M.PNG'/>" alt="image">
					<h5>내 픽보관함</h5>
				</div>

				<div class="col-xs-3 btn btn-file">
					<input type="file" name="img_mypc[]" id="img_mypc" multiple
						accept=".jpg, .jpeg, .png"> <img
						class="img-circle img_100"
						src="<c:url value='/resources/images/sns/P.png'/>" alt="image">
					<h5>내 PC</h5>
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
			<!-- row text-center -->
		</div>
		<!-- modal-body -->
	</div>
	<!-- modal-content -->
</div>
<!-- modal-->


<!-- 상단 바 시작-->
<div class="topnav" id="myTopnav" style="background-color: #e3f2fd;">

	<a href="#" class="btncolor">되돌리기</a> <a onclick="myFunc('Demo3')"
		href="#">내 필터 보관함</a> <a class="btn" data-toggle="modal"
		id="option_btn">가져오기</a> <a href="#" class="btncolor">저장하기</a>

	<!-- 검색바 -->
	<!-- <form class="form-inline">
			<input class="form-control" type="search" placeholder="필터명을 입력하세요." aria-label="Search" id="Search" onkeyup="search_func()">
			<button class="btn btn-primary" type="submit">검색</button>	
		</form>
 		<ul id="filterMenu" class="ul_submenu" style="margin-bottom: 0;margin-top: 48px">
			<li><a href="#">HTML</a></li>
			<li><a href="#">CSS</a></li>
			<li><a href="#">JavaScript</a></li>
			<li><a href="#">PHP</a></li>
			<li><a href="#">Python</a></li> 
		</ul> -->
	<script>
		/* function search_func() {
			// Declare variables
			var input, filter, ul, li, a, i;
			input = document.getElementById("Search");
			filter = input.value.toUpperCase();
			ul = document.getElementById("filterMenu");
			li = ul.getElementsByTagName("li");
		
			// Loop through all list items, and hide those who don't match the search query
			for (i = 0; i < li.length; i++) {
				a = li[i].getElementsByTagName("a")[0];
				if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
					li[i].style.display = "";
				} else {
					li[i].style.display = "none";
				}
			}
		} */
	</script>

</div>
<!-- 상단 바 끝-->

<!-- 프리뷰 시작 -->
<div class="preview_wrap">
	<div class="preview_container row">
		<div class="preview" id="preview">
			<!-- 사진 리스트 들어가는 곳 -->
			<div class="col-lg-2 col-md-4 col-sm-6 noMnP">
				<div class=" photo_wrap">
					<div class="photo">
						<div class="photo_center_wrap">
							<div class="photo_center">
								<img src="<c:url value='/resources/images/sns/P.png'/>" />
							</div>
						</div>
					</div>
					<div class="menu">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-default">삭제</button>
							<button type="button" class="btn btn-default">회전</button>
							<button type="button" class="btn btn-default" id="btn_select">선택</button>
						</div>
					</div>
				</div>
			</div>


			<!-- 하단 수평스크롤 시작-->
			<div class="navbar navbar-default navbar-fixed-bottom">
				<div class="container-fluid">
					<div class="nav navbar-nav">
						<!-- 필터 띄우기 -->
						<div class="scrollmenu squares">
							<div
								style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item
								1</div>
							<div
								style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item
								1</div>
							<div
								style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item
								1</div>
							<div
								style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item
								1</div>
							<div
								style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item
								1</div>
							<div
								style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item
								1</div>
							<div
								style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item
								1</div>
							<div
								style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item
								1</div>
							<div
								style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item
								1</div>
							<div
								style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item
								1</div>
							<div
								style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item
								1</div>
							<div
								style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item
								8</div>
						</div>
						<!-- scrollmenu squares -->
					</div>
					<!-- nav -->
				</div>
				<!-- CON-FLU -->
			</div>
			<!-- navbar -->

		</div>
		<!-- preview -->
	</div>
	<!-- preview_container -->
</div>
<!-- preview_wrap -->



<script type="text/javascript">
<!-- 모달창 열고 닫기 -->
	//모달요소 얻기
	var modal = document.getElementById('option_modal');
	// 모달창 열기 버튼요소 얻기
	var btn = document.getElementById("option_btn");
	// 모달창 닫기(span) 태그요소 얻기
	var span = document.getElementsByClassName("close")[0];

	//페이지 로드하면서 모달창 열기(띄우기)
	window.onload = function() {
		modal.style.display = "block";
	}
	// 버튼 클릭시 모달창 열기(보이기)
	btn.onclick = function() {
		modal.style.display = "block";
	}
	// 닫기 클릭시 모달창 닫기(감추기)
	span.onclick = function() {
		modal.style.display = "none";
	}
	// 모달창 외의 바깥부분 클릭시 모달창 닫기(감추기)
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
	//프리뷰에 로드시 모달창 자동 닫기(감추기)
	var input = document.getElementById("img_mypc");
	function isEmpty(str) {
		return !str.replace(/\s+/, '').length;
	}
	input.addEventListener("input", function() {
		if (!isEmpty(this.value)) {
			console.log("#img_mypc is NOTNULL");
			modal.style.display = "none";
		}
	});
	
	<!-- 프리뷰에 다중으로 이미지띄우기  -->
	var fileCollection = new Array();
	$('#img_mypc').on(
			'change',
			function(e) {
				var files = e.target.files;
				$.each(files, function(i, file) {
					fileCollection.push(file);
					var reader = new FileReader();
					reader.readAsDataURL(file);
					reader.onload = function(e) {	
						var template = '<div class="col-lg-2 col-md-4 col-sm-6 noMnP"  >'
							+ '<div class=" photo_wrap">'
							+'<div class="photo" >'
							+'<div class="photo_center_wrap" >'
							+'<div class="photo_center" >'
							+ '<img id="temp_img" src="'+e.target.result+'"/>'
							+ '</div></div></div></div></div>';	
	
						$('#preview').append(template);
										       
				       
					};
				});
			});
	
	$("#btn_select").click(function(event) {
	var selected=document.querySelectorAll("div.photo_center img[id=temp_img]");
	console.log(selected);
	});
	
	/*  // 등록 이미지 삭제 ( input file reset )
	function resetInputFile($input, $preview) {
	var agent = navigator.userAgent.toLowerCase();
	if((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1)) {
	    // ie 일때
	    $input.replaceWith($input.clone(true));
	    $preview.empty();
	} else {
	    //other
	    $input.val("");
	    $preview.empty();
	}        
	}
	
	$(".btn-delete").click(function(event) {
	var $input = $("#inp-img");
	var $preview = $('#preview');
	resetInputFile($input, $preview);
	});  */
</script>
