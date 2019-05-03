<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- css&js -->
<link href="<c:url value='/css/Navbar.css' />" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/css/Modal.css'/>">


<!-- albumEditor.jsp -->
<!-- 상단 바 -->
<div class="topnav" id="myTopnav" style="background-color: #e3f2fd;">

	<a href="#" class="btncolor">되돌리기</a>
	 <a onclick="myFunc('Demo3')" href="#">내 필터 보관함</a> 
	 <a class="btn" data-toggle="modal" id="option_btn">가져오기</a>

	<!-- <form class="form-inline">
		<input class="form-control" type="search" placeholder="필터명을 입력하세요."
			aria-label="Search" id="Search" onkeyup="search_func()">

		<button class="btn btn-primary" type="submit">검색</button>	
	</form> -->

	<a href="#" class="btncolor">저장하기</a>

	<!-- <ul id="filterMenu" class="ul_submenu" style="margin-bottom: 0;margin-top: 48px">
			<li><a href="#">HTML</a></li>
			<li><a href="#">CSS</a></li>
			<li><a href="#">JavaScript</a></li>
			<li><a href="#">PHP</a></li>
			<li><a href="#">Python</a></li> </ul> -->

</div>

<div class="row" >
<div class="row" style="height: 500px;background-color:gray;">

</div>


<!-- 필터 띄우기 -->
<div class="scrollmenu squares">
	<div style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item 1</div>
	<div style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item 1</div>
	<div style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item 1</div>
	<div style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item 1</div>
	<div style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item 1</div>
	<div style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item 1</div>
	<div style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item 1</div>
	<div style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item 1</div>
	<div style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item 1</div>
	<div style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item 1</div>
	<div style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item 1</div>
	<div style="background-image: url('<c:url value='/resources/images/sns/P.png'/>')">item 8</div>
	  
</div>
</div>

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

<!-- 모달 -->
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
					<input type="file" name="attachedFile1"> 
					<img class="img-circle img_100"
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
	
	 $(window).load(function(){
	        $('#option_modal').modal('show');
	    });

</script>



